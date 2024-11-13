#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[ Régimes Transitoires ]

= Régime continu ou variable - Régime transitoire ou permanent

== Régime continu ou variable

Dans un régime continu, les différentes grandeurs du circuit sont constantes au cours du temps.

À l'inverse, dans un régime variable, les différentes grandeurs du circuit peuvent varier au cours du temps.

== Régime transitoire ou permanent

#warn[Régime transitoire $!=$ Régime permanent/stationnaire]

Dans un régime permanent/stationnaire, les *caractéristiques* des grandeurs sont constantes.

Par exemple, un signal électrique sinusoïde (ou carré, ou triangle, ou sawtooth...) dans un circuit électrique peut-être considéré comme un régime stationnaire/permanent si ses caractéristiques (amplitude, fréquence, phase) sont constantes au cours du temps.

Dans un régime transitoire, le circuit finira par "disparaître". Quelque chose devra tendre vers 0 (Ex: un capaciteur se décharge).

== Limitation dans ce chapitre

Dans ce chapitre, on s'intéressera aux régimes continus comme régimes stationnaires.

C'est à dire aux cas où un régime continu passera vers un autre régime continu,
avec un échelon de tension/intensité.

#plot((-1, 2), y-tick: none, y: (0, 2),
	((-1, 1), x => 0.5),
	((1, 2), x => 1.5)
)

= Régime transitoire d'un circuit R,C du $1^"er"$ ordre - Charge et décharge d'un condensateur

== Équation différentielle

Le circuit R,C de premier ordre correspond simplement à prendre un condensateur, une résistance et un générateur et à les mettre en série:

#figcan({
	carre((0, 0),
		branch(apply(source-ideale, u: tenserl($e(t)$))),
		apply(resistor, label: $R$, u: tenserl($u_R$)),
		(i: $i$),
		branch(apply(condensateur, u: tenserl($u$)))
	)
}) <circuit>

On a: (loi des mailles, loi des nœuds, caractéristique d'un condensateur et d'une résistance):
- Caractéristique d'une résistance: $ u_R = R i $
- Caractéristique d'un condensateur: $ i = C (dif u)/(dif t) $
- Loi des mailles: $ e = u_R + u <=> e = R i + u $

En substituant $i$:
$ e = R C (dif u)/(dif t) + u $

#set math.equation(numbering: "Eq. 1")

On obtient une équation différentielle du premier ordre à coefficients constants avec second membre:
#resultb[$ (dif u)/(dif t) + 1/(R C) u = e/(R C) $ <diff>]

#set math.equation(numbering: none)

On pose un échelon de tension:
$ e(t) = cases(0 "pour" t < 0, E "pour" t > 0) $

On cherche $u(t)$ pour $t > 0$.

== Résolution

On a une équadiff du 1er ordre à coefficients constants et un 2nd membre non nul.

$ u(t) = u_H (t) + u_p (T) $

Avec $u_H$ la solution de l'équadiff homogène associée et $u_p$ une solution particulière cherchée de la mếme forme que $e(t)$ (qui ici est constante).

Ici, les solutions de l'équadiff homogène associée sont ($U in RR$):
$ u_H (t) = U e^((- t)/(R C)) $

On cherche $u_p$ sous la forme d'une constante:
$ u_p (t) = V $
Donc:
$ (dif u_p)/(dif t) = 0 $

Donc d'apres @diff:
$ 0 + u_p/(R C) = E / (R C) $
#resultb[$ u_p (t) = E $]

D'où l'ensemble des solutions pour $u$:
#resultb[$ u(t) = E + U e^(-t/(R C)) $]

On cherche maintenant la tension initiale $U$, c'est à dire les conditions initiales du circuit:
$ u(0) = U_0 $

On utilise la continuité de la tension aux bornes de $C$. On sait que l'énergie stockée dans $C$ est $cal(E) = 1/2 C u^2$. \
Or $C$ est une constante et l'énergie est continue, donc $u(t)$ est continue.

On va faire l'hypothèse que $C$ est déchargé au début. On a donc:
$u(0^-) = 0$. \
Par continuité de $u$ aux bornes de $C$, $u(0^+) = u(0^-) = 0$. \
Or on a: $u(0^+) = E + U = 0$ \
D'où: $U = -E$

#resultb[$ u(t) = E(1 - e^(-t/(R C))) $]

== Interprétation de la solution

$ u(t) = u_p (t) + u_H (t) $
Avec $u_p (t) = E$ et $u_H (t) = -E e^(-t/(R C))$

On voit que $u_p$ va rester constant, ce qui traduit un régime permanent, ici continu. \
On voit que $u_H$ va tendre vers zéro, ce qui traduit un régime transitoire.

Notre signal à donc une forme:

#plot((-1, 4), y: (0, 1.5), y-tick: none, x => if x < 0 { 0 } else { 1 - calc.exp(-x) })

On pourra donc considérer:
- Un régime permanent au début
- Un régime transitoire de "transition"
- Un régime permanent jusqu'en $+oo$

Comme notre exponentielle ne touche techniquement jamais le bout de la courbe,
il faut déterminer à partir de quand on considère que on est passé en régime permanent.

== Intensité du courant

On a:
$ u(t) = E(1 - e^(-t/(R C))) $
On dérive:
$ (dif u)/(dif t) &= -E(-1/(R C) e^(-t / (R C))) \
&= E/(R C) e^(-t/(R C)) $

On substitut dans:
$ i = C (dif u)/(dif t) $

D'où:
#resultb[$ i(t) = E/R e^(-t / (R C)) $]

Remarques:
1. L'homogénéité est vérifiée
2. On sait que l'intensité est nulle jusqu'a $t=0$ (par $i = C (dif u)/(dif t)$). On a une discontinuité en $t = 0$, l'intensité saute jusqu'a $E/R$, puis décroit avec une exponentielle inverse.

#caution[*#underline[#smallcaps[Discontinuité de L'intensité pour C ]]*]

#plot((-1, 4), y-tick: none, y: (0, 1.5),
	((-1, 0), x => 0),
	((0, 4), x => calc.exp(-x))
)

== Cas de la décharge de $C$

On reprend le même circuit @circuit.

En $t=0$, $C$ est chargé sous une tension $E$.
Donc:
$ e(t) = cases(E "pour" t < 0, 0 "pour" t > 0) $

En $t < 0$, $u(t) = E$

$ (dif u)/(dif t) = 0 => i = C (dif u)/(dif t) = 0 $
$ R i = 0 => e(t) = u(t) $

Pour $t > 0$:
$ (dif u)/(dif t) + 1 / (R C) u = e(t)/(R C) = 0 $

Ici, on a pas de 2nd membre. On a donc:
$ u(t) = u_H (t) = U e^(-t/(R C)) $

On doit déterminer la valeur de $U$, la constante d'intégration. \
De même, on utilise la continuite de $u$ aux bornes de $C$:
$ u(0^+) = u(0^-) = E $
par l'expression de la solution:
$ u(0^+) = U $
Donc $U = E$

On a donc:
$ u(t) = E e^(-t / (R C)) $
On peut tracer $u$:

#plot((-1, 3), y: (0, 2), y-tick: none,
	((-1, 0), x => 1),
	((0, 4), x => calc.exp(-x))
)

Et pour l'intensité:
$ i = C (dif u)/(dif t) = C E (-1/(R C) e^(-t / (R C))) $
D'où:
$ i(t) = -E/R e^(-t / (R C)) $
(On a la même chose, mais avec un signe moins devant)

#figcan({
	arrow((0, 0), (4, 0))
	arrow((0, 0), (0, 4))

	import draw: *
	content((-0.5, -2), $-E/R$)

	set-style(stroke: green)
	line((-2, 0), (0, 0))
	hobby((0, -2), (1, -0.7), (3, 0))
	line((3, 0), (4, 0))
})

On a toujours discontinuité de $i$.

== Temps caractéristique $tau$

Par homogénéité, l'exposant d'une exponentielle est toujours sans dimension.
Ainsi, dans $e^(-t / (R C))$, $-t/(R C)$ est une grandeure sans dimension.
Donc $[R C] = [T]$.

\
On nomme donc $tau$ le temps caractéristique, défini par:
#resultb[$ tau = R C $]

En reprenant l'équadiff:
$ (dif u)/(dif t) + 1/(R C) u = e(t)/(R C) $
On a:
$ [(dif u)/(dif t)] = [U]/[T] $
$ [u / (R C)] = [U]/[T] $
Donc $[R C] = [T]$, donc:
$ (dif u)/(dif t) + 1/tau u = e(t)/tau $

Pour résumer:
- Charge d'un condensateur:
  - $u(t) = E(1 - e^(-t/tau)) $
  - $i(t) = E/R e^(-t/tau) $
- Décharge d'un condensateur:
  - $u(t) = E e^(-t/tau) $
  - $i(t) = -E/R e^(-t/tau) $

Obtention de la valeur de $tau$ expérimentalement:

On peut faire le même raisonnement pour chaque formule, mais on utilisera la décharge d'un condensateur.

On peut mesurer l'intersection de la tangente avec l'axe des abscisses directement:

#figcan({
	arrow((0, 0), (4, 0))
	arrow((0, 0), (0, 4))

	import draw: *
	content((-0.5, 4), $u$)
	content((-0.5, 2.3), $E$)

	set-style(stroke: green)
	line((-2, 2), (0, 2))
	hobby((0, 2), (1, 0.7), (3, 0))
	line((3, 0), (4, 0))

	set-style(stroke: red)
	line((-0.5, 3), (1, 0))
	point((1, 0), value: $tau$, color: red)
})

On a l'asymptote pour $t -> +oo$:
$ u = 0 $

La tangente à l'origine est:
$ y = u'(0)t  + u(0) $
$ u'(t) = -E/tau e^(-t/tau) $
Donc:
$ y = -E/tau t + E $

D'où:
$ y(t) = 0 \
<=> -E/tau t + E = 0 \
<=> -E/tau t = -E \
<=> 1/tau t = 1 \
<=> t = tau $
Donc l'intersection de la tangente à l'origine avec l'axe des abscisses est une bonne estimation expérimentale de $tau$.

Autre methode: temps de montée/descente.

#figcan({
	arrow((0, 0), (4, 0))
	arrow((0, 0), (0, 4))

	import draw: *
	content((-0.5, 4), $u$)

	content((-0.5, 2), $E$)
	content((-0.5, 1.6), $90 %$)
	content((-0.5, 0.5), $10 %$)

	content((0.3, -0.3), $t_1$)
	content((2, -0.3), $t_2$)

	set-style(stroke: green)
	line((-2, 0), (0, 0))
	hobby((0, 0), (1, 1.3), (3, 2))
	line((3, 2), (4, 2))

	set-style(stroke: (paint: green, dash: "dotted"))
	line((0, 2), (3, 2))
	line((0, 1.8), (2, 1.8), (2, 0))
	line((0, 0.5), (0.3, 0.5), (0.3, 0))
})

On pose: $Delta T = t_2 - t_1$
#note[En décharge, on partira de $90 %$ et on ira à $10 %$]
#note[Dans une situation où on part d'une tension arbitraire $E_1$ vers une autre tension $E_2$, on devra partire d'une interpolation linéaire ($10 %$ et $90 %$) des deux. ]

On a:
$ u(t_1) = E/10 = E(1 - e^(-t_1/tau)) $
D'où:
$ e^(-t_1/tau) = 9/10 \
t_1 = - tau ln(9/10) $

Et:
$ u(t_2) = 9/10 E = E (1 - e^(-t_2/tau)) $
$ e^(-t_2/tau) = 1/10 $
$ t_2 = - tau ln 1/10 $

On a donc:
$ Delta T = t_2 - t_1 = tau ln 10 + tau ln 9/10 $
$ Delta T = 2 tau ln 3 approx 2.2 tau approx 2 tau $

== Aspects énergétique

On a:
$ e(t) = u + R i = u + R C (dif u)/(dif t) $

$ e i = u i + R i^2 $
On substitue le $i$: 
$ e i = C u (dif u)/(dif t) + R i^2 $
$ e i = (dif)/(dif t) (C u^2)/2 + R i^2 $

On va interpréter $e i$ comme la puissance fournie par le générateur (notre source idéale de tension est en convention générateur). \
La résistance est en convention récepteur, donc $R i^2$ est la puissance dissipée par effet joule.

== Réponse à un signal carré

#figcan({
	carre((0, 0), 
		branch(apply(source-ideale, u: tenserl($e(t)$))),
		apply(resistor, label: $R$),
		branch(apply(condensateur, label: $C$, u: tenserl($u$)))
	)
})

Lorsque le temps caractéristique $tau$ du système résistance-condensateur commence à approcher le temps caractéristique du circuit ($1 / f$), on ne peut plus se placer dans l'ARQS: on observe la charge et la décharge du condensateur sur notre signal.

#figure(caption: [Charge et décharge d'un condensateur avec un signal crénau], image("signal_carre.png"))

== Mesure de l'intensité

On peut se place aux bornes de la résistance et mesurer la tension pour obtenir l'intensité ($times$ une constante).

Problème de manipulation: la masse de l'oscilloscope nous fait ignorer le condensateur si on mesure la résistance.
Il faut intervertir les bornes du GBF.

= Régime transitoire d'un circuit $R$, $L$ du premier ordre - Établissement et rupture du courant dans une bobine

#figcan({
	carre((0, 0), 
		branch(apply(source-ideale, u: tenserl($e(t)$))),
		apply(resistor, u: tenserl($u_R$), label: $R$),
		(i: $i$),
		branch(apply(bobine, label: $L$, u: tenserl($u$)))
	)
})

On a:
$ e(t) &= u + u_R \
&= L (dif i)/(dif t) + u_R \
&= L (dif i)/(dif t) + R i \
<=> e(t)/L &= (dif i)/(dif t) + R/L i \
<=> 1/tau (e(t)/R) &= (dif i)/(dif t) + i/tau \
$

D'où:
$ tau = L / R $

Établissement:
$ e(t) = cases(0 "si" t < 0,E "(constante) si" t > 0)  $

On pose:
$ i(t) = i_H (t) + i_e (t) $
Avec:
$ i_H (t) = I e^(-1/tau) $
Et:
$ i_P (t) = E/R $

Donc $ i(t) = I e^(-t/tau) + E/R $
Comme l'énergie est une quantité continue, et que
$ cal(E)_L = 1/2 L i^2 $
Avec $L$ une constante, alors $i$ est une quantite continue.
On a:
$ i(0^+) = i(0^-) $

On a $i$ en $0^-$ qui est avant le basculement de $e$ de $0$ à $E$, donc on peut se placer dans un régime permanent avec $i$ une constante.
On a:
$ (dif i)/(dif t) (0^-) = 0 $
$ i(0^-)/tau = 0/(R tau) => i(0^-) = 0 $
Et par continuité de $i$:
$ i(0^+) = 0 $

On a donc:
$ i(0^+) = 0 = I + E/R \
<=> I = -E/R \
i(t) = E/R (1 - e^(-t/tau))
$

#plot((-2, 4), x => if x < 0 { 0 } else { 1 - calc.exp(-x) })

On pose l'équation de la bobine:
$ u = L (dif i)/(dif t) $
$ i(t) = E/R (1 - e^(-t/tau)) => (dif i)/(dif t) = E/R (1/tau e^(-t/tau)) = E/(R tau) e^(-t/tau) $
$ u = L (dif i)/(dif t) = L/R E R/L e^(-t/tau) $
D'où:
#resultb[$ u = E e^(-t/tau) $]

On a donc une discontinuité de $u$ en 0.

#plot((-2, 4), x => if x < 0 { 0 } else { calc.exp(-x) })

Le plus dur sera de déterminer les conditions initiales.

On va faire l'inverse: on va faire basculer $e$ de $E$ vers $0$:
$ e(t) = cases(E "si" t < 0, 0 "si" t > 0) $

Par loi des mailles:
$ E = u_R + u_L = R i + L (dif i)/(dif t) $
*On fait l'hypothèse que le régime permanent a été atteint et que ce régime permanent est un régime continu.* \
Cela implique que $(dif i)/(dif t) = 0$

On a donc:
- Pour $t < 0$, $E = R i(t) <=> i(t) = E/R$
- $i(0^-) = E/R$
Par continuité de $i$ dans $L$:
- $underbrace(i(0^+) = i(0^-) = E/R, "condition initiale")$ 

On obtient donc l'équa-diff:
$ (dif i)/(dif t) + i/tau = e(t "(avec "t > 0")")/(R tau) = 0 $
$ (dif i)/(dif t) + i/tau = 0 $

On résout l'équation homogène:
$ i(t) = i_H (t) = I e^(-t/tau) $
On a $i(0) = I = E/R$, donc

$ i(t) = E/R e^(-t/tau) $

D'où:
#plot((-2, 4), x => if x < 0 { 1 } else { calc.exp(-x) })

Pour la tension:
$ u &= L (dif i)/(dif t) \
&= L E/R (-1/tau e^(-t/tau))
$

D'où:
$ u = -E e^(-t/tau) $

#plot((-2, 4), x => if x < 0 { 0 } else { -calc.exp(-x) })

On peut poser le temps caractéristique $tau = L/R$

== Aspect énergétique

On a $ e = R i + L (dif i)(dif t) $
$ e i = R i^2 + L i (dif i)/(dif t) $
$ e i = R i^2 + (dif)/(dif t)underbrace((1/2 L i^2), "énergie stockée") $

On a:
- $e i$ la puissance fournie par le générateur
- $R i^2$ la puissance reçue par $R$ et dissipée par effet Joule
- $1/2 L i^2$ la puissance "stockée" dans $L$
  - Si $(dif)/(dif t (1/2 L i^2)) < 0$, alors $L$ est génératrice (la bobine se "décharge")
  - Si $(dif)/(dif t (1/2 L i^2)) > 0$, alors $L$ est réceptrice (la bobine se "charge")
