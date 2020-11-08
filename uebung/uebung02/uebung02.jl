### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

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

# ╔═╡ ee9d76f2-1515-11eb-31e4-cf7088e9f1e8
md"""
## Aufgabe 2.3
Implementieren sie folgende Definition des Elastizitätstensor

$$\mathbb{C} = \lambda \mathbf{I} \otimes \mathbf{I} + 2\mu \mathbb{I}$$

!!! hint
Implementieren sie zuerst den Einheitstensor 4. Stufe $\mathbb{I}$
"""

# ╔═╡ bbc1d878-1516-11eb-00f3-f7971b3df5b2
## Definieren sie in dieser Zelle den Einheitstensor 4. Stufe in Indexnotation


# ╔═╡ 2b8a5b56-1488-11eb-0f3f-9758221b2cad
begin 
	## Definieren sie hier g eine Funktion die die Indexnotation von ℂ beschreibt
	g(i,j,k,l) 
	ℂ = SymmetricTensor{4, 3}(g)
	tovoigt(ℂ)
end

# ╔═╡ 2d0ec56e-1485-11eb-0e57-a52b9d71c7c3
md"## Aufgabe 2.4
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
## Aufgabe 2.5 
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
md"## Aufgabe 2.6
Ändern sie nun den Input Wert auf einen Float, bspw. 1.0. Welche Funktionsimplementierung wird aufgerufen und wieso?"

# ╔═╡ 95aafe32-1361-11eb-176d-bbc95ba8a45a
# Rufen sie hier hello_course mit einem Float Input auf 
hello_course(1.0)

# ╔═╡ 7a886134-1466-11eb-1b97-216405a0324a
md"!!! hint 
Um alle Implementierungen einer Funktion `f` gelistet zu bekommen, können sie mit `methods(f)` einen Dispatch Table von Julia erfragen. Probieren sie das mit unserer `hello_course` Methode."

# ╔═╡ 9f0a358c-1466-11eb-122f-0505b19dd76f
#Fragen sie Julia nach allen Implementierung der Methode hello_course


# ╔═╡ 9d05b6de-1480-11eb-2637-370719ccd01d
md"""### Kontrollfluss

Wir können den Kontrollfluss in Julia über Konditionen steuern:
```julia
function test(x,y)
	if x < y
    	relation = "less than"
    elseif x == y
        relation = "equal to"
    else
        relation = "greater than"
    end
    return "x is " * relation * " y."
end
```

Zuästzlich können wir Teile mehrmals evaluieren. Dieses Konzept wird durch Schleifen realisiert. Die wichtigsten Arten von Schleifen sind `for` und `while` Schleifen. Die **for** Schleife hat eine festgelegte Länge. Das heißt, es ist schon beim programmieren klar, wie oft ein bestimmter Teil des Codes wiederholt werden muss. Diese Art von Schleife wird wie folgt in Julia geschrieben:

```julia
function increment(a)
	for i in 1:5
		 a = a + i ## Kurze Schreibweise a+=1
	end
	return a
end
```

**While** Schleifen verfolgen ein anderes Konzept. Bei diesen Schleifen weiß man in dem Moment, in dem man sie programmiert, nicht, wie oft sie ein bestimmten Teil des Codes wiederholen sollen. Was man dafür aber weiß, ist ein Abbruchkriterium. Sie werden wie folgt in Julia implementiert.

```julia
function double_increment(a)
	while true
    	if a+1 >= 5
			break
		end
	end
end
```

Ein klassisches Beispiel für while Schleifen sind iterative Löser wie z.B. Newton Iterationen, die so lange laufen sollen, bis eine gewisse Toleranz erfüllt ist oder eine maximale Anzahl an Iterationen.

"""

# ╔═╡ f7d54034-151d-11eb-0f54-bdae21564eb3
md"""## Aufgabe 2.7
Nun sind sie gerüstet ihre ersten komplett selbst geschrieben Funktionen zu schreiben, die die vorgestellten Konzepte nutzen. Schreiben sie hierfür eine eigene funktion namens `my_dot_operation(a,b)`, die Skalare, Vektoren (Skalar Produkt) und Tensoren 2. Stufe miteinander multipliziert. Verwenden sie dabei keine vordefinierten Operationen wie bspw. den \cdot Operator ⋅, sondern lösen sie es ausschließlich über die normalen Arithmetik Operatoren wie +,-,*,/, sowie den vorgestellten Konzepten in dem Kontrollfluss Kapitel.

* Die Skalarmultiplikationen können sie mit den Werten 2 und 3 überprüfen, was 6 ergeben sollte.
* Die Vektoren Operationen sollte mit folgenden Vektoren überprüft werden
```julia
𝐱 = Vec{3}([1.0,2.0,3.0])
𝐲 = Vec{3}([4.0,5.0,6.0])
```
welches zum Ergebnis `32.0` führen sollte
* Testen sie ihre Implementierung mit den schon definierten Tensoren 2. Stufe 𝐁 und 𝐂. Das ergebnis sollte folgendes sein 
```julia
3×3 Tensor{2,3,Int64,9}:
 1  2  3
 3  5  6
 1  2  3
```
"""

# ╔═╡ 9b3be99c-1523-11eb-20c1-1f1320c732be
## Ihre my_dot_operation Implementierung


# ╔═╡ d9c89d9a-1523-11eb-3fa6-b99bcb363457
md"""## Eine kleine Einführung in das Plotten
Julia besitzt ein umfangreiches plotting Ökosystem, welches im `Plots` Package gebündelt ist. Dieses Package ist für sie schon importiert. Die wichtigste Funktion in diesem Paket ist `plot()`, die in ihrer einfachsten Andwendung x-Werte und y-Werte annimmt, wie bspw.

```julia
plot(𝐱,𝐲)
```
wobei 𝐱 ein Vektor der x Werte ist und 𝐲 der dazugehörige y Werte Vektor.

Ein anschauliches Beispiel:
"""

# ╔═╡ 77ee562c-1524-11eb-2126-cd18b7f54c7b
@bind x₀ html"<input type='range' min='0.2' max='10' label='x₀'>"

# ╔═╡ 5d3675fc-1525-11eb-134b-f51f3e2a826d
x₀

# ╔═╡ 0fe24ea0-152e-11eb-082f-df5c209afe02
@bind ϕ html"<input type='range' min='0.2' max='10' label='ϕ'>"

# ╔═╡ 15c9645a-152e-11eb-243b-ed07dd658867
ϕ

# ╔═╡ 412b68fa-152e-11eb-057d-3ff27ff6c2af
@bind ω html"<input type='range' min='0.2' max='10' label='ω'>"

# ╔═╡ 4efcc88e-152e-11eb-0c91-51052ceb4859
ω

# ╔═╡ 34470e1e-1524-11eb-0da3-bd3699f0fb43
begin	
	x = collect(0:0.01:10)
	plot(x, (x) -> x₀*sin.((x.+ϕ)*ω), title="Mein erster Plot", label="Sinus Kurve", ylim=(-8,8))
end

# ╔═╡ c8249444-152e-11eb-29c7-733c4a7ad319
md"""
Beachten sie die Notation des 𝐲 Arguments
```julia
(x) -> ...
```
Dieses Konstrukt nennt man Anonyme Funktion oder auch lambda Funktion.
Das sind Funktionen, die man innerhalb eines Codes definiert, aber sonst nie wieder braucht und daher auch keinen Namen brauchen (deswegen der Name anonym). Sie können wie im oben dargestellten Fall hilfreich sein. Zum konstruieren sollte man sich immer folgende Sprechart vorstellen:
* meine Argumente in runden Klammern () bilden -> auf folgendes ab ...
* Im beispiel vom Plot mein Vektor (𝐱) bildet -> auf $a\sin(\omega(x_i+\phi))$ ab
Diese Arten von Funktionen können bspw. sehr gut bei der Konstruktion von Tensoren in Indexnotation angewendet werden. Logischerweise erlauben sie auch mehrere Argumente, so dass der Elastizitätstensor von vorhin, z.b. wie folgt definiert werden kann

```julia
C = SymmetricTensor{4, 3}((i,j,k,l) -> λ*δ(i,j)*δ(k,l) + μ*(δ(i,k)*δ(j,l) + δ(i,l)*δ(j,k)))
```
"""

# ╔═╡ b35d502c-20f6-11eb-0d46-175ff430a00d
md"""
## Srukturen (engl. Structs)

Zusammen mit Funktionen ergeben Structs die essentielle Bausteine von Julia. Strukturen sind Sammlungen von Feldern, wobei Felder hier als arbiträre Variable gesehen werden kann. Beispielsweise lässt sich ein klassisches Material in einem `Elasticity` struct zusammenfassen. Das Struct braucht lediglich zwei Parameter `λ` und `μ`
```julia
struct Elasticity
	λ::Float64
	μ::Float64
end
```
Nun wäre es zusätzlich gut, wenn wir nicht jedes Mal den Elastizitätstensor neu aufbauen müssen, wenn wir ihn brauchen. Also entscheiden wir uns dazu diesen Tensor als Feld in unserem Struct mit abzuspeichern

```julia
struct Elasticity{dim}
	λ::Float64
	μ::Float64
	elasticity_tensor::SymmetricTensor{4,dim}
end
```

Hierbei habe ich das Struct bzgl `dim` parametrisiert. Da wir nicht wissen, wie viele Dimensionen später diskretisiert werden, führen wir diesbezüglich Flexibilität ein.

Nun stellt sich die Frage, wir können wir unser Struct erzeugen? Indem wir uns einen sogenannten *Konstruktor* definieren. Das ist eine Funktion, die genau wie das Struct heißen muss und uns das besagte struct zurück gibt.

```julia
function Elasticity(λ, μ, dim)
	C = SymmetricTensor{4, dim}((i,j,k,l) -> λ*δ(i,j)*δ(k,l) + μ*(δ(i,k)*δ(j,l) + δ(i,l)*δ(j,k)))
	return Elasticity(λ,μ, C)
end
```
"""

# ╔═╡ 8bea648a-20fb-11eb-00a6-5b0f2d7ea52a
begin
	struct Elasticity{dim}
		λ::Float64
		μ::Float64
		elasticity_tensor::SymmetricTensor{4,dim}
	end
	
	function Elasticity(λ, μ, dim)
		C = SymmetricTensor{4, dim}((i,j,k,l) -> λ*δ(i,j)*δ(k,l) + μ*(δ(i,k)*δ(j,l) + δ(i,l)*δ(j,k)))
		return Elasticity(λ,μ, C)
	end
end

# ╔═╡ acea91d2-20fb-11eb-2228-8fdb39ef21e1
Elasticity(λ, μ, 2)

# ╔═╡ c1d0c020-21b0-11eb-2c2e-3bc5cec84eab
md"""## Aufgabe 2.9
* Erweitern sie die Methode `hello_course` um den Dispatch mit dem Input Argument `elasticity_tensor`. In der Implementierung dieses Dispatches geben Sie folgenden String zurück ` "Das ist mein Elastizitätstensor ℂ: ..."`, wobei die Punkte ersetzt werden sollen mit der reduzierten Schreibweise von $\mathbb{C}$. Sie können weiter oben nachsehen, wie wir zuvor die reduzierte Schreibweise von `Tensors.jl` bekommen haben.
* Plotten sie anschließend das Ergebnis aus der doppelten Überschiebung von $\mathbb{C}$ mit $\varepsilon$. $\varepsilon$ ist für sie schon definiert und ist ein **Array** von Dehnungen der Dimension 2. Das Ergebnis soll in der Variable $\sigma$ gespeichert werden. Plotten sie zuerst die $_{xx}$ Komponente und anschließend im selben Plot die $_{yy}$ Komponente.

### Hinweis
Wir haben hier quasi-zeitabhängige $\varepsilon$ Werte, die in einem Array gespeichert sind. Also jeder Array Eintrag ist ein Tensor 2. Stufe. Das bedeutet, dass ihr Ergebnis $\sigma$ auch ein Array gefüllt mit Tensoren 2. Stufe sein muss.
Zusätzlich möchten ich ihnen für die Bearbeitung dieser Aufgabe noch folgende vereinfachende Syntax für Array Erzeugung mit auf den Weg geben

	[dosomething(ε) for ε in ε_array]

erzeugt ein Array, wobei auf jedes Element des Array die Funktion `dosomething` angewendet wird. Sie müssen dabei nicht zwangsläufig Funktionen aufrufen. Bspw. ist auch folgendes möglich

	[ε ⋅ γ for ε in ε_array]

wobei $\gamma$ ein konstanter Tensor 2. Stufe wäre.
"""

# ╔═╡ 576028d0-21b2-11eb-2ebc-416983a04e9d
ε = [SymmetricTensor{2,2}([i 0; 0 -ν*i]) for i in 0:0.0005:0.02]

# ╔═╡ d957c282-21b2-11eb-0347-17acffd3cbcb
begin
	plot(getindex.(ε,(1)), getindex.([Elasticity(λ,μ,2).elasticity_tensor ⊡ ε_t for ε_t in ε],1))
	plot!(getindex.(ε,(4)), getindex.([Elasticity(λ,μ,2).elasticity_tensor ⊡ ε_t for ε_t in ε],2))
end

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
# ╟─a1c460fa-1488-11eb-1337-7d3c3e0ad20e
# ╠═84b569fa-1488-11eb-14ee-4bf29a4afa5a
# ╠═fece2868-1487-11eb-206f-d92557595592
# ╠═2ae9446e-1488-11eb-3cdc-87e08efa77ea
# ╟─ee9d76f2-1515-11eb-31e4-cf7088e9f1e8
# ╠═bbc1d878-1516-11eb-00f3-f7971b3df5b2
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
# ╟─9d05b6de-1480-11eb-2637-370719ccd01d
# ╟─f7d54034-151d-11eb-0f54-bdae21564eb3
# ╠═9b3be99c-1523-11eb-20c1-1f1320c732be
# ╟─d9c89d9a-1523-11eb-3fa6-b99bcb363457
# ╠═5d3675fc-1525-11eb-134b-f51f3e2a826d
# ╟─77ee562c-1524-11eb-2126-cd18b7f54c7b
# ╠═15c9645a-152e-11eb-243b-ed07dd658867
# ╟─0fe24ea0-152e-11eb-082f-df5c209afe02
# ╠═4efcc88e-152e-11eb-0c91-51052ceb4859
# ╟─412b68fa-152e-11eb-057d-3ff27ff6c2af
# ╠═34470e1e-1524-11eb-0da3-bd3699f0fb43
# ╟─c8249444-152e-11eb-29c7-733c4a7ad319
# ╟─b35d502c-20f6-11eb-0d46-175ff430a00d
# ╠═8bea648a-20fb-11eb-00a6-5b0f2d7ea52a
# ╠═acea91d2-20fb-11eb-2228-8fdb39ef21e1
# ╟─c1d0c020-21b0-11eb-2c2e-3bc5cec84eab
# ╠═576028d0-21b2-11eb-2ebc-416983a04e9d
# ╠═d957c282-21b2-11eb-0347-17acffd3cbcb
