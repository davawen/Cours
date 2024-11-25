#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[Fonction de transfert - Diagramme de Bode - Filtre du $1^"er"$ ordre]

= Fonction de transfert - Diagramme de Bode

== Notion de quadripole

#figcan({
	import draw: *

	rect((-1, -1), (1, 1))

	line((-1, -0.5), (-2.1, -0.5))
	line((-1, 0.5), (-2.1, 0.5), mark: (start: "straight", pos: -40%))
	line((1, -0.5), (2.1, -0.5))
	line((1, 0.5), (2.1, 0.5), mark: (start: "straight", pos: -40%))

	content((-1.8, 0.8), $i_e$)
	content((1.8, 0.8), $i_s$)

	content((-1.5, -1.5), [entrée])
	content((1.5, -1.5), [sortie])

	circle((-3, 0))
	content((-3, 0), [Générateur])

	circle((3, 0))
	content((3, 0), [Charge])

	line((-1.5, -0.5), (-1.5, 0.5), mark: (end: "straight"))
	content((-1.7, 0), $e$)

	line((1.5, -0.5), (1.5, 0.5), mark: (end: "straight"))
	content((1.7, 0), $s$)
})

#let und = math.underline

On peut définir la notion d'impédance d'entrée et d'impédance de sortie:
$ und(Z_e) = und(e)/und(i_e) $
$ und(Z_s) = und(s)/und(i_s) $

#def[Impédance d'entrée]:

#def[Impédance de sortie]:

On va considérer qu'un quadripole se comporte comme une impédance en entrée, et une impédance en sortie.

Exemples de quadripoles:
- Le transformateur
- Un circuit $R$,$C$:
#figcan({
	carre((0, 0), 
		branch(u: tenserl($e$, offset: (0, 0.6)), apply(dots)),
		(i: $i_e$),
		(inset: 1),
		apply(resistor, label: $R$),
		branch((inset: 0.5), apply(condensateur, label: $C$), (inset: 0.5)),
		(inset: 1),
		(i: $i_s$),
		branch(u: tenserl($s$, offset: (0, 0.6)), apply(dots)),
	)

	draw.rect((-2, -4), (2, 0))
})

#pagebreak()

== Fonction de transfert

#def[Fonction de transfert]: Dans un circuit en régime sinusoïdal forcé,
c'est le rapport de la sortie sur l'entrée. \
$ und(H) = und(s)/und(e) $
Elle est associée aux système linéaires, qui nous permettent d'appliquer le principe de superposition.

#def[Principe de superposition]: Si on a $e_1$ et $e_2$ des tensions telles que:
$ e(t) = lambda_1 e_1 (t) + lambda_2 e_2 (t) $

Alors:
$ s(t) = lambda_1 s_1(t) + lambda_2 s_2 (t) $
Avec $und(s_1)(t) = und(H) und(e_1)$ et $und(s_2)(t) = und(H) und(e_2)$

#def[Système linéaire]:
Les valeurs $s$ et $e$ doivent respecter un système d'équation linéaires:
$ sum_k a_k (dif^k s)/(dif t^k) + sum_l b_l (dif^l e)/(dif t^l) = f(t)  $

Or, on peut traduire ces équation linéaire en notation complexe:
$ sum_k a_k (j omega)^k und(s) + sum_l b_l (j omega)^l und(e) $
$ = und(s) sum_k a_k (j omega)^k + und(e) sum_l b_l (j omega)^l $
D'où la fonction de transfert dans un système linéaire:
$ und(H) = und(s)/und(e) = - (sum_l b_l (j omega)^l)/(sum_k a_k (j omega)^k) $

#warn[Les carrés, les racine carrés, etc... ne s'inscrivent pas dans les systèmes linéaires!]

== Lien entre fonction de transfert et équation différentielle

#figcan({
	carre((0, 0),
		branch(apply(dots), u: tenserl($e$)),
		apply(condensateur, label: $C$),
		apply(resistor, label: $R$),
		branch(
			apply(derivation, u: tenserl($s$), 
				apply(condensateur, label: $C$),
				apply(resistor, label: $R$)
			)
		)
	)
})

$ und(s) = und(e) und(Z_1)/(und(Z_1) + und(Z_2)) $
$ und(H) = und(Z_1)/(und(Z_1) + und(Z_2)) $

$ und(Z_1) = 1/(1/R + j C omega) = R/(1 + j R C omega) $
$ und(Z_2) = 1/(j C omega) + R = (1 + j R C omega)/(j C omega) $

$ und(H) &= (R/(1 + j R C omega))/(R/(1 + j R C omega) + (1 + j R C omega)/(j C omega))  \
&= (j R C omega)/(j R C omega + (1 + j R C omega)^2) \
&= (j R C omega)/(1 + 3j R C omega - R^2 C^2 omega^2)
$

$ und(H) = und(s)/und(e) =(j R C omega)/(1 + 3j R C omega - R^2 C^2 omega^2) $

$ (1 + 3j R C omega - R^2 C^2 omega^2)und(s) = j R C omega und(e) $

On retrouve l'équation différentielle (on transforme les $j omega$ en dérivées premières, $(j omega)^2 = -omega^2$ en dérivées secondes, etc...):
#resultb[
	$ s + 3 R C (dif s)/(dif t) + R^2 C^2 (dif^2 s)/(dif t^2) = R C (dif e)/(dif t) $
]

== Gain et phase de $und(H)$
On a donc $und(H)$ notre fonction transfert. \
On définit le gain $G$ le module de la fonction de transfert, avec $G = abs(und(H))$, et $phi$ la phase de la fonction de transfert, avec $phi = arg(und(H))$

En général, on utilisera le gain en décibel:
$ G_"dB" = 20 log_10 (G) $

== Les deux tracés du diagramme de Bode

Le diagramme de Bode, c'est le tracé du gain en décibel, et de la phase,
en fonction du $log_10 (omega) = log_10 (2 pi f)$

== Cas du circuit $R,C$

On a un circuit de la forme:
#figcan({
	carre((0, 0), 
		branch(u: tenserl($e$), apply(dots)),
		apply(resistor, label: $R$),
		branch(u: tenserl($und(s)$), apply(condensateur, label: $C$))
	)
})

On a:
$ und(H) = und(s)/und(e) = (und(Z)_c)/(und(Z)_c + und(Z)_R) = (1/(j C omega))/(1/(j C omega) + R) $

Donc:


$ und(H) = 1/(1 + j R C omega) $

$ G = abs(und(H)) = abs(und(s))/(abs(1 + j R C omega)) $
$ G = 1/(sqrt(1^2 + (R C omega)^2)) $

$ G_"dB" = 20 log_10 G \
= 20 log_10 (1) - 20 log_10 (sqrt(1 + (R C omega)^2)) \
= - 20 log_10 (sqrt(1 + R^2 C^2 omega ^2))
$

On fait un diagramme asymptotique:
- À basses fréquences $<=> omega -> 0$, on a $ G_"dB" -> 0 $
- À hautes fréquences $<=> omega -> oo$, on a
  $ G_"dB" -> -20 log(R C omega) = -20 log ( R C ) - 20 log(omega) $

On a une pente de $-20 "dB/décade"$

En traçant le diagramme de Bode correspondant:

#plot((-10, 10), x-tick: none, y-tick: none,
	((-10, 2), x => 0),
	((2, 10), x => -x + 2),

)

On cherche l'intersection des asymptotes:
$ 0 = -20 log(R C) - 20 log(omega) \
20 log(R C) = -20 log(omega) \
20 log(1/(R C)) = 20 log(omega) \
<=> 1/(R C) = omega
$

On cherche dorénavant le diagramme de bode.

$ und(H) = 1/(1 + j R C omega) $

$ phi = arg(und(H)) = arg(1) - arg(1 + j R C omega) = 0 - Psi $
$ Psi = arg(1 + j R C omega) $
$ cases(tan Psi = (R C omega)/1, cos Psi  "du signe du dénominateur donc" > 0) $
Donc
$ Psi = arctan(R C omega) $
$ phi = - arctan(R C omega) $

- $omega -> 0 => phi -> 0$
- $omega -> +oo => phi -> -pi/2 $

On a:
#plot(
	(-10, 10), x-tick: none, y-tick: none,
	((-10, 3), x => 0),
	((0, 10), x => -calc.pi/2),
	((-10, 10), x => -calc.atan(x).rad()/2 - calc.pi/4)
)

= Notion de filtrage

== But du filtrage


