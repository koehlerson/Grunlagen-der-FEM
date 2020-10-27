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

# ╔═╡ 13693e5c-1465-11eb-0b9b-4b560ab73661
md"""# Grundlagen der FEM
Wilkommen in der ersten Übung im Modul Grundlagen der FEM. In der ersten Übung werden wir uns mit Tensoren und Kontinuumsmechanik
beschäftigen.
## Übung 1 Teil 1 - Tensorrechnung"""

# ╔═╡ f95578fa-1464-11eb-06be-a3bc5c1d47e0
html"""<iframe width="100%" height="450px" src="https://www.youtube.com/embed/W5UVb3BIbEw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

# ╔═╡ 8ad346fc-1791-11eb-0c61-63c29ca2c2df
md"""
## 1.1 Tensormultiplikation

Schreiben Sie die folgenden Ausdrücke in Indexnotation und vereinfachen Sie soweit es geht.

1. $\boldsymbol{I} : (\boldsymbol{A} \otimes \boldsymbol{b})$

Ihre Antwort: $(@bind task11a TextField())

2. $(\boldsymbol{I} \otimes \boldsymbol{I})^{T23} : \boldsymbol{B}$

Ihre Antwort: $(@bind task11b TextField())

3. $\boldsymbol{B} : (\boldsymbol{A} \otimes  \boldsymbol{A}^T) : \mathbb{L} : (\boldsymbol{B} \otimes  \boldsymbol{B}^T) : \boldsymbol{A}$

Ihre Antwort: $(@bind task11c TextField())

4. $\boldsymbol{I} (\boldsymbol{AB})$

Ihre Antwort: $(@bind task11d TextField())

5. $(\boldsymbol{I} \otimes \boldsymbol{I}) : \boldsymbol{B}$

Ihre Antwort: $(@bind task11e TextField())

6. $\boldsymbol{A}^T : \mathbb{A} : \boldsymbol{B}$

Ihre Antwort: $(@bind task11f TextField())

## 1.2 Differentialoperationen 

Schreiben Sie die folgenden Ausdrücke in Indexnotation und vereinfachen Sie soweit es geht.

1. $\frac{1}{2} (grad\boldsymbol{v} + grad^T\boldsymbol{v}):\boldsymbol{A} \quad(Ann.: ... \boldsymbol{A} = \boldsymbol{A}^T)$

Ihre Antwort: $(@bind task12a TextField())

2. $div(\boldsymbol{v}\boldsymbol{T})$

Ihre Antwort: $(@bind task12b TextField())

3. $\frac{\partial{(tr\boldsymbol{A})}}{\partial{\boldsymbol{A}}}$

Ihre Antwort: $(@bind task12c TextField())

4. $\frac{\partial{\boldsymbol{A}}}{\partial{\boldsymbol{A}}} : \boldsymbol{B}$

Ihre Antwort: $(@bind task12d TextField())

5. $tr(grad(\boldsymbol{vT}))$

Ihre Antwort: $(@bind task12e TextField())

6. $\frac{\partial{(\boldsymbol{AB})}}{\partial{\boldsymbol{A}}}$

Ihre Antwort: $(@bind task12f TextField())

## 1.3 Elastizitätstensor und Voigt-Notation

Für linear elastisches isotropes Material lässt sich der Elastizitätstensor $\mathbb{C}$ wie folgt darstellen:

$\mathbb{C} = \lambda \boldsymbol{I} \otimes \boldsymbol{I} + 2\mu \mathbb{I} \qquad (1.1)$

a) Zeigen Sie, dass die Ausdrucksweisen $\boldsymbol{\sigma} = \lambda (tr\varepsilon)\boldsymbol{I} + 2\mu \varepsilon$ und $\boldsymbol{\sigma} = \mathbb{C}:\varepsilon$
äquivalent sind.
Setzen Sie dazu $(1.1)$ ein, schreiben die beiden Ausdrücke in Indexschreibweise und vereinfachen Sie soweit wie möglich.

b) Schreiben Sie das Materialgesetz $\boldsymbol{\sigma} = \mathbb{C}:\varepsilon$ zunächst in genereller Matrixnotation und dann in Voigt-Notation.
Unter welchen Annahmen ist dies möglich?

*Hinweis*: $\varepsilon$ lautet in in Voigt-Notation $\varepsilon^T = [\varepsilon_{11}, \varepsilon_{22}, \varepsilon_{33}, 2 \varepsilon_{23}, 2 \varepsilon_{13}, 2 \varepsilon_{12}]$

"""

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

b)Berechnen Sie die Verschiebung im Punkt A für den Parametersatz $\{E,\nu,q,t,l\}=\{210 \text{GPa},0.3,500 \text{MPa},100 \text{mm} ,100\text{mm}\}$

*Hinweis*: Die Beziehungen zwischen den Elastizitätsparametern lauten:

$\lambda=\frac{E \nu}{(1+\nu)(1-2 \nu)} \quad,\quad \mu=\frac{E}{2(1+\nu)}$

"""

# ╔═╡ Cell order:
# ╟─13693e5c-1465-11eb-0b9b-4b560ab73661
# ╟─0762dd74-1838-11eb-0bbe-e78a0e4363d2
# ╟─f95578fa-1464-11eb-06be-a3bc5c1d47e0
# ╠═8ad346fc-1791-11eb-0c61-63c29ca2c2df
# ╟─bc074770-1465-11eb-3f13-f30e20bf2ad6
# ╟─053ff316-1465-11eb-180f-cbb42b439c66
# ╟─50bd15a0-146d-11eb-23a8-e535d61f3092
# ╟─280a0fae-146e-11eb-2f2f-fdb24267944d
# ╟─c1ddd1b0-183d-11eb-33af-41164af82c03
