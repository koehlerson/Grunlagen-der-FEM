### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 040aca22-2f39-11eb-10c1-9b60aa983b9e
include("../../definitions/def.jl")

# ╔═╡ aa329452-2f39-11eb-31d8-ad7314cbeb31
md""" 
# FEM mit Stabelementen
Willkommen in der fünften Übung im Modul Grundlagen der FEM. In dieser Übung werden wir unser eigenes kleines FEM Programm schreiben.
"""

# ╔═╡ 15f4d0ba-2f3a-11eb-3ac1-d94e11540f54
md"""
# Aufgabe 5.1 - Elementsteifigkeitsmatrix
"""

# ╔═╡ c49a8484-2f3a-11eb-1400-1369a263adca
md"""
## Aufgabe 5.1a) 
Wie lassen sich die Einträge der Elementsteifigkeitsmatrizen berechnen? Werten Sie auch die Spezialfälle $\alpha \in \{\frac{\pi}{2},\frac{3\pi}{2}\}$ und $\alpha \in \{0,\pi\}$ aus.
"""

# ╔═╡ 529307d8-2f3c-11eb-34bf-9b3587e352a1
solution(md"""
$$\delta\Pi^{int,h} = \int_0^l \delta\tilde{\varepsilon}^h EA\tilde{\varepsilon}d\tilde{x}$$
	
$\boldsymbol{\tilde{\varepsilon}} = \boldsymbol{B}^e \boldsymbol{\tilde{d}}^e, \quad \boldsymbol{\tilde{d}}^e = \begin{bmatrix}
	\tilde{d}_1^e \\ \tilde{d}_2^e \end{bmatrix}, \quad \delta
	\boldsymbol{\tilde{\varepsilon}} = \boldsymbol{B}^e\delta\boldsymbol{\tilde{d}}^e$
	
$\Rightarrow \delta\Pi^{int,t} = (\delta\boldsymbol{\tilde{d}}^e)^T\int_0^l (\boldsymbol{B}^e)^T EA \boldsymbol{B}^e d\tilde{x} \; \boldsymbol{\tilde{d}}^e$
	
$\Rightarrow \boldsymbol{\tilde{k}}^e = \int_0^l (\boldsymbol{B}^e)^T EA \boldsymbol{B}^e d\tilde{x}$
	
Projektion von $\tilde{d}_i^e$ in x- und y- Richtungen
	
$d_{ix}^e = \tilde{d}_i^e \cos{\alpha}, \quad d_{iy}^e = \tilde{d}_i^e \sin{\alpha}, \quad \boldsymbol{d}_i^e = \begin{bmatrix}
	d_{ix}^e \\ d_{iy}^e \end{bmatrix}$
	
$\boldsymbol{n} = \begin{bmatrix}
	\cos{\alpha} \\ \sin{\alpha} \end{bmatrix} \Rightarrow \boldsymbol{n}^T.\boldsymbol{d}_i^e = \tilde{d}_i^e$
	
Gesamtes Elemet:
	
$\begin{bmatrix}
	\tilde{d}_1^e \\ \tilde{d}_2^e \end{bmatrix} = \begin{bmatrix}
	\boldsymbol{n}^T & \boldsymbol{0} \\ \boldsymbol{0} & \boldsymbol{n}^T\end{bmatrix}\begin{bmatrix}
	\boldsymbol{d}_1^e \\ \boldsymbol{d}_2^2\end{bmatrix}$
	
$\boldsymbol{T}^e := \text{Transformationmatrix} := \begin{bmatrix}
	\boldsymbol{n}^T & \boldsymbol{0} \\ \boldsymbol{0} & \boldsymbol{n}^T\end{bmatrix}$
	
$\boldsymbol{\tilde{d}}^e = \boldsymbol{T}^e\boldsymbol{d}^e , \quad (\delta\boldsymbol{\tilde{d}}^e)^T = (\delta\boldsymbol{d}^e)^T(\boldsymbol{T}^e)^T$
	
Ersetzen in der virtuellen inneren Energie $\rightarrow \delta\Pi^{int,h} = {\delta\boldsymbol{d}^e}^T \; {\boldsymbol{T}^e}^T \boldsymbol{\tilde{k}}^e\boldsymbol{T}^e \; \boldsymbol{d}^e$
	
$\Rightarrow \boldsymbol{k}^e = {\boldsymbol{T}^e}^T \boldsymbol{\tilde{k}}^e\boldsymbol{T}^e$
	
Matrix $\boldsymbol{\tilde{k}}^e$: 
	
$\boldsymbol{\tilde{k}}^e = \int_0^l {\boldsymbol{B}^e}^T EA \boldsymbol{B}^e d\tilde{x}$
	
$\boldsymbol{B}^e = [-\frac{1}{l} \quad \frac{1}{l}] \quad \text{const in } \tilde{x}$
	
$\Rightarrow \boldsymbol{\tilde{k}}^e = EA {\boldsymbol{B}^e}^T\boldsymbol{B}^e\int_0^l d\tilde{x}$
	
$\boldsymbol{\tilde{k}}^e = \frac{EA}{L}\begin{bmatrix}
	1 & -1 \\
	-1 & 1 \end{bmatrix}$
	
Transformationsmatrix $\boldsymbol{T}^e$:
	
$c := \cos{\alpha}, \quad s := \sin{\alpha}, \quad \boldsymbol{n} = \begin{bmatrix}
	c \\ s \end{bmatrix} \Rightarrow \boldsymbol{T}^e = \begin{bmatrix}
	c & s & 0 & 0 \\
	0 & 0 & c & s \end{bmatrix}$
	
Elementseifigkeitsmatrix $\boldsymbol{k}^e = {\boldsymbol{T}^e}^T \boldsymbol{\tilde{k}}^e\boldsymbol{T}^e$
	
$\boldsymbol{\tilde{k}}^e\boldsymbol{T}^e = \frac{EA}{L}\begin{bmatrix}
	1 & -1 \\
	-1 & 1 \end{bmatrix}\begin{bmatrix}
	c & s & 0 & 0 \\
	0 & 0 & c & s \end{bmatrix} =  \frac{EA}{l}\begin{bmatrix}
	c & s & -c & s \\
	-c & -s & c & s \end{bmatrix}$
	
${\boldsymbol{T}^e}^T \boldsymbol{\tilde{k}}^e\boldsymbol{T}^e = \frac{EA}{l} \begin{bmatrix}
	c & 0 \\ s & 0 \\ 0 & c \\ 0 & s \end{bmatrix}\begin{bmatrix}
	c & s & -c & s \\
	-c & -s & c & s \end{bmatrix} = \frac{EA}{l}\begin{bmatrix}
	c^2 & cs & -c^2 & -cs \\ 
	cs & s^2 & -cs & -s^2 \\
	-c^2 & -cs & c^2 & cs \\
	-cs & -s^2 & cs & s^2 \end{bmatrix}$
	
$\Rightarrow \boldsymbol{k}^e = \frac{EA}{l}\begin{bmatrix}
	c^2 & cs & -c^2 & -cs \\ 
	cs & s^2 & -cs & -s^2 \\
	-c^2 & -cs & c^2 & cs \\
	-cs & -s^2 & cs & s^2 \end{bmatrix}$
	
Spezialfälle auswerten:
	
$\alpha \in \{\frac{\pi}{2},\frac{3\pi}{2}\} \rightarrow c = 0, \quad s = 1 \Rightarrow \boldsymbol{k}^e = \frac{EA}{l}\begin{bmatrix}
	0 & 0 & 0 & 0 \\ 
	0 & s^2 & 0 & -s^2 \\
	0 & 0 & 0 & 0 \\
	0 & -s^2 & 0 & s^2 \end{bmatrix}$
	
$\alpha \in \{0,\pi\} \rightarrow c = 1, \quad s = 0 \Rightarrow \boldsymbol{k}^e = \frac{EA}{l}\begin{bmatrix}
	c^2 & 0 & -c^2 & 0 \\ 
	0 & 0 & 0 & 0 \\
	-c^2 & 0 & c^2 & 0 \\
	0 & 0 & 0 & 0 \end{bmatrix}$
""",blur=false)

# ╔═╡ cc9e78a2-3327-11eb-1a07-2d7d6263c710
md"""
-----
Hier haben wir ihnen die Struktur `Node` erstellt. Sie enthält alle erforderlichen Informationen eines Knotens, nämlich die der Koordinaten, Randbedingungen, ID und externe Lasten."""

# ╔═╡ 1ca1a746-2f51-11eb-04ca-e37ea8e6adf5
"""
	Node(coords, bcs, id, force) 
erstellt einen Knoten 

# Fields 
- `coords::Array{Float64,1}` Koordinatenvektor
- `bcs::Array{Bool,1}` Randbedingung am Knoten
- `id::Int64` die globale Knotennummer
- `force::Array{Float64,1}` Kraftvektor am Knoten 
"""
struct Node 
	coord::Array{Float64,1}
	bcs::Array{Bool,1} #false wenn fest gehalten
	id::Int64
	force::Array{Float64,1}
end

# ╔═╡ 86488cf6-2f4b-11eb-38ac-45f547ae8c98
md"""
## Aufgabe 5.1b) 
Schreiben Sie eine Julia-Funktion `plane_truss_element_stiffness` zur Berechnung der Elementsteifigkeitsmatrizen!"""

# ╔═╡ 1281faf0-2f50-11eb-142d-d510cdc821f9
hint(md""" 
Outputgröße ist die Elementsteifigkeitsmatrix im globalen x,y-Koordinatensystem:
	
$\boldsymbol{k}^e = \boldsymbol{T}^T \boldsymbol{\tilde{k}}^e\boldsymbol{T}^e \boldsymbol{\tilde{k}}^e \text{ mit } \boldsymbol{\tilde{k}}^e = \int_0^l (\boldsymbol{B}^e)^T EA \boldsymbol{B}^e d\tilde{x}$
""")

# ╔═╡ 6c76f5dc-2f51-11eb-108e-cdd32492a7bf
"""
	plane_truss_element_stiffness(E, A, n1, n2) -> Array{Float64, 2}
Berechnet die globale Steifigkeitsmatrix

# Argumente
- `E::Real` E Modul
- `A::Real` Querschnittsfläche 
- `n1::Node` erster Knoten
- `n2::Node` zweiter Knoten
"""
function plane_truss_element_stiffness(E::Real,A::Real,n1::Node,n2::Node)
	l = sqrt((n2.coord[1] - n1.coord[1])^2 + (n2.coord[2] - n1.coord[2])^2)
	θ = atan(((n2.coord[2] - n1.coord[2])/(n2.coord[1] - n1.coord[1])))
	c = cos(θ)
	s = sin(θ)
	
	k = ((E*A)/l) *[c*c c*s -c*c -c*s
				  c*s s*s -c*s -s*s
				  -c*c -c*s c*c c*s
				  -c*s -s*s c*s s*s]
	
	return k
end

# ╔═╡ 942f7246-387c-11eb-0943-4fd1f9731b8b
begin
function plane_truss_element_stiffness()
	return missing
end
	nothing
end

# ╔═╡ 5a8c7450-3311-11eb-1043-dbe83bb9ae2e
hint(md"""
Definieren Sie die Funktion `plane_truss_element_stiffness`, die den Elastizitätsmodul, die Querschnittsfläche und die verbundenen Knoten als Argumente hat.
	
Verwenden Sie die Einträge der Elementsteifigkeitsmatrix in 5.1a).
""")

# ╔═╡ c46cbfbe-3317-11eb-1a56-0f9a0ed102c9
md"""
## Aufgabe 5.1c) 
Betrachtet wird das Fachwerk aus Aufgabe 4.1.
"""

# ╔═╡ 88287da8-2f3a-11eb-3e11-dde5c2477600
HTML(open(f->read(f, String), "assets/file4.1.svg"))

# ╔═╡ ef823d38-2f56-11eb-3c09-4b4b580b4476
md""" 
Die global zusammengesetzte Matrix dieser Struktur ist

$\begin{bmatrix}
k_{33}^1 + k_{33}^3 & k_{34}^1\\
k_{43}^1 & k_{44}^1 + k_{44}^2
\end{bmatrix} \begin{bmatrix}
D_3 \\ D_4
\end{bmatrix} = \begin{bmatrix}
F_1 \\ F_2
\end{bmatrix}$

Bestimmen Sie den Lösungsvektor $\boldsymbol{D}$ mithilfe des in der vorherigen 
Übung aufgestellten globalen Gleichungssystems. Die Kräfte betragen $F_x= 0.01$ kN und $F_y=−0.05$ kN.

Verwenden sie die Parameter aus aus der folgenden Tabelle:

| Data       |      | values    |
| :------------- | :----------: | -----------: |
|  E |    | 10000 KN/$m^2$    |
|  A |    | 0.02 $m^2$    |
| node no.1:    | [x y] | [0 0] m |
| node no.2:    | [x y] | [1 2] m |
| node no.4:    | [x y] | [3 2] m |

"""

# ╔═╡ 83caf3f8-3318-11eb-2957-c37fc660848f
begin 
	n1₁ = Node([0,0], [false, false], 1,[0,0])
	n1₂ = Node([1,2], [true, true], 2,[0.01,-0.05])
	n1₃ = Node([1,0], [false, false], 3,[0,0])
	n1₄ = Node([3,2], [false, false], 4,[0,0])
end

# ╔═╡ e6485b34-2f52-11eb-03d1-7dca1f4cf989
k1₁ = plane_truss_element_stiffness(10000,0.02,n1₁,n1₂)

# ╔═╡ c28da868-2f55-11eb-388d-7b34612d1e18
k1₂ = plane_truss_element_stiffness(10000,0.02,n1₃,n1₂)

# ╔═╡ d02140ac-2f55-11eb-2c49-17aee10e1d81
k1₃ = plane_truss_element_stiffness(10000,0.02,n1₂,n1₄)

# ╔═╡ 9bb9904c-2f57-11eb-368a-890dbed7dea2
kₐ = [k1₁[3,3] + k1₃[3,3] k1₁[3,4]
	k1₁[4,3] k1₁[4,4] + k1₂[4,4]]

# ╔═╡ 0b5f09ae-2f58-11eb-3369-0fa44a6c007b
F = [0.01
	-0.05]

# ╔═╡ 1e69f590-2f58-11eb-2e4f-2b8cba23fee6
D1 = kₐ\F

# ╔═╡ ef35fdae-3318-11eb-27a8-bd08c4559794
try
if D1 ≈ [0.00018498447189992432, -0.00033003105620015146]
	 correct51b = true
	 correct()
else
	 correct51b = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end
catch
	still_missing()
end

# ╔═╡ 8e65690e-2fff-11eb-3009-bfb2fec767ae
md"""
# Aufgabe 5.2 - Schreiben eines FEM-Programms
"""

# ╔═╡ b45c421c-3000-11eb-0cbf-433e191f2314
md"""
Im Folgenden soll ein eigener FE-Code in Julia erzeugt werden, mithilfe dessen die Knotenverschiebungen von ebenen Fachwerken berechnet werden können.
Der Workflow des Programms ist in der folgenden Abbildung dargestellt.

Daraufhin werden mithilfe der Funktionen `plane_truss_element_stiffness` und `doassemble` die Elementsteifigkeitsmatrizen aufgestellt und im globalen Gleichungssystem assembliert.

Schließlich wird der globale Lastvektor aufgestellt mithilfe der Funktion `build_load_vector` und das globale Gleichungssystem gelöst.
"""

# ╔═╡ 8d6a2250-3002-11eb-3c19-31ac04361ee4
HTML(open(f->read(f, String), "assets/corrected_flowchart.svg"))

# ╔═╡ 4b1310c8-3321-11eb-2602-6f3393ba89dc
md"""
## Aufgabe 5.2a)
Erstellen Sie den Konstruktor für `Element`! Definieren sie den Konstruktur anhand von $$E$$, $$A$$, `n1::Node`, `n2::Node`, `enum`, wobei `enum` die Element ID (bzw. Nummer) ist. Rufen sie für die Erstellung der lokalen Steifigkeitsmatrix die Funktion `plane_truss_element_stiffness` auf.
"""

# ╔═╡ 60b7b740-3099-11eb-02b8-eb8bf877662c
begin
	struct Element 
		n1::Node
		n2::Node
		enum::Int64
		localk::Array{Float64,2}
	end
	
	function Element(E,A,n1::Node,n2::Node,enum)
		k = plane_truss_element_stiffness(E,A,n1,n2)
		return Element(n1,n2,enum,k)
	end
	
end

# ╔═╡ c234461e-30aa-11eb-1dfb-d3e958d78831
begin
function create_connectivity(ElementsAr)
	E = Array{Union{Missing ,Int64},2}(missing, 2, length(ElementsAr))	
	for i in 1:length(ElementsAr)
		c = ElementsAr[i].enum
		E[1,c] = ElementsAr[i].n1.id
		E[2,c] = ElementsAr[i].n2.id
	end
	return E
end
	nothing
end

# ╔═╡ 38052d30-3327-11eb-1b0b-f9e7a3393948
md"""
## Aufgabe 5.2b)
Definieren Sie die Knoten und Elemente für die folgende Struktur.
"""

# ╔═╡ 97936350-3324-11eb-3a0c-d79ad97f2761
HTML(open(f->read(f, String), "assets/bigstruct.svg"))

# ╔═╡ 0ee0ab68-30d0-11eb-219a-49a79141fdf6
begin
	n2₁ = Node([0,0], [true,false], 1,[0,0])
	n2₂ = Node([1,1], [true,true], 2,[0,0])
	n2₃ = Node([2,0], [true,true], 3,[0,0])
	n2₄ = Node([3,1], [true,true], 4,[0,0])
	n2₅ = Node([4,0], [true,false], 5,[0,0])
	n2₆ = Node([5,1], [false,false], 6,[0,0])
end

# ╔═╡ a555b458-30d0-11eb-2a40-b9962e49f921
begin
	e2₁ = Element(10000,0.02,n2₁,n2₃,1)
	e2₂ = Element(10000,0.02,n2₃,n2₅,2)
	e2₃ = Element(10000,0.02,n2₁,n2₂,3)
	e2₄ = Element(10000,0.02,n2₂,n2₃,4)
	e2₅ = Element(10000,0.02,n2₃,n2₄,5)
	e2₆ = Element(10000,0.02,n2₄,n2₅,6)
	e2₇ = Element(10000,0.02,n2₅,n2₆,7)
	e2₈ = Element(10000,0.02,n2₂,n2₄,8)
	e2₉ = Element(10000,0.02,n2₄,n2₆,9)
end

# ╔═╡ 33a246f6-3322-11eb-1b28-8f705d18953e
md"""
## Aufgabe 5.2c)
"""

# ╔═╡ c5163552-3322-11eb-133f-fd85c3e1e9a1
HTML(open(f->read(f, String), "assets/file4.1.svg"))

# ╔═╡ d44533c0-3322-11eb-0dd4-2749e1fe1c89
md"""
In diesem Teil wird die Matrix `assembleid` mithilfe der Funktion `create_assembleid` erstellt. 
Sie hat die Dimension $[2 \times n_{DOF}]$ und beinhaltet alle verbleibenden Freiheitsgrade. Die zwei Zeilen stehen hier für die x und y Richtung. Also, sind die Zeilen für die Dimension des Problems zuständig.
An den Positionen, an denen Dirichlet-Randbedingungen vorliegen, befinden sich Nulleinträge.
Für das Beispiel lautet sie also:

$\text{assembleid} = \begin{bmatrix}
0 & 1 & 0 & 0 \\
0 & 2 & 0 & 0 \end{bmatrix}$
"""

# ╔═╡ b1b6b9bc-3324-11eb-2c59-b106f2a65357
md"""
Für das Problem aus Abbildung 5.4:

$\text{assembleid} = \begin{bmatrix}
1 & 2 & 4 & 6 & 8 & 0 \\
0 & 3 & 5 & 7 & 0 & 0 \end{bmatrix}$
"""

# ╔═╡ f609ca00-3324-11eb-00af-2b1fa3ed6fb3
md"""
Erstellen Sie die Funktion `create_assembleid` die alle Knoten als Argument verwendet, und geben Sie die assembleid-Matrix zurück.
"""

# ╔═╡ 4aa8ce12-3325-11eb-006d-4fdf804c2828
hint(md"""
Die Funktion sollte dieselbe Matrix unabhängig von der Reihenfolge der eingegebenen Argumente zurückgeben.
""")

# ╔═╡ a06c5e30-30b0-11eb-15de-9702f870e34d
function create_assembleid(nodes_array)
	
	#hier werden die Knoten nach ihrer ID sortiert
	sorted_nodes = Array{Node,1}(undef,length(nodes_array))
	for node in nodes_array 
		sorted_nodes[node.id] = node
	end
	
	#initialisieren der AID Matrix
	AID = -ones(Int64,2,length(sorted_nodes))
	
	#hier loopen wir und weisen alle geblockten DOFs den Wert 0 zu
	for i in 1:length(sorted_nodes)
		if sorted_nodes[i].bcs[1] == false
			AID[1,i] = 0
		end
		if sorted_nodes[i].bcs[2] == false
			AID[2,i] = 0
		end
	end
	
	#in dieser Schleife sollen alle freien DOFs ihren Wert zugewiesen bekommen
	counter = 1
	for i in 1:length(sorted_nodes)
		c = sorted_nodes[i].id
		for j in 1:2
			if(AID[j,c] != 0.0)
				AID[j,c] = counter
				counter = counter + 1
			end
		end
	end
	
	return AID
end

# ╔═╡ 3f08eb2a-387d-11eb-147f-8d547b29dd27
begin
function create_assembleid()
	return missing
end
	nothing
end

# ╔═╡ d01e4b26-3325-11eb-372c-9594ed05ecac
md"""
## Aufgabe 5.2d)
Überprüfen Sie Ihre Funktion in Beispiel 4.1 und 5.4
"""

# ╔═╡ 16ffc812-3326-11eb-3112-27a5e3d7cab4
AID₁ = create_assembleid([n1₁,n1₂,n1₃,n1₄])

# ╔═╡ 52e724f6-3326-11eb-29c5-bd8b3cdae3de
if isa(AID₁, Missing)
	 correct52c = false
	 still_missing()
elseif AID₁ == [0 1 0 0;0 2 0 0]
	 correct52c = true
	 correct()
else
	 correct52c = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end

# ╔═╡ 86fa701e-30d2-11eb-0d7b-2988e595ecae
AID₂ = create_assembleid([n2₅, n2₄, n2₁, n2₆, n2₃, n2₂])

# ╔═╡ 8f9defd6-3418-11eb-2329-19f3eaad237e
try 
	draw_structure([e2₁,e2₂,e2₃,e2₄,e2₅,e2₆,e2₇,e2₈,e2₉],drawing_size=(650,200), origin_point=(50,150))
catch
	 still_missing()
end

# ╔═╡ e644e2b0-3326-11eb-0201-c957aa05b056
if isa(AID₂, Missing)
	 correct52c2 = false
	 still_missing()
elseif AID₂ == [1 2 4 6 8 0;0 3 5 7 0 0]
	 correct52c2 = true
	 correct()
else
	 correct52c2 = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end

# ╔═╡ af80b9f0-3328-11eb-0341-ffa35c91d3d9
md"""
## Aufgabe 5.2e)
"""

# ╔═╡ 183b656c-3329-11eb-2d43-913cfce0d065
md"""
Die Assemblierung findet in einer Schleife über die Elemente statt, in der für jedes Element zunächst die lokale Steifigkeitsmatrix $\boldsymbol{k}^e$ abgefragt wird. Diese lokale Steifigkeitsmatrix wird im Struct `Element` gespeichert.

Mithilfe der Funktion `doassemble` soll die globale Steifigkeitsmatrix nun an den passenden Einträgen mit den jeweiligen Einträgen der lokalen Steifigkeitsmatrix besetzt werden. 
Um diesen Prozess zu veranschaulichen wird das Fachwerk in Abbildung 5.4 betrachtet
"""

# ╔═╡ c964129e-3329-11eb-14f7-e15e79a291d1
HTML(open(f->read(f, String), "assets/bigstruct.svg"))

# ╔═╡ faf101e0-34ce-11eb-3507-0f79a0c20223
md"die `assembleid` des Problems lautet:"

# ╔═╡ 577505ca-34ce-11eb-0ac3-2befd0cf3020
assembleid = [1 2 4 6 8 0
	          0 3 5 7 0 0]

# ╔═╡ cdf789c6-3329-11eb-06e0-efc29792f6bb
md"""
Mit Hilfe dieser Matrix werden die einzelnen Einträge $[\boldsymbol{k}^e]_{ij}$ der Elementsteifigkeitsmatrix den Einträgen $[\boldsymbol{K}]_{ij}$ der globalen Steifigkeitsmatrix zugeordnet.
Bevor dies geschieht wird jedoch zunächst die leere globale Steifigkeitsmatrix aufgestellt mit 

$K_{ij} = 0 \quad \text{für} \quad i,j= 1,...8$

Nun wird der Element-Schleifendurchlauf gestartet.
In jedem Iterationsschrit wird zunächst die lokale Elementsteifigkeitsmatrix $\boldsymbol{k}^e$ des aktuellen Elements erfragt.
Daraufhin wird mithilfe der Funktion `doassemble` die globale Steifigkeitsmatrix $\boldsymbol{K}$ überschrieben.
Um diesen Vorgang zu verdeutlichen wird der erste Iterationsschritt (Element $e=1$) betrachtet. 
Die Positionen $i$ und $j$
in der globalen Matrix können den Einträgen der `assembleid` - Matrix entnommen werden:
"""

# ╔═╡ 8b710f90-34ce-11eb-12c5-c362c688ae49
assembleid[:,1] #Wir möchten beide Zeilen haben, 1. Zeile x Richtung - 2. Zeile y Richtung

# ╔═╡ 90f316ac-34ce-11eb-1a6b-c1e32699ab54
assembleid[:,2] #Knoten ID korrespondiert zur Spalte, also Knoten ID = 1

# ╔═╡ 348d2538-34ce-11eb-1fdf-0bee7a6e765b
md"""
mit der Elementsteifigkeitsmatrix

$\boldsymbol{k}^{\boxed{1}} = \quad
\begin{array}{l|l}
1 \qquad 0 \qquad 4 \qquad 5 & global dof\\
\hline
k_{11}^{\boxed{1}} \quad k_{12}^{\boxed{1}} \quad k_{13}^{\boxed{1}} \quad k_{14}^{\boxed{1}} & 1 \\
k_{21}^{\boxed{1}} \quad k_{22}^{\boxed{1}} \quad k_{23}^{\boxed{1}} \quad k_{24}^{\boxed{1}} & 0 \\
k_{31}^{\boxed{1}} \quad k_{32}^{\boxed{1}} \quad k_{33}^{\boxed{1}} \quad k_{34}^{\boxed{1}} & 4 \\
k_{41}^{\boxed{1}} \quad k_{42}^{\boxed{1}} \quad k_{43}^{\boxed{1}} \quad k_{44}^{\boxed{1}} & 5
\end{array}$

Die ersten zwei Zeilen und Spalten von $\boldsymbol{k}^{\boxed{1}}$ sind dem vertikalen und horizontalem Freiheitsgrad des globalen Knotens 1 zugeordnet;
die dritte und vierte Zeile sowie Spalte korrespondieren zu dem globalen Knoten 3.
Mit der dieser Information folgt nun der Aktualisierungs-Vorgang

$K_{11} \Leftarrow K_{11} + K_{11}^{\boxed{1}}, \quad K_{14} \Leftarrow K_{14} + K_{13}^{\boxed{1}}, \quad K_{15} \Leftarrow K_{15} + K_{14}^{\boxed{1}}$
$K_{41} \Leftarrow K_{41} + K_{31}^{\boxed{1}}, \quad K_{44} \Leftarrow K_{44} + K_{33}^{\boxed{1}}, \quad K_{45} \Leftarrow K_{45} + K_{43}^{\boxed{1}}$
$K_{51} \Leftarrow K_{51} + K_{41}^{\boxed{1}}, \quad K_{54} \Leftarrow K_{54} + K_{34}^{\boxed{1}}, \quad K_{55} \Leftarrow K_{55} + K_{44}^{\boxed{1}}$

Es wird deutlich, dass die Einträge der zweiten Zeile und Spalte nicht in das Update der globalen Matrix eingehen, da die zugehörigen globalen Freiheitsgrade aufgrund der Dirichlet-Randbedingungen in der `assembleid`-Matrix mit  Null gekennzeichnet sind.

Für den zweiten Iterationsschritt $e=2$, bei dem das zweite Element betrachtet wird, folgt:

$\boldsymbol{k}^{\boxed{2}} = \quad
\begin{array}{l|l}
4 \qquad 5 \qquad 8 \qquad 0 & global dof\\
\hline
k_{11}^{\boxed{2}} \quad k_{12}^{\boxed{2}} \quad k_{13}^{\boxed{2}} \quad k_{14}^{\boxed{2}} & 4 \\
k_{21}^{\boxed{2}} \quad k_{22}^{\boxed{2}} \quad k_{23}^{\boxed{2}} \quad k_{24}^{\boxed{2}} & 5 \\
k_{31}^{\boxed{2}} \quad k_{32}^{\boxed{2}} \quad k_{33}^{\boxed{2}} \quad k_{34}^{\boxed{2}} & 8 \\
k_{41}^{\boxed{2}} \quad k_{42}^{\boxed{2}} \quad k_{43}^{\boxed{2}} \quad k_{44}^{\boxed{2}} & 0
\end{array}$

$K_{44} \Leftarrow K_{44} + K_{11}^{\boxed{2}}, \quad K_{45} \Leftarrow K_{45} + K_{12}^{\boxed{2}}, \quad K_{48} \Leftarrow K_{48} + K_{13}^{\boxed{2}}$
$K_{54} \Leftarrow K_{54} + K_{21}^{\boxed{2}}, \quad K_{55} \Leftarrow K_{55} + K_{22}^{\boxed{2}}, \quad K_{58} \Leftarrow K_{58} + K_{23}^{\boxed{2}}$
$K_{84} \Leftarrow K_{84} + K_{31}^{\boxed{2}}, \quad K_{85} \Leftarrow K_{85} + K_{32}^{\boxed{2}}, \quad K_{88} \Leftarrow K_{88} + K_{33}^{\boxed{2}}$

In gleicher Weise wird für die weiteren Elemente verfahren bis der Schleifendurchlauf über alle Elemente abgeschlossen ist.
Schließlich bleibt noch zu berücksichtigen, dass ein Element je nach vorliegenden Dirichlet Randbedingungen eine unterschiedliche Anzahl von Freiheitsgraden aufweisen kann.
Um diese Tatsache algorithmisch zu handhaben kann die Funktion `doassemble` als Kontrollroutine betrachtet werden welche mithilfe von Fallunterscheidung prüft, wieviele aktive Freiheitsgrade im jeweiligen Element vorliegen.
Besitzt ein Element nur einen aktiven Freiheitsgrad so wird zum Update der globalen Steifigkeitsmatrix die Unterfunktion `assemble1!()` aufgerufen.
Liegen zwei aktive Freiheitsgrade vor wird die Unterfunktion `assemble2!` aufgerufen, und so weiter.
In den Unterfunktionen selbst wird dann das Update, wie erklärt, durchgeführt.

"""

# ╔═╡ cd5598c2-335c-11eb-3b85-35f09478e247
md"""
## Aufgabe 5.2f)
Betrachten Sie die Funktionen `assemble1!` und `assemble2!`. Schreiben Sie `assemble3!` und `assemble4!`
"""

# ╔═╡ c7424588-324f-11eb-0a0f-d55cd2709b04
function assemble1!(K,element::Element,I,J,IJ)
	i = findall(x -> x != 0, [I;J])[1]
	if i == 1
		a = I[1]
	elseif i == 2 
		a = I[2]
	elseif i == 3
		a = J[1]
	else 
		a = J[2]
	end
	
	K[a,a] = K[a,a] + element.localk[IJ[1],IJ[1]]

end

# ╔═╡ 241a065e-324d-11eb-2212-b94e2175a105
function assemble2!(K,element::Element,I,J,IJ)
	if length(findall(x -> x != 0, I)) == 2
		a = I[1]
		b = I[2]
	elseif length(findall(x -> x != 0, J)) == 2
		a = J[1]
		b = J[2]
	else 
		a = I[findall(x -> x != 0, I)[1]]
		b = J[findall(x -> x != 0, J)[1]]
	end
	
	K[a,a] = K[a,a] + element.localk[IJ[1],IJ[1]]
	K[a,b] = K[a,b] + element.localk[IJ[1],IJ[2]]
	K[b,a] = K[b,a] + element.localk[IJ[2],IJ[1]]
	K[b,b] = K[b,b] + element.localk[IJ[2],IJ[2]]
	
end	

# ╔═╡ a731e544-3247-11eb-1ee9-0f5c279f51a9
function assemble3!(K,element::Element,I,J,IJ)
	if length(findall(x -> x != 0, I)) == 1
		a = I[findall(x -> x != 0,I)[1]]
		b = J[1]
		c = J[2]
	elseif length(findall(x -> x != 0, J)) == 1
		a = I[1]
		b = I[2]
		c = J[findall(x -> x != 0,I)[1]]
	end
	
	K[a,a] = K[a,a] + element.localk[IJ[1],IJ[1]]
	K[a,b] = K[a,b] + element.localk[IJ[1],IJ[2]]
	K[a,c] = K[a,c] + element.localk[IJ[1],IJ[3]]
	K[b,a] = K[b,a] + element.localk[IJ[2],IJ[1]]
	K[b,b] = K[b,b] + element.localk[IJ[2],IJ[2]]
	K[b,c] = K[b,c] + element.localk[IJ[2],IJ[3]]
	K[c,a] = K[c,a] + element.localk[IJ[3],IJ[1]]
	K[c,b] = K[c,b] + element.localk[IJ[3],IJ[2]]
	K[c,c] = K[c,c] + element.localk[IJ[3],IJ[3]]
end

# ╔═╡ f9e01796-3244-11eb-157f-d517df2decf3
function assemble4!(K,element::Element,I,J,IJ)
	a = I[1]
	b = I[2]
	c = J[1]
	d = J[2]
	
	K[a,a] = K[a,a] + element.localk[1,1]
	K[a,b] = K[a,b] + element.localk[1,2]
	K[a,c] = K[a,c] + element.localk[1,3]
	K[a,d] = K[a,d] + element.localk[1,4]
	K[b,a] = K[b,a] + element.localk[2,1]
	K[b,b] = K[b,b] + element.localk[2,2]
	K[b,c] = K[b,c] + element.localk[2,3]
	K[b,d] = K[b,d] + element.localk[2,4]
	K[c,a] = K[c,a] + element.localk[3,1]
	K[c,b] = K[c,b] + element.localk[3,2]
	K[c,c] = K[c,c] + element.localk[3,3]
	K[c,d] = K[c,d] + element.localk[3,4]
	K[d,a] = K[d,a] + element.localk[4,1]
	K[d,b] = K[d,b] + element.localk[4,2]
	K[d,c] = K[d,c] + element.localk[4,3]
	K[d,d] = K[d,d] + element.localk[4,4]
end

# ╔═╡ b749d21a-323e-11eb-0f0e-cf692f6328cc
function doassemble(elementarray::Array{Element,1}, AID::Array{Int64,2})
	
	n = length(findall(x -> x != 0, AID))
	K = zeros(n,n)
	
	for element in elementarray
		I = AID[:, element.n1.id]
		J = AID[:,element.n2.id]
		IJ = findall(x -> x!= 0, [I;J])
		active_DOF = length(IJ)
		if active_DOF == 4
			assemble4!(K,element,I,J,IJ)
		elseif active_DOF == 3
			assemble3!(K,element,I,J,IJ)
		elseif active_DOF == 2
			assemble2!(K,element,I,J,IJ)
		else
			assemble1!(K,element,I,J,IJ)
		end
	end
	
	return K
end

# ╔═╡ 517b3434-3a1c-11eb-269d-d7e027c9f7d2
I = AID₂[:,3]

# ╔═╡ 6be5da0e-3a1c-11eb-3f1a-cd380c6b693a
J = AID₂[:,5]

# ╔═╡ 9a53e098-3a1c-11eb-3419-edc3deab6590
[I;J]

# ╔═╡ 7b09bf14-3a1c-11eb-1d18-cbd2f23e6889
findall(x -> x!= 0,[I;J])

# ╔═╡ 9d72d5d8-335d-11eb-3b46-e583eef75d04
md"""
## Aufgabe 5.2g) 
Wenden Sie die Funktion `doassemble()` auf die 2 angegebenen Strukturen an und vergleichen Sie das Ergebnis mit $k_a$ in der Frage 5.1c).
"""

# ╔═╡ c21968d8-335e-11eb-16cf-c3709a2a21e4
md"""
für die Struktur 5.4
"""

# ╔═╡ b50eb080-3561-11eb-137d-1502dcadfe54
HTML(open(f->read(f, String), "assets/bigstruct.svg"))

# ╔═╡ 94b95000-32fb-11eb-1da9-0bdf405c09da
K2₁ = doassemble([e2₉,e2₈,e2₇,e2₆,e2₅,e2₄,e2₃,e2₂,e2₁],AID₂)

# ╔═╡ 64abb59c-3418-11eb-2f08-e7996b307bef
try 
	draw_structure([e2₁,e2₂,e2₃,e2₄,e2₅,e2₆,e2₇,e2₈,e2₉],drawing_size=(650,200), origin_point=(50,150))
catch
	nothing
end

# ╔═╡ be2828f2-3561-11eb-1991-f10a1d196b08
try	
K2_true = [170.711 -70.7107 -70.7107 -100.0 0.0 0.0 0.0 0.0
	-70.7107 241.421 0.0 -70.7107 70.7107 -100.0 0.0 0.0
	-70.7107 0.0 141.421 70.7107 -70.7107 0.0 0.0 0.0
	-100.0 -70.7107 70.7107 341.421 0.0 -70.7107 -70.7107 -100.0
	 0.0 70.7107 -70.7107 0.0 141.421 -70.7107 -70.7107 0.0
	0.0 -100.0 0.0 -70.7107 -70.7107 341.421 0.0 -70.7107
	0.0 0.0 0.0 -70.7107 -70.7107 0.0 141.421 70.7107
	0.0 0.0 0.0 -100.0 0.0 -70.7107 70.7107 241.421]
if isapprox(K2_true-K2₁,zeros(8,8); atol = 1)
	 correct52g = true
	 correct()
else
	 correct52g = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end
catch
	still_missing()
end

# ╔═╡ b4c94006-335e-11eb-1e25-ff99ac4537c3
md"""
für die Struktur 4.1
"""

# ╔═╡ 8829041a-3563-11eb-030d-a71d5c71c191
HTML(open(f->read(f, String), "assets/file4.1.svg"))

# ╔═╡ b291edea-335e-11eb-097c-ef347082c6c8
begin 
	e1₁ = Element(10000,0.02,n1₁,n1₂,1)
	e1₂ = Element(10000,0.02,n1₃,n1₂,2)
	e1₃ = Element(10000,0.02,n1₂,n1₄,3)
end

# ╔═╡ 4336a372-3418-11eb-32e3-996957c0095f
try
	draw_structure([e1₁, e1₂,e1₃],drawing_size=(650,300), origin_point=(50,250))
catch
	still_missing()
end

# ╔═╡ 0d3ffff6-335e-11eb-3343-6d976bd62664
K2₂ = doassemble([e1₂, e1₃, e1₁], AID₁)

# ╔═╡ 1967ba12-3563-11eb-27ff-012dd1e376de
try
if isapprox(K2₂,[117.889 35.7771; 35.7771 171.554];atol = 1)
	 correct52g2 = true
	 correct()
else
	 correct52g2 = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end
catch
	still_missing()
end

# ╔═╡ 1576689a-3360-11eb-146c-0d395253c4a8
md"""
## Aufgabe 5.2h)
Schreiben Sie die Funktion `build_load_vector`, die für den Aufbau des Lastvektors verantwortlich ist. Probieren Sie die funktion für Strukturen 4.1 und 5.4
"""

# ╔═╡ 42410726-3361-11eb-3eb0-a161350a6345
hint(md"""
Die Funktion sollte die Knoten und die Assembleid-Matrix als Argumente haben.
""")

# ╔═╡ 0a10c624-325e-11eb-3dfb-59169b2863a9
function build_load_vector(narray::Array{Node,1}, AID::Array{Int64,2})
	n = length(findall(x -> x != 0, AID))
	R = zeros(n)
	
	# Zu erst werden die DOFs wieder nach ihrer Nummer sortiert
	sorted_nodes = Array{Node,1}(undef,length(narray))
	for node in narray 
		sorted_nodes[node.id] = node
	end
	# jetzt loopen wir wieder über die geordneten DOFs
	for i in 1:length(sorted_nodes)
		if AID[1,i] != 0
			R[AID[1,i]] += sorted_nodes[i].force[1]
		end
		if AID[2,i] != 0 
			R[AID[2,i]] += sorted_nodes[i].force[2]
		end
	end
	return R
end

# ╔═╡ 7d7cbbf8-3304-11eb-13c7-b9d2236ac7d4
r1 = build_load_vector([n1₂,n1₁,n1₃,n1₄],AID₁)

# ╔═╡ d3904184-3563-11eb-228d-693b41b3798c
try
	if r1 ≈ [0.01, -0.05]
	 correct52h = true
	 correct()
else
	 correct52h = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end
catch
	still_missing()
end

# ╔═╡ 4820f362-326d-11eb-239a-4b44cc20a425
r2 = build_load_vector([n2₆,n2₅,n2₄,n2₃,n2₂,n2₁],AID₂)

# ╔═╡ ef131e22-3563-11eb-1a81-bb6564423511
try
if r2 ≈ [0, 0,0,0,0,0,0,0]
	 correct52h2 = true
	 correct()
else
	 correct52h2 = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end
catch
	still_missing()
end

# ╔═╡ 6ba1599c-3361-11eb-1051-2d8cb2ab5f83
md"""
## Aufgabe 5.2i) 
Finden Sie den Verschiebungsvektor die struktur 4.1 und vergleiche ihn mit 5.1c)
"""

# ╔═╡ 94d50e1a-3361-11eb-3a11-319636f9ef0a
D2 = K2₂\r1

# ╔═╡ b6b8f942-3361-11eb-04c6-4d383bfa88fa
try
	if D2 ≈ [0.00018498447189992432, -0.00033003105620015146]
	 correct52i = true
	 correct()
else
	 correct52i = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end
catch
	still_missing()
end

# ╔═╡ ff8d1a1c-3362-11eb-2456-9d4ef28e6b59
md"""
## Aufgabe 5.3
Finden Sie mit Hilfe aller erstellten Funktionen den Verschiebungsvektor der folgenden Struktur. 

$F_1^2 = 0.01, \quad F_2^2 = -0.05$

$E=10000\qquad A_1 = 0.02, A_2 = 0.015$
"""

# ╔═╡ 82d27b28-3364-11eb-1e71-a956feda2d02
HTML(open(f->read(f, String), "assets/struct5.3.svg"))

# ╔═╡ 9dcf44da-3303-11eb-08c4-3b3a45c7303c
begin
	n3₁ = Node([0,0],[false,false],1,[0,0])
	n3₂ = Node([2,2],[true,true],2,[0.01,-0.05])
	n3₃ = Node([4,2],[false,false],3,[0,0])
end

# ╔═╡ fab600d0-3303-11eb-09bc-7b09fc8adcc1
begin 
	e3₁ = Element(10000,0.02,n3₁,n3₂,1)
	e3₂ = Element(10000,0.015,n3₂,n3₃,2)
end

# ╔═╡ f9731df6-3417-11eb-0750-05d638090992
try
	draw_structure([e3₁, e3₂],drawing_size=(650,300), origin_point=(50,250))
catch
	still_missing()
end

# ╔═╡ 3bc3eb7a-3304-11eb-0712-f971de0475a0
AID₃ = create_assembleid([n3₁,n3₂,n3₃])

# ╔═╡ 57c21912-3304-11eb-18b5-5dca9fd1ca91
K3 = doassemble([e3₁,e3₂],AID₃)

# ╔═╡ 8ad8ae06-3363-11eb-1f32-219f892ef5e0
r3 = build_load_vector([n3₁,n3₂,n3₃],AID₃)

# ╔═╡ 9990ecec-3363-11eb-227c-d7fda1bde48a
D3 = K3\r3

# ╔═╡ b108d542-3363-11eb-2db8-a5323baebf6d
try
if D3 ≈ [0.0008000000000000001, -0.002214213562373096]
	 correct53 = true
	 correct()
else
	 correct53 = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end
catch
	still_missing()
end

# ╔═╡ Cell order:
# ╟─040aca22-2f39-11eb-10c1-9b60aa983b9e
# ╟─aa329452-2f39-11eb-31d8-ad7314cbeb31
# ╟─15f4d0ba-2f3a-11eb-3ac1-d94e11540f54
# ╟─c49a8484-2f3a-11eb-1400-1369a263adca
# ╟─529307d8-2f3c-11eb-34bf-9b3587e352a1
# ╟─cc9e78a2-3327-11eb-1a07-2d7d6263c710
# ╠═1ca1a746-2f51-11eb-04ca-e37ea8e6adf5
# ╟─86488cf6-2f4b-11eb-38ac-45f547ae8c98
# ╟─1281faf0-2f50-11eb-142d-d510cdc821f9
# ╠═6c76f5dc-2f51-11eb-108e-cdd32492a7bf
# ╟─942f7246-387c-11eb-0943-4fd1f9731b8b
# ╟─5a8c7450-3311-11eb-1043-dbe83bb9ae2e
# ╟─c46cbfbe-3317-11eb-1a56-0f9a0ed102c9
# ╟─88287da8-2f3a-11eb-3e11-dde5c2477600
# ╟─ef823d38-2f56-11eb-3c09-4b4b580b4476
# ╠═83caf3f8-3318-11eb-2957-c37fc660848f
# ╠═e6485b34-2f52-11eb-03d1-7dca1f4cf989
# ╠═c28da868-2f55-11eb-388d-7b34612d1e18
# ╠═d02140ac-2f55-11eb-2c49-17aee10e1d81
# ╠═9bb9904c-2f57-11eb-368a-890dbed7dea2
# ╠═0b5f09ae-2f58-11eb-3369-0fa44a6c007b
# ╠═1e69f590-2f58-11eb-2e4f-2b8cba23fee6
# ╟─ef35fdae-3318-11eb-27a8-bd08c4559794
# ╟─8e65690e-2fff-11eb-3009-bfb2fec767ae
# ╟─b45c421c-3000-11eb-0cbf-433e191f2314
# ╟─8d6a2250-3002-11eb-3c19-31ac04361ee4
# ╟─4b1310c8-3321-11eb-2602-6f3393ba89dc
# ╠═60b7b740-3099-11eb-02b8-eb8bf877662c
# ╟─c234461e-30aa-11eb-1dfb-d3e958d78831
# ╟─38052d30-3327-11eb-1b0b-f9e7a3393948
# ╟─97936350-3324-11eb-3a0c-d79ad97f2761
# ╠═0ee0ab68-30d0-11eb-219a-49a79141fdf6
# ╠═a555b458-30d0-11eb-2a40-b9962e49f921
# ╟─33a246f6-3322-11eb-1b28-8f705d18953e
# ╟─c5163552-3322-11eb-133f-fd85c3e1e9a1
# ╟─d44533c0-3322-11eb-0dd4-2749e1fe1c89
# ╟─b1b6b9bc-3324-11eb-2c59-b106f2a65357
# ╟─f609ca00-3324-11eb-00af-2b1fa3ed6fb3
# ╟─4aa8ce12-3325-11eb-006d-4fdf804c2828
# ╠═a06c5e30-30b0-11eb-15de-9702f870e34d
# ╟─3f08eb2a-387d-11eb-147f-8d547b29dd27
# ╟─d01e4b26-3325-11eb-372c-9594ed05ecac
# ╠═16ffc812-3326-11eb-3112-27a5e3d7cab4
# ╟─52e724f6-3326-11eb-29c5-bd8b3cdae3de
# ╠═86fa701e-30d2-11eb-0d7b-2988e595ecae
# ╟─8f9defd6-3418-11eb-2329-19f3eaad237e
# ╟─e644e2b0-3326-11eb-0201-c957aa05b056
# ╟─af80b9f0-3328-11eb-0341-ffa35c91d3d9
# ╟─183b656c-3329-11eb-2d43-913cfce0d065
# ╟─c964129e-3329-11eb-14f7-e15e79a291d1
# ╟─faf101e0-34ce-11eb-3507-0f79a0c20223
# ╠═577505ca-34ce-11eb-0ac3-2befd0cf3020
# ╟─cdf789c6-3329-11eb-06e0-efc29792f6bb
# ╠═8b710f90-34ce-11eb-12c5-c362c688ae49
# ╠═90f316ac-34ce-11eb-1a6b-c1e32699ab54
# ╟─348d2538-34ce-11eb-1fdf-0bee7a6e765b
# ╟─cd5598c2-335c-11eb-3b85-35f09478e247
# ╠═c7424588-324f-11eb-0a0f-d55cd2709b04
# ╠═241a065e-324d-11eb-2212-b94e2175a105
# ╠═a731e544-3247-11eb-1ee9-0f5c279f51a9
# ╠═f9e01796-3244-11eb-157f-d517df2decf3
# ╠═b749d21a-323e-11eb-0f0e-cf692f6328cc
# ╠═517b3434-3a1c-11eb-269d-d7e027c9f7d2
# ╠═6be5da0e-3a1c-11eb-3f1a-cd380c6b693a
# ╠═9a53e098-3a1c-11eb-3419-edc3deab6590
# ╠═7b09bf14-3a1c-11eb-1d18-cbd2f23e6889
# ╟─9d72d5d8-335d-11eb-3b46-e583eef75d04
# ╟─c21968d8-335e-11eb-16cf-c3709a2a21e4
# ╟─b50eb080-3561-11eb-137d-1502dcadfe54
# ╠═94b95000-32fb-11eb-1da9-0bdf405c09da
# ╟─64abb59c-3418-11eb-2f08-e7996b307bef
# ╟─be2828f2-3561-11eb-1991-f10a1d196b08
# ╟─b4c94006-335e-11eb-1e25-ff99ac4537c3
# ╟─8829041a-3563-11eb-030d-a71d5c71c191
# ╠═b291edea-335e-11eb-097c-ef347082c6c8
# ╟─4336a372-3418-11eb-32e3-996957c0095f
# ╠═0d3ffff6-335e-11eb-3343-6d976bd62664
# ╟─1967ba12-3563-11eb-27ff-012dd1e376de
# ╟─1576689a-3360-11eb-146c-0d395253c4a8
# ╟─42410726-3361-11eb-3eb0-a161350a6345
# ╠═0a10c624-325e-11eb-3dfb-59169b2863a9
# ╠═7d7cbbf8-3304-11eb-13c7-b9d2236ac7d4
# ╟─d3904184-3563-11eb-228d-693b41b3798c
# ╠═4820f362-326d-11eb-239a-4b44cc20a425
# ╟─ef131e22-3563-11eb-1a81-bb6564423511
# ╟─6ba1599c-3361-11eb-1051-2d8cb2ab5f83
# ╠═94d50e1a-3361-11eb-3a11-319636f9ef0a
# ╟─b6b8f942-3361-11eb-04c6-4d383bfa88fa
# ╟─ff8d1a1c-3362-11eb-2456-9d4ef28e6b59
# ╟─82d27b28-3364-11eb-1e71-a956feda2d02
# ╠═9dcf44da-3303-11eb-08c4-3b3a45c7303c
# ╠═fab600d0-3303-11eb-09bc-7b09fc8adcc1
# ╟─f9731df6-3417-11eb-0750-05d638090992
# ╠═3bc3eb7a-3304-11eb-0712-f971de0475a0
# ╠═57c21912-3304-11eb-18b5-5dca9fd1ca91
# ╠═8ad8ae06-3363-11eb-1f32-219f892ef5e0
# ╠═9990ecec-3363-11eb-227c-d7fda1bde48a
# ╟─b108d542-3363-11eb-2db8-a5323baebf6d
