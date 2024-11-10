#import "@local/physique:0.1.0": *
#import optique: *
#import xarrow: xarrow

#show: doc => template(doc)

#titleb[Association de lentilles \ Instruments d'optique]

#outline()

#let lc = math.cal($L$)

= Association de lentilles

== Méthode générale

Systématiquement faire un schéma synoptique:
$ A -->^(lc_1) B -->^(lc_2) A' -->^(lc_3) ... $

On peut utiliser des conditions particulières dans ce schéma. Par exemple, si notre objet est à l'infini:

$ oo -->^(lc_1) F'_1 -->^(lc_2) ... $

Ou si on sait qu'une de nos lentilles donne une image à l'infini:
$ F'_1 -->^(lc_1) oo -->^(lc_2) ... $

== Cas d'une système afocal

Mis à part les deux cas particuliers qu'on va voir (système afocal et #todo[]), on ne va pas beaucoup parler d'association de lentilles

Dans un système afocal, l'infini est conjugué à l'infini:

$ oo -->^(lc_1) F'_1 -->^(lc_2) ... --> F'_n -->^(lc_n) oo  $


Dans le cas particulier de deux lentilles, on a:
$ oo -->^(lc_1) F'_1 = F'_2 -->^(lc_2) oo $

Les foyer images et objets des deux lentilles sont nécessairement confondues. On a:
$ ov(O_1 O_2) = ov(O_1 F'_1) + ov(F'_1 O_2) = f'_1 + f'_2 $

== Lentilles accolées

#def[Lentilles accoléés]: Lentilles dont les centre sont confondus.

Si deux lentilles $lc_1$ et $lc_2$ sont accolées, on considère que leurs centre respectifs $O_1$ et $O_2$ sont égaux.

Si on a:
$ A -->^(lc_1) A_1 -->^(lc_2) A' $

On va chercher le système optique équivalent possédant une seule lentille  $lc_3$ tel que:
$ A -->^(lc_3) A' $

On utilise la relation de conjugaison:
$ 1/ov(O A_1) = 1/f'_1 + 1/ov(O A) $
$ 1/ov(O A') &= 1/f'_2 + 1/ov(O A_1) \
&= 1/f'_2 + 1/f'_1 + 1/ov(O A) \
&= (f'_1 + f'_2)/(f'_1 f'_2) + 1/ov(O A)
$

Une lentille de distance focale $(f'_1 f'_2)/(f'_1 + f'_2)$ est équivalente à un système focale de deux lentilles #underline[accolées].

On appelle cette relation *théorème des vergences*, car on a $V_3 = V_1 + V_2$

= L'œil

== Description

L'œil est constitué de plusiers parties:
1. Le nerf optique qui transmet le signal au cerveau
2. La rétine, où les images se forment à l'aide de cellules photosensibles
3. La pupille (la partie qui nous interésse)

L'objet traverse un premier dioptre, l'humeure aqueuse, puis passe dans la pupille qui agit comme une lentille.

L'œil capte des rayons de toute direction, on peut donc difficilement se placer dans les conditions de Gauss. L'iris agit ainsi comme un diaphragme qui va limiter l'angle des rayons incident.

L'indice entre l'humeur aqueuse et le cristallin sont généralement très proche, donc on va ignorer la traversée de ce dioptre et on considérera une seule lentille.

== Caractéristiques de l'œil

=== L'accomodation
La principale caractéristique de l'œil est *l'accomodation*.

Dans un œil, on ne peut déplacer ni l'écran, ni la lentille. Pour voir à différentes distances, le cristallin, qui est un muscle, va se contracter afin de modifier la distance focale de la pupille et changer.

De ce fait, cela permet de voir toute une zone. On va définir deux choses:
- Le Punctum Remotum (PR), le point le plus éloigné qu'on peut observer.
- Le Punctum Proximum (PP), le point le plus proche qu'on peut observer.

Ces valeures sont des *points*, #underline[PAS] des distances.

Lorsque l'œil regarde le PR avec la rétine, il est au repos. Le cristallin n'a pas besoin de se contracter. \
Lorsque l'œil regarde le PP, il est le plus contracté.

Pour un œil normal, sans défaut, le PR est à l'infini et le PP est à $25 "cm"$.

=== L'acuité visuelle

#def[Acuité visuelle]: Capacité à distinguer deux points

On parle aussi de résolution angulaire. Un œil normal est capable de distinguer deux points à partir du moment où l'angle des rayon incidents dépasse $4 dot 10^(-4) "rad"$

#figcan({
	import draw: *

	arrow((-2, 0), (2, 0))
	line((-2, 0.5), (2, 0))
})

=== Champ de l'œil

Espace où l'image se forme sur la zone sensible de la rétine.

== Modélisation de l'œil

On va modéliser l'œil par une lentille pour le cristallin et par un écran pour la rétine.

On peut modeliser l'accomodation par un changement de lentille (ce qui n'est pas très pratique), ou par déplacement de l'écran sur l'axe optique.

On détermine la position de l'écran pour un objet à $25 "cm"$, et un objet à l'infini.

En plaçant l'écran entre ces deux positions, on pourra recueillir l'image d'un objet entre $25 "cm"$ et l'infini.

== Défauts de l'œil

On va parler des 4 défauts principaux.

=== Myopie

Le cristallin est trop convergent.
Les rayons à l'infini viennent converger avant la rétine.

Le PR est proche de l'œil, on ne peut pas voir au-delà.

Pour rectifier la miopie, on place une lentille divergente (dîte correctrice) avant le cristallin afin d'envoyer les rayons à l'infini sur le PR de l'œil myope:

$ oo -->^(lc_c) "PR" xarrow("œil myope") "rétine" $

=== Hypermétropie

L'hypermétropie est l'inverse de la myopie. Le cristallin n'est pas assez convergent, les rayons convergent derrière la rétine.

Or, tout les œils peuvent accomoder, l'hypermétropie peut se "régler d'elle même" en accomodant constamment. Cela-dit, l'accomodage est fatigant et l'hypermétropie se détecte par une fatigue visuelle constante.

Pour la rectifier, on place une lentille correctrice convergente avannt le cristallin.

=== Astigmatie
Le cristallin n'est pas parfaitement sphérique, la lentille n'est pas symmétrique.

=== Presbytie
Le cristallin est moins souple, on peut moins accomoder.

= Loupe

#figcan({
	import draw: *
	arrow((-4, 0), (4, 0))
	point((0, 0), value: $O$)

	double_arrow((0, 2), (0, -2))

	point((-2, 0), value: $A$, anchor: "south-east")
	point((-2, 1), name: "B", value: $B$, anchor: "south-east")
	line((-2, 0), (-2, 1))

	cetz.angle.angle((3.5, 0), (0, 4), (0, -4), )
	point((3.5, 0), value: $O'$)

	set-style(stroke: red)
	line("B", (0, 1))
	line((0, 1), (4, -1))
	line("B", (4, -2))

	set-style(stroke: blue)
	line((3.5, 0), "B")
})

On veut pouvoir observer $A B$ en étant au repos.
Ainsi, il faut que la loupe conjugue $A B$ par l'infini.

On place donc $A B$ au foyer objet $F$ de la lentille.

On calcule le grossissement (qui n'est pas la même chose que le grandissement) par:
$ G = alpha'/alpha $

#def[$alpha$]: Angle sous lequel on voit l'objet $A B$ sans instrument \
#def[$alpha'$]: Angle sous lequel on voit l'image $A' B'$

Dans le triangle $O A B$ = $O F B$

On se place dans les conditions de Gauss.

Pour voir $ A B$ le plus grand possible:
- En l'absence de loupe, on place $A B$ le plus près possible de l'œil, au PP:
  $ ov(O' A) = -d_m $
  $ alpha approx tan alpha = ov(A B)/ov(A O') = ov(A B)/d_m $
- Avec une loupe:
  $ alpha' approx tan alpha' = ov(A B)/ov(F O) = ov(A B)/f' $
  $ G = alpha' / alpha = (ov(A B)/f')/(ov(A B)/d_m) = d_m / f' $

Alternativement au grossissement, on peut utiliser le concept de "puissance":
$ P = alpha' / ov(A B) $
Ici:
$ P = 1/f' $

= Lunette astronomique - Instrument pour voir infiniment grand

#figcan({
	arrow((-4, 0), (4, 0))
	point((-2, 0), value: $O_1$)
	double_arrow((-2, -2), (-2, 2))

	point((1, 0), value: $O_2$, anchor: "south-west")
	double_arrow((1, -2), (1, 2))

	point((0, 0), value: $F'_1$)
	point((0, 0), value: $F_2$, anchor: "south-west")

	import draw: *

	line((0, -2), (0, 2), stroke: (dash: "dotted"))

	set-style(stroke: red)
	line((-4, 0.5), (-2, 0), (1, -0.75))
	line((-4, 2), (-2, 1.5), (1, -1.5))

	cetz.angle.angle((-2, 0), (-4, 0), (-4, 0.5))

	set-style(stroke: blue)
	line((0, -3/6), (4, 1.5), stroke: (paint: blue, dash: "dotted"))
	line((1, -0.75), (4, 0.75))
	line((1, -1.5), (4, 0))

	cetz.angle.angle((2.4, 0), (4, 0), (4, 0.75))
})

On a un objet à l'infini (une planète, par exemple).
On veut que l'œil emmètrope puisse regarder à travers la lunette sans accomodation.
On a donc:
$ oo -->^cal(L_1) F'_1 = F_2 -->^cal(L_2) oo $

On est face à un système afocal.

Le foyer image de l'objectif est confondu avec le foyer objet de l'oculaire. \
#def[Encombrement]: Taille de la lunette le long de l'axe optique.

On a l'encombrement $ov(O_1 O_2)$ avec:
$ ov(O_1 O_2) = ov(O_1 F_1') + ov(F_2 O_2) = f'_1 + f'_2 $

On mesure le grossissement de même:
$ G = alpha'/alpha $

On utilise le foyer secondaire $F$:

Dans le triangle $O_1 F_1' F$:
$ alpha approx tan alpha = ov(F'_1 F)/ov(O_1 F'_1) = ov(F'_1 F)/f'_1 $

Dans le triangle $O_2 F_1' F = O_2 F_2 F$:
$ alpha' approx tan alpha' = ov(F_2 F)/ov(O_2 F_2) = ov(F'_1 F)/(-f'_2) $

On a:
$ G = alpha' / alpha = (ov(F'_1 F)/(-f'_2))/(ov(F'_1 F)/f'_1) = -f'_1/f'_2 $

Pour qu'on puisse *voir* quelque chose, avec:
$ oo -->^cal(L_1) F'_1 -->^cal(L_2) A $
Il suffit que que $A$ soit situé entre le PP et le PR.
On a deux positions extrêmes:
- A au PR: $A = oo$, $F'_1 = F_2$
- A au PP: $A = d_m$,
  On a $F'_1 -->^cal(L_2) F_2 $

= Aberrations optiques

== Aberrations chromatiques

L'indice de réfraction de la lentille change selon la longueur d'onde des rayons qui passent au travers (loi de Cauchy).
Ainsi, des rayons de différentes couleurs auront différents foyers, ce qui amène un "étalage" des couleurs sur l'écran:

#figcan({
	import draw: *

	arrow((-4, 0), (4, 0))
	double_arrow((0, 2), (0, -2))

	line((-4, 1), (0, 1), (4, -1.5), stroke: (paint: yellow, dash: "dashed"))
	line((-4, 1), (0, 1), (4, -1), stroke: (paint: red, dash: "dashed"))
	line((-4, -1), (0, -1), (4, 1), stroke: (paint: red, dash: "dashed"))

	line((-4, -1), (0, -1), (4, 1.5), stroke: (paint: yellow, dash: "dashed"))
	line((-4, 1), (0, 1), (4, -1), stroke: (paint: red, dash: "dashed"))
	line((-4, 1), (0, 1), (4, -2), stroke: (paint: blue, dash: "dotted"))
	line((-4, -1), (0, -1), (4, 2), stroke: (paint: blue, dash: "dotted"))

	line((1.3, 1.5), (1.3, -1.5))
	circle((1.1, -2.2), radius: 0.3, stroke: none, fill: red)
	circle((1.1, -2.2), radius: 0.2, stroke: none, fill: yellow)
	circle((1.1, -2.2), radius: 0.1, stroke: none, fill: blue)

	line((2, 1.5), (2, -1.5))
	circle((2.2, -2.2), radius: 0.4, stroke: none, fill: blue)
	circle((2.2, -2.2), radius: 0.25, stroke: none, fill: yellow)
	circle((2.2, -2.2), radius: 0.1, stroke: none, fill: red)

	point((1.3, 0), color: blue)
	point((1.6, 0), color: yellow)
	point((2, 0), color: red)
})

Pour réduire les aberrations chromatiques, on peut alterner lentille convergente et lentille divergente, pour essayer de "recentrer" les foyers de couleur différente.

== Aberrations géométriques

=== Aberration sphérique

Lorsque les rayons n'arrivent pas dans les conditions de Gauss, l'astigmatisme n'est pas vérifié.

On peut placer un diaphragme sur la lentille pour limiter l'angle d'incidence des rayons incidents.

=== Distortion
