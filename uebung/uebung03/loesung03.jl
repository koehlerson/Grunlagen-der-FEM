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
Zur Lösung der Aufgaben werden 3 grundlegende Prinzipien bzw. mathematischen Regeln erforderlich
1. Fundamental Lemma der Variationsrechnung
2. Die erste Variation eines Funktionals
3. partielle Integration

### 1 Fundamental Lemma der Variationsrechnung
Erfüllt $\phi$ in $[a,b]$, dass

$$\int_a^b \phi (x) \delta u = 0$$

wobei $\delta u$ eine beliebige Testfunktion ist, dann gilt für $\delta u(a)=0$ und $\delta u(b)=0$:

$$\phi(x) = 0$$

**Motivation** Integral des Funktionals so umformulieren, dass Testfunktionen ausgeklammert werden können und $\phi$ gleich 0 gesetzt werden kann $\implies$ Differentialgleichung aus $\phi$ bekommen

### 2 Die erste Variation eines Funktionals
Sei ein Potential $\Pi$ gegeben

$$\Pi(u) = \int_{\mathcal{B}} f(x, u, u', u'', ..., u^{(n)}) dV$$

Dann ist die erste Variation wie folgt definiert

$$\delta u \Pi = \frac{\partial \Pi}{\partial u}\delta u + \frac{\partial \Pi}{\partial u'} \delta u' + \frac{\partial \Pi}{\partial u''} \delta u'' + ... + \frac{\partial \Pi}{\partial u^{(n)}} \delta u^{(n)}$$

wobei $u^{(n)}$ für die $n$-te Ableitung der Funktion $u$ steht

### 3 Partielle Integration
Wird angewendet um Ableitungen von Testfunktionen $\delta u$ auf gesuchte Funktion $u$ umzuwälzen, damit $\delta u$ ausgeklammert werden kann

$$\int_0^l u' \delta u' dx = u'\delta u ]_{x=l} - u' \delta u]_{x=0} - \int_0^l u'' \delta u dx$$

"""

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

# ╔═╡ 18014a4c-2291-11eb-1530-0377724de112
loesung_1a = md"""
$E u'' = \rho g$
"""

# ╔═╡ 3fa3403c-2291-11eb-3ca2-9ba37fe20bdb
begin 
true_loesung_1a = md"""
$E u'' = \rho g$
"""
nothing
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
solution(uebung31a_loesung; blur=false)

# ╔═╡ cc3829fc-1cf3-11eb-1d2b-e5dea4601c02
md"## Aufgabe 3.1b) 
Ermitteln sie die Lösungsfunktion $u(x)$ der Differentialgleichung unter Berücksichtigung der Randbedingungen.
"

# ╔═╡ 299af2de-2292-11eb-3e42-537b9a08cf2d
loesung_1b = md"""
$u = \frac{\rho g}{2 E} x^{2} - \frac{\rho g l}{E} x$
"""

# ╔═╡ b2fb9374-2604-11eb-2b59-374f775884c8
begin
uebung31b_loesung = md"""
$u'' = \frac{\rho g}{E}$

$\text{Integration} \Rightarrow u' = \frac{\rho g}{E}x + C_1$
	
$\text{Neumann RB} \Rightarrow u'(x=l) = 0 \Rightarrow C_1 = \frac{-\rho g}{E}l$
	
$u' = \frac{\rho g}{E} (x-l)$
	
$\text{Integration} \Rightarrow u = \frac{\rho g}{2E}x^2 - \frac{\rho gl}{E}x + C_2$
	
$\text{Dirichlet RB} \Rightarrow u(x=0) = 0 \Rightarrow C_2 = 0$
	
$\Rightarrow \boxed{u = \frac{\rho g}{2E}x^2 - \frac{\rho gl}{E}x}$
"""
nothing
end

# ╔═╡ da714626-2604-11eb-086d-e3b716acb930
solution(uebung31b_loesung, blur=false)

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

# ╔═╡ a5535376-2292-11eb-0f11-0bd3abfca30d
loesung_2a = md"""
$E I w'''' = q_{0}$
"""

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
solution(uebung32a_loesung, blur=false)

# ╔═╡ fa4c205a-1cf3-11eb-06ff-49faaed15160
md"
## Aufgabe 3.2b)
Bestimmen sie die Biegelinie $w(x)$ unter Auswertung der Randbedingungen.
"

# ╔═╡ 21c1e5da-2293-11eb-21ba-6f847d8da9f6
loesung_2b = md"""
$w = -\frac{1}{24 E I} q_{0} x^{4} + \frac{1}{12 E I} q_{0} l x^{3} - \frac{1}{24 E I}q_{0} l^{3} x$
"""

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
solution(uebung32b_loesung, blur=false)

# ╔═╡ 05986728-1cf4-11eb-090e-2bdb51224135
md"""
## Aufgabe 3.2c) 
Wie lauten die natürlichen Randbedingungen unter der Annahme, dass der Balken bei $x=0$ fest eingespannt ist und bei $x=l$ frei?


!!! note "Hinweis"
    Die essentiellen RB lauten in diesem Fall $w(0)=0$ und $w'(0)=0$.

    ddw = w''

    dddw = w'''
"""

# ╔═╡ 812cc7d8-2293-11eb-3acd-2bb1dd14cadd
ddw = md"""
$E I w'' (x = l) = 0$
"""

# ╔═╡ 2926284e-2294-11eb-1b98-1daa626b64d5
dddw = md"""
$E I w''' (x = l) = 0$
"""

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
solution(uebung32c_loesung, blur=false)

# ╔═╡ Cell order:
# ╟─b9f115c4-27ef-11eb-179f-cd13bc9ccd4c
# ╟─7ba3c82a-2608-11eb-0a6f-a11c4a8b64f9
# ╟─6580ea26-1cf0-11eb-3191-1b305010b003
# ╟─144417ae-1cf1-11eb-1ac7-7f99dba09b1f
# ╟─35a1597a-1d14-11eb-162f-f1251f6239db
# ╟─36836be2-1cf3-11eb-08ba-e7a8ec36385d
# ╟─cb6ac5e8-1cf3-11eb-1acd-b1bf6bff665b
# ╠═18014a4c-2291-11eb-1530-0377724de112
# ╟─8b173bc4-2604-11eb-06c9-89de890cbcc0
# ╟─3fa3403c-2291-11eb-3ca2-9ba37fe20bdb
# ╟─1fd73148-2604-11eb-12c4-03c97e2747be
# ╟─cc3829fc-1cf3-11eb-1d2b-e5dea4601c02
# ╠═299af2de-2292-11eb-3e42-537b9a08cf2d
# ╟─da714626-2604-11eb-086d-e3b716acb930
# ╟─b2fb9374-2604-11eb-2b59-374f775884c8
# ╟─6f622318-1cf3-11eb-15b6-09a7e9a194bc
# ╟─4622cc54-1d17-11eb-2f2a-9b1d8f095036
# ╟─7efc1d7e-1cf3-11eb-0dab-c14c81752a14
# ╟─ea170b1e-1cf3-11eb-1f1e-573f1901407c
# ╠═a5535376-2292-11eb-0f11-0bd3abfca30d
# ╟─3f2e732a-2605-11eb-1424-dba6760572db
# ╟─0cbf4872-2605-11eb-1ac0-e54f1e9cb497
# ╟─fa4c205a-1cf3-11eb-06ff-49faaed15160
# ╠═21c1e5da-2293-11eb-21ba-6f847d8da9f6
# ╟─97c94816-2605-11eb-01e9-9f03e4f04009
# ╟─76c37218-2605-11eb-0c4e-c58ff67521f5
# ╟─05986728-1cf4-11eb-090e-2bdb51224135
# ╠═812cc7d8-2293-11eb-3acd-2bb1dd14cadd
# ╠═2926284e-2294-11eb-1b98-1daa626b64d5
# ╟─caa17324-2605-11eb-3d20-3b72d682922f
# ╟─ab5dfa98-2605-11eb-2263-b99a9dac0a5c
