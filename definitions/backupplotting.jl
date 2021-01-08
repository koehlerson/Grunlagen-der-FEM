function plot(dh::JuAFEM.AbstractDofHandler, u::Array{T,1}, args...; field::Int=1, process::Function=postprocess, scale_plot=false, shading=false, kwargs...) where T
    C = JuAFEM.getcelltype(dh.grid)
    nodes = JuAFEM.getnodes(dh.grid)
    cells = JuAFEM.getcells(dh.grid)
    coords = [node.x[i] for node in nodes, i in 1:JuAFEM.getdim(dh.grid)]
    connectivity = getproperty.(cells, :nodes)
    N = length(JuAFEM.vertices(cells[1]))
    elements = [element[i] for element in connectivity, i in 1:N]
    solution = reshape(dof_to_node(dh, u; field=field, process=process), JuAFEM.getnnodes(dh.grid))
    triangle_elements = to_triangle(C, elements) 
    scene = WGLMakie.mesh(coords, triangle_elements, color=solution, args...; scale_plot=scale_plot, shading=shading, kwargs...)
    return scene
end


function surfaceplot(dh::JuAFEM.AbstractDofHandler, u::Array{T,1}, args...; field::Int=1, process::Function=postprocess, scale_plot=false, shading=false, kwargs...) where T
    @assert JuAFEM.getdim(dh.grid) == 2 "Only 2D solutions supported!"
    C = JuAFEM.getcelltype(dh.grid)
    nodes = JuAFEM.getnodes(dh.grid)
    cells = JuAFEM.getcells(dh.grid)
    coords = [node.x[i] for node in nodes, i in 1:2]
    connectivity = getproperty.(cells, :nodes)
    N = length(JuAFEM.vertices(cells[1]))
    elements = [element[i] for element in connectivity, i in 1:N]
    solution = reshape(dof_to_node(dh, u; field=field, process=process), JuAFEM.getnnodes(dh.grid))
    points = [AbstractPlotting.Point3f0(coord[1], coord[2], solution[idx]) for (idx, coord) in enumerate(eachrow(coords))]
    triangle_elements = to_triangle(C, elements)  
    scene = WGLMakie.mesh(points, triangle_elements, color=solution, args...; scale_plot=scale_plot, shading=shading, kwargs...)
    return scene
end


function warp_by_vector(dh::JuAFEM.AbstractDofHandler, u::Array{T,1}, args...; field::Int=1, scale=1.0, process::Function=postprocess, scale_plot=false, shading=false, kwargs...) where T
    C = JuAFEM.getcelltype(dh.grid)
    nodes = JuAFEM.getnodes(dh.grid)
    cells = JuAFEM.getcells(dh.grid)
    coords = [node.x[i] for node in nodes, i in 1:JuAFEM.getdim(dh.grid)]
    connectivity = getproperty.(cells, :nodes)
    N = length(JuAFEM.vertices(cells[1]))
    elements = [element[i] for element in connectivity, i in 1:N]
    u_matrix = dof_to_node(dh, u; field=field, process=identity)
    solution = reshape(dof_to_node(dh, u; field=field, process=process), JuAFEM.getnnodes(dh.grid))
    triangle_elements = to_triangle(C, elements) 
    scene =WGLMakie.mesh(coords .+ (scale .* u_matrix), color=solution, triangle_elements, args...; scale_plot=scale_plot, shading=shading, kwargs...)
    return scene
end

to_triangle(::Type{<:JuAFEM.AbstractCell{2,N,3}}, elements) where N = elements[:,1:3]
to_triangle(::Type{<:JuAFEM.AbstractCell{3,N,4}}, elements) where N = vcat(elements[:,[1,2,3]], elements[:,[1,2,4]], elements[:,[2,3,4]], elements[:,[1,4,3]])
to_triangle(::Type{<:JuAFEM.AbstractCell{2,N,4}}, elements) where N = vcat(elements[:,[1,2,3]], elements[:,[3,4,1]])
to_triangle(::Type{<:JuAFEM.AbstractCell{3,N,6}}, elements) where N = vcat(elements[:,[1,2,3]], elements[:,[3,4,1]], elements[:,[1,5,6]], elements[:,[6,2,1]], elements[:,[2,6,7]], elements[:,[7,3,2]], elements[:,[3,7,8]], elements[:,[8,4,3]], elements[:,[1,4,8]], elements[:,[8,5,1]], elements[:,[5,8,7]], elements[:,[7,6,5]])

function postprocess(node_values)
    dim = length(node_values)
    if dim == 1
        return node_values
    else 
        return sqrt(sum(node_values.^2))
    end 
end

function dof_to_node(dh::JuAFEM.AbstractDofHandler, u::Array{T,1}; field::Int=1, process::Function=postprocess) where T
    fieldnames = JuAFEM.getfieldnames(dh)  
    field_dim = JuAFEM.getfielddim(dh, field)
    data = fill(NaN, JuAFEM.getnnodes(dh.grid), field_dim) 
    offset = JuAFEM.field_offset(dh, fieldnames[field])

    for cell in JuAFEM.CellIterator(dh)
        _celldofs = JuAFEM.celldofs(cell)
        counter = 1
        for node in cell.nodes
            for d in 1:field_dim
                data[node, d] = u[_celldofs[counter + offset]]
                counter += 1
            end
        end
    end
    return mapslices(process, data, dims=[2])
end
