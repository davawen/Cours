#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Phénomènes de diffraction]

= Étude quantitative de la diffraction

== Observation expérimentale

Si on fait briller de la lumière à travers des fentes
d'Young, on observe des raies qui ont toutes
même taille. On parle alors *d'interférence*.

Si on fait briller de la lumière à travers un 
dispositif à double fente, on observe une raie
centrale, et des raies de taille décroissante autout.
On parle alors de *diffraction*.

#figure(caption: [Figure de diffraction d'une double fente], image("figure_diffraction.png", width: 40%))

En optique géométrique, on s'attendrait à ce que si un
faisceau parallèle à une fente passe à travers cette fente,
le faisceau coupé fasse la taille de la fente et reste de la taille de la
fente (en pointillés sur @laser). \
En réalité, la lumière est *diffractée*.
// Chaque point de la fente "agit" comme une source secondaire
// qui rémmet 

#figcan(caption: [Diffraction d'un faisceau laser par une fente], {
	import draw: *

	content((-2, 0), [Laser >])

	set-style(stroke: (paint: aqua, dash: none, thickness: 0.8))
	line((-1.4, 0), (0, 0))

	set-style(stroke: (paint: aqua, dash: none, thickness: 0.4))
	line((0, 0), (3, 0.2))
	line((0, 0), (3, -0.2))

	set-style(stroke: (thickness: 0.05, paint: black, dash: "dashed"))
	line((0, 0.2), (3, 0.2))
	line((0, -0.2), (3, -0.2))

	set-style(stroke: (thickness: 0.05, dash: none))
	content((-0.2, 1), [fente de largeur $a$], anchor: "east")

	line((0, 0.2), (0, 2))
	line((0, -0.2), (0, -2))

	line((3, -1), (3, 1))

}) <laser>

== Approche quantitative

Sur @laser, on pose $theta$ l'angle de diffraction, $D$ la distance entre la fente et l'écran et $L$ la taille
des taches obtenues sur l'écran.

On mesure la taille des taches en faisant varier les différents paramètres:

=== Pour une ouverture $a$ constante

Pour des angles $theta$ petits, on a $theta approx L/D$,
et la largeur suit en effet une relation pseudo-linéaire avec $D$:

#figure(caption: [Largeur $L$ de la tache centrale en fonction de $D$], image("graphe_l_fonc_d.png", width: 50%))

=== Variation de la taille $L$ de la tache centrale avec la largeur $a$ de la fente

#figure(caption: [Largeur $L$ en fonction de la largeur $a$ de la fente ou de l'inverse de $a$ pour $D = 1.8upright(" m")$], image("graphe_l_fonc_theta.png"))

=== Loi de la diffraction pour une fente

#parachute[
	Pour $lambda$ la longueur d'onde, $a$ la largeur de la fente:
	$ sin theta = lambda/a $
]
