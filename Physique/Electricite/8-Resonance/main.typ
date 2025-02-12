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

#figcan(caption: [Tension au bornes de $C$], {
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

#figcan(caption: [Tension au bornes de $R$], {
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

#figcan(caption: [Tension au bornes de $L$], {
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

#figcan(caption: [Tension au bornes de $L,C$], {
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
