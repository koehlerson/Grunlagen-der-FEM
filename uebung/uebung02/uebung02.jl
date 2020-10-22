### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

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
	σ = 1 # das ist eine integer Variable
end

# ╔═╡ aff894ce-12db-11eb-01d1-f9a36eb6ee1d
md"Falls sie sich nun fragen, wie sie diesen Charakter erzeugen, können sie [auf dieser Seite alle Unicode Charakter finden](https://docs.julialang.org/en/v1/manual/unicode-input/). Generell werden fett gedruckte Buchstaben aus \bf + Buchstabe + Tab erzeugt, bspw \bfF + Tab.

Doppelt geschriebene Buchstaben wie 𝔸 werden über \bb + Buchstabe + Tab erzeugt.

Auch große, sowie kleine griechischen Buchstaben sind Verfügbar wie \sigma (σ) \Sigma (Σ), \gamma (γ) , \Gamma (Γ)"

# ╔═╡ abe50f8a-12df-11eb-2eb8-8f687db89f9f
md"### Funktionen

Funktionen sind einer der grundlegenden Bausteine in Julia. Sie stellen sogar den zentralen Aspekt Sprache dar. Sie bestehen aus Input und Output. 

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

# ╔═╡ 50a158dc-1466-11eb-3a51-b5b6b7c744d4


# ╔═╡ 7f94ddc8-12e1-11eb-147b-6d327e18e3ee
md"Kopieren sie die Funktion jeweils in eine Zelle. Die Zellen sind für sie schon angelegt. Achten sie dabei darauf, was mit dem darunterstehenden Aufruf passiert"

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
md"Ändern sie nun den Input werd auf einen Float, bspw. 1.0. Welche Funktionsimplementierung wird aufgerufen und wieso?"

# ╔═╡ 95aafe32-1361-11eb-176d-bbc95ba8a45a
# Rufen sie hier hello_course mit einem Float Input auf 


# ╔═╡ 7a886134-1466-11eb-1b97-216405a0324a
md"!!! hint 
Um alle Implementierungen einer Funktion `f` gelistet zu bekommen, können sie mit `methods(f)` einen Dispatch Table von Julia erfragen. Probieren sie das mit unserer `hello_course` Methode."

# ╔═╡ 9f0a358c-1466-11eb-122f-0505b19dd76f
#Fragen sie Julia nach allen Implementierung der Methode hello_course


# ╔═╡ ae95dfc0-12df-11eb-1c0a-43f01227939d
md"### Packages
Natürlich müssen wir nicht bei jedem Problem von null anfangen und das Rad neu erfinden. Viele Menschen überall auf der Welt kreieren ein Ökosystem für wissenschaftliches Rechnen innerhalb Julia. Einzelne Funktionen und Strukturen (engl. Structs) werden zusammen gefasst in Packages."

# ╔═╡ af8ff79e-12df-11eb-0d5d-c18481643e25
md"### Arrays, Matrizen, Tensoren
In der FEM gibt es grundlegende Konzepte die zwangsweise ein Gebrauch von Array, Matrizen und Tensoren machen. Daher werden wir uns in dieser Sektion"

# ╔═╡ aeae80ac-12df-11eb-2dbd-cb8055cd7fcc


# ╔═╡ Cell order:
# ╟─39a641c6-1458-11eb-0839-ed5e7b38e91e
# ╟─630bc766-12d9-11eb-2c25-eb321e5df528
# ╠═51e80510-12d9-11eb-1943-41a799a99bfb
# ╠═d73d4a14-12f1-11eb-3376-0df3c73299a3
# ╟─aff894ce-12db-11eb-01d1-f9a36eb6ee1d
# ╟─abe50f8a-12df-11eb-2eb8-8f687db89f9f
# ╠═50a158dc-1466-11eb-3a51-b5b6b7c744d4
# ╟─7f94ddc8-12e1-11eb-147b-6d327e18e3ee
# ╠═bfd6d2b0-12e1-11eb-1707-43f522e19a24
# ╠═102db10c-12e2-11eb-084f-93b0daf2fad8
# ╠═866778f4-12e1-11eb-21cf-fd3c6af88c61
# ╠═c35ba24e-12e1-11eb-15a0-f1ccbe5a0053
# ╠═42f29d1a-1361-11eb-1dff-2708b4bd24f4
# ╠═598b89bc-1361-11eb-1299-e976985e253a
# ╠═97eba36a-1361-11eb-0a5f-5b0cdc809ae9
# ╠═95aafe32-1361-11eb-176d-bbc95ba8a45a
# ╟─7a886134-1466-11eb-1b97-216405a0324a
# ╠═9f0a358c-1466-11eb-122f-0505b19dd76f
# ╠═ae95dfc0-12df-11eb-1c0a-43f01227939d
# ╠═af8ff79e-12df-11eb-0d5d-c18481643e25
# ╠═aeae80ac-12df-11eb-2dbd-cb8055cd7fcc
