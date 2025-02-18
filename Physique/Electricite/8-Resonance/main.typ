#import "@local/physique:0.1.0": *
#import elec: *

#let und = math.underline
#let uu = $und(u)$
#let ee = $und(e)$
#let ss = $und(s)$
#let ii = $und(i)$

#show: doc => template(doc)

#titleb[Oscillateur en régime sinusoïdal forcé \
Résonance - Filtres du $2^"nd"$ ordre]

= Circuit $R,L,C$ série soumis à une excitation sinusoïdal

Dans tout ce chapitre, on s'intéressera au régime permanent
de circuits du second ordre soumis à un régime sinusoïdal forcé.

On utilisera donc des impédances.

== Différentes tensions et montages correspondants

#figcan(caption: [Tension aux bornes de $C$], {
	carre((0, 0),
		branch(apply(dots), u: tenserl($e$)),
		(i: $i$),
		apply(bobine, label: $C$),
		apply(resistor, label: $R$),
		branch(
			apply(condensateur, label: $C$, u: tenserl($u_C$))
		)
	)
}) <figc>

#figcan(caption: [Tension aux bornes de $R$], {
	carre((0, 0),
		branch(apply(dots), u: tenserl($e$)),
		(i: $i$),
		apply(bobine, label: $C$),
		apply(condensateur, label: $C$),
		branch(
			apply(resistor, label: $R$, u: tenserl($u_R$))
		)
	)
}) <figr>

#figcan(caption: [Tension aux bornes de $L$], {
	carre((0, 0),
		branch(apply(dots), u: tenserl($e$)),
		(i: $i$),
		apply(resistor, label: $R$),
		apply(condensateur, label: $C$),
		branch(
			apply(bobine, label: $L$, u: tenserl($u_L$))
		)
	)
}) <figl>

#figcan(caption: [Tension aux bornes de $L,C$], {
	carre((0, 0),
		branch(apply(dots), u: tenserl($e$)),
		(i: $i$),
		apply(resistor, label: $R$),
		branch(
			apply(bobine, label: $L$),
			apply(condensateur, label: $C$),
			u: tenserl($u$)
		)
	)
}) <figlc>

#pagebreak()
== Équation différentielle

- Aux bornes de $C$ (@figc):
$ e &= u_L + u_R + u_C \
&= L (dif i)/(dif t) + R i + u_C \
&= L C (dif^2 u)/(dif t^2) + R C (dif u_C)/(dif t) + u_C
$

#resultb[$
e/(L C) &= (dif^2 u)/(dif t^2) + R/L (dif u_C)/(dif t) + u_C / (L C)
$]

- Aux bornes de $R$: (@figr)
$ 
e &= u_L + u_C + u_R \
&= L (dif t)/(dif t) + u_C + u_R
$
On a $i = u_R/R$, on dérive l'équation précédente:
$ (dif e)/(dif t) &= L/R (dif^2 u)/(dif t^2) + (dif u_C)/(dif t) + (dif u_R)/(dif t) \
&= L/R (dif^2 u_R)/(dif t^2) + u_R/(R C) + (dif u_C)/(dif t)
$
#resultb[$ 
R/L (dif e)/(dif t) = (dif^2 u_R)/(dif t^2) + R/L (dif u_R)/(dif t)
	+ 1/(C L) u_R
$]

- Aux bornes de $L$ (@figl):

$
e &= u_R + u_C + u_L \
(dif e)/(dif t) &= R (dif i)/(dif t) + (dif u_C)/(dif t) + (dif u_L)/(dif t) \
(dif^2 e)/(dif t^2) &= R/L (dif u_L)/(dif t) + u_L / (L C)
+ (dif^2 u_L)/(dif t^2)
$

#resultb[
	$ (dif^2 u_L)/(dif t^2) + R/L (dif u_L)/(dif t) + 1/(L C) u_L = (dif^2 e)/(dif t^2) $
]

- Aux bornes de $L,C$ (@figlc):

  On va supposer un régime qu'une excitation sinusoïdale 
  est envoyée en entrée, on va utiliser les impédences pour obtenir une fonction de transfert, puis on transforme tout les 
  $j omega$ et les $omega^2$ en différentiations pour obtenir
  l'équation différentielle, et on va dire hassul le système respecte
  cette équation différentielle pour toutes les entrées, donc on a 
  trouvé l'équation différentiel du circuit.
  
  $ ee &= R ii + j omega ii + 1/(j C omega) ii $
  $ uu = (j L omega + 1/(j C omega)) ii $
  $ ii = uu/(j L omega + 1/(j C omega)) $
  $ uu = (1/(L C) - omega^2)/(1/(L C) + j R/L omega - omega^2) ee $
  $ (dif^2 u)/(dif t^2) + R/L (dif u)/(dif t) + 1/(L C) u = 1/(L C) e + (dif^2 e)/(dif t^2) $


== Régime transitoire et régime force

On trouve toujours la même équation différentielle, ce qui change c'est ce qui se passe de l'autre coté.

On aura juste à résoudre l'équation homogène (comme pour un régime
transitoire normal), puis à ajouter une solution particulière,
qui sera "simple" à trouver, car le second membre sera une
sinusoïde.

== Passage à la notation complexe

- Aux bornes de $C$
  On reprend l'équation différentielle:
  $ (dif^2 u_C)/(dif t^2) + R/L (dif u_C)/(dif t) + u_C / (L C) = e/(L C) $
  On la traduit en notation complexe:
  $ -omega^2 uu_C + R/L j omega uu_C + 1/(L C) uu_C = 1/(L C) ee $
  

- Aux bornes de $R$:
  $ (dif^2 u_R)/(dif t^2) + R/L (dif u_R)/(dif t) + 1/(C L) u_R = R/L (dif e)/(dif t) $
  
  $ - omega^2 uu_R + R/L j omega uu_R + 1/(L C) uu_R = R/L j omega ee $

- Aux bornes de $L$:
  $ (dif^2 u_L)/(dif t^2) + R/L (dif u_L)/(dif t) + 1/(L C) u_L = (dif^2 e)/(dif t^2) $
  $ -omega^2 uu_L + R/L j omega uu_L + 1/(L C) uu_L = -omega^2 ee $

#todo[Calcul immondes: #image("arghhh.png")]

On se retrouve avec des fonctions qui ressemblent étrangement à des fonctions de transfert...

On regarde le comportement asymptotique des filtres:

- Aux bornes de $L$: \
  Quand $omega -> +oo$, $uu_R -> ee$ \
  Quand $omega -> 0$, $uu_R -> 0$ \
  Le filtre semble être passe-haut

- Aux bornes de $C$: \
  Quand $omega -> +oo$, $uu_R -> 0$ \
  Quand $omega -> 0$, $uu_R -> ee$ \
  Le filtre semble être passe-bas

- Aux bornes de $R$: \
  Quand $omega -> +oo$, $uu_R -> 0$ \
  Quand $omega -> 0$, $uu_R -> 0$ \
  Ce filtre est potentiellement un passe bande, on potentiellement un coupe-tout.
  "a priori, effectivement, il y a de fortes chances que ce soit un passe-bande"

= Résonance en intensité - Filtre passe-bande du 2#super[nd] ordre

#def[Résonance]: Passage par un *maximum* de l'*amplitude* 
de la fonction de transfert étudiée en fonction
de la *fréquence/pulsation*.

== Étude de l'amplitude en fonction de la fréquence

Pour étudier l'intensité du circuit, on va regarder le circuit
aux bornes de la résistance (Voir @figr)

On pose la tension et l'intensité complexes du circuit:
$ ee = (j L omega + 1/(j C omega) + R) ii $
$ ii = ee/(R + j (L omega - 1/(C omega))) $
Donc l'amplitude vérifie:
$ I = E/(sqrt(R^2 + (L omega - 1/(C omega))^2)) $
Au dénominateur, les terme étant au carré, on a toujours:
$ R^2 + (L omega - 1/(C omega))^2 >= R^2 $
$ sqrt(R^2 + (L omega - 1/(C omega))^2) >= R $
Donc l'intensité respect toujours $I <= E/R$

Pour atteindre ce maximum, il faut vérifier l'égalité:
$ L omega - 1/(C omega) = 0  \
<=> L C omega^2 = 1 \
<=> omega = omega_0 = 1/sqrt(L C)
$

Donc l'intensité passe par un maximum pour
la pulsation $omega_0 = 1/sqrt(L C)$

#note[On peut aussi dériver, ou mettre au carré et dériver,
mais c'est beaucoup plus lourd sur les calculs.]

On analyse l'intensité asymptotiquement:
- Quand $omega->0$, $I -> 0$
- Quand $omega -> +oo$, $I -> 0$

On passe qund même par un maximum d'amplitude $E/R$, le filtre est donc passe bande.

Il est de la forme:

#plot((0, 4), y: (0, 1),
	x-ticks: ((2, $omega_0$),), x-tick: none,
	y-ticks: ((1, $E/R$),), y-tick: none, 
	(x => (x => calc.exp(-x*x))(x - 2))
)

== Filtre passe bande du 2#super[nd] ordre

On reprend le même circuit (@figr):
$ ee = (j L omega + 1/(j C omega) + R) ii $
$ ii = ee/(R + j (L omega - 1/(C omega))) $

On refait la même chose, différement:

On étudie le comportement asymptotique de:
+ La bobine:
  - $u_L = L (dif i)/(dif t)$
  - $uu_L = j omega L ii$
  - $omega -> 0 <=> uu_L -> 0 <=> $ La bobine est un fil
  - $omega -> +oo <=> ii -> 0 <=> $ La bobine est un interrupteur ouvert
+ Le condensateur:
  - $i = C (dif u_C)/(dif t)$
  - $ii = j omega C uu_C$
  - $omega -> 0 <=> i -> 0 <=> $ Le condensateur est un interrupteur ouvert
  - $omega -> +oo <=> uu_C -> 0 <=> $ Le condensateur des un fil

Donc le circuit se comporte asympotiquement comme un passe-bande
(ou on passe-rien).

On étudie le gain de la fonction de transfert:
$ G = |und(H)| = R/sqrt(R^2 + (L omega - 1/(C omega))^2) $
D'après l'étude qu'on a déjà effectué sur l'intensité,
$G$ est croissant jusqu'a $omega_0$, et il est decroissant après.

Pour tracer  le diagramme de Bode, on passe au gain décibel:
$ G_"dB" = 20 log R - 20 log sqrt(R^2 + (L omega - 1/(C omega))^2) $
- Quand $omega -> 0$, \
  $ R^2 + (L omega - 1/(C omega))^2 approx 1/(C omega) $
  Donc $G_"dB" = 20 log R - 20 log 1/(C omega) = 20 log R C omega = 20 log omega/omega_1$
  avec $omega_1 = 1/(R C)$

  On observe une pente de $20 "dB/décal"$
- Quand $omega -> +oo$,
  $ R^2 + (L omega - 1/(C omega))^2 approx L omega $
  Donc $G_"dB" = 20 log R - 20 log L omega = - 20 log (L omega)/R = -20 log omega/omega_2$
  avec $omega_2 = R/L$

  On observe une pente de $-20 "dB/décal"$

On cherche une valeur de référence de $omega$.
On prend $omega_0$ tel que:
$ 20 log R C omega_0 = - 20 log (L omega_0)/R $
$ 20 log (L C omega_0^2) = 0 $
$ omega_0 = 1/sqrt(L C) $

En évaluant le gain en $omega_0$, on trouve que:
$ G_"dB" (omega_0) = 20 log (R C)/sqrt(L C) 
= 20 log R sqrt(C/L) 
= -20 log 1/R sqrt(L/C) $

On retrouve l'expression du facteur de qualité $Q$ de la forme canonique.

Donc, avec $Q > 1$ en jaune, $Q = 1$ en bleu, $Q < 1$ en vert,
le tracé asymptotique du diagramme de bode ressemble à:
#plot((-3, 3), y: (-2, 2),
	x-tick: none, x-ticks: ((1, $omega_0$), ),
	y-tick: none,
	((-3, 1), (x => x - 1)),
	((1, 3), (x => -x + 1)),
	(stroke: yellow),
	((-3, 1), (x => x - 1 - 1)),
	((1, 3), (x => -x)),
	(stroke: green),
	((-3, 1), (x => x)),
	((1, 3), (x => -x + 2)),
)

Le tracé réel est de la forme:
#figcan({
	import draw: *
	arrow((-1, 0), (3, 0))
	arrow((0, -3), (0, 1))

	bezier((-1, -2), (1, 0), (-0.5, 0))
	bezier((1, 0), (3, -2), (2.5, 0))

})

Si $Q$ le facteur de qualité est:
- Plus petit que $1$, on parle de *raisonnance floue*
- Supérieur à $1$, on parle de *raisonnance aigüe*

On reprend la fonction de transfert:
$ und(H) = H_0/(1 + j Q (omega/omega_0 - omega_0/omega)) $

- Quand $omega->0$,
  $ und(H) approx H_0/(- j (Q omega_0)/omega) = (j H_0 omega)/(Q omega_0) $
  $ und(H) = ss/ee $
  $ ss = j omega H_0/(Q omega_0) ee $
  On observe un comportement dérivateur
- Quand $omega -> +oo$,
  $ und(H) approx (H_0 omega_0)/(j Q omega) $
  $ ss = 1/(j omega) (H_0 omega_0)/Q ee $
  On observe un comportement intégrateur

== Phase

Jusqu'a maintenant, on a fait que étudier l'amplitude/le gain du circuit.
Pour obtenir le phase, on reprend la fonction de transfert:

$ phi = arg und(H) = arg R - arg (R + j (L omega - 1/(C omega)))
= psi
$
$ psi = arg (R + j (L omega - 1/(C omega))) $
$ cases(tan psi = (L omega - 1/(C omega))/R, cos psi "du signe de R donc" > 0) $

$ phi = arctan((L omega)/R - 1/(R C omega)) $

#note[#def[Forme canonique]: on peut mettre toute les fonctions de transfert du 1#super[er] et du 2#super[nd] ordre sous la même forme:
$ und(H) = (H_0 (j 1/Q omega/omega_0))/(1 = j 1/Q omega/omega_0 - (omega/omega_0)^2) $
	On peut faire l'étude de la phase et de l'amplitude avec la forme
	canonique, mais cela est plus laborieux qu'avec la forme précendente.
	On retombe sur:
	$ phi = arg H_0 + psi$
	$ arg H_0 = cases(0 "si" H_0 > 0, pi "si" H_0 < 0)$
	$ psi = cases(
		arctan((1/Q omega/omega_0)/(1 - (omega/omega_0)^2)) "si" omega < omega_0,
		arctan((1/Q omega/omega_0)/(1 - (omega/omega_0)^2)) "si" omega > omega_0
	) $

	Ce qui n'est pas très sexy...

	On préfère donc utiliser la forme précédente pour l'étude de la phase.
]

On pose
$ f(omega) = (L omega)/R - 1/(R C omega) $
$ f'(omega) = L/R + 1/(R C omega^2) $
On a $f'(omega) > 0$, donc $f$ est croissante, donc $phi$ est décroissante.

Étude asymptotique:
- $omega -> 0$, $phi = pi/2$
- $omega -> +oo$, $phi = -pi/2$
- $phi = 0 <=> L omega - 1/(C omega) = 0 <=> omega = omega_0$

Donc $phi = 0$ pour la fréquence de résonance.
Coup de chance!

== Bande passante à $-3 "dB"$

On reprend l'expression du gain:
$ G_"dB" = 20 log G $
$ G = R/sqrt(R^2 + (L omega - 1/(C omega))^2) $

On cherche $omega$ tel que $G(omega) >= G_"max"/sqrt(2)$

Ici, $G_"max" = 1$, donc on cherche $omega$ tel que:

$ R/(sqrt(R^2 + (L omega - 1/(C omega))^2)) >= 1/sqrt(2) $
$ (R^2 + (L omega - 1/(C omega))^2)/R^2 <= 2 $
$ R^2 + (L omega - 1/(C omega))^2 <= 2 R^2 $
$ R^2 - (L omega - 1/(C omega))^2 <= 0 $
$ (R + L omega - 1/(C omega))(R - L omega + 1/(C omega)) <= 0 $
On met tout au même dénominateur et on divise par $C omega$:
$ (R C omega + L C omega^2 - 1)(R C omega - L C omega^2 + 1) <= 0 $
$ underbrace((- L C omega^2 - R C omega + 1), A)underbrace((L C omega^2 - R C omega - 1), B) >= 0 $

$ Delta = (R C)^2 + 4 L C > 0 $
$ omega_1 = (R C + sqrt(Delta))/(2 L C) > 0 $
$ omega_2 = (- R C + sqrt(Delta))/(2 L C) > 0 $
$ omega_1' = (R C - sqrt(Delta))/(2 L C) < 0 $
$ omega_2' = (- R C - sqrt(Delta))/(2 L C) < 0 $

D'où:
$ (omega - omega_1)(omega - omega_1')(omega - omega_2)(omega - omega_2') <= 0 $
On fait un tableau de signe, on trouve que la 
bande passante, est les $omega in [omega_2; omega_1]$

== Déphasage et bande passante

On reprend le même circuit, avec les expressions connues de la fonction de transfert:

$ und(H) = 1/(1 + j 1/R ( L omega - 1/(C omega) )) $
$ phi = - arctan( 1/R (L omega - 1/(C omega)) ) $

Le gain maximum $G_"max"$ est $1$.
On sait que $omega_1$ et $omega_2$ sont les limites de la 
bande passantes, donc
$ G(omega_1) = G(omega_2) = G_"max"/sqrt(2) = 1/sqrt(2) $

On a donc, pour $omega in {omega_1, omega_2}$:
$ 1/(sqrt(1 + 1/R^2 (L omega - 1/(C omega))^2)) = 1/sqrt(2) $
$ <=> 1/R^2 (L omega - 1/(C omega))^2 = 1 $
#grid(
	columns: (1fr, 1fr),
	$ => 1/R (L omega_1 - 1/(C omega_1)) = 1 $,
	$ => 1/R (L omega_2 - 1/(C omega_2)) = -1 $
)

En reprenant l'expression de la phase,
on trouve ainsi la phase à la limite de la bande passante:
$ phi(omega_1) = - arctan(1) = -pi/4 $
$ phi(omega_2) = - arctan(-1) = pi/4 $

#todo[
	Graphique de la phase
]

== Facteur de qualité et bande passante

On pose $Delta omega = omega_2 - omega_1$ la largeur de la bande passante.
En reprenant les expressions de $omega_1$ et de $omega_2$,
on trouve $Delta omega = R/L$ dans ce circuit.

En général, on a $Delta omega = omega_0/Q$.
On aura une résonnance floue si $Delta omega$ est grand,
et une résonnance aïgue si $Delta omega$ est petit.

#todo[
#plot((0, 5), x-tick: none, y-tick: none,
	x-ticks: ((2, $omega_1$), (3, $omega_0$), (4, $omega_2$)),
	(x => x)
)
]

= Résonance avec bornes de la capacité - Filtre passe-bas du 2#super[nd] ordre

== Étude de l'amplitude

On prend le circuit aux bornes de la capacité (@figc).

On reprend le facteur de qualité et l'expression de l'impédance:
$ Q = omega_0/(Delta omega) 
= 1/R sqrt(L/C)
= L/(R sqrt(L C))
= (L omega_0)/R
= sqrt(L C)/(R C) = 1/(R C omega_0)
$

$ uu_C
&= (1/(j C omega))/(R + 1/(j C omega) + j L omega) und(e) \
&= 1/(1 + j R C omega - L C omega^2) und(e)
$

Avec $omega_0 =  1/sqrt(R C)$ et $Q = 1/R sqrt(L/C)$, on a:
$ uu_C = 
ee/(1 + j 1/Q omega/omega_0 - (omega/omega_0)^2)
$

$ 
G = 1/sqrt((1 - (omega/omega_0)^2)^2 + 1/Q^2 (omega/omega_0)^2)
$

Pour alléger la notation, on pose $f(omega) = 1/G^2$:
$ f(omega) = (1- (omega/omega_0)^2)^2 + 1/Q^2 (omega/omega_0)^2 $
$ f'(omega)
&= 2 (1 - (omega/omega_0)^2) (- 2 omega/omega_0^2) + 1/Q^2 (2 omega/omega_0^2) \
&= (2 omega)/omega_0 (1/Q^2 - 2 + 2 (omega/omega_0)^2)
$

On a $omega/omega_0 > 0$,
donc si $1/(Q^2) - 2$ est positif, on somme des valeures strictement positives,
et on se retrouvera avec une variation croissante.

- 1#super[er] cas, si $1/Q^2 - 2 >= 0$, alors
  $ 1/Q^2 >= 2 <=> 1/Q >= sqrt(2) <=> Q <= 1/sqrt(2) <=> R >= sqrt((2 L)/C) $

  On aura alors nécéssairement $f'(omega) > 0$, donc $f$ croissante,
  donc $uu_C$ décroissante.

  La tension ne passe pas par un maximum: on n'observe pas de résonnance.

- 2#super[eme] cas, $1/Q^2 - 2 < 0 <=> Q > 1/sqrt(2)$

  On cherche des solutions pour $f' = 0$, donc pour:
  $ 2 (omega/omega_0)^2 = 2 - 1/Q^2 $
  $ <=> omega_r = omega_0 sqrt(1 - 1/(2 Q^2)) $

  On a:
  - $omega > omega_r <=> f'(omega) > 0 $
  - $omega < omega_r <=> f'(omega) < 0$
  Donc $f$ admet un minimum en $omega_r$, et comme on
  passe à l'inverse, $G$ admet un maximum en $omega_r$.

  On cherche le gain de la résonance (le gain maximum du filtre):
  $ G(omega_r)
&= 1/sqrt((1/(2 Q^2))^2 + 1/Q^2 (1 - 1/(2 Q^2))) \ 
&= 1/sqrt(1/(4 Q^4) + 1/Q^2 - 1/(2 Q^4)) \
&= 1/sqrt(1/Q^2 (1 - 1/(4 Q^2))) \
&= (2 Q^2)/sqrt(4Q^2 - 1)
$

== Filtre passe-bas du 2#super[nd] ordre

On reprend le circuit (@figc).
On fait une étude asymptotique rapide:

#align(center, table(
	columns: 3,
	align: horizon,
	[Circuit], [Haute fréquence], [Basse fréquence],
	figcan({ bobine((0, 0)) }),
	figcan({ fil((0, 0), (1, 0)) }),
	figcan({ serie((0, 0), apply(interrupteur)) }),
	figcan({ condensateur((0, 0)) }),
	figcan({ serie((0, 0), apply(interrupteur)) }),
	figcan({ fil((0, 0), (1, 0)) }),
	figcan({
		carre((0, 0),
			branch(apply(dots)),
			apply(bobine, label: $C$),
			apply(resistor, label: $R$),
			branch(
				apply(condensateur, label: $C$)
			)
		)
	}), 
	figcan({
		carre((0, 0),
			branch(apply(dots)),
			apply(resistor, label: $R$),
			branch(
				apply(interrupteur, label: $C$)
			)
		)
	}), 
	figcan({
		carre((0, 0),
			branch(apply(dots)),
			apply(interrupteur, label: $L$),
			apply(resistor, label: $R$),
			branch()
		)
	}), 
	[],
	$ss = ee$,
	$ss = 0$
))

Donc le filtre à l'air d'être passe bas.

On a:
$ und(H) = 1/(1 + j 1/Q omega/omega_0 - (omega/omega_0)^2) $

$ G = 1/sqrt((1 - (omega/omega_0)^2)^2 + 1/Q^2 (omega/omega_0)^2) $

#let fromage = $omega$

$ G_"dB" &= -20 log sqrt((1 - (omega/omega_0)^2)^2 + 1/Q^2 (omega/omega_0)^2) $
- Quand $omega -> 0$, $G_"dB" approx - 20 log 1 = 0$,
  donc on observe une asymptote horizontale en basse fréquences.
- Quand $fromage -> +oo$, $G_"dB" approx - 20 log sqrt((omega/omega_0)^4) = - 40 log omega/omega_0 $
  donc on observe une asymptote diagonale en $-40 "dB/décal"$ 
  en $+oo$.

On analyse la phase
$ phi = arg und(H) &= arg H_0 - arg(1 - (fromage/fromage_0)^2 + j 1/Q fromage/fromage_0) \
&= arg H_0 - psi
$

$ arg H_0 = cases(0 "si" H_0 >= 0, pi "si" H_0 < 0) $

$ tan psi = (1/Q fromage/fromage_0)/(1 - (fromage/fromage_0)^2) $
$ cos psi "est du signe de " 1 - (omega/omega_0)^2 $

$ 
phi = cases(0 "si" H_0 >= 0, pi "si" H_0 < 0)
- cases(
	arctan((1/Q fromage/fromage_0)/(1 - (fromage/fromage_0)^2))
	"si" fromage <= fromage_0,
	pi + arctan((1/Q fromage/fromage_0)/(1 - (fromage/fromage_0)^2))
	"si" fromage > fromage_0
)
$

La phase sera la même qu'il
y ai résonnance ou non.


En visualisant sur un oscilloscope en mode XY la sortie du filtre
par-rapport à son l'entrée, on observera une ellipse
(dû à la différence de phase entre les sinus de même fréquence)
dont les caractéristiques dépendront
de la fréquence d'entrée, du facteur de qualité
et du type de résonance du filtre.

#figcan(caption: [Visualisation de l'entrée d'un filtre (en rouge), de sa sortie (en vert) et de l'ellipse formée en prenant commes coordonnées $X$ l'entrée et en $Y$ sa sortie (#link("https://www.desmos.com/calculator/0qapj51vtt")[version interactive])], {
	import draw: *
	
	let phi1 = 1
	let phi2 = 2

	let s2 = 0.6

	arrow((-4, 0), (4, 0))
	arrow((0, -2), (0, 2))

	let a(x) = calc.sin(x + phi1)
	let b(x) = s2 * calc.sin(x + phi2)

	for i in frange(-calc.pi, calc.pi, step: 0.1) {
		let next = i + 0.1

		line((i, a(i)), (next, a(next)), stroke: red)
		line((i, b(i)), (next, b(next)), stroke: green)

		line((a(i), b(i)), (a(next), b(next)))
	}
})

