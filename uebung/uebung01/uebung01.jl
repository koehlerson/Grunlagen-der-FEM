### A Pluto.jl notebook ###
# v0.12.4

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

# ╔═╡ 0762dd74-1838-11eb-0bbe-e78a0e4363d2
using PlutoUI

# ╔═╡ 49a17e1e-1855-11eb-3264-e7b227556408
DownloadButton(read("uebung01.jl"), "uebung01.jl")

# ╔═╡ 13693e5c-1465-11eb-0b9b-4b560ab73661
md"""# Grundlagen der FEM
Wilkommen in der ersten Übung im Modul Grundlagen der FEM. In der ersten Übung werden wir uns mit Tensoren und Kontinuumsmechanik
beschäftigen. Wie sie bereits sehen, werden wir dieses Jahr die Umgebung Pluto nutzen, um Ihnen Dinge beizubringen. Da es Interaktivität bietet, hoffen wir sie zum mitarbeiten motivieren zu können!

Das Gif unterhalb des Textes wird sich aktualisieren, sobald sie alle Aufgaben gelöst haben."""

# ╔═╡ 2f1024a6-1936-11eb-2b4a-a9032966f1e0
md"## Übung 1 Teil 1 - Tensorrechnung"

# ╔═╡ f95578fa-1464-11eb-06be-a3bc5c1d47e0
html"""<iframe width="100%" height="450px" src="https://www.youtube.com/embed/W5UVb3BIbEw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

# ╔═╡ 8e9903f8-190d-11eb-245d-17f91d4ecb75
md"""
## 1.1 Tensormultiplikation

Schreiben Sie die folgenden Ausdrücke in Indexnotation und vereinfachen Sie soweit es geht.

### Hinweis

* Beginnen sie dabei bzgl. des Index mit i und gehen sie anschließend alphabetisch weiter
* Sollten Kronecker Delta Symbole $\delta$ auftreten, vereinfachen sie diese, indem sie den Index beibehalten, der zuerst im Alphabet vorkommt
* Sollten es zwei Tensoren gleicher Stufe sein, wird der erste Index des $\delta$ erhalten und der zweite ersetzt
* Kronecker Delta Symbole $\delta$ von Identitätstensoren (𝐈, 𝕀) werden nicht vereinfacht
* Trennen sie einzelne Tensoren (inkl. Kronecker Delta $\delta$) mit einem Leerzeichen
* Indices werden wie folgt geschrieben Unterstrich "\_" beginnt die Indices und "{ }" umschließt die Indices Bspl.: "A\_{ij}" ergibt $A_{ij}$, was in symbolischer Notation $\boldsymbol{A}$ entsprechen würde
* Doppelt gestrichene Buchstaben wie $\mathbb{A}$ werden über "\mathbb{ }" erzeugt, wobei innerhalb der Klammer der Buchstabe steht
"""

# ╔═╡ a8de612a-190f-11eb-2b98-4900bad105a7
md"""1. $\boldsymbol{I} : (\boldsymbol{A} \otimes \boldsymbol{b})$"""

# ╔═╡ b2b86362-190f-11eb-2e12-6fad405d5196
@bind task11a html"""
<input type="text" value="" id="input_task11a">
<span id='rendered_task11a' style="margin-left: 10%;"></span>
  <!-- The loading of KaTeX is deferred to speed up page rendering -->
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/katex.min.js" integrity="sha384-g7c+Jr9ZivxKLnZTDUhnkOnsh30B4H0rpLUpJ4jAIKs4fnJI+sEnkvrMWph2EDg4" crossorigin="anonymous"></script>
<!-- To automatically render math in text elements, include the auto-render extension: -->
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/contrib/auto-render.min.js" integrity="sha384-mll67QQFJfxn0IYznZYonOWZ644AWYC+Pt2cHqMaRhXVrursRwvLnLaebdGIlYNa" crossorigin="anonymous"
        onload="renderMathInElement(document.body);"></script>

<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" crossorigin="anonymous"></script>

<script>
$("#input_task11a").keyup(function(e){
	katex.render($("#input_task11a").val(), rendered_task11a,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ d9273082-190f-11eb-087d-8dad8c1a447f
if rstrip(lstrip(task11a)) == "\\delta_{ij} A_{ij} b_{m}"
	correct11a = true
	 md"!!! correct
			Korrekte Antwort 🐥"
else
	correct11a = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ dff403e0-190f-11eb-2d98-6756d76c3b71
md""" Lösung anzeigen $(@bind solution_task11a CheckBox(default=false))"""

# ╔═╡ 04d25806-1910-11eb-0bb5-233f5d8ec245
if solution_task11a
	md" $\delta_{ij} A_{ij} b_{m}$"
else
	md""
end

# ╔═╡ 5710a094-191c-11eb-1e02-61de4ff3cdee
md"2. $(\boldsymbol{I} \otimes \boldsymbol{I})^{T23} : \boldsymbol{B}$
 **Fassen sie bei dieser Aufgabe ausnahmsweise die $\delta$ Symbole zusammen**"

# ╔═╡ a64c8582-191d-11eb-2b06-ef9cee920f04
@bind task11b html"""
<input type="text" value="" id="input_task11b">
<span id='rendered_task11b' style="margin-left: 10%;"></span>

<script>
$("#input_task11b").keyup(function(e){
	katex.render($("#input_task11b").val(), rendered_task11b,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ bccb8e2a-191d-11eb-3a27-41f583cd8e8b
if rstrip(lstrip(task11b)) == "B_{ij}"
	 correct11b = true
	 md"!!! correct
			Korrekte Antwort 🐣"
else
	 correct11b = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ a66d168a-191d-11eb-1d53-7fc16179f8ff
md""" Lösung anzeigen $(@bind solution_task11b CheckBox(default=false))"""

# ╔═╡ a690ea92-191d-11eb-1a13-936c8ce8fe43
if solution_task11b
	md" $B_{ij}$"
else
	md""
end

# ╔═╡ d17ac54a-1920-11eb-3de8-55a10d8195ac
md"3. $\boldsymbol{B} : (\boldsymbol{A} \otimes  \boldsymbol{A}^T) : \mathbb{L} : (\boldsymbol{B} \otimes  \boldsymbol{B}^T) : \boldsymbol{A}$"

# ╔═╡ d2baac54-1920-11eb-030a-5965bf9cc9c7
@bind task11c html"""
<input type="text" value="" id="input_task11c">
<span id='rendered_task11c' style="margin-left: 10%;"></span>

<script>
$("#input_task11c").keyup(function(e){
	katex.render($("#input_task11c").val(), rendered_task11c,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ d2d08d8a-1920-11eb-2587-4b62bfe38feb
if rstrip(lstrip(task11c)) == "B_{ij} A_{ij} A_{lk} \\mathbb{L}_{klmn} B_{mn} B_{po} A_{op}"
	correct11c = true
	 md"!!! correct
			Korrekte Antwort 🐤"
else
	correct11c = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ d312a436-1920-11eb-37b7-775abea39c2b
md""" Lösung anzeigen $(@bind solution_task11c CheckBox(default=false))"""

# ╔═╡ 83023220-1922-11eb-1f8e-4f8cfc0ce1ee
if solution_task11c
	md" $B_{ij} A_{ij} A_{lk} \mathbb{L}_{klmn} B_{mn} B_{po} A_{op}$"
else
	md""
end

# ╔═╡ 9ea71322-1924-11eb-20ed-85f38dccba33
md"4. $\boldsymbol{I} (\boldsymbol{AB})$"

# ╔═╡ f6306f58-1924-11eb-27b7-1305064400d1
@bind task11d html"""
<input type="text" value="" id="input_task11d">
<span id='rendered_task11d' style="margin-left: 10%;"></span>

<script>
$("#input_task11d").keyup(function(e){
	katex.render($("#input_task11d").val(), rendered_task11d,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ 9ec4257a-1924-11eb-3a51-e5f81918c11d
if rstrip(lstrip(task11d)) == "\\delta_{ij} A_{jk} B_{kl}"
	correct11d = true
	 md"!!! correct
			Korrekte Antwort 🐧"
else
	correct11d = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 9ee23c54-1924-11eb-0b22-7170776525aa
md""" Lösung anzeigen $(@bind solution_task11d CheckBox(default=false))"""

# ╔═╡ 9f286616-1924-11eb-3e77-79e77c173106
if solution_task11d
	md" $\delta_{ij} A_{jk} B_{kl}$"
else
	md""
end

# ╔═╡ a306ae76-1926-11eb-0b6d-67b308eccb06
md"5. $(\boldsymbol{I} \otimes \boldsymbol{I}) : \boldsymbol{B}$"

# ╔═╡ a33543d0-1926-11eb-1cb9-958f38fda165
@bind task11e html"""
<input type="text" value="" id="input_task11e">
<span id='rendered_task11e' style="margin-left: 10%;"></span>

<script>
$("#input_task11e").keyup(function(e){
	katex.render($("#input_task11e").val(), rendered_task11e,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ a365e8e6-1926-11eb-0628-cfed1f89bf83
if rstrip(lstrip(task11e)) == "\\delta_{ij} \\delta_{kl} B_{kl}"
	correct11e = true
	 md"!!! correct
			Korrekte Antwort 🐦"
else
	correct11e = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ a39910fe-1926-11eb-3624-f7e8313645ef
md""" Lösung anzeigen $(@bind solution_task11e CheckBox(default=false))"""

# ╔═╡ a3cef430-1926-11eb-1ee2-77d1d2aa5b6c
if solution_task11e
	md" $\delta_{ij} \delta_{kl} B_{kl}$"
else
	md""
end

# ╔═╡ 6ab985e4-1927-11eb-108b-cdf38909c4ef
md"6. $\boldsymbol{A}^T : \mathbb{A} : \boldsymbol{B}$"

# ╔═╡ e3b2682e-1927-11eb-2d0b-eb930c3afac1
@bind task11f html"""
<input type="text" value="" id="input_task11f">
<span id='rendered_task11f' style="margin-left: 10%;"></span>

<script>
$("#input_task11f").keyup(function(e){
	katex.render($("#input_task11f").val(), rendered_task11f,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ e3cd8dc0-1927-11eb-110c-13c15199b249
if rstrip(lstrip(task11f)) == "A_{ji} \\mathbb{A}_{ijkl} B_{kl}"
	correct11f = true
	 md"!!! correct
			Korrekte Antwort 🦆"
else
	correct11f = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ e3e81d2a-1927-11eb-3c7f-9d3244f36d9d
md""" Lösung anzeigen $(@bind solution_task11f CheckBox(default=false))"""

# ╔═╡ e444d862-1927-11eb-3671-f5883df0bd07
if solution_task11f
	md" $A_{ji} \mathbb{A}_{ijkl} B_{kl}$"
else
	md""
end

# ╔═╡ dbbb9d62-1930-11eb-1e0e-cb28d84b6352
md"""
## 1.2 Differentialoperationen 

Schreiben Sie die folgenden Ausdrücke in Indexnotation und vereinfachen Sie soweit es geht.

### Hinweis
* Benutzen sie für Ableitungen die Komma Schreibweise im Index, bspw. $\text{grad} \ \mathbf{v} = v_{i,j}$
"""

# ╔═╡ e7ff3296-1930-11eb-361b-7b5276252c09
md"1. $\frac{1}{2} (\text{grad}\boldsymbol{v} + \text{grad}^T\boldsymbol{v}):\boldsymbol{A} \quad(Ann.: ... \boldsymbol{A} = \boldsymbol{A}^T)$"

# ╔═╡ 194358a0-1931-11eb-2be2-0b7a5c912f1f
@bind task12a html"""
<input type="text" value="" id="input_task12a">
<span id='rendered_task12a' style="margin-left: 10%;"></span>

<script>
$("#input_task12a").keyup(function(e){
	katex.render($("#input_task12a").val(), rendered_task12a,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ 195966f4-1931-11eb-293a-d5ad4f50444e
if rstrip(lstrip(task12a)) == "v_{i,j} A_{ij}"
	correct12a = true
	 md"!!! correct
			Korrekte Antwort 🐥"
else
	correct12a = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 19709dd8-1931-11eb-2ca2-4fa7e31bc8db
md""" Lösung anzeigen $(@bind solution_task12a CheckBox(default=false))"""

# ╔═╡ 4cd5df26-1933-11eb-2329-534518fa6774
if solution_task12a
	md" $v_{i,j} A_{ij}$"
else
	md""
end

# ╔═╡ cf44387e-1934-11eb-1e19-c9721ff071bf
md"2. $\text{div}(\boldsymbol{v}\boldsymbol{T})$"

# ╔═╡ cf5fccec-1934-11eb-1942-03bfc7841ce0
@bind task12b html"""
<input type="text" value="" id="input_task12b">
<span id='rendered_task12b' style="margin-left: 10%;"></span>

<script>
$("#input_task12b").keyup(function(e){
	katex.render($("#input_task12b").val(), rendered_task12b,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ cf770e5c-1934-11eb-272c-470405e6123c
if rstrip(lstrip(task12b)) == "v_{i,j} T_{ij} + v_{i} T_{ij,j}"
	correct12b = true
	 md"!!! correct
			Korrekte Antwort 🐣"
else
	correct12b = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ cf902bce-1934-11eb-3dd8-772cf35b082a
md""" Lösung anzeigen $(@bind solution_task12b CheckBox(default=false))"""

# ╔═╡ cfa71ffc-1934-11eb-269e-9fb2421d1331
if solution_task12b
	md" $v_{i,j} T_{ij} + v_{i} T_{ij,j}$"
else
	md""
end

# ╔═╡ a265130e-1935-11eb-1885-bf3d19c637dc
md"""3. $\frac{\partial{(\text{tr}\boldsymbol{A})}}{\partial{\boldsymbol{A}}}$"""

# ╔═╡ c04a4e24-1936-11eb-289c-e5a84e5e7f35
@bind task12c html"""
<input type="text" value="" id="input_task12c">
<span id='rendered_task12c' style="margin-left: 10%;"></span>

<script>
$("#input_task12c").keyup(function(e){
	katex.render($("#input_task12c").val(), rendered_task12c,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ c06039a8-1936-11eb-27c5-5d68b8675151
if rstrip(lstrip(task12c)) == "\\delta_{ij}"
	correct12c = true
	 md"!!! correct
			Korrekte Antwort 🐤"
else
	correct12c = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ c0a7787e-1936-11eb-3a24-f1cc2a7335b0
md""" Lösung anzeigen $(@bind solution_task12c CheckBox(default=false))"""

# ╔═╡ c1339310-1936-11eb-34a1-31b891a94835
if solution_task12c
	md" $\delta_{ij}$"
else
	md""
end

# ╔═╡ afaf7d4c-1935-11eb-2f47-39704f93c4c8
md"4. $\frac{\partial{\boldsymbol{A}}}{\partial{\boldsymbol{A}}} : \boldsymbol{B}$"

# ╔═╡ 4a62b3c4-1939-11eb-37ba-c5394b2d289e
@bind task12d html"""
<input type="text" value="" id="input_task12d">
<span id='rendered_task12d' style="margin-left: 10%;"></span>

<script>
$("#input_task12d").keyup(function(e){
	katex.render($("#input_task12d").val(), rendered_task12d,{throwOnError: false,output: "mathml"})
});
</script>
"""

# ╔═╡ 4a83bfa6-1939-11eb-3175-e913d8ca91ff
if rstrip(lstrip(task12d)) == "B_{ij}"
	correct12d = true
	 md"!!! correct
			Korrekte Antwort 🐧"
else
	correct12d = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 4adf4024-1939-11eb-17b3-27129640dc35
md""" Lösung anzeigen $(@bind solution_task12d CheckBox(default=false))"""

# ╔═╡ 4b519e14-1939-11eb-2a53-211dfaf0983e
if solution_task12d
	md" $B_{ij}$"
else
	md""
end

# ╔═╡ afc9452e-1935-11eb-09d7-d549a9e81f00
md"5. $\text{tr}(\text{grad}(\boldsymbol{vT}))$"

# ╔═╡ 9559da24-1939-11eb-06d7-71b5cf174ba7
@bind task12e html"""
<input type="text" value="" id="input_task12e">
<span id='rendered_task12e' style="margin-left: 10%;"></span>

<script>
$("#input_task12e").keyup(function(e){
	katex.render($("#input_task12e").val(), rendered_task12e,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ 9699cc8c-1939-11eb-2af1-d92a46a89418
if rstrip(lstrip(task12e)) == "(v_{i} T_{ij})_{,j}"
	correct12e = true
	 md"!!! correct
			Korrekte Antwort 🐦"
else
	correct12e = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 95768458-1939-11eb-21a6-f7f6283273d7
md""" Lösung anzeigen $(@bind solution_task12e CheckBox(default=false))"""

# ╔═╡ 959bbbe2-1939-11eb-2cf7-e91c25f7db30
if solution_task12e
	md" $(v_{i} T_{ij})_{,j}$"
else
	md""
end

# ╔═╡ afe2b842-1935-11eb-0ce0-b9cdfc5321ee
md"6. $\frac{\partial{(\boldsymbol{AB})}}{\partial{\boldsymbol{A}}}$"

# ╔═╡ 078d787e-193a-11eb-2806-733b1ee0ca44
@bind task12f html"""
<input type="text" value="" id="input_task12f">
<span id='rendered_task12f' style="margin-left: 10%;"></span>

<script>
$("#input_task12f").keyup(function(e){
	katex.render($("#input_task12f").val(), rendered_task12f,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ 0763325a-193a-11eb-17b5-797b2ca3c9cf
if rstrip(lstrip(task12f)) == "\\delta_{il} \\delta_{jm} B_{jk}"
	correct12f = true
	 md"!!! correct
			Korrekte Antwort 🦆"
else
	correct12f = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 07c29dfa-193a-11eb-1a26-7dab6a949ca9
md""" Lösung anzeigen $(@bind solution_task12f CheckBox(default=false))"""

# ╔═╡ 083d3d4c-193a-11eb-000a-49f73b0ee0b7
if solution_task12f
	md" $\delta_{il} \delta_{jm} B_{jk}$"
else
	md""
end

# ╔═╡ 8ad346fc-1791-11eb-0c61-63c29ca2c2df
md"""

## 1.3 Elastizitätstensor und Voigt-Notation

Für linear elastisches isotropes Material lässt sich der Elastizitätstensor $\mathbb{C}$ wie folgt darstellen:

$\mathbb{C} = \lambda \boldsymbol{I} \otimes \boldsymbol{I} + 2\mu \mathbb{I} \qquad (1.1)$

a) Zeigen Sie, dass die Ausdrucksweisen $\boldsymbol{\sigma} = \lambda (tr\varepsilon)\boldsymbol{I} + 2\mu \boldsymbol{\varepsilon}$ und $\boldsymbol{\sigma} = \mathbb{C}:\boldsymbol{\varepsilon}$
äquivalent sind.
Setzen Sie dazu $(1.1)$ ein, schreiben die beiden Ausdrücke in Indexschreibweise und vereinfachen Sie soweit wie möglich.
"""

# ╔═╡ 5730b86e-19c8-11eb-021f-890f971a5ebc
md""" Lösung anzeigen $(@bind solution_task13a CheckBox(default=false))"""

# ╔═╡ 28428bba-19d5-11eb-04bb-f353179c60f7
if solution_task13a
	md"""$\boldsymbol{\sigma} = \mathbb{C} : \boldsymbol{\varepsilon} = (\lambda \boldsymbol{I} \otimes \boldsymbol{I} + 2\mu \mathbb{I}):\boldsymbol{\varepsilon} = \lambda (\boldsymbol{I} \otimes \boldsymbol{I}):\boldsymbol{\varepsilon} + 2\mu\mathbb{I}:\boldsymbol{\varepsilon}$ 
	$\lambda (\boldsymbol{I} \otimes \boldsymbol{I}):\boldsymbol{\varepsilon} = \lambda \delta_{ij} \delta_{mn} \varepsilon_{mn} \boldsymbol{e}_i \boldsymbol{e}_j = \lambda \delta_{ij} \varepsilon_{mm} \boldsymbol{e}_i \boldsymbol{e}_j = \lambda (tr\varepsilon)\boldsymbol{I}$
	$2\mu\mathbb{I}:\boldsymbol{\varepsilon} = 2\mu \delta_{ij} \delta_{kl} \boldsymbol{e}_i \boldsymbol{e}_k \boldsymbol{e}_j \boldsymbol{e}_l : \varepsilon_{mn} \boldsymbol{e}_m \boldsymbol{e}_n = 2\mu \delta_{ij} \delta_{kl} \delta_{jm} \delta_{ln} \varepsilon_{mn} \boldsymbol{e}_i \boldsymbol{e}_k = 2\mu\varepsilon_{ik}\boldsymbol{e}_i\boldsymbol{e}_k = 2\mu \boldsymbol{\varepsilon}$
	$\boldsymbol{\sigma} = \lambda (tr\varepsilon)\boldsymbol{I} + 2\mu \boldsymbol{\varepsilon}$
	
	"""
else
	md""
end

# ╔═╡ 7c8f29e4-19c6-11eb-2a76-31caf9825131
md"""
b) Schreiben Sie das Materialgesetz $\boldsymbol{\sigma} = \mathbb{C}:\varepsilon$ zunächst in genereller Matrixnotation und dann in Voigt-Notation.
Unter welchen Annahmen ist dies möglich?

**Hinweis**: $\varepsilon$ lautet in in Voigt-Notation $\varepsilon^T = [\varepsilon_{11}, \varepsilon_{22}, \varepsilon_{33}, 2 \varepsilon_{23}, 2 \varepsilon_{13}, 2 \varepsilon_{12}]$"""

# ╔═╡ 6eae056e-19c8-11eb-237c-f91cc664d7f1
md""" Lösung anzeigen $(@bind solution_task13b CheckBox(default=false))"""

# ╔═╡ 6ec8d2ea-19c8-11eb-3032-41ea38d096cc
if solution_task13b
	md"""
	Matrixnotation: $\boldsymbol{\sigma} = \begin{bmatrix}
	\sigma_{11} & \sigma_{12} & \sigma_{13} \\
	\sigma_{21} & \sigma_{22} & \sigma_{23} \\
	\sigma_{31} & \sigma_{32} & \sigma_{33}
	\end{bmatrix}$ 
	
	voigh-notation:
	$\underline{\boldsymbol{\sigma}}^{9\text{x}1} = \begin{bmatrix}
	\sigma_{11} & \sigma_{22} & \sigma_{33} &
	\sigma_{23} & \sigma_{13} & \sigma_{12} & 
	\sigma_{32} & \sigma_{31} & \sigma_{21}
	\end{bmatrix}^T$
	$\underline{\boldsymbol{I}}^{9\text{x}1} = \begin{bmatrix}
	1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0
	\end{bmatrix}^T$
	
	$(\underline{\boldsymbol{I}} \otimes \underline{\boldsymbol{I}})^{9\text{x}9} = \begin{bmatrix}
	1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0\\
	1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0\\
	1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	\end{bmatrix}$
	
	$\mathbb{I}^{9\text{x}9} = \begin{bmatrix}
	1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1\\
	\end{bmatrix}$
	
	$\mathbb{C}^{9\text{x}9} = \begin{bmatrix}
	\lambda & \lambda & \lambda & 0 & 0 & 0 & 0 & 0 & 0\\
	\lambda & \lambda & \lambda & 0 & 0 & 0 & 0 & 0 & 0\\
	\lambda & \lambda & \lambda & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	\end{bmatrix} +  \begin{bmatrix}
	2\mu & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 2\mu & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 2\mu & 0 & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 2\mu & 0 & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 2\mu & 0 & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 2\mu & 0 & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 2\mu & 0 & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 2\mu & 0\\
	0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 2\mu\\
	\end{bmatrix}$
	
	$\underline{\boldsymbol{\varepsilon}}^{9\text{x}1} = \begin{bmatrix}
	\varepsilon_{11} & \varepsilon_{22} & \varepsilon_{33} &
	\varepsilon_{23} & \varepsilon_{13} & \varepsilon_{12} & 
	\varepsilon_{32} & \varepsilon_{31} & \varepsilon_{21}
	\end{bmatrix}^T$
	
	$\underline{\boldsymbol{\sigma}}^{9\text{x}1} = \mathbb{C}^{9\text{x}9} \underline{\boldsymbol{\varepsilon}}^{9\text{x}1}$
	
	Aufnahmen für voigh-notation: 
	1. Symmetrie von $\boldsymbol{\sigma}: \sigma_{ij} = \sigma_{ji}$
	2. Symmetrie von $\boldsymbol{\varepsilon}: \varepsilon_{ij} = \varepsilon_{ji}$
	3. Kleine symmetri von $\mathbb{C}: \mathbb{C}_{ijkl} = \mathbb{C}_{jikl} =      \mathbb{C}_{ijlk}$
	
	$\underline{\boldsymbol{\sigma}}^v = \begin{bmatrix}
	\sigma_{11} & \sigma_{22} & \sigma_{33} &
	\sigma_{23} & \sigma_{13} & \sigma_{12}
	\end{bmatrix}^T$
	
	$\mathbb{C}^v = \begin{bmatrix}
	\lambda + 2\mu & \lambda & \lambda & 0 & 0 & 0\\
	\lambda & \lambda +2\mu & \lambda & 0 & 0 & 0\\
	\lambda & \lambda & \lambda +2\mu & 0 & 0 & 0\\
	0 & 0 & 0 & \mu & 0 & 0\\
	0 & 0 & 0 & 0 & \mu & 0\\
	0 & 0 & 0 & 0 & 0 & \mu
	\end{bmatrix}$
	"""
else
	md""
end

# ╔═╡ bc074770-1465-11eb-3f13-f30e20bf2ad6
md"## Übung 1 Teil 2 - Kontinuumsmechanik"

# ╔═╡ 053ff316-1465-11eb-180f-cbb42b439c66
html"""<iframe width="100%" height="450px" src="https://www.youtube.com/embed/w1c7ezb3i2w" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

# ╔═╡ 50bd15a0-146d-11eb-23a8-e535d61f3092
md"""## 1.4 Analytische Lösung eines Randwertproblems 

"""

# ╔═╡ 280a0fae-146e-11eb-2f2f-fdb24267944d
HTML(open(f->read(f, String), "ue1_scaled.svg"))

# ╔═╡ c1ddd1b0-183d-11eb-33af-41164af82c03
md""" 

Der dargestellte Körper $\beta=l\times l\times t$ liegt reibungsfrei auf einer Ebene und ist im Koordinatenursprung (mittig in der $l$-$t$-Ebene) zusätzlich in Horizontalrichtung fixiert.
Auf ihn wirkt die Flächenlast $q$. 
Volumenkräfte durch die Erdbeschleunigung sind zu vernachlässigen.

a) Erfüllt der Verschiebungszustand $\boldsymbol{u}= \alpha x_1 \boldsymbol{e}_1 + \beta x_2 \boldsymbol{e}_2 + \gamma x_3 \boldsymbol{e}_3$
die Impulsbilanz? 
Bestimmen Sie die Konstanten $\alpha, \beta, \gamma$ aus den Randbedingungen.
Nutzen sie dazu das Cauchy-Theorem $\boldsymbol{\sigma}\boldsymbol{n}=\boldsymbol{t}$
"""

# ╔═╡ e77998a8-19ed-11eb-0932-f3399b2dfd6c
md"""
Ihre Antwort für $\alpha$: 
"""

# ╔═╡ ee3c7d56-19e6-11eb-00df-4d69dad82e9a
@bind task14aa html"""
<input type="text" value="" id="input_task14aa">
<span id='rendered_task14aa' style="margin-left: 10%;"></span>

<script>
$("#input_task14aa").keyup(function(e){
	katex.render($("#input_task14aa").val(), rendered_task14aa,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ c3b1bcb2-19ec-11eb-2bfa-8b7d9ffd608f
if rstrip(lstrip(task14aa)) == "-\\frac{q(\\lambda + \\mu)}{\\mu(3\\lambda + 2\\mu)}"
	correct14aa = true
	 md"!!! correct
			Korrekte Antwort 🦆"
else
	correct14aa = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 5ff26594-19ee-11eb-31ac-7b83406e1d2c
md"""
Ihre Antwort für $\beta$:
"""

# ╔═╡ ed94609e-19e6-11eb-1e99-cde57c7f5d4d
@bind task14ab html"""
<input type="text" value="" id="input_task14ab">
<span id='rendered_task14ab' style="margin-left: 10%;"></span>

<script>
$("#input_task14ab").keyup(function(e){
	katex.render($("#input_task14ab").val(), rendered_task14ab,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ c48883f0-19ec-11eb-372a-e5249a3997bf
if rstrip(lstrip(task14ab)) == "\\frac{q\\lambda}{2\\mu(3\\lambda + 2\\mu)}"
	correct14ab = true
	 md"!!! correct
			Korrekte Antwort 🦆"
else
	correct14ab = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 7a8d434e-19ee-11eb-14ab-61593eef4629
md"""
Ihre Antwort für $\gamma$:
"""

# ╔═╡ ecb13e2c-19e6-11eb-0758-d7b2d9f3973b
@bind task14ac html"""
<input type="text" value="" id="input_task14ac">
<span id='rendered_task14ac' style="margin-left: 10%;"></span>

<script>
$("#input_task14ac").keyup(function(e){
	katex.render($("#input_task14ac").val(), rendered_task14ac,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ c5907a00-19ec-11eb-077b-ed211385c6c4
if rstrip(lstrip(task14ac)) == "\\frac{q\\lambda}{2\\mu(3\\lambda + 2\\mu)}"
	correct14ac = true
	 md"!!! correct
			Korrekte Antwort 🦆"
else
	correct14ac = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ 84419740-19d9-11eb-1926-e39fc47f3399
md""" Lösung anzeigen $(@bind solution_task14a CheckBox(default=false))"""

# ╔═╡ a2b37624-19db-11eb-3a0e-134d650c11db
if solution_task14a
	md""" Impulsebilanz: $-\text{div}\boldsymbol{\sigma} = \boldsymbol{b} - \rho\ddot{\boldsymbol{x}} = \boldsymbol{0}$ (da keine körperkräfte und statisches problem)\
	$$\boldsymbol{u} = \begin{bmatrix}
\alpha x_1\\
\beta x_2\\
\gamma x_3
	\end{bmatrix}$$ $\Rightarrow$ $\text{grad}\boldsymbol{u} = \begin{bmatrix}
\alpha & 0 & 0\\
0 & \beta & 0 \\
0 & 0 & \gamma	
	\end{bmatrix}$ 
	\
	$\text{Wir wissen das}$
$\varepsilon = \frac{1}{2}(\text{grad}\boldsymbol{\varepsilon} + \text{grad}^T\boldsymbol{\varepsilon)} = \text{sym}(\text{grad}\boldsymbol{\varepsilon)}$ \
	$\text{tr}\boldsymbol{\varepsilon} = \alpha + \beta + \gamma$ 
	\
	$\text{Hook's law: }\boldsymbol{\sigma} = \lambda \begin{bmatrix}
\alpha + \beta + \gamma & 0 & 0\\
0 & \alpha + \beta + \gamma & 0\\
0 & 0 & \alpha + \beta + \gamma	
	\end{bmatrix} +2\mu\begin{bmatrix}
\alpha & 0 & 0\\
0 & \beta & 0 \\
0 & 0 & \gamma	
	\end{bmatrix}$
	$\Rightarrow -\text{div}\boldsymbol{\sigma} = \boldsymbol{0} \quad \text{da } \boldsymbol{\sigma} \text{ constant in } \boldsymbol{x}$

Randbedingungen:
* $x_3 = \frac{t}{2} \quad \boldsymbol{\sigma}.\boldsymbol{e}_3 = \boldsymbol{0} \Rightarrow \lambda (\alpha + \beta + \gamma) + 2\mu \gamma = 0 \qquad Eq(1)$
* $x_2 = \frac{l}{2} \quad \boldsymbol{\sigma}.\boldsymbol{e}_2 = \boldsymbol{0} \Rightarrow \lambda (\alpha + \beta + \gamma) + 2\mu \beta = 0 \qquad Eq(2)$
* $x_1 = l \quad \boldsymbol{\sigma}.\boldsymbol{e}_1 = \boldsymbol{0} \Rightarrow \lambda (\alpha + \beta + \gamma) + 2\mu \alpha = -q \qquad Eq(3)$ 
	
 $Eq(1) - Eq(2) = 2\mu \gamma - 2\mu \beta \Rightarrow \gamma = \beta \qquad Eq(4)$ 
\
 $Eq(1) - Eq(3) = 2\mu \gamma - 2\mu \alpha \Rightarrow \alpha = \gamma - \frac{q}{2\mu} \qquad Eq(5)$
\
Eq(4) und Eq(5) in Eq(2):  
	$ \lambda (\gamma - \frac{q}{2\mu} + 2\gamma)+2\mu\gamma = 0  \Rightarrow \gamma(3\lambda + 2\mu) = \frac{q\lambda}{2\mu}$
\
$\boxed{\beta = \gamma = \frac{q\lambda}{2\mu(3\lambda + 2\mu)}}$
\
In Eq(5): 
$\boxed{\alpha = \frac{q\lambda}{2\mu(3\lambda + 2\mu)} - \frac{q}{2\mu} = -\frac{q(\lambda + \mu)}{\mu(3\lambda + 2\mu)}}$
	
	"""
else
	md""
end

# ╔═╡ 95d4bdc4-19c6-11eb-3307-03a3f9465604
md"""
b)Berechnen Sie die Verschiebung im Punkt A für den Parametersatz $\{E,\nu,q,t,l\}=\{210 \text{GPa},0.3,500 \text{MPa},100 \text{mm} ,100\text{mm}\}$

**Hinweis**: Die Beziehungen zwischen den Elastizitätsparametern lauten:

$\lambda=\frac{E \nu}{(1+\nu)(1-2 \nu)} \quad,\quad \mu=\frac{E}{2(1+\nu)}$
"""

# ╔═╡ 77308eae-19e7-11eb-32cc-71930d96c317
@bind task14b html"""
<input type="text" value="" id="input_task14b">
<span id='rendered_task14b' style="margin-left: 10%;"></span>

<script>
$("#input_task14b").keyup(function(e){
	katex.render($("#input_task14b").val(), rendered_task14b,{throwOnError: false, output: "mathml"})
});
</script>
"""

# ╔═╡ a09558a6-19ee-11eb-1ed0-8f8091a05903
if rstrip(lstrip(task14b)) == "-0.238"
	correct14b = true
	 md"!!! correct
			Korrekte Antwort 🦆"
else
	correct14b = false
	 md"!!! danger 
			Falsche oder nicht gegebene Antwort 🦥"
end

# ╔═╡ f6fc6c5e-192c-11eb-11aa-cd94a4b9f2ea
if all([correct11a, correct11b, correct11c, correct11d, correct11e, correct12f,correct12a, correct12b, correct12c, correct12d, correct12e, correct12f, correct14aa,correct14ab, correct14ac, correct14b])
	md""" ### Alle Aufgaben richtig gelöst
	
$(Resource("https://media.giphy.com/media/l3q2Z6S6n38zjPswo/giphy.gif"))
    """
else
	md""" ### Noch nicht alle Aufgaben gelöst, los geht's!
	$(Resource("https://media.giphy.com/media/XcAa52ejGuNqdb5SFQ/giphy.gif"))
	"""
end

# ╔═╡ 94b1db7c-19e7-11eb-3947-eb06a78bb810
md""" Lösung anzeigen $(@bind solution_task14b CheckBox(default=false))"""

# ╔═╡ ae69f482-19e7-11eb-28b1-a3eb8511aa07
if solution_task14b
	md""" 
	Verschiebung am Punkt A: 
	\
	$\lambda = 80,769 \text{ Gpa}, \mu = 121,154 \text{ Gpa} \Rightarrow \alpha = -0,00238$
	\
	$\Rightarrow \boldsymbol{u}(l,0,0) = -0,238 \text{mm } \boldsymbol{e}_1$
	
	"""
else
	md""
end

# ╔═╡ Cell order:
# ╟─49a17e1e-1855-11eb-3264-e7b227556408
# ╟─13693e5c-1465-11eb-0b9b-4b560ab73661
# ╟─f6fc6c5e-192c-11eb-11aa-cd94a4b9f2ea
# ╟─2f1024a6-1936-11eb-2b4a-a9032966f1e0
# ╟─0762dd74-1838-11eb-0bbe-e78a0e4363d2
# ╟─f95578fa-1464-11eb-06be-a3bc5c1d47e0
# ╟─8e9903f8-190d-11eb-245d-17f91d4ecb75
# ╟─a8de612a-190f-11eb-2b98-4900bad105a7
# ╟─b2b86362-190f-11eb-2e12-6fad405d5196
# ╟─d9273082-190f-11eb-087d-8dad8c1a447f
# ╟─dff403e0-190f-11eb-2d98-6756d76c3b71
# ╟─04d25806-1910-11eb-0bb5-233f5d8ec245
# ╟─5710a094-191c-11eb-1e02-61de4ff3cdee
# ╟─a64c8582-191d-11eb-2b06-ef9cee920f04
# ╟─bccb8e2a-191d-11eb-3a27-41f583cd8e8b
# ╟─a66d168a-191d-11eb-1d53-7fc16179f8ff
# ╟─a690ea92-191d-11eb-1a13-936c8ce8fe43
# ╟─d17ac54a-1920-11eb-3de8-55a10d8195ac
# ╟─d2baac54-1920-11eb-030a-5965bf9cc9c7
# ╟─d2d08d8a-1920-11eb-2587-4b62bfe38feb
# ╟─d312a436-1920-11eb-37b7-775abea39c2b
# ╟─83023220-1922-11eb-1f8e-4f8cfc0ce1ee
# ╟─9ea71322-1924-11eb-20ed-85f38dccba33
# ╟─f6306f58-1924-11eb-27b7-1305064400d1
# ╟─9ec4257a-1924-11eb-3a51-e5f81918c11d
# ╟─9ee23c54-1924-11eb-0b22-7170776525aa
# ╟─9f286616-1924-11eb-3e77-79e77c173106
# ╟─a306ae76-1926-11eb-0b6d-67b308eccb06
# ╟─a33543d0-1926-11eb-1cb9-958f38fda165
# ╟─a365e8e6-1926-11eb-0628-cfed1f89bf83
# ╟─a39910fe-1926-11eb-3624-f7e8313645ef
# ╟─a3cef430-1926-11eb-1ee2-77d1d2aa5b6c
# ╟─6ab985e4-1927-11eb-108b-cdf38909c4ef
# ╟─e3b2682e-1927-11eb-2d0b-eb930c3afac1
# ╟─e3cd8dc0-1927-11eb-110c-13c15199b249
# ╟─e3e81d2a-1927-11eb-3c7f-9d3244f36d9d
# ╟─e444d862-1927-11eb-3671-f5883df0bd07
# ╟─dbbb9d62-1930-11eb-1e0e-cb28d84b6352
# ╟─e7ff3296-1930-11eb-361b-7b5276252c09
# ╟─194358a0-1931-11eb-2be2-0b7a5c912f1f
# ╟─195966f4-1931-11eb-293a-d5ad4f50444e
# ╟─19709dd8-1931-11eb-2ca2-4fa7e31bc8db
# ╟─4cd5df26-1933-11eb-2329-534518fa6774
# ╟─cf44387e-1934-11eb-1e19-c9721ff071bf
# ╟─cf5fccec-1934-11eb-1942-03bfc7841ce0
# ╟─cf770e5c-1934-11eb-272c-470405e6123c
# ╟─cf902bce-1934-11eb-3dd8-772cf35b082a
# ╟─cfa71ffc-1934-11eb-269e-9fb2421d1331
# ╟─a265130e-1935-11eb-1885-bf3d19c637dc
# ╟─c04a4e24-1936-11eb-289c-e5a84e5e7f35
# ╟─c06039a8-1936-11eb-27c5-5d68b8675151
# ╟─c0a7787e-1936-11eb-3a24-f1cc2a7335b0
# ╟─c1339310-1936-11eb-34a1-31b891a94835
# ╟─afaf7d4c-1935-11eb-2f47-39704f93c4c8
# ╟─4a62b3c4-1939-11eb-37ba-c5394b2d289e
# ╟─4a83bfa6-1939-11eb-3175-e913d8ca91ff
# ╟─4adf4024-1939-11eb-17b3-27129640dc35
# ╟─4b519e14-1939-11eb-2a53-211dfaf0983e
# ╟─afc9452e-1935-11eb-09d7-d549a9e81f00
# ╟─9559da24-1939-11eb-06d7-71b5cf174ba7
# ╟─9699cc8c-1939-11eb-2af1-d92a46a89418
# ╟─95768458-1939-11eb-21a6-f7f6283273d7
# ╟─959bbbe2-1939-11eb-2cf7-e91c25f7db30
# ╟─afe2b842-1935-11eb-0ce0-b9cdfc5321ee
# ╟─078d787e-193a-11eb-2806-733b1ee0ca44
# ╟─0763325a-193a-11eb-17b5-797b2ca3c9cf
# ╟─07c29dfa-193a-11eb-1a26-7dab6a949ca9
# ╟─083d3d4c-193a-11eb-000a-49f73b0ee0b7
# ╟─8ad346fc-1791-11eb-0c61-63c29ca2c2df
# ╟─5730b86e-19c8-11eb-021f-890f971a5ebc
# ╟─28428bba-19d5-11eb-04bb-f353179c60f7
# ╟─7c8f29e4-19c6-11eb-2a76-31caf9825131
# ╟─6eae056e-19c8-11eb-237c-f91cc664d7f1
# ╟─6ec8d2ea-19c8-11eb-3032-41ea38d096cc
# ╟─bc074770-1465-11eb-3f13-f30e20bf2ad6
# ╟─053ff316-1465-11eb-180f-cbb42b439c66
# ╟─50bd15a0-146d-11eb-23a8-e535d61f3092
# ╟─280a0fae-146e-11eb-2f2f-fdb24267944d
# ╟─c1ddd1b0-183d-11eb-33af-41164af82c03
# ╟─e77998a8-19ed-11eb-0932-f3399b2dfd6c
# ╟─ee3c7d56-19e6-11eb-00df-4d69dad82e9a
# ╟─c3b1bcb2-19ec-11eb-2bfa-8b7d9ffd608f
# ╟─5ff26594-19ee-11eb-31ac-7b83406e1d2c
# ╟─ed94609e-19e6-11eb-1e99-cde57c7f5d4d
# ╟─c48883f0-19ec-11eb-372a-e5249a3997bf
# ╟─7a8d434e-19ee-11eb-14ab-61593eef4629
# ╟─ecb13e2c-19e6-11eb-0758-d7b2d9f3973b
# ╟─c5907a00-19ec-11eb-077b-ed211385c6c4
# ╟─84419740-19d9-11eb-1926-e39fc47f3399
# ╟─a2b37624-19db-11eb-3a0e-134d650c11db
# ╟─95d4bdc4-19c6-11eb-3307-03a3f9465604
# ╟─77308eae-19e7-11eb-32cc-71930d96c317
# ╟─a09558a6-19ee-11eb-1ed0-8f8091a05903
# ╟─94b1db7c-19e7-11eb-3947-eb06a78bb810
# ╟─ae69f482-19e7-11eb-28b1-a3eb8511aa07
