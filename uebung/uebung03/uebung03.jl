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

# ╔═╡ b9f115c4-27ef-11eb-179f-cd13bc9ccd4c
include("../../definitions/def.jl")

# ╔═╡ 7ba3c82a-2608-11eb-0a6f-a11c4a8b64f9
begin
# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end
nothing
end

# ╔═╡ 6580ea26-1cf0-11eb-3191-1b305010b003
md"""
# Variationsrechnung 
Wilkommen in der dritten Übung im Modul Grundlagen der FEM. In dieser Übung werden wir uns  mit dem Variationsprinzip beschäftigen.
"""

# ╔═╡ 29d77f40-2802-11eb-11a2-294717f0529a
html"""
<iframe width="100%" height="450" src="https://www.youtube.com/embed/E8xK0eIGArU?start=2976" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

# ╔═╡ 144417ae-1cf1-11eb-1ac7-7f99dba09b1f
md"# Aufgabe 3.1 - Stab unter Eigengewicht"

# ╔═╡ 35a1597a-1d14-11eb-162f-f1251f6239db
HTML(open(f->read(f, String), "assets/ue2_stab_eigengewicht_1.svg"))

# ╔═╡ 36836be2-1cf3-11eb-08ba-e7a8ec36385d
md"Ein Stab ($EA=const.$) der Dichte $\rho$ und der Länge $l$ ist eingespannt an der Position $x=0$ und erfährt eine Deformation aufgrund seiner Masse im Erdschwerefeld $g$."





# ╔═╡ cb6ac5e8-1cf3-11eb-1acd-b1bf6bff665b
md"
## Aufgabe 3.1a) 
Leiten Sie mithilfe des Prinzips des Minimums des elastischen Gesamtpotentials die Euler-Lagrange Differentialgleichung für die Verschiebungsfunktion $u(x)$ her."

# ╔═╡ a4f59166-2290-11eb-30f7-2f15cf68fdc5
begin
hint1 = md""" 
Elastisches Potential des Stabes: 
	
$$\Pi = \int_{\mathcal{B}} \left(\frac{1}{2} \sigma(\varepsilon)\varepsilon - \rho(-g)u\right)dV$$
"""
hint(hint1)
end

# ╔═╡ 18014a4c-2291-11eb-1530-0377724de112
loesung_1a = md"""
$ $
"""

# ╔═╡ 3fa3403c-2291-11eb-3ca2-9ba37fe20bdb
begin 
true_loesung_1a = md"""
$E u'' = \rho g$
"""
nothing
end

# ╔═╡ 523158bc-2291-11eb-0a76-fdfa1c1e31cd
if loesung_1a == true_loesung_1a
	 correct31a = true
	 correct()
else
	 correct31a = false
	 warning(md"""Falsche oder nicht gegebene Antwort 🦥""")
end

# ╔═╡ 1fd73148-2604-11eb-12c4-03c97e2747be
begin 
	uebung31a_loesung = md"""
	Elastisches Potential des Stabes: 
	
	$\Pi = \int_{\mathcal{B}} (\frac{1}{2} \sigma(\varepsilon)\varepsilon - \rho(-g)u)dV$
	
	$\sigma(\varepsilon) = E\varepsilon \text{,} \qquad \varepsilon = \frac{du}{dx} = u'\text{,} \qquad \int_{\mathcal{B}} dV = A\int_0^ldx$
	
	$\Rightarrow \Pi = A\int_0^l(\frac{1}{2}Eu'^2 + \rho gu)dx \Rightarrow \min$
	
	$\delta u \Pi = \frac{\partial \Pi}{\partial u'} \delta u' + \frac{\partial \Pi}{\partial u}\delta u = 0$
	
	$\Rightarrow A \int_0^l(Eu'\delta u' + \rho g \delta u)dx = 0$
	
	$\text{partielle integration}: \int_0^l u' \delta u' dx = u'\delta u ]_{x=l} - u' \delta u]_{x=0} - \int_0^l u'' \delta u dx$
	
	$\text{Neumann RB: }u']_{x=l} = 0 \text{,} \qquad  \text{Dirichlet RB: }\delta u]_{x=0} = 0$
	
	$\Rightarrow \delta u \Pi = - \int_0^l (EAu'' - A\rho g)\delta u = 0$
	
	$EAu'' - A\rho g = 0$
	
	$\boxed{\text{Euler-Lagrange Gleichung: } Eu'' = \rho g}$
	
	$\text{RB: } EAu']_{x=l} = u]_{x=0} = 0$
	"""
	nothing
end

# ╔═╡ 8b173bc4-2604-11eb-06c9-89de890cbcc0
solution(uebung31a_loesung)

# ╔═╡ cc3829fc-1cf3-11eb-1d2b-e5dea4601c02
md"## Aufgabe 3.1b) 
Ermitteln sie die Lösungsfunktion $u(x)$ der Differentialgleichung unter Berücksichtigung der Randbedingungen.
"

# ╔═╡ dfb3a160-2d6e-11eb-0df0-b537a4dba098
begin
	hint1b = md"""
	$u'' = \frac{\rho g}{E}$

	$\text{Integration} \Rightarrow u' = \frac{\rho g}{E}x + C_1$
	"""
	nothing
	hint(hint1b)
end

# ╔═╡ 299af2de-2292-11eb-3e42-537b9a08cf2d
loesung_1b = md"""
$ $
"""

# ╔═╡ 53028652-2292-11eb-0d5d-f92bdc9da4f7
begin true_loesung_1b = md"""
$u = \frac{\rho g}{2 E} x^{2} - \frac{\rho g l}{E} x$	
"""
	nothing
end

# ╔═╡ ad6102d0-1d0f-11eb-12a9-af8f3eb9cb95
if loesung_1b == true_loesung_1b
	 correct31b = true
	 correct()
else
	 correct31b = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ b2fb9374-2604-11eb-2b59-374f775884c8
begin
uebung31b_loesung = md"""
$\text{Neumann RB} \Rightarrow u'(x=l) = 0 \Rightarrow C_1 = \frac{-\rho g}{E}l$
	
$u' = \frac{\rho g}{E} (x-l)$
	
$\text{Integration} \Rightarrow u = \frac{\rho g}{2E}x^2 - \frac{\rho gl}{E}x + C_2$
	
$\text{Dirichlet RB} \Rightarrow u(x=0) = 0 \Rightarrow C_2 = 0$
	
$\Rightarrow \boxed{u = \frac{\rho g}{2E}x^2 - \frac{\rho gl}{E}x}$
"""
nothing
end

# ╔═╡ da714626-2604-11eb-086d-e3b716acb930
solution(uebung31b_loesung)

# ╔═╡ 6f622318-1cf3-11eb-15b6-09a7e9a194bc
md"# Aufgabe 3.2 - Balken unter Streckenlast"

# ╔═╡ 4622cc54-1d17-11eb-2f2a-9b1d8f095036
HTML(open(f->read(f, String), "assets/aufgabe_2.svg"))

# ╔═╡ 7efc1d7e-1cf3-11eb-0dab-c14c81752a14
md" Ein Balken ($EI=const.$) der Länge $l$ erfährt eine konstante Streckenlast $q(x)=q_0$.

Vorgegeben sei das folgende elastische Gesamtpotential:

$\Pi=\int_{0}^l \Big[ \frac{1}{2} EI(w(x)'')^2-w(x)q_0 \Big] dx$
"

# ╔═╡ ea170b1e-1cf3-11eb-1f1e-573f1901407c
md"
## Aufgabe 3.2a) 
Leiten Sie mithilfe der Variationsmethode die Euler-Lagrange Gleichung für die Durchbiegung $w(x)$ sowie die natürlichen Randbedingungen her.
"

# ╔═╡ bcd2664e-2d6f-11eb-2f0f-77684907b02a
begin
	hint32a = md"""
	Variation nach $w = w(x)$
	
	$\delta w \Pi = \int_0^l (EIw'' \delta w'' - q_0 \delta w)dx = 0$
	
	$\text{partielle integration: }\int_0^l w'' \delta w'' dx = w'' \delta w']_{x=l} - w'' \delta w']_{x=0} - \int_0^l w''' \delta w' dx$
	"""
	hint(hint32a)
end

# ╔═╡ a5535376-2292-11eb-0f11-0bd3abfca30d
loesung_2a = md"""
$ $
"""

# ╔═╡ cfb5b690-2292-11eb-3c29-9dc80057477b
begin 
true_loesung_2a = md"""
$E I w'''' = q_{0}$	
"""
	nothing
end

# ╔═╡ e8b0757a-2292-11eb-322c-b99dfb8068e6
if loesung_2a == true_loesung_2a
	 correct32a = true
	 correct()
else
	 correct32a = false
	 warning(md""" Falsche oder nicht gegebene Antwort 🦥 """)
end

# ╔═╡ 0cbf4872-2605-11eb-1ac0-e54f1e9cb497
begin 
	uebung32a_loesung = md"""
	Variation nach $w = w(x)$
	
	$\delta w \Pi = \int_0^l (EIw'' \delta w'' - q_0 \delta w)dx = 0$
	
	$\text{partielle integration: }\int_0^l w'' \delta w'' dx = w'' \delta w']_{x=l} - w'' \delta w']_{x=0} - \int_0^l w''' \delta w' dx$
	
	$\text{partielle integration: } -\int_0^l w''' \delta w' dx = w''' \delta w]_{x=0} - w''' \delta w]_{x=l} + \int_0^l w'''' \delta w dx$
	
	$\text{Dirichlet RB: } \delta w]_{x=0} = \delta w]_{x=l} = 0$
	
	$\Rightarrow \delta w \Pi = EI w'']_{x=l} \delta w' - EI w'']_{x=0} \delta w + \int_0^l (EI w'''' - q_0)\delta w dx = 0$
	
	$\text{DG: } \boxed{EI w'''' = q_0}$
	
	$\text{RB: } EIw''(x=0) = EIw''(x=l) = 0$
	
	$\text{    } EIw (x=0) = EIw(x=l) = 0$
	"""
	nothing
end

# ╔═╡ 3f2e732a-2605-11eb-1424-dba6760572db
solution(uebung32a_loesung)

# ╔═╡ fa4c205a-1cf3-11eb-06ff-49faaed15160
md"
## Aufgabe 3.2b)
Bestimmen sie die Biegelinie $w(x)$ unter Auswertung der Randbedingungen.
"

# ╔═╡ 21c1e5da-2293-11eb-21ba-6f847d8da9f6
loesung_2b = md"""
$ $
"""

# ╔═╡ 3ab64608-2293-11eb-35d9-5f70c6ef15e7
begin 
true_loesung_2b = md"""
$w = -\frac{1}{24 E I} q_{0} x^{4} + \frac{1}{12 E I} q_{0} l x^{3} - \frac{1}{24 E I}q_{0} l^{3} x$	
"""
	nothing
end

# ╔═╡ 3962918a-2293-11eb-19ff-034dbffc2963
if loesung_2b == true_loesung_2b
	 correct32b = true
	 correct()
else
	 correct32b = false
	 warning(md"Falsche oder nicht gegebene Antwort 🦥")
end

# ╔═╡ 76c37218-2605-11eb-0c4e-c58ff67521f5
begin 
	uebung32b_loesung = md"""
	$EIw'' = -\frac{1}{2}q_0 x^2 + C_1 x + C_2$ 
	
	$EIw''(x=0) = EIw''(x=l) = 0 \Rightarrow C_2 = 0, C_1 = \frac{1}{2}q_0 l$
	
	$EIw' = -\frac{1}{6}q_0 x^3 + \frac{1}{4}q_0 l x^2 + C_3$
	
	$EIw = -\frac{1}{24}q_0 x^4 + \frac{1}{12}q_0 l x^3 + C_3 x + C_4$
	
	$EIw (x=0) = EIw(x=l) = 0 \Rightarrow C_4 = 0, C_3 = \frac{1}{24}q_0l^3$
	
	$EIw = -\frac{1}{24}q_0x^4 + \frac{1}{12}q_0l x^3 - \frac{1}{24}q_0 l^3 x$
	
	$\boxed{w = -\frac{1}{24EI}q_0x^4 + \frac{1}{12EI}q_0l x^3 - \frac{1}{24EI}q_0 l^3x}$
	"""
	nothing
end

# ╔═╡ 97c94816-2605-11eb-01e9-9f03e4f04009
solution(uebung32b_loesung)

# ╔═╡ 05986728-1cf4-11eb-090e-2bdb51224135
md"""
## Aufgabe 3.2c) 
Wie lauten die natürlichen Randbedingungen unter der Annahme, dass der Balken bei $x=0$ fest eingespannt ist und bei $x=l$ frei?


!!! note "Hinweis"
    Die essentiellen RB lauten in diesem Fall $w(0)=0$ und $w'(0)=0$.

    ddw = $w''$

    dddw = $w'''$
"""

# ╔═╡ 812cc7d8-2293-11eb-3acd-2bb1dd14cadd
ddw = md"""
$ $
"""

# ╔═╡ f34e6af8-2293-11eb-1b1a-4b0c3e5cb9c6
begin
true_ddw = md"""
$E I w'' (x = l) = 0$
"""
	nothing
end

# ╔═╡ e91d1760-2293-11eb-2acf-bf7c86853da0
if ddw == true_ddw
	 correct32c1 = true
	 correct()
else
	 correct32c1 = false
	 warning(md"Falsche oder nicht gegebene Antwort 🦥")
end

# ╔═╡ 2926284e-2294-11eb-1b98-1daa626b64d5
dddw = md"""
$ $
"""

# ╔═╡ 3cc38e3c-2294-11eb-2569-b5af2f506637
begin
true_dddw = md"""
$E I w''' (x = l) = 0$
"""
	nothing
end

# ╔═╡ 55f30796-2294-11eb-0a52-1bae9379a190
if dddw == true_dddw
	 correct32c2 = true
	 correct()
else
	 correct32c2 = false
	 warning(md"Falsche oder nicht gegebene Antwort 🦥")
end

# ╔═╡ ab5dfa98-2605-11eb-2263-b99a9dac0a5c
begin 
	uebung32c_loesung = md"""
	$\delta w \Pi = \int_0^l (EIw'' \delta w'' - q_0 \delta w)dx = 0$
	
	$\text{partielle integration: }\int_0^l w'' \delta w'' dx = w'' \delta w']_{x=l} - w'' \delta w']_{x=0} - \int_0^l w''' \delta w' dx$
	
	$\text{partielle integration: } -\int_0^l w''' \delta w' dx = w''' \delta w]_{x=0} - w''' \delta w]_{x=l} + \int_0^l w'''' \delta w dx$
	
	$\delta w]_{x=0} = \delta w']_{x=0} = 0$
	
	$\Rightarrow \delta w \Pi = EIw'' \delta w']_{x=l} - EIw''' \delta w]_{x=l} + \int_0^l(EIw'''' - q_0)dx = 0$
	
	natürliche RB: 
	
	$\boxed{EI w'' (x=l) = 0}$
	
	$\boxed{EI w''' (x=l) = 0}$
	"""
	nothing
end

# ╔═╡ caa17324-2605-11eb-3d20-3b72d682922f
solution(uebung32c_loesung)

# ╔═╡ Cell order:
# ╟─b9f115c4-27ef-11eb-179f-cd13bc9ccd4c
# ╟─7ba3c82a-2608-11eb-0a6f-a11c4a8b64f9
# ╟─6580ea26-1cf0-11eb-3191-1b305010b003
# ╟─29d77f40-2802-11eb-11a2-294717f0529a
# ╟─144417ae-1cf1-11eb-1ac7-7f99dba09b1f
# ╟─35a1597a-1d14-11eb-162f-f1251f6239db
# ╟─36836be2-1cf3-11eb-08ba-e7a8ec36385d
# ╟─cb6ac5e8-1cf3-11eb-1acd-b1bf6bff665b
# ╟─a4f59166-2290-11eb-30f7-2f15cf68fdc5
# ╠═18014a4c-2291-11eb-1530-0377724de112
# ╟─523158bc-2291-11eb-0a76-fdfa1c1e31cd
# ╟─3fa3403c-2291-11eb-3ca2-9ba37fe20bdb
# ╟─1fd73148-2604-11eb-12c4-03c97e2747be
# ╟─8b173bc4-2604-11eb-06c9-89de890cbcc0
# ╟─cc3829fc-1cf3-11eb-1d2b-e5dea4601c02
# ╟─dfb3a160-2d6e-11eb-0df0-b537a4dba098
# ╠═299af2de-2292-11eb-3e42-537b9a08cf2d
# ╟─ad6102d0-1d0f-11eb-12a9-af8f3eb9cb95
# ╟─53028652-2292-11eb-0d5d-f92bdc9da4f7
# ╟─b2fb9374-2604-11eb-2b59-374f775884c8
# ╟─da714626-2604-11eb-086d-e3b716acb930
# ╟─6f622318-1cf3-11eb-15b6-09a7e9a194bc
# ╟─4622cc54-1d17-11eb-2f2a-9b1d8f095036
# ╟─7efc1d7e-1cf3-11eb-0dab-c14c81752a14
# ╟─ea170b1e-1cf3-11eb-1f1e-573f1901407c
# ╟─bcd2664e-2d6f-11eb-2f0f-77684907b02a
# ╠═a5535376-2292-11eb-0f11-0bd3abfca30d
# ╟─e8b0757a-2292-11eb-322c-b99dfb8068e6
# ╟─cfb5b690-2292-11eb-3c29-9dc80057477b
# ╟─0cbf4872-2605-11eb-1ac0-e54f1e9cb497
# ╟─3f2e732a-2605-11eb-1424-dba6760572db
# ╟─fa4c205a-1cf3-11eb-06ff-49faaed15160
# ╠═21c1e5da-2293-11eb-21ba-6f847d8da9f6
# ╟─3962918a-2293-11eb-19ff-034dbffc2963
# ╟─97c94816-2605-11eb-01e9-9f03e4f04009
# ╟─3ab64608-2293-11eb-35d9-5f70c6ef15e7
# ╟─76c37218-2605-11eb-0c4e-c58ff67521f5
# ╟─05986728-1cf4-11eb-090e-2bdb51224135
# ╠═812cc7d8-2293-11eb-3acd-2bb1dd14cadd
# ╟─e91d1760-2293-11eb-2acf-bf7c86853da0
# ╟─f34e6af8-2293-11eb-1b1a-4b0c3e5cb9c6
# ╠═2926284e-2294-11eb-1b98-1daa626b64d5
# ╟─55f30796-2294-11eb-0a52-1bae9379a190
# ╟─caa17324-2605-11eb-3d20-3b72d682922f
# ╟─3cc38e3c-2294-11eb-2569-b5af2f506637
# ╟─ab5dfa98-2605-11eb-2263-b99a9dac0a5c
