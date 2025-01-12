#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Propagation d'un signal - Notion d'onde progressives]

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

On peut observer la propagation des ondes en elle même (vagues sur un lac) ou en sentir les effets (retard d'un écho).

#def[Pertubation]: Modification/compression locale d'un milieu. On parle d'onde si cette pertubation se déplace (sans déplacement de matière: une fois que l'onde est passée, le milieu local reprend sa configuration initiale).

== Ondes transversales ou longitudinales

#def[Onde transversale]: Onde se déplaçant perpendiculairement à son milieu: vagues, onde transversales sur une corde

#def[Onde longitudinales]: Onde se déplaçant "dans le sens" de son milieu: compression de matière (onde acoustique)

== Définition d'une onde progressive

#def[Onde progressive]: onde se propageant dans un milieu sans déformation (= sans mur qui la forcera à se réfléchir) et sans aténuation.

#def[Onde stationnaire]: onde se propageant dans un milieu et intérférant avec sa propre réflexion

Les ondes progressives et stationnaires sont deux familles de solution à l'équation d'onde.

== Direction de propagation

Une pertubation devrai à-priori se propager dans toutes les directions (tri-dimensionnelles) dans un milieu homogène et isotrope.

Dans certains milieu, la propagation sera bi-dimensionnelle (vague sur l'eau) ou monodimensionnel (corde).

== Célérité

#let unit(c) = $upright(#c)$

On note $c$ la célérité: la vitesse de propagation de l'onde (= de la pertubation).

Quelques ordre de grandeurs:
- Onde transversales sur une corde: $c = sqrt(T/mu)$, avec $mu$ la masse
  linéique, $T$ la tension de la corde. Ordre de $approx 10 " "unit(m dot s)^(-1)$
- Onde transversales à la surface de l'eau: $c approx 30 unit("cm" dot s^(-1))$
- Onde sonores: $340 unit(m dot s^(-1))$ dans l'air, $approx 1500$ dans l'eau, $3000$ dans l'acier
- Onde électromagnétique: $299 792 458 " "unit(m dot s^(-1))$ dans le vide

== Formalisation mathématique

Hypothèses:
- On se place avec une onde unidimensionnelle (un seul paramètre de "position")
- Pertubation $u(x, t)$ (= quelle est la valeur de la pertubation en un point de l'espace $x$ et en un instant $t$) émise en $S$ d'abscisse $x = 0$ à une vitesse $c$

En supposant que les ondes se propagent dans le sens des $x$ croissants:

Si l'onde se situe en $x_1 $ en $t_1$, et qu'elle s'est déplacée en $x_2$ en $t_2$ (avec $u(x_1, t_1) = u(x_2, t_2)$), on définit le retard entre les deux points par:
$ tau = t_2 - t_1 $
On obtient la vitesse de propagation de l'onde par:
$ c = (x_2 - x_1)/(t_2 - t_1) $
On considère que $c$ est une constante (la vitesse de propagation ne change pas pendant la propagation: milieu homogène et isotrope), d'où:
$ tau = t_2 - t_1 = (x_2 - x_1)/c $
On peut donc définir la valeur de la pertubation en $x_2$ par-rapport à $x_1$:
$ t_1 = t_2 - (x_2 - x_1)/c $
$ u(x_2, t_2) = u(x_1, t_2 - (x_2 - x_1)/c) $

En prenant $x_1 = 0$, $x_2 = x$, $t_2 = t$, on peut définir l'état de la perturbation à n'importe quel point par-rapport à la pertubation à l'origine:
$ u(x, t) = u(0, t - x/c) $

On se contente donc de l'expression fonctionelle de l'onde: $f(t - x/c)$ 

#note[
	Si les ondes se propagent dans le sens des $x$ décroissants,
	on utilise l'expression inverse $g(t + x/c)$
]

On peut aussi se baser sur la position plutôt que sur le temps et faire la même manipulation:
#todo[Faire la même manipulation]
$ F(x - c t) "ou" G(x + c t) $

Les deux expressions sont équivalentes:
- Si $f$ est connue, on obtient $F$ avec $t = 0$
- Si $F$ est connue, on obtient $f$ avec $x = 0$

Mise en application: prévoir l'évolution temporelle de la pertubation en un point donné de son évolution spatiale:
#align(center, image("pertubation.png"))

1. En 1 s, chaque point se propage de $3 " "unit(m)$.
2. En $x_A = 5" m"$: $ f(t) = cases(
	0 "si" t < 2/3 "ou" t > 2,
	3 J (t-2/3) "si" 2/3 <= t <= 1,
	J(1 - t) + J "si" 1 <= t <= 2
) $
  En $t = 1$, le point $J$ est en $A$. \
  Le point $K$ est en avance de $A$ de $1" m"$, \
  donc il l'atteint en $t = 2/3$. \
  Le point $I$ atteint le point $A$ après avoir parcouru 3m, \
  donc en $t = 2$. \
  On fait une interpolation linéaire pour le reste.

== Cas des ondes sinusoïdales

Pour une onde se propageant dans le sens de $x$ croissants. \
Pour une onde sinusoïdale, notre fonction est un sinus:

$ u(x, t) &= f(t - x/c) \
&= U sin(omega (t - x/c) + phi) \
&= U sin(omega t - omega/c + phi) \
$

#note[On a pas réellement besoin de la phase $phi$, car on peut simplement bien choisir notre $t$ initial pour l'annuler.]

On pose $k = omega/c$ le vecteur d'onde ou la pulsation spatiale.

On fait le lien:
#grid(
	columns: (1fr, 1fr),
	rows: 1,
	[
	*Période temporelle*
	- Pulsation $omega$
	- Fréquence $f$
	- Période $T$
	$ omega = 2 pi f = (2pi)/T $
	], [
	*Période spatiale*
	- Vecteur d'onde $k$
	- Nombre d'onde $sigma$
	- Longeur d'onde $lambda$
	$ k = 2pi sigma = (2 pi)/lambda $
	]
)

#note[
	Le vecteur d'onde est ici un scalaire car les ondes sont unidimensionelles, mais avec plus de dimension, on prend le produit scalaire avec $arw(O M)$ la direction de propagation.
]

$ u(x, t) = U sin(2 pi t/T - 2pi x/lambda + phi) $

== Déphasage et lien avec le retard dû à la propagation

En supposant que l'onde est émise en $S$ d'abscisse $x = 0$

=== Déphasage de signaux en deux points

On appelle $phi(x)$ la phase initiale:
$ phi(x) = -k x + phi_0 = phi_0 - (2pi)/lambda x $

D'où déphasage entre deux points $x_1$ et $x_2$:
$ Delta phi = phi(x_2) - phi(x_1) $
