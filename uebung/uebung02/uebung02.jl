### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ 17fba392-147c-11eb-3385-85ad7992d53e
using Tensors, Plots

# ╔═╡ 39a641c6-1458-11eb-0839-ed5e7b38e91e
md"
# Grundlagen der FEM
Wilkommen in der zweiten Übung im Modul Grundlagen der FEM. In dieser zweiten Übung werden wir uns um grundlegende Konzepte innerhalb Julia, Pluto Notebooks und Tensoren beschäftigen
## Übung 2
"

# ╔═╡ 630bc766-12d9-11eb-2c25-eb321e5df528
md"### Variablen
Zunächst werden wir lernen wie Variablen in Julia funktionieren und wie sie in Pluto miteinander interagieren. Prinzipiell können alle Unicode Charaktere akzeptiert, nicht nur standard Buchstaben und Wörter. Beispielsweise definieren wir in der nächsten Zelle 𝐅."

# ╔═╡ 51e80510-12d9-11eb-1943-41a799a99bfb
𝐅 = 1.0 # initiiert 𝐅 als Float64

# ╔═╡ d73d4a14-12f1-11eb-3376-0df3c73299a3
begin
	𝔽 = "Das ist eine String Variable"
	γ = 'D' #γ ist ein Char, achten sie auf den unterschied zwischen " und '
	σ = 1 # das ist eine integer Variable
end

# ╔═╡ aff894ce-12db-11eb-01d1-f9a36eb6ee1d
md"Falls sie sich nun fragen, wie sie diesen Charakter erzeugen, können sie [auf dieser Seite alle Unicode Charakter finden](https://docs.julialang.org/en/v1/manual/unicode-input/). Generell werden fett gedruckte Buchstaben aus \bf + Buchstabe + Tab erzeugt, bspw \bfF + Tab.

Doppelt geschriebene Buchstaben wie 𝔸 werden über \bb + Buchstabe + Tab erzeugt.

Auch große, sowie kleine griechischen Buchstaben sind Verfügbar wie \sigma (σ) \Sigma (Σ), \gamma (γ) , \Gamma (Γ)"

# ╔═╡ ae95dfc0-12df-11eb-1c0a-43f01227939d
md"### Packages
Natürlich müssen wir nicht bei jedem Problem von null anfangen und das Rad neu erfinden. Viele Menschen überall auf der Welt kreieren ein Ökosystem für wissenschaftliches Rechnen innerhalb Julia. Einzelne Funktionen und Strukturen (engl. Structs) werden zusammen gefasst in Packages.

In zukünftigen werden wir Pakete wie folgt importieren:
```julia 
using Tensors
using Plots, LinearAlgebra
```
Wie sie sehen können mehrere Pakete auf einmal importiert werden. Zusätzlich ist wichtig, dass alle Funktionen so importiert werden, wie sie im Paket heißen. Bspw. existiert im Tensors Package die Operation ⊗, die auch so - ohne Zusatz - importiert wird. Im Rahmen dieser Übungen werden sie nie selber diese Statements schreiben müssen. Sollten Pakete benötigt werden, wird es eine Zelle geben, die das Paket für sie importiert, wie z.B. folgende"

# ╔═╡ af8ff79e-12df-11eb-0d5d-c18481643e25
md"### Arrays, Matrizen, Tensoren
In der FEM gibt es grundlegende Konzepte die zwangsweise ein Gebrauch von Array, Matrizen und Tensoren machen. Daher werden wir uns in dieser Sektion mit diesen Objekten beschäftigen."

# ╔═╡ ca96e4c2-147d-11eb-24e7-117b12315124
𝐮 = [1.0,2.0,3.0]

# ╔═╡ d8417ccc-147d-11eb-10a5-3d71961fe86b
𝐊  = [1.0 0.0 0.0
	  0.0 1.0 0.0
	  0.0 0.0 3.0]

# ╔═╡ f75d4550-147d-11eb-1ba8-334ff551f65b
𝐟 = 𝐊 \ 𝐮 # berechnet 𝐊⁻¹⋅𝐮

# ╔═╡ b2721566-147e-11eb-2a7c-cf3e6adef77c
md"""Vektoren und Matrizen können aber auch mit 0 und 1 initialisiert werden

```julia
𝔸 = Matrix{Float64}(undef,2,3)
𝔸 = zeros(2,3)

𝐮 = Vector{Float64}(undef,3)
𝐮 = zeros(3)
```

Auf einzelne Einträge kann über folgende Notation zugegriffen werden

```julia
𝔸[1,1] # gibt den Eintrag der 1. Spalte und 1. Zeile zurück
𝔸[1,:] # gibt die erste Zeile zurück
𝔸[:,1] # gibt die erste Spalte zurück
```
"""

# ╔═╡ 8ba57640-1480-11eb-384b-b57d583138e9
md"## Aufgabe 2.1
Speichern sie die zweite Spalte und dritte Zeile der Matrix 𝐊 in separate Variablen und addieren sie diese zusammen. Skalieren sie anschließend das Ergebnis um den Eintrag in der dritten Spalte, dritte zeile"

# ╔═╡ 7203efc2-1481-11eb-2a14-e999f283dda0
# Code Zelle für die Bearbeitung der Aufgabe


# ╔═╡ d616ee5e-1483-11eb-2892-81977042b734
md"### Tensoren
Tensoren sind ein essentieller Bestandteil, um sich das Leben im Kontext der FE leichter zu machen. Wir werden die Implementierung des Paketes `Tensors.jl` nutzen. Das Paket wurde ein paar Zellen weiter oben schon für sie importiert.
Grundsätzlich können wir zwei verschiedene Arten von Tensoren konstruieren. Symmetrische und nicht symmetrische. In Julia erfolgt das über folgende Syntax

```julia
Tensor{stufe,dimension}(inhalt)
SymmetricTensor{stufe,dimension}(inhalt)
```

Ein konkretes Beispiel:"

# ╔═╡ 9a732b32-1484-11eb-207c-ef610a4271c0
𝐁 = Tensor{2,3}([1 0 0; 0 0 1; 1 0 0])

# ╔═╡ e9f9e9e8-1484-11eb-015a-b178f17dfdc1
md"## Aufgabe 2.2
Wieso hat ein Symmetrischer Tensor ein 6 zeiligen Vektor als Inhalt und keine 3×3 Koeffizientenmatrix wie oben?"

# ╔═╡ ccf73382-1484-11eb-35ef-c3e03424a433
𝐂 = SymmetricTensor{2,3}([1,2,3,4,5,6])

# ╔═╡ a1c460fa-1488-11eb-1337-7d3c3e0ad20e
md""" Tensoren können auch direkt über Indexnotation initialisiert werden"""

# ╔═╡ 84b569fa-1488-11eb-14ee-4bf29a4afa5a
begin
	E = 200e9
	ν = 0.3
	dim = 2
	λ = E*ν / ((1 + ν) * (1 - 2ν))
	μ = E / (2(1 + ν))
	δ(i,j) = i == j ? 1.0 : 0.0	
end

# ╔═╡ fece2868-1487-11eb-206f-d92557595592
f(i,j,k,l) = λ*δ(i,j)*δ(k,l) + μ*(δ(i,k)*δ(j,l) + δ(i,l)*δ(j,k))

# ╔═╡ 2ae9446e-1488-11eb-3cdc-87e08efa77ea
begin
	C = SymmetricTensor{4, 3}(f)
	tovoigt(C)
end

# ╔═╡ 2b8a5b56-1488-11eb-0f3f-9758221b2cad


# ╔═╡ 2d0ec56e-1485-11eb-0e57-a52b9d71c7c3
md"## Aufgabe 2.3 
Berechnen sie das einfach sowie doppelte Produkt der beiden oben definierten Tensoren"

# ╔═╡ 403c4bf2-1485-11eb-0490-ab38f0e3b074
# das einfache Produkt hier \cdot + tab ist die dazugehörige Operation


# ╔═╡ 56a81c0e-1485-11eb-0d8c-379d5507aa2a
# das doppelte Produkt hier \boxdot + tab ist die dazugehörige Operation, auf Papier geschrieben als ":"


# ╔═╡ abe50f8a-12df-11eb-2eb8-8f687db89f9f
md"### Funktionen

Funktionen sind einer der grundlegenden Bausteine in Julia. Sie stellen sogar den zentralen Aspekt der Sprache dar. Sie bestehen aus Input und Output. 

Funktionen werden wie folgt definiert

```julia
function hello_course()
	return \"hello FEM course 👻\"
end
```

Basierend auf dem Input werden spezifische Funktionsimplementierungen aufgerufen. Diese Funktionalität nennt sich multiple dispatch. Sofern sie die Funktion ohne Input aufrufen, wird die obere Funktion ausgeführt. Sobald sie eine Input Variable übergeben, wird Julia versuchen die zweite Definition auszuführen

```julia
function hello_course(student_name)
	return \"hello $student_name in the FEM course 🐣\"
end
```

Nicht nur Anzahl der Input Variablen ist entscheidend, sondern auch ihr Typ. Dazu definieren wir folgende 3. Implementierung

```julia
function hello_course(student_name::Int)
	return \"hello Student0$student_name in the FEM course 🎈\"
end
```
"

# ╔═╡ 7f94ddc8-12e1-11eb-147b-6d327e18e3ee
md"
## Aufgabe 2.2 
Kopieren sie die Funktion jeweils in eine Zelle. Die Zellen sind für sie schon angelegt. Achten sie dabei darauf, was mit dem darunterstehenden Aufruf passiert"

# ╔═╡ bfd6d2b0-12e1-11eb-1707-43f522e19a24
hello_course()

# ╔═╡ 102db10c-12e2-11eb-084f-93b0daf2fad8
# Hier hello_course() ohne Input einfügen und auf Output oben achten


# ╔═╡ 866778f4-12e1-11eb-21cf-fd3c6af88c61
# Hier hello_course(student_name) einfügen und auf Output unterhalb achten


# ╔═╡ c35ba24e-12e1-11eb-15a0-f1ccbe5a0053
hello_course("Student1")

# ╔═╡ 42f29d1a-1361-11eb-1dff-2708b4bd24f4
# Hier hello_course(student_name::Int) einfügen und auf Output achten


# ╔═╡ 598b89bc-1361-11eb-1299-e976985e253a
hello_course(1)

# ╔═╡ 97eba36a-1361-11eb-0a5f-5b0cdc809ae9
md"## Aufgabe 2.3
Ändern sie nun den Input werd auf einen Float, bspw. 1.0. Welche Funktionsimplementierung wird aufgerufen und wieso?"

# ╔═╡ 95aafe32-1361-11eb-176d-bbc95ba8a45a
# Rufen sie hier hello_course mit einem Float Input auf 
hello_course(1.0)

# ╔═╡ 7a886134-1466-11eb-1b97-216405a0324a
md"!!! hint 
Um alle Implementierungen einer Funktion `f` gelistet zu bekommen, können sie mit `methods(f)` einen Dispatch Table von Julia erfragen. Probieren sie das mit unserer `hello_course` Methode."

# ╔═╡ 9f0a358c-1466-11eb-122f-0505b19dd76f
#Fragen sie Julia nach allen Implementierung der Methode hello_course
which(hello_course, (Int,))

# ╔═╡ 9d05b6de-1480-11eb-2637-370719ccd01d
md"""### Kontrollfluss und Schleifen"""

# ╔═╡ Cell order:
# ╟─39a641c6-1458-11eb-0839-ed5e7b38e91e
# ╟─630bc766-12d9-11eb-2c25-eb321e5df528
# ╠═51e80510-12d9-11eb-1943-41a799a99bfb
# ╠═d73d4a14-12f1-11eb-3376-0df3c73299a3
# ╟─aff894ce-12db-11eb-01d1-f9a36eb6ee1d
# ╟─ae95dfc0-12df-11eb-1c0a-43f01227939d
# ╠═17fba392-147c-11eb-3385-85ad7992d53e
# ╟─af8ff79e-12df-11eb-0d5d-c18481643e25
# ╠═ca96e4c2-147d-11eb-24e7-117b12315124
# ╠═d8417ccc-147d-11eb-10a5-3d71961fe86b
# ╠═f75d4550-147d-11eb-1ba8-334ff551f65b
# ╟─b2721566-147e-11eb-2a7c-cf3e6adef77c
# ╟─8ba57640-1480-11eb-384b-b57d583138e9
# ╠═7203efc2-1481-11eb-2a14-e999f283dda0
# ╟─d616ee5e-1483-11eb-2892-81977042b734
# ╠═9a732b32-1484-11eb-207c-ef610a4271c0
# ╟─e9f9e9e8-1484-11eb-015a-b178f17dfdc1
# ╠═ccf73382-1484-11eb-35ef-c3e03424a433
# ╠═a1c460fa-1488-11eb-1337-7d3c3e0ad20e
# ╠═84b569fa-1488-11eb-14ee-4bf29a4afa5a
# ╠═fece2868-1487-11eb-206f-d92557595592
# ╠═2ae9446e-1488-11eb-3cdc-87e08efa77ea
# ╠═2b8a5b56-1488-11eb-0f3f-9758221b2cad
# ╟─2d0ec56e-1485-11eb-0e57-a52b9d71c7c3
# ╠═403c4bf2-1485-11eb-0490-ab38f0e3b074
# ╠═56a81c0e-1485-11eb-0d8c-379d5507aa2a
# ╟─abe50f8a-12df-11eb-2eb8-8f687db89f9f
# ╟─7f94ddc8-12e1-11eb-147b-6d327e18e3ee
# ╠═bfd6d2b0-12e1-11eb-1707-43f522e19a24
# ╠═102db10c-12e2-11eb-084f-93b0daf2fad8
# ╠═866778f4-12e1-11eb-21cf-fd3c6af88c61
# ╠═c35ba24e-12e1-11eb-15a0-f1ccbe5a0053
# ╠═42f29d1a-1361-11eb-1dff-2708b4bd24f4
# ╠═598b89bc-1361-11eb-1299-e976985e253a
# ╟─97eba36a-1361-11eb-0a5f-5b0cdc809ae9
# ╠═95aafe32-1361-11eb-176d-bbc95ba8a45a
# ╟─7a886134-1466-11eb-1b97-216405a0324a
# ╠═9f0a358c-1466-11eb-122f-0505b19dd76f
# ╠═9d05b6de-1480-11eb-2637-370719ccd01d
