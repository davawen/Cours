#import "@local/physique:0.1.0": *

#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#show: doc => template(doc)

#show link: underline

#titleb[Corps pur sous plusieurs phases]

= Définitions et généralités

== Notion de corps pur / Mélange

#def[Corps pur]: Système constitué d'un seul type d'espèce chimique

Exemple:
- L'air n'est pas un corps pur
- L'ean du robinet n'est pas un corps pur
- L'eau distillée est en principe pur

== Phases usuelles d'un corps pur

On considère les phases habituelles:
- Solide, liquide, gas
- Il existe aussi des variétés dîts allotropiques.
  C'est à dire différentes phases usuelles ayant des propritétés
  différentes (par exemple Glace I à IX)

== Mise en évidence expérimentale d'un changement de phase

== Définition des transitions de phases

#align(center, diagram(
	node((-2, 0), [Solide]),
	edge((2, 0), [Sublimation], "->", bend: 7deg),
	edge((0, -2), [Fusion], "->", bend: 7deg, label-angle: auto),

	node((2, 0), [Gazeux]),
	edge((0, -2), [Liquéfaction], "->", bend: -7deg, label-angle: auto),
	edge((-2, 0), [Condensation], "->", bend: 7deg),

	node((0, -2), [Liquide]),
	edge((-2, 0), [Solidification], "->", label-angle: auto, bend: 7deg),
	edge((2, 0), [Vaporisation], "->", label-angle: auto, bend: -7deg),
))

== Retard du changement d'état en état métastable

Le changement d'état ne s'opère pas instantanément et spontanément.

Les corps peuvent se retrouver dans un état métastable,
où toute pertubation peut le faire basculer dans l'état où il
"devrait" être.

Par exemple, de l'eau peut-être liquide à $-1$ °C,
mais une petite pertubation peut forcer la solidification
du corps entier. C'est la surfusion.

(Voir #link("https://youtu.be/NG0c9bFNk1U")[en vidéo])

== Variance et règle de phases

En reprenant la relation
$ P V = n R T $,
$ P/T = n/V R $
$ P/T = underbrace(C, "intensif") R "avec" C = n/V "la concentration" $

Il suffit donc de $2$ paramètre intensifs qui permettent
de décrire l'entièreté du système: 
la pression et la température.

#parachute[
	Sinon, on peut partir de la relation suivante:

	Pour $v$ la variance, $c$ le nombre de constituants,
	$phi$ le nombre de phases, on a la relation:
	$ v = c + 2 - phi $
	Pour un gaz parfait, on a un constituant et une seule phase, donc
	#resultb[$ v = 2 $]
]

== Titre massique et titre molaire

Pour un corps constitué de différentes phases,
de masses $m_i$ et de quantité de matières $n_i$.

On pose le $x_i$ *titre massique* la proportion relative de la phase
en masse, et $x_i^*$ le *titre molaire* la proportion relative de la
phase en quantité de matières, avec:
$ x_i = m_i/m_"tot" "  " x_i^* = n_i/n_"tot" $

#note[
	Dans le cas d'un corps pur, une seule substance est présente,
	donc chaque phase possède une masse molaire identique.

	On a donc, *dans le cas d'un corps pur*,
	$ x_i = x_i^* $
]

= Analyse des changements d'état

== Fusion ou solidification

Le changement d'état s'opère à température constante.

#figcan({
	import draw: *
	arrow((0, 0), (0, 4))
	arrow((0, 0), (4, 0))

	content((-0.3, 4), $T$)
	content((4, -0.3), $t$)

	catmull((0.5, 4), (1, 2.5), (1.5, 2))
	line((1.5, 2), (3, 2))
	catmull((3, 2), (3.1, 1.5), (4, 0.3))

	content((3.5, 3), [Palier de solidification], name: "solid")
	line((2.5, 2), (rel: (0, -0.1), to: "solid.south"))

	bezier-through((1.5, 2), (1.9, 1.85), (2.2, 2), stroke: (dash: "dotted"))

	content((1.5, 1.5), [Surfusion])
})

== Vaporisation ou liquéfaction

De même quand on chauffe le liquide:

#figcan({
	import draw: *
	arrow((0, 0), (0, 4))
	arrow((0, 0), (4, 0))

	content((-0.3, 4), $T$)
	content((4, -0.3), $t$)

	scale(x: -120%)
	translate((-4, 0))

	catmull((0.5, 4), (1, 2.5), (1.5, 2))
	line((1.5, 2), (3, 2))
	catmull((3, 2), (3.1, 1.5), (4, 0.3))

	content((2.5, 3), [Palier de vaporisation], name: "solid")
	line((2.5, 2), (rel: (0, -0.1), to: "solid.south"))
})

On définit la #def[pression de vapeur saturante] à une
température $T$, c'est la pression
où le liquide et la vapeur sont en équilibre.

Explication: comme on a deux paramètre intensifs,
on peut les modifiers indépendament pour
observer tout les états possible d'un corps.

Or, pour une température fixée, il n'existe qu'une
seul pression d'équilibre, c'est à dire une pression
où les deux états du corps co-existent
(ou inversement, en fixant la pression).

En graphant le point d'équilibre, on obtient un pseudo-diagramme
de phase:

#figcan({
	import draw: *

	arrow((0, 0), (0, 6))
	arrow((0, 0), (6, 0))

	content((-0.3, 6), $P$)
	content((6, -0.3), $T$)

	catmull((1.3, 1), (3.5, 2.5), (5, 5))
	content((5.5, 5.3), [point critique])
	content((1, 0.7), [point triple])

	content((4.5, 1.5), align(center)[entièrement \ gazeux])
	content((2, 3.5), align(center)[entièrement \ liquide])

	circle((1.3, 1), radius: 0.04)
	circle((5, 5), radius: 0.04)
})

== Sublimation - solidification

On obtient le même diagramme si on cherche le point d'équilibre
dans le changement de phase entre liquide et solide

#pagebreak()

= Étude du diagramme $(P, T)$

== Description

En assemblant ces deux diagrammes, on obtient le diagramme
de changement de phase:

#figcan({
	import draw: *

	arrow((0, 0), (0, 6))
	arrow((0, 0), (6, 0))

	content((-0.3, 6), $P$)
	content((6, -0.3), $T$)

	catmull((0, 0), (1, 0.8), (3.5, 2.5), (5, 4))
	catmull((1, 0.8), (1.5, 4), (2.5, 5))
	content((6, 3.5), [point critique])
	content((2, 0.6), [point triple])

	line((5, 4), (6.5, 4), stroke: (dash: "dotted"))
	line((5, 4), (5, 5.5), stroke: (dash: "dotted"))

	content((4.5, 1.5), align(center)[gazeux])
	content((2.5, 3.2), align(center)[liquide])
	content((0.7, 4), align(center)[solide])
	content((6.3, 4.8), align(center)[fluide \ supercritique])

	circle((1, 0.8), radius: 0.04)
	circle((5, 4), radius: 0.04)
})

== Point triple

Chaque corps pur possède un unique point triple,
un couple $(P, T)$ où les trois phases coexistent.

Point triple de l'eau:
$(6.026 times 10^(-3) "atm", -0.01 degree "C")$

== Point critique

== Cas particulier de l'eau

Dans le cas de l'eau,
l'interface entre solide et liquide possède une pente
inverse (l'eau prend plus de place sous
forme solide que sous forme liquide)

= Diagramme de Clapeyron $(P, v)$ de l'équilibre liquide-vapeur

== Description

#figure(image("clapey.png", width: 50%))

On parle d'équilibre liquide-vapeur quand une phase
liquide et une phase de vapeur coexistent.

On réalise le diagramme de Clapeyron à température fixée.

== Courbe d'ébuillition de rosée et de saturation

On appelle *courbe d'ébullition* la courbe qui relie
les points pression-température entre
l'apparition de la première goutte de vapeur
ou  la disparition de la dernière goutte d'eau.

De même, on appelle *courbe de rosée* la courbe qui relie
l'apparition de la première goutte d'eau et la disparition
de la dernière goutte de vapeur.

Ensemble, ces courbes sont appellées courbes de saturation.

== Point critique - Opalescence critique

= Théorème des moments

#figure(image("clapey2.png", width: 70%))

On peut utiliser ce diagramme pour déterminer la composition
d'un mélange.

Le volume massique de la vapeur et le volume massique du liquide
caractérise le corps.

On pose le volume total $V = V_l + V_v$ somme des volumes de
la vapeur et du liquide.

$ underbrace((m_l + m_v), "mass totale") v = m_l v_l + m_v v_v $

$ v = x_l v_l + x_v v_v "avec" x_l = m_l/(m_l + m_v) "le titre massique" $

$ x_l + x_v = 1 <=> x_l = 1 - x_v $
$ v = (1 - x_v) v_l + x_v v_v  $
$ v - v_l = x_v (v_v - v_l) $
$ x_v = (v - v_l)/(v_v - v_l) $
$ x_v = (A M)/(A B) $
