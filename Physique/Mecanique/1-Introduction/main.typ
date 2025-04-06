#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Intrøductiøn à la mécåníqũė \ Systèmes de Coordonées]

= Bref historique

= Objet de la mécanique

== Quelques définitions
- #def[Cinématique]: Description, analyse des mouvements, sans s'intéresser aux
  causes de ce mouvement. 
- #def[Dynamique]: Étude des causes du mouvement: notion de force et d'action mécanique
  - #def[Statique]: Étude des équilibres en l'absence de mouvement \

== Cadre de la mécanique newtonienne 

=== Unités

- #def[Mètre]: Distance parcourue par la lumière en $1/c$ seconde.
- #def[Seconde]: Horloge atomique

=== Hypothèse de la mécanique newtonienne

On considèra que:
- La précision de la position et de la vitesse est illimité et absolue.
  - (Faux car principe d'incertitude quantique mais négligeable à l'échelle macroscopique)
- Le temps avance à la même vitesse partout
  - (Faux car relativité restreinte, mais négligeable à l'échelle macroscopique)
- Espace euclidien = La somme des angles d'un triangle vaut $180 degree$, l'espace est plat
  - (Faux car torsion de l'espace-temps)
- Le temps et l'espace sont continus
  - (Faux car quantisation)

= Systèmes de coordonnées

Un système de coordonnée permet de se repérer dans l'espace par rapport à une origine.

== Coordonnées cartésiennes

On pose un repère orthonormé ($arw(u_x), arw(u_y), arw(u_z)$)

#figcan({
	import draw: *
	line((0, 0, 0), (1, 0, 0))
	line((0, 0, 0), (0, 1, 0))
	line((0, 0, 0), (0, 0, 1))

	content((1.2, 0, 0), $arw(u_y)$)
	content((0, 1.2, 0), $arw(u_z)$)
	content((0, 0, 1.2), $arw(u_x)$)

	circle((2, 0.8, 1), radius: 0.05, fill: black)
	content((2, 1.1, 1), $M$)

	line((0, 0, 0), (0, 0.8, 0), (0, 0.8, 1), (2, 0.8, 1), stroke: (dash: "dotted"))
})

On peut atteindre le point $M$ avec ses coordonées: $arw(O M) = x arw(u_x) + y arw(u_y) + z arw(u_z) $

On peut faire varier les coordonnées de $M$ dans les trois directions élémentaires.

Déplacement élémentaire:
$ dif arw(O M) = dif x arw(u_x) + dif y arw(u_y) + dif z arw(u_z) $

En faisant varier $dif x$, $dif y$ et $dif z$. \
On obtient un parallépipède de coté $dif x$, $dif y$ et $dif z$.
On appelle le volume de ce parallépipède le volume élémentaire:
$ dif tau = dif x dif y dif z $

Ce parallépipède possède 3 faces élémentaire:
- Une perpendiculaire à $arw(u_x)$, de surface $dif y dif z = dif S_x$
- Une perpendiculaire à $arw(u_y)$, de surface $dif x dif z = dif S_y$
- Une perpendiculaire à $arw(u_z)$, de surface $dif y dif x = dif S_z$

== Coordonées cylindriques

Lorsque notre système tourne autour d'un point fixe, il sera souvent beaucoup plus simple d'utiliser directement un repère cylindrique, plutôt que des coordonées cartésiennes.

#figure(caption: [Repère cylindriques], image("cylindre.png", width: 50%))

On va regarder ce qui se passe dans le plan $arw(x) arw(y)$.

On prend $M_P$ le projeté orthogonal de $M$ dans le plan $arw(x) arw(y)$

#figcan({
	import draw: *
	arrow((-4, 0), (4, 0))
	arrow((0, -2), (0, 2))

	point((2, 1), value: $M_P$)
	line((0, 0), (2, 1))
	content((1, 0.8), $r$)
	cetz.angle.angle((0, 0), (1, 0), (2, 1), radius: 1)
	content((1.2, 0.3), $theta$)
})

On prend la distance $O M_P$ dans ce plan, ainsi que l'angle $theta$ entre $arw(O M_P)$ et le vecteur $arw(x)$

Coordonées cylindriques:
- $r ->$ La distance $O M_P$ (qui est positive)
- $theta in [0; 2 pi[$ 
- $z$, la hauteur, la même que dans les coordonées cartesiennes

Autrement dit, on utilise des coordonnées polaires pour $x$ et $y$, et des coordonées cartésiennes pour $z$.

=== Conversion depuis les coordonées cartésiennes

On a:
$ r = O M_P = sqrt(x^2 + y^2) $
$ tan theta = y / x $
$ theta = cases(
	arctan(y/x) "si" x >= 0 "et" y >= 0,
	arctan(y/x) + pi "si" x < 0 "et" y >= 0,
	arctan(y/x) + pi "si" x > 0 "et" y < 0,
	arctan(y/x) + 2pi "si" x < 0 "et" y < 0,
) $
$ z = z $

=== Conversion vers coordonées cartésiennes

$ cases(x = r cos theta,
 y = r sin theta,
 z = z) $

=== Base mobile

On se place dans les coordonées polaires.

On a la base du repère polaire $(arw(u_x), arw(u_y))$

On va prendre la base locale du point $M_P$.
On pose $arw(u_r)$ le vecteur unitaire $hat(O M_P)$ et $arw(u_theta)$ son vecteur orthogonal unitaire (afin de former une base orthonormé), qu'on prendre dans le sens trigonométrique.

$ cases(
	u_r = arw(x) cos theta + arw(y) sin theta,
	u_theta = - arw(x) sin theta + arw(y) cos theta
) $

#figcan({
	import draw: *
	arrow((-4, 0), (4, 0))
	arrow((0, -2), (0, 2))

	point((2, 1), value: $M_P$, anchor: "north-west")
	line((0, 0), (2, 1))
	content((1, 0.8), $r$)
	cetz.angle.angle((0, 0), (1, 0), (2, 1), radius: 1)
	content((1.2, 0.3), $theta$)

	arrow((2, 1), (3, 1.5), stroke: blue)
	arrow((2, 1), (1.5, 2), stroke: blue)

	content((3.2, 1.6), $arw(u_r)$)
	content((1.6, 2.2), $arw(u_theta)$)
})

On obtient une nouvelle base de l'espace: $(arw(u_r), arw(u_theta), arw(u_z))$

N'importe quel point/vecteur possède une représentation dans cette base et dans la base cartésienne:

$ arw(a) &= a_x arw(u_x) + a_y arw(u_y) + a_z arw(u_z) \
&= a_r arw(u_r) + a_theta arw(u_theta) + a_z arw(u_z)
$

#def[$a_r$]: Composante radiale \
#def[$a_theta$]: Composante orthoradiale \

On peut enfin représenter $arw(O M)$ dans cette base:

$ arw(O M) = arw(O M_P) + arw(M_P M) $
$ arw(O M_P) = r arw(u_r) + 0 times arw(u_theta) $
$ arw(O M) = r arw(u_r) + z arw(u_z) $

#caution[
	Et non pas $arw(O M) = r arw(u_r) + theta arw(u_theta) + z arw(u_z)$

	Le $theta$ est "caché" dans $u_r$, la base est mobile.
]

On peut passer de la base cylindrique vers la base cartésienne:
$ cases(
	arw(u_x) = cos theta arw(u_r) - sin theta arw(u_theta)
) $

=== Déplacement élémentaire

- Pour passer de $x$ à $r + dif r$, le point $M$ s'est déplacé sur $O M_P$
  de $dif r$ dans le sens de $u_r$, d'où un déplacement de $dif r arw(u_r)$
- Pour passer de $z$ à $z + dif z$, le point $M$ subit une translation de $dif z arw(u_z)$
- Pour passer de $theta$ à $theta + dif theta$, le point $M_P$ subit une rotation d'axe $(O, arw(z))$, donc:
  - La distance parcourue vaut $r dif theta$ dans la direction $arw(u_theta)$, d'où: $r dif theta arw(u_theta)$

On a donc:
$ dif arw(O M) = dif r arw(u_r) + r dif theta arw(u_theta) + dif z arw(u_z) $

=== Volume élémentaire

On peut encore apparenter notre déplacement à un mini parallépipède.

On obtient un volume élémentaire:
$ dif tau = r dif r dif theta dif z $

#figure(caption: [Volume élémentaire dans un repère cylindrique], image("cylindre_volume.png", width: 50%))

On peut aussi définir des surfaces élémentaires:
- $dif S_r perp arw(u_r)$ avec $dif S_r = r dif theta dif z$
- $dif S_theta perp arw(u_theta)$ avec $dif S_theta = dif r dif z$
- $dif S_z perp arw(u_z)$ avec $dif S_z = r dif r dif theta$

== Coordonnées sphériques

#note[
	Convention:
	#canvas({
		import draw: *
		circle((0, 0), radius: 0.15)
		circle((0, 0), radius: 0.05, fill: black)
		content((0.3, 0), [Vecteur pointant vers nous], anchor: "west")

		translate((0, -0.6))
		circle((0, 0), radius: 0.15)
		line((-0.05, -0.05), (0.05, 0.05))
		line((0.05, -0.05), (-0.05, 0.05))
		content((0.3, 0), [Vecteur pointant à l'opposé], anchor: "west")
	})
]


#figure(caption: [Repère sphérique], image("sphere.png", width: 60%))

On va directement définir $r$ comme la distance $O M$:
$ r = sqrt(x^2 + y^2 + z^2) $

#caution[L'angle $theta$ des coordonnées sphériques n'a rien à voir avec l'angle $theta$ des coordonnées cylindriques]

On projete $M$ sur le plan $arw(x) arw(y)$ pour obtenir $M_P$

On a:
- $phi$ l'angle entre $arw(x)$ et $arw(O M_P)$, avec $phi in [0; 2pi[$
- $theta$ l'angle entre $arw(z)$ et $arw(O M)$, avec $theta in [0; pi[$

#figcan({
	import draw: *
	arrow((0, 0, 0), (3, 0, 0))
	arrow((0, 0, 0), (0, 3, 0))
	arrow((0, 0, 0), (0, 0, 3))

	content((3.2, 0, 0), $arw(u_y)$)
	content((0, 0, 3.2), $arw(u_x)$)
	content((0, 3.2, 0), $arw(u_z)$)

	on-xz({
		cetz.angle.angle((0, 0), (0, 2), (2, 2))
		content((0.4, 1), $phi$)
	})

	rotate(y: 45deg)
	on-yz({
		cetz.angle.angle((0, 0), (0, 3), (3, 2))
		content((0.5, 0.8), $theta$)
	})
	rotate(y: -45deg)

	point((2, 2, 2), value: $M$, anchor: "south-west")

	line((0, 0, 0), (2, 0, 2))
	line((2, 0, 2), (2, 2, 2), stroke: (dash: "dotted"))
	point((2, 0, 2), value: $M_P$, anchor: "north-west")

	line((0, 0, 0), (2, 2, 2))
})

\
=== Conversion en coordonées cartésiennes

On s'intéresse aux plans:
- $arw(u_x) arw(u_y)$, le plan équatorial
#figcan({
	import draw: *
	arrow((-3, 0), (3, 0))
	arrow((0, 2), (0, -2))

	content((3.2, 0), $arw(u_x)$)
	content((0, -2.2), $arw(u_y)$)

	point((2, -1), value: $M_P$, anchor: "north-west")
	line((0, 0), (2, -1))
	cetz.angle.angle((0, 0), (0, -1), (2, -1))
	content((0.5, -0.5), $phi$)

	line((0, -1), (2, -1), stroke: (paint: red))
	content((1, -1.2), $y$)

	line((0, 0), (0, -1), stroke: (paint: red))
	content((-0.3, -0.5), $x$)

	line((-2, 1), (0, 0), stroke: (paint: green, dash: "dashed"))
	content((-2.2, 1.2), [Plan méridien])
})
- $O M_P M$, le plan méridien
#figcan({
	import draw: *
	arrow((-3, 0), (3, 0))
	arrow((0, -2), (0, 2))

	content((0, 2.2), $arw(u_z)$)

	point((2, 0), value: $M_P$, anchor: "north-west")
	point((2, 1.5), value: $M$, anchor: "north-west")

	line((0, 0), (2, 1.5))
	cetz.angle.angle((0, 0), (0, 1), (2, 1.5))
	content((0.3, 0.7), $theta$)

	line((2, 0), (2, 1.5), stroke: (dash: "dotted"))
	cetz.angle.angle((2, 1.5), (0, 0), (2, 0))
	content((1.8, 0.8), $theta$)

	content((2.2, 0.75), $z$)
})

Ce qui nous donne:
- Dans le plan équatorial:
  $ cos phi &= x/(O M_P) = x / (r sin theta) \
x &= r sin theta cos phi
$
  $ sin phi &= y/(O M_P) = y / (r sin theta) \
y &= r sin phi sin theta
$
- Dans le plan méridien:
$ cos theta &= z / r \ z &= r cos theta $

=== Conversion vers coordonées sphériques

On a, assez simplement:
$ r = O M = sqrt(x^2 + y^2 + z^2) $

Pour trouver les angles, on utilise les fonctions trigonométriques réciproques:
- Pour $theta$:
  - Avec le $cos$:
    $ cos theta = z / r = z / sqrt(x^2 + y^2 + z^2) $
  - Avec la $tan$:
    $ tan theta = (sin theta) / (cos theta) = (O M_P)/z $
    $ tan theta = sqrt(x^2 + y^2)/z $
- Pour $phi$:
  - $ tan phi = (sin phi)/(cos phi) = (r sin phi sin theta)/(r cos phi sin theta) = y/x $

=== Base mobile


On pose la base $(arw(u_r), arw(u_theta), arw(u_phi))$:

On pose aussi le vecteur "joker" $arw(u)$, qui est orthogonal à $arw(u_phi)$ dans le plan équatorial, et qui simplifie le calcul des vecteurs de la base.

$arw(u_theta)$ va dans le même sens que $theta$, et $arw(u_phi)$ va dans le même sens que $phi$.

#figcan({
	import draw: *
	arrow((-3, 0), (3, 0))
	arrow((0, -2), (0, 2))

	content((0, 2.2), $arw(u_z)$)

	point((2, 0), value: $M_P$, anchor: "north-west")
	content((2, 1.5), $M$, anchor: "south-east", padding: 0.1)

	line((0, 0), (2, 1.5))
	cetz.angle.angle((0, 0), (0, 1), (2, 1.5), mark: (start: ">"))
	content((0.3, 0.7), $theta$)

	arrow((2, 1.5), (3, 2.25), stroke: blue)
	arrow((2, 1.5), (2.75, 0.5), stroke: blue)
	content((3.3, 2.3), $arw(u_r)$)
	content((3, 0.5), $arw(u_theta)$)

	arrow((0, 0), (1, 0), stroke: green)
	content((0.8, -0.3), $arw(u)$)
})

Le vecteur orthogonal à $arw(u_r)$ et $arw(u_theta)$ est orthogonal au plan méridien:

#figcan({
	import draw: *
	arrow((-3, 0), (3, 0))
	arrow((0, 2), (0, -2))

	content((3.2, 0), $arw(u_x)$)
	content((0, -2.2), $arw(u_y)$)

	point((2, -1), value: $M_P$, anchor: "north-east")
	line((0, 0), (2, -1))
	cetz.angle.angle((0, 0), (0, -1), (2, -1))
	content((0.5, -0.5), $phi$)

	arrow((2, -1), (2.75, -0.25), stroke: blue)
	content((2.8, -0.8), $arw(u_phi)$)

	arrow((2, -1), (2.75, -1.375), stroke: green)
	content((2.9, -1.4), $arw(u)$)
})

On a donc:
$ arw(u) = cos phi arw(u_x) + sin phi arw(u_y) $
$ arw(u_phi) = - sin phi arw(u_x) + cos phi arw(u_y) $
$ arw(u_r) &= cos phi arw(u_z) + sin theta arw(u) \
&= cos phi arw(u_z) + sin theta cos phi arw(u_x) + sin theta sin phi arw(u_y)
$
$ arw(u_theta) &= - sin theta arw(u_z) + cos theta arw(u) \
&= - sin theta arw(u_z) + cos theta cos phi arw(u_x) + cos theta sin phi arw(u_y) $

=== Déplacement élémentaire

Le déplacement par rapport à $r$ est plutôt simple:
$ r --> r + dif r <=> dif r arw(u_r) $

Le déplacement par rapport à $theta$ se rapporte à se déplacer de $theta$ sur le cercle de centre $O$ de rayon $r$ (la coupe de la sphere par le plan méridien), d'où:
$ theta --> theta + dif theta <=> r dif theta arw(u_theta) $

Le déplacement par rapport à $phi$ se rapport à déplacer $M_P$ sur le cercle
de centre $O$, et de rayon $O M_P = r sin theta$ (le rayon est plus petit si on se rapproche des pôles et plus grand si on se rapproche de l'équateur), d'où:
$ underbrace(r sin theta, "rayon") underbrace(dif phi, "angle") $
Un rayon $times$ un angle est une distance, et elle est parcourue dans la direction de $arw(u_phi)$:
$ phi --> phi + dif phi <=> r sin theta dif phi arw(u_phi) $

On obtient donc le déplacement élémentaire:
$ dif arw(O M) = dif r arw(u_r) + r dif theta arw(u_theta) + r sin theta dif phi arw(u_phi) $
$ dif tau = r^2 sin theta dif r dif theta dif phi $

Et les surfaces perpendiculaires:
- $dif S_r = r^2 sin theta dif theta dif phi$
- $dif S_theta = r sin theta dif r dif phi$
- $dif S_phi = r dif r dif phi$

= Dérivée d'un vecteur unitaire tournant par rapport à son angle de rotation

== Cas des coordonées polaires

On se place en coordonées polaires:
#figcan({
	import draw: *
	arrow((-3, 0), (3, 0))
	arrow((0, -2), (0, 2))

	arrow((0, 0), (2, 2))
	content((2.2, 2.2), $r$)

	cetz.angle.angle((0, 0), (1, 0), (2, 2))
	content((0.8, 0.4), $theta$)

	arrow((0, 0), (1, 0), stroke: green)
	content((0.8, -0.4), $arw(u_x)$)
	arrow((0, 0), (0, 1), stroke: green)
	content((-0.4, 0.8), $arw(u_y)$)

	rotate(45deg)
	arrow((0, 0), (1, 0), stroke: red)
	content((1.1, 0.3), $arw(u_r)$)
	arrow((0, 0), (0, 1), stroke: red)
	content((-0.4, 0.8), $arw(u_theta)$)
})

$ cases(
	arw(u_r) = cos theta arw(u_x) + sin theta arw(u_y),
	arw(u_theta) = -sin theta arw(u_x) + cos theta arw(u_y)
) $

On dérive $arw(u_r)$:
$ (dif arw(u_r))/(dif theta) = - sin theta arw(u_x) + cos theta arw(u_y) = arw(u_theta) $

$ (dif arw(u_theta))/(dif theta) = - cos theta arw(u_x) - sin theta arw(u_y) = -arw(u_r) $

Dériver le vecteur unitaire polaire correspond à le faire tourner d'un angle $pi/2$ 

== Cas général

On prend $hat(u)$ un vecteur unitaire, tournant d'un angle $alpha$

On cherche $(dif hat(u))/(dif alpha)$

On a $hat(u)$ unitaire, donc:
$ ||hat(u)||^2 = 1 = hat(u) dot hat(u) $
$ (dif ||hat(u)||^2)/(dif alpha) &= hat(u) dot (dif hat(u))/(dif alpha) + (dif hat(u))/(dif alpha) dot hat(u) \
&= 2 hat(u) dot (dif hat(u))/(dif alpha) \
&= (dif (1))/(dif alpha) = 0
$

Donc: $ hat(u) dot (dif hat(u))/(dif alpha) = 0 $
$hat(u)$ est un vecteur unitaire, donc ne peut pas être nul. \
Donc la dérivée d'un vecteur unitaire sera forcément orthogonal à ce vecteur.

== Base de Frenet

#def[Base de Frenet]: Quatrième solution pour se repérer dans l'espace, liée à la trajectoire que l'on va suivre. \
On définit l'abscisse curviligne comme la distance sur la trajectoire que l'on suit. \
On définit alors un vecteur unitaire $arw(u_t)$ qui va suivre la trajectoire, et un vecteur normal $arw(u_n)$ orthogonal à $arw(u_t)$.
Le vecteur normal devera toujours pointer vers l'intérieur de la concavité de la courbe.

Das le cas circulaire, on a donc $arw(u_t) = arw(u_theta)$ et $arw(u_n) = -arw(u_n)$

#figcan({
	import draw: *

	circle((0, 0), name: "c", radius: 1.5)

	let tangent(shape, percent, ..style) = {
		arrow(
			shape + "." + str(percent) + "%", 
			(
				shape + "." + str(percent) + "%",
				1,
				shape + "." + str(percent + 1) + "%"
			), 
			..style
		)
	}

	tangent("c", 10, stroke: red)
	tangent("c", 50, stroke: red)

	arrow("c.10%", ("c.10%", 1, "c"), stroke: green)
	arrow("c.50%", ("c.50%", 1, "c"), stroke: green)

	translate((0, -3))

	catmull((-1, 0.5), (0, 0), (1, 1), (2, -1), (5, 0), name: "c")

	tangent("c", 10, stroke: red)
	tangent("c", 40, stroke: red)
	tangent("c", 60, stroke: red)
})

On a:
$ (dif arw(u_t))/(dif s) = arw(u_n)/R $
Avec $R$ le rayon de courbure.
