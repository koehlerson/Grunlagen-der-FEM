### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 58d68d8a-2286-11eb-1240-131a943d6476
include("../../definitions/def.jl")

# ╔═╡ 3ae07614-1e9f-11eb-1c0f-87391866f5c4
md"""
# Assemblierung 
Willkommen in der vierten Übung im Modul Grundlagen der FEM. In dieser Übung werden wir uns mit der Assemblierung von Fachwerkelementen beschäftigen.
"""

# ╔═╡ 12c5a564-33fb-11eb-3e9c-2d4902290dda
html"""
<iframe width="100%" height="400" src="https://www.youtube.com/embed/N6hwyeJHPJc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
"""

# ╔═╡ 81b2f330-1e9f-11eb-24ec-07abca3077b1
md"
## Aufgabe 4.1 - Ebenes Fachwerk
Gegeben sei das folgende Fachwerk:
"

# ╔═╡ 36e9bf14-1ea6-11eb-2d7b-1fbf2437b474
HTML(open(f->read(f, String), "assets/file4.1.svg"))

# ╔═╡ 9acc3504-1e9f-11eb-0cf7-c74777523852
md"
a) Welche grundlegenden Schritte sind erforderlich um das Problem mithilfe der Finite-Elemente Methode zu lösen?

"

# ╔═╡ f9bce7ee-2286-11eb-138d-ab50b327be7e
solution(md"""
1. Modellbildung:

Ersetzen des reellen Systems durch mathematisches Modell (Variationsgleichung/ schwache Form) 

Beispiel Fachwerk: 
	
$${\delta \Pi}^{stab} = G^e = \underbrace{\int_0^l EAu' \delta u' dx}_{\delta\Pi^{\text{int},e}} - {\delta 	\Pi}^{\text{ext},e}$$

Warum schwache Form? 

a) es treten nur Ableitungen 1. Ordnung auf $\Rightarrow$ numerisch einfacher zu approximieren

b) Einbinden der Randbedingung "direkt" möglich. 

2. Diskretisierung 

a) aufteilen der zu untersuchenden Struktur in finite Elemente

b) kontinuierliche Lösungsfunktionen werden approximiert durch diskrete Knotenwerte, welche über das Element interpoliert werden

3. Elementsteifigkeitsmatrizen $\underline{\boldsymbol{k}}^e$ und Lastvektoren $\underline{\boldsymbol{p}}^e$ aufstellen

 $\rightarrow$ $\underline{\boldsymbol{k}}^e$ beinhalten Informationen über Material und Geometrie des jeweiligen Elements

 $\rightarrow$ $\underline{\boldsymbol{p}}^e$ beinhalten Informationen über Lasten (Volumenkräfte, Neumann-RB)

4. Assemblierung 

 $\rightarrow$ Zusammenführung der einzelnen Elementmatrizen zu globalem Gleichungssystem
	
 $\rightarrow$ Berücksichtigung der Dirichlet - RB 

5. Lösen
""")

# ╔═╡ eff87330-1e9f-11eb-0976-55b763f969eb
md"Im Folgenden sei angenommen, dass die jeweiligen Elementsteifigkeitsmatrizen $\underline{\boldsymbol{k}}^e$ bekannt sind."

# ╔═╡ b7293c42-1e9f-11eb-1485-5dd584ff3369
md"
b) Assemblieren Sie aus den Elementsteifigkeitsmatrizen die globale Steifigkeitsmatrix $\underline{\boldsymbol{K}}$ Stellen Sie den globalen Lastvektor $\underline{\boldsymbol{P}}$ und das globale Gleichungssystem auf.

Nutzen Sie die in Abbildung 4.2 dargestellte Element- und Knotennummerierung.
"

# ╔═╡ 129173e6-33fa-11eb-077b-43854380f681
HTML(open(f->read(f, String), "assets/file4.1.svg"))

# ╔═╡ f705e684-2288-11eb-214e-39f140373c34
begin
k1_1_true = ["k_{11}^{1}" "k_{12}^{1}" "k_{13}^{1}" "k_{14}^{1}" 
"k_{21}^{1}" "k_{22}^{1}" "k_{23}^{1}" "k_{24}^{1}" 
"k_{31}^{1}" "k_{32}^{1}" "k_{33}^{1}" "k_{34}^{1}" 
"k_{41}^{1}" "k_{42}^{1}" "k_{43}^{1}" "k_{44}^{1}"]
d1_1_true = ["D_{1}"
	"D_{2}"
	"D_{3}"
	"D_{4}"]
	nothing
end

# ╔═╡ 3fd7fda8-228a-11eb-019d-a987be0605e5
k1_1 = ["0" "0" "0" "0" 
"0" "0" "0" "0" 
"0" "0" "0" "0" 
"0" "0" "0" "0"]

# ╔═╡ d35ee188-2833-11eb-39f3-4d1680ee863c
d1_1 = ["0"
	"0"
	"0"
	"0"]

# ╔═╡ 15c5a436-2835-11eb-347d-ed06c3ac6664
show_matrix(k1_1,d1_1)

# ╔═╡ d4900cb4-2833-11eb-10b5-c503830bc8c9
if k1_1 == k1_1_true && d1_1 == d1_1_true
	 correct41b1 = true
	 correct()
else
	 correct41b1 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 2cc1c750-2835-11eb-1869-8f8a8215fb48
solution(md"""
$\boldsymbol{k}^1 = \begin{bmatrix}
k_{11}^1 & k_{12}^1 & k_{13}^1 & k_{14}^1 \\
k_{21}^1 & k_{22}^1 & k_{23}^1 & k_{24}^1 \\
k_{31}^1 & k_{32}^1 & k_{33}^1 & k_{34}^1 \\
k_{41}^1 & k_{42}^1 & k_{43}^1 & k_{44}^1
\end{bmatrix} \quad \boldsymbol{d}^1 = \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4
\end{bmatrix}$
""")

# ╔═╡ a37ee288-2835-11eb-3c7d-c5eb79a4b89e
begin
	k1_2_true = [0 0 0 0 
0 "k_{66}^{2}" 0 "k_{64}^{2}" 
0 0 0 0 
0 "k_{46}^{2}" 0 "k_{44}^{2}"]
	d1_2_true = ["D_{5}"
		"D_{6}"
		"D_{3}"
		"D_{4}"]
	nothing
end

# ╔═╡ e7cad600-228a-11eb-2165-b19bcd6a2a8a
k1_2 = [0 0 0 0 
0 "0" 0 "0" 
0 0 0 0 
0 "0" 0 "0"]

# ╔═╡ 985640ea-2835-11eb-2974-d535e0cb95cc
d1_2 = ["0"
		"0"
		"0"
		"0"]

# ╔═╡ 993a87dc-2835-11eb-3713-6beef93ac8c4
show_matrix(k1_2,d1_2)

# ╔═╡ 1694a15e-2836-11eb-30bf-73c9bb9371fe
if k1_2 == k1_2_true && d1_2 == d1_2_true
	 correct41b2 = true
	 correct()
else
	 correct41b2 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 2dd50818-2836-11eb-0943-61c0ead89ff4
solution(md"""
$\boldsymbol{k}^2 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & k_{66}^2 & 0 & k_{64}^2 \\
0 & 0 & 0 & 0 \\
0 & k_{46}^2 & 0 & k_{44}^2
\end{bmatrix} \quad \boldsymbol{d}^2 = \begin{bmatrix}
D_5 \\ D_6 \\ D_3 \\ D_4
\end{bmatrix}$
""")

# ╔═╡ eb5481d8-2837-11eb-0b10-17f191cc4022
begin 
	k1_3_true = ["k_{33}^{3}" 0 "k_{37}^{3}" 0
0 0 0 0 
"k_{73}^{3}" 0 "k_{77}^{3}" 0 
0 0 0 0]
	d1_3_true = ["D_{3}"
		"D_{4}"
		"D_{7}"
		"D_{8}"]
	nothing 
end

# ╔═╡ f5131368-228a-11eb-3ca3-bd164ac72650
k1_3 = ["0" 0 "0" 0
0 0 0 0 
"0" 0 "0" 0 
0 0 0 0]

# ╔═╡ 7575e4b0-2838-11eb-3698-1defd5cf7cb5
d1_3 = ["0"
		"0"
		"0"
		"0"]

# ╔═╡ 8788895a-2838-11eb-1aca-cd40b7cf97eb
show_matrix(k1_3,d1_3)

# ╔═╡ 8fb4a5be-2838-11eb-0b35-ad0d3901f0bb
if k1_3 == k1_3_true && d1_3 == d1_3_true
	 correct41b3 = true
	 correct()
else
	 correct41b3 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 5d32ebac-283b-11eb-3b2e-892a613c5800
solution(md"""
$\boldsymbol{k}^3 = \begin{bmatrix}
k_{33}^3 & 0 & k_{37}^3 & 0 \\
0 & 0 & 0 & 0 \\
k_{73}^3 & 0 & k_{77}^3 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^3 = \begin{bmatrix}
D_3 \\ D_4 \\ D_7 \\ D_8
\end{bmatrix}$
""")

# ╔═╡ bc5a443c-283a-11eb-0d9c-198ff047602f
begin
	k1_assemb_true = ["k_{11}^{1}" "k_{12}^{1}" "k_{13}^{1}" "k_{14}^{1}" 0 0 0 0 
"k_{21}^{1}" "k_{22}^{1}" "k_{23}^{1}" "k_{24}^{1}" 0 0 0 0 
"k_{31}^{1}" "k_{32}^{1}" "k_{33}^{1} + k_{33}^{3}" "k_{34}^{1}" 0 0 "k_{37}^{3}" 0 
"k_{41}^{1}" "k_{42}^{1}" "k_{43}^{1}" "k_{44}^{1} + k_{44}^{2}" 0 "k_{46}^{2}" 0 0 
0 0 0 0 0 0 0 0 
0 0 0 "k_{64}^{2}" 0 "k_{66}^{2}" 0 0 
0 0 "k_{73}^{3}" 0 0 0 "k_{77}^{3}" 0
0 0 0 0 0 0 0 0]
	d1_true = ["D_{1}"
	"D_{2}"
	"D_{3}"
	"D_{4}"
	"D_{5}"
	"D_{6}"
	"D_{7}"
	"D_{8}"]
	P1_true = [0
	0
	"F_{x}"
	"F_{y}"
	0
	0
	0
	0]
	nothing
end

# ╔═╡ 85e45d38-228c-11eb-3344-df87a82d7cf5
k1_assemb= ["0" "0" "0" "0" 0 0 0 0 
"0" "0" "0" "0" 0 0 0 0 
"0" "0" "0" "0" 0 0 "0" 0 
"0" "0" "0" "0" 0 "0" 0 0 
0 0 0 0 0 0 0 0 
0 0 0 "0" 0 "0" 0 0 
0 0 "0" 0 0 0 "0" 0
0 0 0 0 0 0 0 0]

# ╔═╡ 39d7eca8-283a-11eb-3717-87c12b1da1bf
d1 = ["0"
	"0"
	"0"
	"0"
	"0"
	"0"
	"0"
	"0"]

# ╔═╡ 834035da-283a-11eb-22b8-b3535af295be
P1 = [0
	0
	"0"
	"0"
	0
	0
	0
	0]

# ╔═╡ a6269cf4-283a-11eb-0137-95a7883e792a
show_matrix(k1_assemb, d1, P1, "=")

# ╔═╡ b045f042-283a-11eb-2aec-afe2645e5908
if k1_assemb == k1_assemb_true && d1 == d1_true && P1 == P1_true
	 correct41b4 = true
	 correct()
else
	 correct41b4 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 7be1c582-283b-11eb-284f-054823a42919
solution(md"""
$\begin{bmatrix}
k_{11}^1 & k_{12}^1 & k_{13}^1 & k_{14}^1 & 0 & 0 & 0 & 0 \\
k_{21}^1 & k_{22}^1 & k_{23}^1 & k_{24}^1 & 0 & 0 & 0 & 0 \\
k_{31}^1 & k_{32}^1 & k_{33}^1 + k_{33}^3 & k_{34}^1 & 0 & 0 & k_{37}^3 & 0 \\
k_{41}^1 & k_{42}^1 & k_{43}^1 & k_{44}^1 + k_{44}^2 & 0 & k_{46}^2 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & k_{64}^2 & 0 & k_{66}^2 & 0 & 0 \\
0 & 0 & k_{73}^3 & 0 & 0 & 0 & k_{77}^3 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0
\end{bmatrix} \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4 \\ D_5 \\ D_6 \\ D_7 \\ D_8
\end{bmatrix} = \begin{bmatrix}
0 \\ 0 \\ F_x \\ F_y \\ 0 \\ 0 \\ 0 \\ 0
\end{bmatrix}$ 
""")

# ╔═╡ c452aaa2-283b-11eb-2370-7bc88abafb1d
md"c) Reduzieren Sie das Gleichungssystem unter Berücksichtigung der Dirichlet-Randbedingungen."

# ╔═╡ 3eb8b1d2-27f2-11eb-37b9-85faac0290b5
begin
k1_assemb_red_true = ["k_{33}^{1} + k_{33}^{3}" "k_{34}^{1}"
				  "k_{43}^{1}" "k_{44}^{1} + k_{44}^{2}"]
	d1_red_true = ["D_{3}"
		  		   "D_{4}"]
	P1_red_true = ["F_{x}"
		  		   "F_{y}"]
	nothing
end

# ╔═╡ 5b2c7692-283c-11eb-2810-91ab9d6fb0b9
k1_assemb_red = ["0" "0"
				  "0" "0"]

# ╔═╡ 78e5db60-283c-11eb-24b5-5722c1afcfa2
d1_red = ["0"
		  "0"]

# ╔═╡ 8f2f12ec-283c-11eb-1227-6556fd36142e
P1_red = ["0"
		  "0"]

# ╔═╡ 6889c6f0-283c-11eb-38a2-4d22066f68cc
show_matrix(k1_assemb_red,d1_red, P1_red, "=")

# ╔═╡ a1a82f06-283c-11eb-2da1-91ba6f950165
if k1_assemb_red == k1_assemb_red_true && d1_red == d1_red_true && P1_red == P1_red_true
	 correct41b5 = true
	 correct()
else
	 correct41b5 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 7c2a8d8a-2287-11eb-0497-7da2fa49f1d3
solution(md"""
$\boldsymbol{D} = \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4 \\ D_5 \\ D_6 \\ D_7 \\ D_8
\end{bmatrix}$

Globales lastvektor: $\boldsymbol{P} = \begin{bmatrix}
0 & 0 & F_x & F_y & 0 & 0 & 0 & 0
\end{bmatrix}^T$

assemblierung des elementseifigkeitsmatrix 

e = 1 

$\boldsymbol{k}^1 = \begin{bmatrix}
k_{11}^1 & k_{12}^1 & k_{13}^1 & k_{14}^1 \\
k_{21}^1 & k_{22}^1 & k_{23}^1 & k_{24}^1 \\
k_{31}^1 & k_{32}^1 & k_{33}^1 & k_{34}^1 \\
k_{41}^1 & k_{42}^1 & k_{43}^1 & k_{44}^1
\end{bmatrix} \quad \boldsymbol{d}^1 = \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4
\end{bmatrix}$

e = 2 

$\boldsymbol{k}^2 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & k_{66}^2 & 0 & k_{64}^2 \\
0 & 0 & 0 & 0 \\
0 & k_{46}^2 & 0 & k_{44}^2
\end{bmatrix} \quad \boldsymbol{d}^2 = \begin{bmatrix}
D_5 \\ D_6 \\ D_3 \\ D_4
\end{bmatrix}$

e = 3 

$\boldsymbol{k}^3 = \begin{bmatrix}
k_{33}^3 & 0 & k_{37}^3 & 0 \\
0 & 0 & 0 & 0 \\
k_{73}^3 & 0 & k_{77}^3 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^3 = \begin{bmatrix}
D_3 \\ D_4 \\ D_7 \\ D_8
\end{bmatrix}$

Gloabales gleichungssystem $\boldsymbol{K}\boldsymbol{D} = \boldsymbol{P}$

$\begin{bmatrix}
k_{11}^1 & k_{12}^1 & k_{13}^1 & k_{14}^1 & 0 & 0 & 0 & 0 \\
k_{21}^1 & k_{22}^1 & k_{23}^1 & k_{24}^1 & 0 & 0 & 0 & 0 \\
k_{31}^1 & k_{32}^1 & k_{33}^1 + k_{33}^3 & k_{34}^1 & 0 & 0 & k_{37}^3 & 0 \\
k_{41}^1 & k_{42}^1 & k_{43}^1 & k_{44}^1 + k_{44}^2 & 0 & k_{46}^2 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & k_{64}^2 & 0 & k_{66}^2 & 0 & 0 \\
0 & 0 & k_{73}^3 & 0 & 0 & 0 & k_{77}^3 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0
\end{bmatrix} \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4 \\ D_5 \\ D_6 \\ D_7 \\ D_8
\end{bmatrix} = \begin{bmatrix}
0 \\ 0 \\ F_x \\ F_y \\ 0 \\ 0 \\ 0 \\ 0
\end{bmatrix}$ 

Dirichlet-RB: 

$\begin{bmatrix}
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & k_{33}^1 + k_{33}^3 & k_{34}^1 & 0 & 0 & 0 & 0 \\
0 & 0 & k_{43}^1 & k_{44}^1 + k_{44}^2 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0
\end{bmatrix} \begin{bmatrix}
0 \\ 0 \\ D_3 \\ D_4 \\ 0 \\ 0 \\ 0 \\ 0
\end{bmatrix} = \begin{bmatrix}
0 \\ 0 \\ F_x \\ F_y \\ 0 \\ 0 \\ 0 \\ 0
\end{bmatrix}$

$\begin{bmatrix}
k_{33}^1 + k_{33}^3 & k_{34}^1\\
k_{43}^1 & k_{44}^1 + k_{44}^2
\end{bmatrix} \begin{bmatrix}
D_3 \\ D_4
\end{bmatrix} = \begin{bmatrix}
F_x \\ F_y
\end{bmatrix}$
""")

# ╔═╡ 4178f5c2-1ea0-11eb-31e1-7522982984e0
md"
## Aufgabe 4.2 - Ebenes Fachwerk
Gegeben sei das dargestellte ebene Fachwerk, für das die jeweiligen Elementsteifigkeitsmatrizen $\underline{\boldsymbol{k}}^e$ als bekannt angenommen werden.
"

# ╔═╡ 4911b53e-1ea6-11eb-3b82-091fef345ed9
HTML(open(f->read(f, String), "assets/file4.2.svg"))

# ╔═╡ 6ff9159e-1ea0-11eb-2b8b-b77d5d946390
md"
**1. Stellen sie elementweise Steifigkeitsmatrix und Lastvektor unter Berücksichtigung der Dirichlet RB auf**

**2. Assemblieren sie die reduzierten Formen zum globalen System**
"

# ╔═╡ 1b2deee0-2819-11eb-1444-2f3bdf6e69fb
begin
k2_1_true = ["k_{44}^{1}"]
d2_1_true = ["D_{4}"]
nothing
end

# ╔═╡ fd0b6706-281f-11eb-258b-0bd2c375f882
hint(md"""
$\boldsymbol{k}^1 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & k_{22}^1 & 0 & k_{24}^1 \\
0 & 0 & 0 & 0 \\
0 & k_{42}^1 & 0 & k_{44}^1
\end{bmatrix} \quad \boldsymbol{d}^1 = \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4
\end{bmatrix}$
""")

# ╔═╡ 8251bc86-228e-11eb-072a-31b1ab15ae22
k2_1 = ["0"]

# ╔═╡ fc078b5e-281b-11eb-1293-f7604090c27e
d2_1 = ["0"]

# ╔═╡ 0cabbaaa-27f3-11eb-21aa-159bdc281a6b
show_matrix(k2_1, d2_1)

# ╔═╡ 088d4e46-2819-11eb-3681-9b0c12ad0f95
if k2_1 == k2_1_true && d2_1 == d2_1_true
	 correct42a1 = true
	 correct()
else
	 correct42a1 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 0e793958-2820-11eb-14fd-4ddb2ed793dd
solution(md"""
Dirichlet - RB: 
	
$\boldsymbol{k}^1 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & k_{44}^1
\end{bmatrix} \quad \boldsymbol{d}^1 = \begin{bmatrix}
0 \\ 0 \\ 0 \\ D_4
\end{bmatrix}$

$\implies$
	
$\boldsymbol{k}^1 = k_{44}^1 \quad \boldsymbol{d}^1 = d_4$""")

# ╔═╡ 28ebefa4-283d-11eb-0e31-2301d29d24d4
begin
	k2_2_true = ["k_{77}^{2}" 0 
0 0]
	d2_2_true = ["D_{7}"
		        "D_{8}"]
	nothing
end

# ╔═╡ d103a3c4-228e-11eb-0a24-8d1cc3add5aa
k2_2 = ["0" 0 
0 0]

# ╔═╡ b96bdcae-283d-11eb-25e4-79c6ab15af58
d2_2 = ["0"
		"0"]

# ╔═╡ fdcf62aa-283d-11eb-0a39-c3ce1744a2a5
show_matrix(k2_2, d2_2)

# ╔═╡ 0db83d60-283e-11eb-0c1c-43f75ffe9686
if k2_2 == k2_2_true && d2_2 == d2_2_true
	 correct42a2 = true
	 correct()
else
	 correct42a2 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 50126336-283f-11eb-26c4-23edc4d7a490
solution(md"""
$\boldsymbol{k}^2 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & k_{77}^2 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^2 = \begin{bmatrix}
0 \\ 0 \\ D_7 \\ D_8
\end{bmatrix}$
	
$\implies$

$\boldsymbol{k}^2 = \begin{bmatrix}
k_{77}^2 & 0 \\
0 & 0
\end{bmatrix} \quad \boldsymbol{d}^2 = \begin{bmatrix}
D_7 \\ D_8
\end{bmatrix}$
	""")

# ╔═╡ c149d954-283e-11eb-1c8c-3f05b25185d8
begin
	k2_3_true = ["k^3_{55}" "k^3_{56}"
	"k^3_{65}" "k^3_{66}"]
	d2_3_true = ["D_{5}"
"D_{6}"]
	nothing
end

# ╔═╡ d6d3d00a-228e-11eb-3a59-59d07fef34d5
k2_3 = ["0" "0"
	"0" "0"]

# ╔═╡ 2cf18314-283f-11eb-2c00-0f03e65a97d0
d2_3 = ["0"
"0"]

# ╔═╡ 390d1b36-283f-11eb-3933-a90e123c3d46
show_matrix(k2_3,d2_3)

# ╔═╡ 42bfbc56-283f-11eb-1ee5-b5f0285b9a52
if k2_3 == k2_3_true && d2_3 == d2_3_true
	 correct42a3 = true
	 correct()
else
	 correct42a3 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 2747c184-2840-11eb-0125-754a1829b50e
solution(md"""
$\boldsymbol{k}^3 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & k_{55}^3 & k_{56}^3 \\
0 & 0 & k_{65}^3 & k_{66}^3
	\end{bmatrix} \quad \boldsymbol{d}^3 = \begin{bmatrix}
0 \\ 0 \\ D_5 \\ D_6
\end{bmatrix}$
	
$\implies$

$\boldsymbol{k}^3 = \begin{bmatrix}
k_{55}^3 & k_{56}^3 \\
k_{65}^3 & k_{66}^3
\end{bmatrix} \quad \boldsymbol{d}^3 = \begin{bmatrix}
D_5 \\ D_6
\end{bmatrix}$	

""")

# ╔═╡ 5a360d32-2840-11eb-0b7d-bf79809174f1
begin
k2_4_true = [0 0 0 
0 "k_{55}^{4}" 0 
0 0 0]
d2_4_true = ["D_{4}"
	"D_{5}"
	"D_{6}"]
	nothing
end

# ╔═╡ e14dcb3a-228e-11eb-04f2-d7ed73a2dde0
k2_4 = [0 0 0 
0 "0" 0 
0 0 0]

# ╔═╡ c35b6512-2840-11eb-15d2-cb197683077f
d2_4 = ["0"
	"0"
	"0"]

# ╔═╡ cd07eb4e-2840-11eb-3ce5-03a46f097ec2
show_matrix(k2_4, d2_4)

# ╔═╡ e3e87680-2840-11eb-355c-194ad4ffb742
if k2_4 == k2_4_true && d2_4 == d2_4_true
	 correct42a4 = true
	 correct()
else
	 correct42a4 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ f3f0ebb6-2840-11eb-1853-611b8c7710bf
solution(md"""
Dirichlet - RB:
	
$\boldsymbol{k}^4 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & k_{55}^4 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^4 = \begin{bmatrix}
0 \\ D_4 \\ D_5 \\ D_6
\end{bmatrix}$
	
$\implies$
	
$\boldsymbol{k}^4 = \begin{bmatrix}
0 & 0 & 0 \\
0 & k_{55}^4 & 0 \\
0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^4 = \begin{bmatrix}
D_4 \\ D_5 \\ D_6
\end{bmatrix}$
""")

# ╔═╡ 31c2583a-2841-11eb-2034-9f49175781eb
begin 
	k2_5_true = ["k_{55}^{5}" "k_{56}^{5}" "k_{57}^{5}" "k_{58}^{5}"
"k_{65}^{5}" "k_{66}^{5}" "k_{67}^{5}" "k_{68}^{5}"
"k_{75}^{5}" "k_{76}^{5}" "k_{77}^{5}" "k_{78}^{5}" 
"k_{85}^{5}" "k_{86}^{5}" "k_{87}^{5}" "k_{88}^{5}"]
	d2_5_true = ["D_{5}"
		"D_{5}"
		"D_{7}"
		"D_{8}"]
	nothing
end

# ╔═╡ e83e38d0-228e-11eb-1f8b-5db72e01c26d
k2_5 = ["0" "0" "0" "0"
"0" "0" "0" "0"
"0" "0" "0" "0" 
"0" "0" "0" "0"]

# ╔═╡ 951785ec-2841-11eb-291e-75bf6bba8aab
d2_5 = ["0"
		"0"
		"0"
		"0"]

# ╔═╡ 9ec0fce8-2841-11eb-020f-255f909053aa
show_matrix(k2_5,d2_5)

# ╔═╡ ae846a0c-2841-11eb-3298-c7263ea63337
if k2_5 == k2_5_true && d2_5 == d2_5_true
	 correct42a5 = true
	 correct()
else
	 correct42a5 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ bc58da64-2841-11eb-0939-9f0671acb698
solution(md"""
$\boldsymbol{k}^5 = \begin{bmatrix}
k_{55}^5 & k_{56}^5 & k_{57}^5 & k_{58}^5 \\
k_{65}^5 & k_{66}^5 & k_{67}^5 & k_{68}^5 \\
k_{75}^5 & k_{76}^5 & k_{77}^5 & k_{78}^5 \\
k_{85}^5 & k_{86}^5 & k_{87}^5 & k_{88}^5
\end{bmatrix} \quad \boldsymbol{d}^5 = \begin{bmatrix}
D_5 \\ D_5 \\ D_7 \\ D_8
\end{bmatrix}$
""")

# ╔═╡ 7865f6f6-2842-11eb-3521-45f984e467d7
begin
k2_assemb_true = ["k_{44}^{1}" 0  0  0  0 
0  "k_{55}^{3} + k_{55}^{4} + k_{55}^{5}" "k_{56}^{3} + k_{56}^{5}" "k_{57}^{5}" "k_{58}^{5}" 
0 "k_{65}^{3} + k_{65}^{5}" "k_{66}^{3} + k_{66}^{5}" "k_{67}^{5}" "k_{68}^{5}" 
0 "k_{75}^{5}" "k_{76}^{5}"  "k_{77}^{5}" "k_{78}^{5}" 
0 "k_{85}^{5}" "k_{86}^{5}" "k_{87}^{5}" "k_{88}^{5}"]
d2_assemb_true = ["D_{4}"
"D_{5}"
"D_{6}"
"D_{7}"
"D_{8}"]
P2_true = [0
	 0
	 0
	 0
	"-F"]
	nothing
end

# ╔═╡ f29882ae-228e-11eb-3324-851d6c5509af
k2_assemb = ["0" 0  0  0  0 
0  "0" "0" "0" "0" 
0 "0" "0" "0" "0" 
0 "0" "0" "0" "0" 
0 "0" "0" "0" "0"]

# ╔═╡ 044b3d9a-281e-11eb-2c14-fdc901326f2c
d2_assemb = ["0"
			   "0"
          	   "0"
			   "0"
			   "0"]

# ╔═╡ 2e8b529a-281e-11eb-2b00-8b9739495b2c
P2 = [0
	 0
	 0
	 0
	"0"]

# ╔═╡ fc5da73c-2841-11eb-07b1-4370923666b8
show_matrix(k2_assemb,d2_assemb,P2, "=")

# ╔═╡ 33fd7f7c-228f-11eb-1f0d-a195cb2379ec
begin 
true_loesung_2 = ["k_{44}^{1}" 0  0  0  0 
0  "k_{55}^{3} + k_{55}^{4} + k_{55}^{5}" "k_{56}^{3} + k_{56}^{5}" "k_{57}^{5}" "k_{58}^{5}" 
0 "k_{65}^{3} + k_{65}^{5}" "k_{66}^{3} + k_{66}^{5}" "k_{67}^{5}" "k_{68}^{5}" 
0 "k_{75}^{5}" "k_{76}^{5}"  "k_{77}^{5}" "k_{78}^{5}" 
0 "k_{85}^{5}" "k_{86}^{5}" "k_{87}^{5}" "k_{88}^{5}"]
true_2_d = ["D_{4}"
			"D_{5}"
          	"D_{6}"
			"D_{7}"
			"D_{8}"]
true_2_p = [0
			0
	  		0
			0
			"-F"]
nothing
end

# ╔═╡ 765857a0-2842-11eb-06e4-9920c9ea08b7
if k2_assemb == k2_assemb_true && d2_assemb == d2_assemb_true && P2 == P2_true
	 correct42a6 = true
	 correct()
else
	 correct42a6 = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ ad0b8b1a-2288-11eb-304e-597e4453a29c
solution(md"""
$\boldsymbol{D} = \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4 \\ D_5 \\ D_6 \\ D_7 \\ D_8
\end{bmatrix}$

Globales lastvektor: $\boldsymbol{P} = \begin{bmatrix}
0 & 0 & 0 & 0 & 0 & 0 & 0 & -F
\end{bmatrix}^T$

assemblierung des elementseifigkeitsmatrix 

e = 1 

$\boldsymbol{k}^1 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & k_{22}^1 & 0 & k_{24}^1 \\
0 & 0 & 0 & 0 \\
0 & k_{42}^1 & 0 & k_{44}^1
\end{bmatrix} \quad \boldsymbol{d}^1 = \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4
\end{bmatrix}$
	
Dirichlet - RB: 
	
$\boldsymbol{k}^1 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & k_{44}^1
\end{bmatrix} \quad \boldsymbol{d}^1 = \begin{bmatrix}
0 \\ 0 \\ 0 \\ D_4
\end{bmatrix}$

e = 2 

$\boldsymbol{k}^2 = \begin{bmatrix}
k_{11}^2 & 0 & k_{17}^2 & 0 \\
0 & 0 & 0 & 0 \\
k_{71}^2 & 0 & k_{77}^2 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^2 = \begin{bmatrix}
D_1 \\ D_2 \\ D_7 \\ D_8
\end{bmatrix}$

Dirichlet - RB: 

$\boldsymbol{k}^2 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & k_{77}^2 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^2 = \begin{bmatrix}
0 \\ 0 \\ D_7 \\ D_8
\end{bmatrix}$
	
e = 3 

$\boldsymbol{k}^3 = \begin{bmatrix}
k_{11}^3 & k_{12}^3 & k_{15}^3 & k_{15}^3 \\
k_{21}^3 & k_{22}^3 & k_{25}^3 & k_{26}^3 \\
k_{51}^3 & k_{52}^3 & k_{55}^3 & k_{56}^3 \\
k_{61}^3 & k_{62}^3 & k_{65}^3 & k_{66}^3
	\end{bmatrix} \quad \boldsymbol{d}^3 = \begin{bmatrix}
D_1 \\ D_2 \\ D_5 \\ D_6
\end{bmatrix}$
	
Dirichlet - RB:
	
$\boldsymbol{k}^3 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & k_{55}^3 & k_{56}^3 \\
0 & 0 & k_{65}^3 & k_{66}^3
	\end{bmatrix} \quad \boldsymbol{d}^3 = \begin{bmatrix}
0 \\ 0 \\ D_5 \\ D_6
\end{bmatrix}$
	
e = 4

$\boldsymbol{k}^4 = \begin{bmatrix}
k_{33}^4 & 0 & k_{35}^4 & 0 \\
0 & 0 & 0 & 0 \\
k_{53}^4 & 0 & k_{55}^4 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^4 = \begin{bmatrix}
D_3 \\ D_4 \\ D_5 \\ D_6
\end{bmatrix}$
	
Dirichlet - RB:
	
$\boldsymbol{k}^4 = \begin{bmatrix}
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & k_{55}^4 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^4 = \begin{bmatrix}
0 \\ D_4 \\ D_5 \\ D_6
\end{bmatrix}$
	
e = 5 

$\boldsymbol{k}^5 = \begin{bmatrix}
k_{55}^5 & k_{56}^5 & k_{57}^5 & k_{58}^5 \\
k_{65}^5 & k_{66}^5 & k_{67}^5 & k_{68}^5 \\
k_{75}^5 & k_{76}^5 & k_{77}^5 & k_{78}^5 \\
k_{85}^5 & k_{86}^5 & k_{87}^5 & k_{88}^5
\end{bmatrix} \quad \boldsymbol{d}^5 = \begin{bmatrix}
D_5 \\ D_5 \\ D_7 \\ D_8
\end{bmatrix}$
	
Gloabales gleichungssystem $\boldsymbol{K}\boldsymbol{D} = \boldsymbol{P}$

$\begin{bmatrix}
k_{44}^1 & 0 & 0 & 0 & 0 \\
0 & k_{55}^3 + k_{55}^4 + k_{55}^5 & k_{56}^3 + k_{56}^5 & k_{57}^5 & k_{58}^5 \\
0 & k_{65}^3 + k_{65}^5 & k_{66}^3 + k_{66}^5 & k_{67}^5 & k_{68}^5 \\
0 & k_{75}^5 & k_{76}^5 & k_{77}^5 & k_{78}^5 \\
0 & k_{85}^5 & k_{86}^5 & k_{87}^5 & k_{88}^5 \\
\end{bmatrix} \begin{bmatrix}
D_4 \\ D_5 \\ D_6 \\ D_7 \\ D_8
\end{bmatrix} = \begin{bmatrix}
0 \\ 0 \\ 0 \\ 0 \\ -F
\end{bmatrix}$ 
""")

# ╔═╡ Cell order:
# ╟─58d68d8a-2286-11eb-1240-131a943d6476
# ╟─3ae07614-1e9f-11eb-1c0f-87391866f5c4
# ╟─12c5a564-33fb-11eb-3e9c-2d4902290dda
# ╟─81b2f330-1e9f-11eb-24ec-07abca3077b1
# ╟─36e9bf14-1ea6-11eb-2d7b-1fbf2437b474
# ╟─9acc3504-1e9f-11eb-0cf7-c74777523852
# ╟─f9bce7ee-2286-11eb-138d-ab50b327be7e
# ╟─eff87330-1e9f-11eb-0976-55b763f969eb
# ╟─b7293c42-1e9f-11eb-1485-5dd584ff3369
# ╟─129173e6-33fa-11eb-077b-43854380f681
# ╟─f705e684-2288-11eb-214e-39f140373c34
# ╟─15c5a436-2835-11eb-347d-ed06c3ac6664
# ╠═3fd7fda8-228a-11eb-019d-a987be0605e5
# ╠═d35ee188-2833-11eb-39f3-4d1680ee863c
# ╟─d4900cb4-2833-11eb-10b5-c503830bc8c9
# ╟─2cc1c750-2835-11eb-1869-8f8a8215fb48
# ╟─a37ee288-2835-11eb-3c7d-c5eb79a4b89e
# ╟─993a87dc-2835-11eb-3713-6beef93ac8c4
# ╠═e7cad600-228a-11eb-2165-b19bcd6a2a8a
# ╠═985640ea-2835-11eb-2974-d535e0cb95cc
# ╟─1694a15e-2836-11eb-30bf-73c9bb9371fe
# ╟─2dd50818-2836-11eb-0943-61c0ead89ff4
# ╟─eb5481d8-2837-11eb-0b10-17f191cc4022
# ╟─8788895a-2838-11eb-1aca-cd40b7cf97eb
# ╠═f5131368-228a-11eb-3ca3-bd164ac72650
# ╠═7575e4b0-2838-11eb-3698-1defd5cf7cb5
# ╟─8fb4a5be-2838-11eb-0b35-ad0d3901f0bb
# ╟─5d32ebac-283b-11eb-3b2e-892a613c5800
# ╟─bc5a443c-283a-11eb-0d9c-198ff047602f
# ╟─a6269cf4-283a-11eb-0137-95a7883e792a
# ╠═85e45d38-228c-11eb-3344-df87a82d7cf5
# ╠═39d7eca8-283a-11eb-3717-87c12b1da1bf
# ╠═834035da-283a-11eb-22b8-b3535af295be
# ╟─b045f042-283a-11eb-2aec-afe2645e5908
# ╟─7be1c582-283b-11eb-284f-054823a42919
# ╟─c452aaa2-283b-11eb-2370-7bc88abafb1d
# ╟─3eb8b1d2-27f2-11eb-37b9-85faac0290b5
# ╟─6889c6f0-283c-11eb-38a2-4d22066f68cc
# ╠═5b2c7692-283c-11eb-2810-91ab9d6fb0b9
# ╠═78e5db60-283c-11eb-24b5-5722c1afcfa2
# ╠═8f2f12ec-283c-11eb-1227-6556fd36142e
# ╟─a1a82f06-283c-11eb-2da1-91ba6f950165
# ╟─7c2a8d8a-2287-11eb-0497-7da2fa49f1d3
# ╟─4178f5c2-1ea0-11eb-31e1-7522982984e0
# ╟─4911b53e-1ea6-11eb-3b82-091fef345ed9
# ╟─6ff9159e-1ea0-11eb-2b8b-b77d5d946390
# ╟─1b2deee0-2819-11eb-1444-2f3bdf6e69fb
# ╟─fd0b6706-281f-11eb-258b-0bd2c375f882
# ╟─0cabbaaa-27f3-11eb-21aa-159bdc281a6b
# ╠═8251bc86-228e-11eb-072a-31b1ab15ae22
# ╠═fc078b5e-281b-11eb-1293-f7604090c27e
# ╟─088d4e46-2819-11eb-3681-9b0c12ad0f95
# ╟─0e793958-2820-11eb-14fd-4ddb2ed793dd
# ╟─28ebefa4-283d-11eb-0e31-2301d29d24d4
# ╟─fdcf62aa-283d-11eb-0a39-c3ce1744a2a5
# ╠═d103a3c4-228e-11eb-0a24-8d1cc3add5aa
# ╠═b96bdcae-283d-11eb-25e4-79c6ab15af58
# ╟─0db83d60-283e-11eb-0c1c-43f75ffe9686
# ╟─50126336-283f-11eb-26c4-23edc4d7a490
# ╟─c149d954-283e-11eb-1c8c-3f05b25185d8
# ╟─390d1b36-283f-11eb-3933-a90e123c3d46
# ╠═d6d3d00a-228e-11eb-3a59-59d07fef34d5
# ╠═2cf18314-283f-11eb-2c00-0f03e65a97d0
# ╟─42bfbc56-283f-11eb-1ee5-b5f0285b9a52
# ╟─2747c184-2840-11eb-0125-754a1829b50e
# ╟─5a360d32-2840-11eb-0b7d-bf79809174f1
# ╟─cd07eb4e-2840-11eb-3ce5-03a46f097ec2
# ╠═e14dcb3a-228e-11eb-04f2-d7ed73a2dde0
# ╠═c35b6512-2840-11eb-15d2-cb197683077f
# ╟─e3e87680-2840-11eb-355c-194ad4ffb742
# ╟─f3f0ebb6-2840-11eb-1853-611b8c7710bf
# ╟─31c2583a-2841-11eb-2034-9f49175781eb
# ╟─9ec0fce8-2841-11eb-020f-255f909053aa
# ╠═e83e38d0-228e-11eb-1f8b-5db72e01c26d
# ╠═951785ec-2841-11eb-291e-75bf6bba8aab
# ╟─ae846a0c-2841-11eb-3298-c7263ea63337
# ╟─bc58da64-2841-11eb-0939-9f0671acb698
# ╟─7865f6f6-2842-11eb-3521-45f984e467d7
# ╟─fc5da73c-2841-11eb-07b1-4370923666b8
# ╠═f29882ae-228e-11eb-3324-851d6c5509af
# ╠═044b3d9a-281e-11eb-2c14-fdc901326f2c
# ╠═2e8b529a-281e-11eb-2b00-8b9739495b2c
# ╟─33fd7f7c-228f-11eb-1f0d-a195cb2379ec
# ╟─765857a0-2842-11eb-06e4-9920c9ea08b7
# ╟─ad0b8b1a-2288-11eb-304e-597e4453a29c
