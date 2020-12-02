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
""", blur=false)

# ╔═╡ eff87330-1e9f-11eb-0976-55b763f969eb
md"Im Folgenden sei angenommen, dass die jeweiligen Elementsteifigkeitsmatrizen $\underline{\boldsymbol{k}}^e$ bekannt sind."

# ╔═╡ b7293c42-1e9f-11eb-1485-5dd584ff3369
md"
b) Assemblieren Sie aus den Elementsteifigkeitsmatrizen die globale Steifigkeitsmatrix $\underline{\boldsymbol{K}}$ Stellen Sie den globalen Lastvektor $\underline{\boldsymbol{P}}$ und das globale Gleichungssystem auf.

Nutzen Sie die in Abbildung 4.2 dargestellte Element- und Knotennummerierung.
"

# ╔═╡ c452aaa2-283b-11eb-2370-7bc88abafb1d
md"c) Reduzieren Sie das Gleichungssystem unter Berücksichtigung der Dirichlet-Randbedingungen."

# ╔═╡ 7c2a8d8a-2287-11eb-0497-7da2fa49f1d3
solution(md"""
$\boldsymbol{D} = \begin{bmatrix}
D_1 \\ D_2 \\ D_3 \\ D_4 \\ D_5 \\ D_6 \\ D_7 \\ D_8
\end{bmatrix}$

Globales lastvektor: $\boldsymbol{P} = \begin{bmatrix}
0 & 0 & F_1 & F_2 & 0 & 0 & 0 & 0
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
""", blur=false)

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

$\implies$
	
$\boldsymbol{k}^1 = k_{44}^1 \quad \boldsymbol{d}^1 = d_4$

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

$\implies$

$\boldsymbol{k}^2 = \begin{bmatrix}
k_{77}^2 & 0 \\
0 & 0
\end{bmatrix} \quad \boldsymbol{d}^2 = \begin{bmatrix}
D_7 \\ D_8
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
	
$\implies$

$\boldsymbol{k}^3 = \begin{bmatrix}
k_{55}^3 & k_{56}^3 \\
k_{65}^3 & k_{66}^3
\end{bmatrix} \quad \boldsymbol{d}^3 = \begin{bmatrix}
D_5 \\ D_6
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

$\implies$
	
$\boldsymbol{k}^4 = \begin{bmatrix}
0 & 0 & 0 \\
0 & k_{55}^4 & 0 \\
0 & 0 & 0
\end{bmatrix} \quad \boldsymbol{d}^4 = \begin{bmatrix}
D_4 \\ D_5 \\ D_6
\end{bmatrix}$
	
e = 5 

$\boldsymbol{k}^5 = \begin{bmatrix}
k_{55}^5 & k_{56}^5 & k_{57}^5 & k_{58}^5 \\
k_{65}^5 & k_{66}^5 & k_{67}^5 & k_{68}^5 \\
k_{75}^5 & k_{76}^5 & k_{77}^5 & k_{78}^5 \\
k_{85}^5 & k_{86}^5 & k_{87}^5 & k_{88}^5
\end{bmatrix} \quad \boldsymbol{d}^5 = \begin{bmatrix}
D_5 \\ D_6 \\ D_7 \\ D_8
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
""", blur=false)

# ╔═╡ Cell order:
# ╟─58d68d8a-2286-11eb-1240-131a943d6476
# ╟─3ae07614-1e9f-11eb-1c0f-87391866f5c4
# ╟─81b2f330-1e9f-11eb-24ec-07abca3077b1
# ╟─36e9bf14-1ea6-11eb-2d7b-1fbf2437b474
# ╟─9acc3504-1e9f-11eb-0cf7-c74777523852
# ╟─f9bce7ee-2286-11eb-138d-ab50b327be7e
# ╟─eff87330-1e9f-11eb-0976-55b763f969eb
# ╟─b7293c42-1e9f-11eb-1485-5dd584ff3369
# ╟─c452aaa2-283b-11eb-2370-7bc88abafb1d
# ╟─7c2a8d8a-2287-11eb-0497-7da2fa49f1d3
# ╟─4178f5c2-1ea0-11eb-31e1-7522982984e0
# ╟─4911b53e-1ea6-11eb-3b82-091fef345ed9
# ╟─6ff9159e-1ea0-11eb-2b8b-b77d5d946390
# ╟─ad0b8b1a-2288-11eb-304e-597e4453a29c
