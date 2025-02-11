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

$L = K/a$ avec $K = 11.10^(-7) upright(" "m^2)$

=== Loi de la diffraction pour une fente

#parachute[
	Pour $lambda$ la longueur d'onde, $a$ la largeur de la fente:
	$ sin theta = lambda/a $
]

=== Généralisation à une ouverture

#figure(caption: [Figure de diffraction à travers une ouverture], image("./tache_centrale.png", width: 30%))

À travers une double fente, la fentre centrale est deux fois plus grande que la deuxième. Ici, la tache centrale est $1.22$ fois plus grande que la deuxième. (lié aux fonctions de Bessel).

Dans ce cas ci, l'angle de diffraction vérifie donc $sin theta = 1.22 lambda/a$

= Principe et approche qualitative de la diffraction

== Modélisation de la propagation d'une onde plane

On va modélise la propagation d'une onde plane
(par exemple, une onde crée par un laser)
par de multiple points emetteurs circulaires.

Si on observe l'avant des ondes émisent, on observe
en effet une onde quasi-plane: le front d'onde

#figcan(caption: [Front d'onde], {
	import draw: *

	for i in range(0, 10) {
		circle((i/5, 0), radius: 0.05)
		arc((i/5, 0), start: 0deg, stop: 180deg, radius: 2, anchor: "origin", stroke: blue)
	}

	line((-2, 2.1), (4, 2.1))
	content((1, 2.5), [Front d'onde])
})

== Diffraction d'une onde par une fente

On va modéliser la diffraction par une fente par plusieurs
point sources, positionnés dans la fente, qui vont chacun 
émettre un signal:

Si la fente est suffisement large, on observe pas de réel changement
dans le front d'onde:
#figure(caption: [Diffraction par une fente large], image("diffraction_large.png", width: 40%))

Si la fente est suffisemment fine,
en additionnant les signaux de chacun des points
on pourra observer assez d'interférences pour voir une tache.

#figure(caption: [Diffraction par une fente fine], image("diffraction_petite.png", width: 40%))

== Diffraction par un obstacle

Par cette modélisation, on observe que les ondes
se propagent en contournant les obstacles:

#figure(caption: [Diffraction par un obstacle], image("diffraction_obstacle.png", width: 40%))

= Exemple de phénomènes de diffraction


== Diffraction en optique

=== Limitation du pouvoir de résolution

Si on observe la diffraction de deux objets (comme deux fentes),
il existe plusieurs critères pour nous dire si oui ou non
on distingue les deux objets dans leur diffraction
(et pas un seul blob d'interférences).

#figure(caption: [Différents critères de résolution], image("criteres.png", width: 80%))

Voir #underline(link("https://fr.wikipedia.org/wiki/Pouvoir_de_résolution"))
