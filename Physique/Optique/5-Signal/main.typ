#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Propagation d'un signal - Notion d'onde progressives]

#show heading.where(level: 1): it => {
	pad(left: 1em, it)
}

= Notion de signal

== Définition

#def[Signal]: Grandeur physique porteuse d'information

== Trois phases d'un signal

Un signal doit d'abord être émis,
puis il doit se transmettre (ce qui peut prendre un certain temps et perdre de l'information),
et il doit être reçu pour récupérer son information.

== Acquisition d'un signal

#def[Capteur]: Appareil transformant n'importe quel signal en signal électrique \
#def[Enregistreur]: Système capturant l'évolution temporelle d'un capteur

On a en général besoin de la linéarité des capteurs, c'est à dire que le signal électrique obtenu est proportionel à la puissance du signal original.

== Signaux Acoustique

=== Définition

#def[Signal Acoustique]: Vibration mécanique d'un fluide ou d'un solide.

=== Émission d'un son

Une des manière d'émettre un son est de frapper un objet, créant une déformation locale qui se répand dans le milieu, avant de se propager dans l'air.

=== Milieu de propagation

Un son se propage nécessairement dans un milieu. Sans air ou solide, le son ne peut pas se propager.

=== Réception d'un son

On récupère les oscillations dans l'air pour le transformer en signal électrique.

=== Célérité du son

La vitesse du son change avec:
- La pression
- La température
- Le milieu

🪂
Dans le cas d'un gaz parfait: $c = sqrt((gamma k_B T)/m) = sqrt((gamma R T)/M)$ avec $gamma = C_P/C_V$, $K_B = 1.38 dot 10^(-23) upright(J dot K^(-1) dot "mol"^(-1))$, $m$ masse de particule du gaz, $R = 8.31 upright(J dot K^(-1))$ et $M$ masse molaire du gaz.

=== Caractéristique d'une onde sonore

#def[Hauteur d'un son]: Fréquence du signal:
- Pour l'humain, les sons perçus on une fréquence comprise entre $20 "Hz"$ et $20 "kHz"$.
- On passe à l'octave suivante en multipliant la fréquence par $2$.
- On peut diviser un octave en $12$ demi-tons en multipliant par $root(12, 2)$

#def[Timbre d'un son]: Forme du signal.
- On parle de son simple si on est face à une sinusoïdale pur
- On parle de son complexe si on a une fréquence fondamentale $f_0$, et que le son est formé de la somme de multiples de cette fréquence.

#def[Intensité sonore]: Puissance sonore en décibels ($I = 10 log P/P_0$).

== Signaux électromagnétiques

=== Définition

Un signal électromagnétique est la propagation d'une perturbation dans un champ électrique et un champ magnétique couplé.

=== Émission des ondes électromagnétiques

Des ondes électromagnétiques sont émisent par l'accéleration de particules chargées.

=== Propagation des ondes électromagnétiques

Les photons se propagent en ligne droite dans les milieux homogènes et isotropes.

Elle peut subir les phénomènes de réflexion et de réfraction comme vu en optique géométrique. 
Elle peut subir des phénomènes de diffraction et de diffusion.

=== Propriétés des ondes électromagnétiques

Contrairement aux ondes accoustiques, les ondes électromagnétiques n'ont pas besoin d'un milieu matériel pour se propager (elles peuvent se transmettre dans le vide), car le champ électromagnétique est présent partout.

= Phénomène de propagation - Notion d'ondes

== Observation expérimentales

