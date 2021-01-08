import JuAFEM

hint(text) = Markdown.MD(Markdown.Admonition("hint", "Hilfe", [text]))
warning(text) = Markdown.MD(Markdown.Admonition("warning", "Warnung", [text]))
yays = [md"Sehr gut! 🐣", md"Yay ❤", md"Genau so! 🎉", md"Gut gemacht! 🐦", md"Weiter so! 🐤", md"Klasse! 🐧", md"Korrekt! 🐖", md"Sehr schön! 🐿"]
correct(text=rand(yays)) = Markdown.MD(Markdown.Admonition("correct", "Richtig!", [text]))
still_missing(text=md"Ersetzen sie `missing` mit ihrer Antwort") = Markdown.MD(Markdown.Admonition("warning", "Here we go! 🦦", [text]))
keep_working(text=md"Noch nicht die richtige Antwort, noch ein Versuch! 🦥") = Markdown.MD(Markdown.Admonition("danger", "Falsch", [text]))
solution(text; blur=true) = blur ? Markdown.MD(Markdown.Admonition("hint", "Lösung", [text])) : Markdown.MD(Markdown.Admonition("note", "Lösung", [text]))

function find_cell_containing_point(grid, point)
    interpolation = JuAFEM.default_interpolation(eltype(grid.cells))
    for cell in 1:length(grid.cells)
        cell_coords  = getcoordinates(grid, cell)
        # [1,2,3] is the indices for the vertices of a quadratic triangle
        coords_vertices = cell_coords[[1,2,3]]
        if is_point_inside_triangle(point, coords_vertices)
            return cell
        end
    end
    error("did not find cell containing point")
end

function is_point_inside_triangle(point, triangle)
    # Just transform thing so they fit the "API" for the function from stack overflow
    return _is_point_inside_triangle((x = point[1], y = point[2]),
                              (x = triangle[1][1], y = triangle[1][2]),
                              (x = triangle[2][1], y = triangle[2][2]),
                              (x = triangle[3][1], y = triangle[3][2]))
end

function _is_point_inside_triangle(p, p0, p1, p2)
    dX = p.x-p2.x
    dY = p.y-p2.y
    dX21 = p2.x-p1.x
    dY12 = p1.y-p2.y
    D = dY12*(p0.x-p2.x) + dX21*(p0.y-p2.y)
    s = dY12*dX + dX21*dY
    t = (p2.y-p0.y)*dX + (p0.x-p2.x)*dY
    (D<0) && return s<=0 && t<=0 && s+t>=D
    return s>=0 && t>=0 && s+t<=D
end

function find_local_coordinate(interpolation, cell_coordinates, global_coordinate)
    dim = length(global_coordinate)
    local_guess = zero(Vec{dim})
    n_basefuncs = getnbasefunctions(interpolation)
    max_iters = 10
    tol_norm = 1e-10
    for iter in 1:10
        if iter == max_iters
            error("did not find a local coordinate")
        end
        N = JuAFEM.value(interpolation, local_guess)

        global_guess = zero(Vec{dim})
        for j in 1:n_basefuncs
            global_guess += N[j] * cell_coordinates[j]
        end
        residual = global_guess - global_coordinate
        if norm(residual) <= tol_norm
            break
        end
        dNdξ = JuAFEM.derivative(interpolation, local_guess)
        J = zero(Tensor{2, 2})
        for j in 1:n_basefuncs
            J += cell_coordinates[j] ⊗ dNdξ[j]
        end
        local_guess -= inv(J) ⋅ residual
    end
    return local_guess
end

"""
    measure_function(point::Vec{dim}, u::Array{T,1}, elementvalues::CellValues, ansatz::Lagrange) -> value
"""
function measure_function(point,u,dh,ansatz)
    cellid = find_cell_containing_point(dh.grid,point)
    cellcoords = getcoordinates(dh.grid,cellid)
    localcoords = find_local_coordinate(ansatz, cellcoords, point)
    qr = QuadratureRule{2, RefTetrahedron, Float64}([1], [localcoords])
    fe_values = CellVectorValues(qr, ansatz)
    reinit!(fe_values, cellcoords)
    return function_value(fe_values, 1, u[celldofs(dh,cellid)])
end

"""
    compute_stresses(cellvalues,dh::DofHandler, u) -> Array{Tensor{2,dim}}
"""
function compute_stresses(cellvalues::CellVectorValues{dim,T}, dh::DofHandler, u,  ℂ) where {dim,T}

    n = getnbasefunctions(cellvalues)
    cell_dofs = zeros(Int, n)
    nqp = getnquadpoints(cellvalues)

    # Allocate storage for the fluxes to store
    σ = [SymmetricTensor{2,dim,T}[] for _ in 1:getncells(dh.grid)]

    @inbounds for (cell_num, cell) in enumerate(CellIterator(dh))
        σ_cell = σ[cell_num]
        celldofs!(cell_dofs, dh, cell_num)
        uᵉ = u[cell_dofs]
        reinit!(cellvalues, cell)

        for q_point in 1:nqp
            σ_qp = ℂ ⊡ function_symmetric_gradient(cellvalues, q_point, uᵉ)
            push!(σ_cell, σ_qp)
        end
    end
    return σ
end

function stress_nodal(cellvalues,ip,dh,u,ℂ)
    σ = compute_stresses(cellvalues, dh, u,ℂ);
    projector = L2Projector(cellvalues, ip, dh.grid);
    σ_nodes = project(σ, projector);
    return σ_nodes
end

nothing