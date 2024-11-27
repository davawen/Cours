#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

// #set page(header: context {
//
// })

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
	(-10, 10), x-tick: none, y-tick: none, color: auto,
	((-10, 10), x => -calc.atan(x - 2).rad()/2 - calc.pi/4),
	(horz: (0,), max: 2),
	(horz: (-calc.pi/2,), min: 0),
)

= Notion de filtrage

== But du filtrage

Un filtrage permet de ne sélectionner qu'une partie des fréquences d'un signal.

== Bande passante

Définie à -3 dB par par l'ensemble des $omega$ tels que $G_"dB" <= G_"dB,max"$ ou $G(omega) >= (G_"max")/sqrt(2)$

#def[Bande passante]: ensemble des fréquences à garder

== Filtres ideal

Un filtre est dit idéal si il a un gain de $1$ pour les fréquences souhaité et $0$ pour les autres.

#plot((-2, 2), x-tick: none, y-tick: none,
	(horz: (0,), max: 1),
	(vert: (1,), max: 0)
)

== Différent type de filtrage

Il y a 2 types de filtrage commun:

#def[Filtre passe-bas]: Laisse passer les basses fréquences \
#def[Filtre passe-haut]: Laisse passer les hautes fréquences

On peut aussi trouver:

#def[Filtre passe-bande]: Ne laisse passer qu'une partie des fréquences:
#plot((-5, 5), x-tick: none, y-tick: none,
	x-ticks: ((-2, $log(omega_1 / omega_0)$), (2, $log(omega_2 / omega_0)$)),
	((-5, -2), x => x+2),
	(horz: (0,), min: -2, max: 2),
	((2, 5), x => -x+2),
	(stroke: (dash: "dotted", paint: blue)),
	(vert: (-2, 2))
)

#def[Filtre coupe-bande]: Laisse passer tout sauf une partie des fréquences:
#plot((-5, 5), x-tick: none, y-tick: none,
	x-ticks: ((-2, $log(omega_1 / omega_0)$), (2, $log(omega_2 / omega_0)$)),
	(horz: (0,), min: -5, max: -2),
	(horz: (0,), min: 2, max: 5),
	((-2, 0), x => if x != 0 { 1/( x - 0.5) } else { 1 } + 1/3),
	((2, 5), x => -x+2),
	(stroke: (dash: "dotted", paint: blue)),
	(vert: (-2, 2))
)

On graphe les abscisses en fonction de $log(omega_0 / omega)$ afin de centrer le filtrage ainsi que normaliser la grandeir dans le log.

== Ordre des filtres

#def[Ordre du filtre]: degré du polynome de $omega$ au dénominateur de la fonction de transfert (SI moment!)

= Filtre passif de premier ordre

== Définition

Les filtres passifs du premier ordre sont ceux faisant intervenir un puissance $1$ de $omega$ au dénominateur de $und(H)$.

Cela revient à avoir une 

== Filtre passe-bas

Le circuit $R, C$ est un filtre passe bas.

=== Fonction de transfert

$ und(H) = 1/(1 + j R C omega) $
Ou, sous sa forme canonique:
$ und(H) = H_0 / (1 + j omega/omega_0) $

=== Étude du gain

=== Fréquence de coupure

$ G = |und(H)| = abs(H_0)/sqrt(1 + (omega/omega_0)^2) $
$ G_"dB" = 20 log abs(H_0) - 20 log sqrt(1 + (omega/omega_0)^2) $

On utillise la définition de la bande passante:
$ omega / (G_"dB" (omega)) >= G_"dB,max" - 3 "dB" $
Ou:
$ G(omega) >= G_"max" / sqrt(2) $

Ici, on a:
- $G_"max" = abs(H_0)$
- $ G(omega) = abs(H_0)/sqrt(1 + (omega/omega_0)^2) >= abs(H_0)/sqrt(2) \
<=> 1 + (omega/omega_0)^2 <= 2 \
<=> (omega/omega_0)^2 <= 1 \
<=> omega <= omega_0
$

La bande passante de ce filtre est dont $[0; omega_0]$.

Dans le cas des hautes fréquences, on a $omega >> omega_0$.
On a donc:
$ und(H) approx H_0 / (j omega/omega_0) = (H_0 omega_0)/(j omega) = und(s)/und(e) $

D'où:
$ j omega und(s) = H_0 omega_0 und(e) $
$ (dif s)/(dif t) = H_0 omega_0 e (t) $
$ s = integral H_0 omega_0 e(t) dif t $

On observe donc un comportement intégrateur (à une constant multiplicatrice près) dans les hautes fréquences. 

#warn[Ce comportement n'est valide que si l'on a du $j omega$ au dénominateur.]

== Filtre passe haut

On inverse la place du condensateur et du résistor:

#figcan({
	carre((0, 0),
		branch(u: tenserl($e$), apply(dots)),
		apply(condensateur, label: $C$),
		(i: $i$),
		branch(apply(resistor, u: tenserl($s$), label: $R$))
	)
})

On applique un pont diviseur de tension:
$ und(s) = und(e) und(Z_R) / (und(Z_R) + und(Z_C)) $
D'où:
$ und(H) = und(s)/und(e) = R / (R + 1/(j omega C)) = (j R omega C)/(1 + j R C omega) $

On met la fonction de transfert sous forme canonique:
$ und(H) = (H_0 j omega/omega_0)/(1 + j omega/omega_0) $
(Avec, ici, $H_0 = 1$ et $omega_0 = 1 / (R C)$)

$ und(H) &= H_0/(omega_0 / (j omega) + 1) \
&= H_0 / (- j omega/omega_0 + 1)
$

== Comportement asymptotique à haute et à basse fréquences

=== Basses fréquences

À basse fréquence, on apparente la condensateur à un interrupteur ouvert:
#figcan({
	carre((0, 0),
		branch(u: tenserl($e$), apply(dots)),
		apply(interrupteur),
		(i: $i$),
		branch(apply(resistor, u: tenserl($s$), label: $R$))
	)
})

Et à haute fréquence, on apparente le condensateur à un fil:
#figcan({
	carre((0, 0),
		branch(u: tenserl($e$), apply(dots)),
		apply(interrupteur, closed: true),
		(i: $i$),
		branch(apply(resistor, u: tenserl($s$), label: $R$))
	)
})

On observe bien le comportement attendu (filtrage des basses fréquences).

#note[
	On peut remplacer le condensateur par une bobine dans l'autre circuit, ce qui nous donne le même comportement passe haut:

	#figcan({
		carre((0, 0),
			branch(u: tenserl($e$), apply(dots)),
			apply(resistor, label: $R$),
			(i: $i$),
			branch(apply(bobine, u: tenserl($s$), label: $L$))
		)
	})
]

=== Fonction de transfert

$ und(H) = (H_0 j omega/omega_0)/(1 + j omega / omega_0) \
= H_0 / (1 - j omega_0 / omega) $

=== Étude du gain

$ G = abs(H_0)/sqrt(1 + (omega_0 / omega)^2) $

$omega$ est croissante donc $(omega_0 / omega)^2 + 1$ est décroissante.

On prend l'inverse à nouveau, donc $G$ est croissante.

=== Diagramme asymptotique


- Quand $omega -> +oo$, $omega_0 / omega -> 0$,
  donc $G -> abs(H_0)$
  
  D'où: $G_"dB" = 20 log(G) -> 20 log abs(H_0)$
  
  On a une asymptote horizontale d'ordonnée $20 log abs(H_0)$.
- Quand $omega -> 0$, $omega_0 / omega -> +oo$, \
  Donc $ sqrt(1 + (omega_0 / omega)^2) approx sqrt((omega_0 / omega)^2) = omega_0 / omega $
  On a $ G = abs(H_0)/(omega_0 / omega) = omega abs(H_0)/omega_0 $
  D'où:
  $ G_"dB" = 20 log abs(H_0) + 20 log omega/omega_0 $
  On a une pente à $+20 "dB/decad"$.

On cherche l'intersection des asymptotes:
$ 20 log abs(H_0) = 20 log abs(H_0) + 20 log omega/omega_0 \
<=> log omega/omega_0 = 0 \
<=> omega = omega_0
$

#let lerp(a, b, t) = a + (b - a)*t

On a donc:
#plot((-5, 5), x-tick: none, y-tick: none,
	((0, 5), x => 0),
	((-5, 0), x => x),
	(stroke: red),
	(x => lerp(x, 0, (calc.atan(x).rad() / calc.pi) + 0.5) - 0.4)
)

=== Déphasage

$ und(H) = (H_0 j omega/omega_0)/(1 + j omega/omega_0)
= H_0 / (1 - j omega_0 / omega) $

==== Première méthode
On prend la première expression de $und(H)$: \
On a:
$ phi = arg(und(H)) = arg(H_0) + arg(j omega/omega_0) - arg(1 + j omega/omega_0) $
D'où:
$ phi = cases(0 "si" H_0 > 0, pi "si" H_0 < 0) + pi/2 - Psi $
Avec:
$ tan Psi = (omega/omega_0)/1 = omega/omega_0 $
$cos Psi$ est du signe de la partie réelle, donc $> 0$:
$ Psi = arctan(omega/omega_0) $
$ phi &= cases(0 "si" H_0 > 0, plus.minus pi "si" H_0 < 0) + pi/2 - arctan(omega/omega_0) \
&= cases(
	pi/2 - arctan(omega/omega_0) "si" H_0 > 0, 
	-pi/2 - arctan(omega/omega_0) "si" H_0 < 0
)
$

==== Deuxième méthode

On prend la deuxième expression de $und(H)$:
$ phi = arg(H_0) - arg(1 - j omega_0 / omega) $

$ phi = cases(0 "si" H_0 > 0, pi "si" H_0 < 0) - Psi $
$ tan Psi = -omega_0 / omega $
Avec $cos Psi$ du signe de $1$, donc positif, d'où:
$ Psi = arctan(- omega_0 / omega) = -arctan(omega_0 / omega) $
$ phi = cases(
	arctan(omega_0 / omega) "si" H_0 > 0,
	pi + arctan(omega_0 / omega) "si" H_0 < 0
) $

#note[
	Selon la méthode qu'on utilise, on arrive pas forcément à la même expression du déphasage.
	Cela dit, on doit trouver les même variations et asymptotes.
]

==== Étude des variations

$omega$ est croissant, donc $omega_0/omega$ est décroissante. \
$arctan$ est croissante.

$phi$ est donc *décroissante*.

==== Étude asymptotique

- Si $H_0 > 0$:
  - Si $omega -> 0$, $omega_0 / omega -> +oo$, donc $phi -> pi/2$
  - Si $omega -> +oo$, $omega_0 / omega -> 0$, donc $phi -> 0$
\
- Si $H_0 < 0$:
  - Si $omega -> 0$, $omega_0 / omega -> +oo$, donc $phi -> (3pi)/2$
  - Si $omega -> +oo$, $omega_0 / omega -> 0$, donc $phi -> pi$

=== Bande passante

$ G_"dB" >= G_"dB,max" - 3 "dB" \ $

Ou:
$ G(omega) >= G_"max"/sqrt(2) \
<=> abs(H_0)/sqrt(1 + (omega_0 / omega)^2) >= abs(H_0)/sqrt(2) \
<=> 1 + (omega_0 / omega)^2 <= 2 \
<=> (omega_0 / omega)^2 <= 1 \
<=> omega >= omega_0
$

=== Diagramme de Bode

Si $H_0 > 0$:
#plot((-10, 10), x-tick: none, y-tick: none, mode: "log",
	y-ticks: ((calc.pi/2, $pi/2$),),
	(horz: (calc.pi/2,), max: 0),
	x => -calc.atan(x).rad()/2 + calc.pi/4
)

Si $abs(H_0) < 1$:
#plot((-5, 5), y: (-7, 2), x-tick: none, y-tick: none,
	((-5, 0), x => x - 2),
	(horz: (-2,), min: 0),
	(stroke: red),
	x => lerp(x - 2, -2, calc.atan(x).rad() / calc.pi + 1/2) - 1/2
)

=== Comportement dérivateur

On a:
$ und(H) = H_0 / (1 - j omega_0 / omega) = und(s)/und(e) $


D'où, si $omega << omega_0$, 
$omega_0 / omega -> +oo$, alors:
$ und(H) approx H_0 / (- j omega_0 / omega) = H_0 / (omega_0 / (j omega))
= underbrace(j omega, "facteur de dérivation") H_0 / omega_0
$

$ und(s) = und(H) und(e) \
= j omega und(e) H_0 / omega_0
= (dif und(e))/(dif t) H_0 / omega_0
$

On obtient la dérivée de l'entrée, *si la condition sur la fréquence est remplie.*

== Quelques remarques sur les filtres du $bb(1^"er")$ ordre.

1. On ne peut pas obtenir de comportements de type passe-bande ou coupe-bande uniquement avec des filtres du premier ordre.

2. En regardant les asymptotes du filtre du premier ordre, on a des asymptotes diagonales à $plus.minus 20 "db/decal"$.
  C'est l'écart de pente maximale atteignable avec le premier ordre.
  C'est aussi l'unité de "base" des filtres. Le $n$-ordre donnera des asymptotes de pente $n 20 "db/decal"$.

3. En regardant la phase, c'est la même chose, on a une variation de $pi/2$.
