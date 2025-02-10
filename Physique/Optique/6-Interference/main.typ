#import "@local/physique:0.1.0": *
#import optique: *

#show: doc => template(doc)

#titleb[Phénomènes d'interférences]

= Superposition de deux ondes

Dans ce chapitre, on se limitera à l'interférences à deux ondes.

== Observation expérimentales

Les amplitudes de différentes ondes s'ajoutent en chaque point.

Les ondes restent "distinctes", il n'y a pas d'intéractions entre
les ondes.

== Phénomène d'interférence

#def[Interférence]: L'ajout des ondes en un même point.

#def[Zone d'interférence]: Zone où l'interférence entre deux ondes
arrive. Dans la majorité de l'espace, l'une des deux ondes
contribue $0$, donc on ne voit aucune interférence.

== Généralisation

#figure(caption: [Interférences de deux ondes à la surface de l'eau], image("onde_eau.png", width: 50%))

= Somme de deux sinusoïdes de même fréquence

On sait qu'on peut toujours se ramener à une somme (possiblement
infinie) d'onde harmoniques avec la transformée de Fourrier.

On va donc simplifier le problème et se limiter à la superposition de deux ondes sinusoïdales.

On peut alors (#link("../5-Signal/main.pdf")[cf. le chapitre précedent]) définir le signal
par une simple fonction dépendant du temps.

== Simulation mathématique

On pose deux sinus:
$s_1 (t) = S_1 sin(2pi f t)$ et $s_2 (t) = S_2 sin(2pi f t + phi)$ 

Selon la valeur du déphasage $phi$ entre les deux signaux,
les interférences seront plus on moins constructives ou
destructives:

#let signal(phi) = (t => calc.sin(t) + calc.sin(t + phi))

#let phi_values = (0, calc.pi/4, calc.pi/2, 3*calc.pi/4, calc.pi)

#plot((-5, 5), x-tick: none, y-tick: none, color: auto,
	signal(0),
	signal(calc.pi/4),
	signal(calc.pi/2),
	signal(3*calc.pi/4),
	signal(calc.pi)
)

== Formule d'interférences

On a donc:
$s_1 (t) = S_1 sin(omega t + phi_1)$ et $s_2 (t) = S_2 sin(omega t + phi_2)$

Et:
$ s(t) &= s_1 (t) + s_2 (t) \
s(t) &= S_1 sin(omega t + phi_1) + S_2 sin(omega t + phi_2) \
&= S_1 sin(omega t) cos(phi_1) + S_1 cos(omega t) sin(phi_1)
+ S_2 sin(omega t) cos(phi_2) + S_2 cos(omega t) sin(phi_2) \
&= (S_1 cos(phi_1) + S_2 cos(phi_2)) sin(omega t)
+ (S_1 sin(phi_1) + S_2 sin(phi_2)) cos(omega t) \
&= A sin(omega t) + B cos(omega t)
$

Avec $A = S_1 cos(phi_1) + S_2 cos(phi_2)$ et $B = S_1 sin(phi_1) + S_2 sin(phi_2)$

On va transformer $s(t)$ en la forme $X sin(omega t + phi)$

$ s(t) = X sin(omega t + phi) = X sin(omega t) cos(phi) + X cos(omega t) sin(phi) $

Par identification:
$ cases(A = X cos(phi), B = X sin(phi)) $
D'où:
$ A^2 + B^2 = X^2 cos^2(phi) + X^2 sin^2(phi) = X^2 $
Donc $X = sqrt(A^2 + B^2)$
$ X^2 &= (S_1 cos(phi_1) + S_2 cos(phi_2))^2 + (S_1 sin(phi_1) + S_2 sin(phi_2))^2  \
&= S_1^2 cos^2(phi) + 2 S_1 S_2 cos(phi_1) cos(phi_2)
+ S_2^2 cos^2 (phi_2) \
&+ S_1^2 sin^2(phi_1) + 2 S_1 S_2 sin(phi_1) sin(phi_2)
+ S_2^2 sin^2(phi_2) \
&= S_1^2 (cos^2 (phi_1) + sin^2 (phi_1))
+ S_2^2 (cos^2 (phi_2) + sin^2 (phi_2))
+ 2 S_1 S_2 (cos(phi_1)cos(phi_2) + sin(phi_1) sin(phi_2)) \
&= S_1^2 + S_2^2 + 2S_1 S_2 cos(phi_1 - phi_2)
$

#set math.equation(numbering: "Eq. 1")

On trouve la *formule d'interférence*:

#resultb[$ X^2 = S_1^2 + S_2^2 + 2S_1 S_2 cos(phi_1 - phi_2) $ <formula>]

#set math.equation(numbering: none)

Démonstration alternative par les complexes et la représentation
dans le plan de Fresnel.

== Extrema d'amplitude

Le seul paramètre variable est le déphasage $phi = phi_1 - phi_2$ entre les deux ondes.

$ -1 <= (cos(phi_1 - phi_2)) <= 1 $
$ S_1^2 + S_2^2 - 2 S_1 S_2 <= s^2(t) <= S_1^2 + S_2^2 + 2 S_1 S_2 $
$ (S_1 - S_2)^2 <= s^2(t) <= (S_1 + S_2)^2 $

Donc $X_max = abs(S_1 + S_2) = S_1 + S_2$ et $X_min = abs(S_1 - S_2)$

== Cas où les signaux ont la même amplitude

Si $S = S_1 = S_2$, on a l'amplitude $X$:
$ X^2 = S^2 + S^2 + 2 S^2 cos(phi_1 - phi_2) = 2 S^2 (1 + cos(phi_1 - phi_2)) $

Et on a $X_max = 2 S$ et $X_min = 0$

== Interférences constructives ou destructives

On parle d'interférences constructives 
quand l'amplitude obtenue est maximale:
$ &"   " cos(phi) = cos(phi_1 - phi_2) = 1 \
&<=> phi_1 - phi_2 eq.triple 0 [2 pi] \
&<=> phi_1 - phi_2 = m times 2 pi, m in ZZ
$

Pour pouvoir parler de "déphasage" avec des ondes
un peu plus funky, on reformule le déphasages
avec $lambda$ la longueur d'onde et $d_1$, $d_2$ le déphasage en longueur:
$ phi_1 = (2pi d_1)/lambda $
$ phi_2 = (2pi d_2)/lambda $

(C'est plus facile de dire que deux vagues sont déphasées de 1 m et
qu'elles sont périodiques sur 2 m, que de dire
qu'elles sont dephasées de $pi/2$)

On a donc:
$ phi_1 - phi_2 = m 2 pi <=> (d_1 - d_2)/lambda = m $

Une condition nécessaire et suffisante pour que l'interférence entre
deux ondes soit constructive est:
#resultb[$ d_1 - d_2 = m lambda $]

#tip[
	Autrement dit, si deux ondes sont déphasées 
	d'un nombre entier de longueur d'onde, elles sont en interférence
	constructive.
]

On parle d'interférences destructives si l'amplitude du signal obtenu
est minimale (pour deux ondes de même fréquence et de même amplitude, on observe une annulation totale).

$ cos(phi_1 - phi_2) = -1  \
<=> phi_1 - phi_2 = p 2 pi + pi, p in ZZ $
$ (d_1 - d_2)/lambda = p + 1/2 $

#resultb[$d_1 - d_2 = lambda p + lambda/2 $]

Est une condition nécéssaire est suffisante que deux ondes interfèrent
de manière destructive.

= Interférences lumineuses par le dispositif des trous d'Young

== Dispositif des trous d'Young

#figcan(caption: [Trous d'Young],{
	import draw: *

	line((0, 1.2), (0, 2))
	line((0, 0.8), (0, -0.8))
	line((0, -1.2), (0, -2))

	line((2, 2), (2, -2))

	point((-2, 0), value: "S", name: "S")
	point((0, 1), value: $S_1$, name: "S1")
	point((0, -1), value: $S_2$, name: "S2", anchor: "north-east")
	point((2, 0.5), value: "M", name: "M", anchor: "west")

	content((2.6, 0.47), [(Point quelconque)], anchor: "west")

	arrow("S", "S1")
	arrow("S", "S2")
	arrow("S1", "M")
	arrow("S2", "M")

	line((0.2, 0.8), (0.2, -0.8),
		mark: (start: "straight", end: "straight")
	)
	content((0.4, 0), $a$)
})

#def[Dispositif des trous d'Young]: \
Deux trous sont faits à travers une lame.
Une source lunimeuse ponctuelle est placée sur la médiatrice
des deux trous $S_1$ et $S_2$.
On observe la lumière atteignant $M$.

== Notion de chemin optique

Le chemin optique est décrit par le temps
mis par la lumière pour parcourir une certaine distance.

On note $(S M)$ le chemin optique pour aller du point $S$ à $M$.
$ (S M) = c tau $
Avec $tau$ le temps mis pour aller de $S$ à $M$ dans le vide.

Si on se déplace dans un milieu d'indice $n$, on a:
$ n = c/v => v = c n $
$ (S M) = n v tau
= integral_(s(0))^(s(tau)) n dif s   $

== Lien entre déphasage et différence de chemin optique

On pose $phi$ le déphasage entre les deux signaux $phi = phi_1 - phi_2$

$ phi = phi_1 - phi_2 = (2pi)/lambda d_1 - (2pi)/lambda d_2 \
= k d_1 - k d_2 "avec" k = (2pi)/lambda \
= omega/c d_1 - omega_c d_2 "avec" omega = k c "le vecteur d'onde" \
= omega/c (d_1 - d_2)
$

On peut ensuite déterminer la distance avec le chemin optique:
$d_1 = (S S_1 M)$ et
$d_2 = (S S_2 M)$

Ce qui nous permet d'obtenir le déphasage entre les deux signaux:
$ phi = omega/c delta = (2pi)/lambda delta $
On appelle $delta$ la différence de marche:
$ delta = (S S_1 M) - (S S_2 M) $

== Calcul de la différence de marche pour le dispositif des trous d'Young à l'infini

#figcan({
	import draw: *

	arrow((-4, 0), (4, 0))

	point((-2, 0), value: "S", name: "S")
	point((3, 0.8), value: "M", name: "M")

	line((0, -2), (0, 2))
	line((3, -2), (3, 2))

	point((0, 1), value: $S_1$, name: "S1")
	point((0, -1), value: $S_2$, anchor: "north-east", name: "S2")

	arrow("S", "S1")
	arrow("S", "S2")
	arrow("S1", "M")
	arrow("S2", "M")

	line((0.2, 0.8), (0.2, -0.8),
		mark: (start: "straight", end: "straight")
	)
	content((0.4, 0), $a$)

	line((0, -2), (3, -2),
		mark: (start: "straight", end: "straight")
	)
	content((1.5, -2.1), $D$, anchor: "north")
})

Il faut que les trous soient très proches par rapport à la distance totale à parcourir.

On considère $x$ la hauteur de point $M$ sur l'écran.

=== Par le calcul

Pour obtenir le déphasage entre les deux signaux,
on cherche à calculer $delta$, la différence de marche, avec:
$ delta &= (S S_1 M) - (S S_2 M) \
&+ (S S_1) + (S_1 M) - (S S_2) - (S_2 M) $
On est dans un milieu homogène et isotrope, et le point $S$ est
sur la médiatrice des points $S_1$ et $S_2$,
donc $(S S_1) = (S S_2)$, donc:
#let na = $n_"air"$

$ delta &= (S_1 M) - (S_2 M) \
&= na S_1 M - na S_2 M $

(On pourra en général omettre l'indice de l'air car $approx 1$)

$ S_1 M^2 = (x - a/2)^2 + D^2 $
$ S_2 M^2 = (x + a/2)^2 + D^2 $

On fera l'hypothèse que l'écran où on observe les interférences
est à l'infini, donc que $D >> a$ et $D >> x$
(ce qui nous permettra de développer le terme en $(x - a/2)^2$ qui nous embête bien)

#note[
	En pratique, on placera une lentille après le dispositif pour
	observer les interférences à l'infini.
]

$ S_1 M &= ((x - a/2)^2 + D^2)^(1/2) \
&= (x^2 - a x + a^2/4 + D^2)^(1/2) \
&= D (1 + underbrace((x^2)/D^2 - (a x)/D^2 + a^2/(4 D^2), -> 0))^(1/2) \
$

On fait un DL d'ordre $1$ de la racine et on bazarde le petit $o$:

$ S_1 M approx D (1 + x^2/(2 D^2) + a^2/(8 D^2) - (a x)/(2 D^2)) $

De même:
$ S_2 M approx D (1 + x^2/(2 D^2) + a^2/(8 D^2) + (a x)/(2 D^2)) $

On a donc:
$ delta = D (- (a x)/(2 D^2) - (a x)/(2 D^2)) = - (a x)/D $
De là, on calcule le déphasage:
$ phi = (2pi)/lambda delta $

#parachute[
	L'intensité lumineuse $I$ est le carré de l'amplitude
	lumineuse $S$.
]

On utilise la formule d'interférence (@formula) pour des signaux
d'amplitude égale:
$ S^2 = 2 S^2 (1 + cos phi) $
$ I &= I_0 (1 + cos phi) $

$ I &= I_0 (1 + cos((2pi)/lambda delta)) \
&= I_0 (1 + cos(- 2pi (a x)/(lambda D))) \
&= I_0 (1 + cos(2pi (a x)/(lambda D))) $

== Notion d'interfrange

On appelle interfrance $i$ la distance entre deux franges
"blanche" (deux crêtes d'interférences constructive).

On mesure l'écart de déphasage entre deux crêtes:
$ Delta phi = 2pi delta/lambda = 2pi x/i "(par définition de l'interfrange)"  $

De là, on remonte les expression pour trouver l'expression de l'interfrange:
$ delta/lambda = x/i \
(a x)/(D lambda) = x/i $

#resultb[$ i = (D lambda)/a $]

#todo[Distance entre les interférence constructives et destructives
(juste les multiple de $i$ et les multiple de $i$ plus $i/2$)]

== Autres dispositifs

=== Miroir de Lloyd

#figcan({
	import draw: *

	line((-3, 0), (3, 0))
	content((0, -0.5), [miroir plan], anchor: "north")

	optique.miroir-plan((-1, 0), (1, 0), stroke: (thickness: 0.06))

	line((2, -2), (2, 2))
	cetz.decorations.zigzag(
		line((2, 0.333333), (2, 1.666666)), amplitude: 0.1
	)
	content((2.5, 1.2), [zone d'interférence], anchor: "west")

	point((-2, 1), value: "S", name: "S")
	point((-2, -1), value: "S'", name: "S'")

	arrow("S", (-1, 0))
	arrow((-1, 0), (2, 1.666))

	arrow("S", (1, 0))
	arrow((1, 0), (2, 0.33333))

	set-style(stroke: (dash: "dotted"))
	arrow("S", (2, 0.333))
	arrow("S", (2, 1.6666666))
})

=== Miroir de Fresnel

On ajoute un deuxième miroir, on bloque les
rayons qui sortent directement de la deuxième source
virtuelle ($S_2$) pour éviter d'avoir des interférences
à trois sources.

#figcan({
	import draw: *

	line((-3, 0), (5, 0))

	optique.miroir-plan((-1, 0), (1, 0), stroke: (thickness: 0.06))
	optique.miroir-plan((1, 0), (3, 0.5), stroke: (thickness: 0.06))

	content((0, -0.5), [miroir plan], anchor: "north")

	// cetz.decorations.zigzag(line((1, -0.1), (3, 0.2)), amplitude: 0.2, factor: 100%)

	line((4, -2), (4, 2))
	cetz.decorations.zigzag(
		line((4, 0.333333), (4, 1.666666)), amplitude: 0.1
	)
	content((4.5, 1.2), [zone d'interférence], anchor: "west")

	point((-2, 1), value: "S", name: "S")
	point((-2, -1), value: "S'", name: "S'")
	//
	// arrow("S", (-1, 0))
	// arrow((-1, 0), (2, 1.666))
	//
	// arrow("S", (1, 0))
	// arrow((1, 0), (2, 0.33333))
	//
	// set-style(stroke: (dash: "dotted"))
	// arrow("S", (2, 0.333))
	// arrow("S", (2, 1.6666666))
})
