#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Cinématique]

= Description cinématique

== Référentiel et temps absolu

#def[Référentiel]: Un repère pour se repérer dans l'espace, et une horloge pour mesurer le temps.

#warn[
	La base peut-être variable. Ce qui compte, c'est l'observateur. \
	Par exemple, la Terre, ou un vélo.
]

== Position, équations horaires, trajectoires

#def[Position]: Le vecteur position $arw(O M)$ d'un point. On peut bien sûr l'écrire dans n'importe quelle base: \
$ arw(O M )
&= x(t) arw(u_x) + y(t) arw(u_y) + z(t) arw(u_z) \
&= r(t) arw(u_r) + theta(t) arw(u_theta) + z(t) arw(u_z) \
&= r(t) arw(u_r) + theta(r) arw(u_theta) + phi(t) arw(u_phi)
$

#def[Équations horaires]: Système d'équations décrivant l'évolution de la vitesse par rapport au temps:
$ cases(x(t), y(t), z(t)) "en cartésien, "
cases(r(t), theta(t), z(t)) "en cylindrique, "
cases(r(t), theta(t), phi(t)) "en sphérique" $

#def[Équations de trajectoire]: Système d'équations indépendantes du temps décrivant la trajectoire d'un point.
$ f(x, y, z) = 0 "en cartésien" \
g(r, theta, z) = 0 "en cylindrique" \
h(r, theta, phi) = 0 "en sphérique"
$

On cherchera en général à obtenir les équations de trajectoire avec les équations horaires.

== Vitesse

#def[Vitesse]: Le vecteur vitesse $arw(v_(\/R)) (M) = (dif arw(O M))/(dif t)$ (avec $R$ le référentiel)

== Accélération

#def[Accélération]: Le vecteur accélération $arw(a_(\/R)) (M) = (dif arw(v_(\/R)) (M))/(dif t) = (dif^2 arw(O M))/(dif t^2)$

= Expression de la vitesse et de l'accélération

== Coordonées cartésiennes

On a:
$ arw(O M) = x(t) arw(u_x) + y(t) arw(u_y) + z(t) arw(u_z) $

Pour récuperer les coordonées de la dérivée, on peut dériver les coordonnées du vecteur position individuellement (car les coordonées de la base ne dependent pas du temps)
$ arw(v_(\/R)) (M) &= (dif arw(O M))/(dif t)  \
&= (dif x)/(dif t) arw(u_x) + (dif y)/(dif t) arw(u_y) + (dif z)/(dif t) arw(u_z) \
&= dot(x) arw(u_x) + dot(y) arw(u_y) + dot(z) arw(u_z)
$

On remarque que $dif arw(O M)$ est le déplacement élémentaire. La vitesse est un déplacement élémentaire effectué pendant un intervalle de temps infinitésimal.

De même:

$ arw(a_(\/R)) (M) &= (dif^2 x)/(dif t^2) arw(u_x) + (dif^2 y)/(dif t^2) arw(u_y) + (dif^2 z)/(dif t^2) arw(u_z) \
&= diaer(x) arw(u_x) + diaer(y) arw(u_y) + diaer(z) arw(u_z)
$

== Coordonées cylindriques

On utilise le déplacement élémentaire:
$ dif arw(O M) = dif r arw(u_r) + r dif theta arw(u_theta) + dif z arw(u_z) $

#warn[Si on utilise cette méthode de démonstration pour la dérivée de la vitesse, il faut redémontrer le déplacement élémentaire (voir Chapitre 1)]

Pour obtenir la vitesse, on divise par $dif t$:
$ arw(v_(\/R)) (M) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) + dot(z) arw(u_z) $

Sinon, on peut partir directement du vecteur position, et on le dérive:
$ arw(O M) = r arw(u_r) + z arw(u_z) $
$ arw(v) = (dif r)/(dif t) arw(u_r) + r (dif arw(u_r))/(dif t) + (dif z)/(dif t) arw(u_z) "(on ne met pas de " (dif arw(u_z))/(dif t) "car le vecteur z ne change pas)" $

On a:
$ (dif arw(u_r))/(dif t) &= (dif arw(u_r))/(dif theta) (dif theta)/(dif t) \
&= arw(u_theta) (dif theta)/(dif t) = arw(u_theta) dot(theta)
$
#warn[Démonstration à faire sur copie, on l'a déjà faîte au Chapitre 1]

D'où:
$ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) + dot(z) arw(u_z) $

Pour l'accélération, on dérive à nouveau:
$ arw(a) &= (dif arw(v))/(dif t) \
&= dif/(dif t) (dot(r) arw(u_r) + r dot(theta) arw(u_theta) + dot(z) arw(u_z)) \
&= diaer(r) arw(u_r) + dot(r) dot(arw(u_r)) + dot(r) dot(theta) arw(u_theta) + r diaer(theta) arw(u_theta) + r dot(theta) dot(arw(u_theta)) + diaer(z) arw(u_z) \
&= arw(u_r) (diaer(r) - r dot(theta)^2) + arw(u_theta) (2 dot(r) dot(theta) + r diaer(theta)) + diaer(z) arw(u_z)
$

== Coordonées sphériques

On va récuperer la vitesse avec le déplacement élémentaire (et on va pas tout dériver parce que #emoji.skull)

On a:
$ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) + r sin theta dot(phi) arw(u_phi) $

== Coordonnées intrinsèques = Base de Fresnel

La vitesse est sur le vecteur tangent (car la vitesse est tangente à la trajectoire):
$ arw(v) = dot(s) arw(u_t) $

$ arw(a) = diaer(s) arw(u_t) + dot(s) dot(arw(u_t)) $

#figcan({
	import draw: *
	catmull((-1, 0), (1, 0.5), (2, -1), (4, 1), (5, 0), name: "c")

	set-style(stroke: orange)
	arrow("c.50%", ("c.50%", 1, "c.51%"))
})

On a:
$ (dif arw(u_t))/(dif r) = arw(u_r) $
Avec $dif r$ l'angle sur le cercle approximant la trajectoire localement (courbure)
$ kappa = det(arw(v), arw(a))/norm(arw(a))^3 $

$ (dif arw(u_t))/(dif t) = (dif arw(u_t))/(dif alpha) (dif alpha)/(dif t) = arw(u_r) 1/R (dif s)/(dif t) $
Avec $dif alpha = (dif s)/R$

$ arw(a) &= (dif^2 s)/(dif t^2) arw(u_t) + (dif s)/(dif t) arw(u_r) (dif s)/(dif t) 1/R \
&= diaer(s) arw(u_t) + (dot(s)^2)/R arw(u_r)
$

Dans une trajectoire circulaire:
$ arw(u_t) = arw(u_theta) $
$ arw(u_r) = - arw(u_r) $

$ arw(v) = (dif s)/(dif t) $
$ dot(s) = v $
$ diaer(s) = (dif v)/(dif t) $

$ arw(a) = underbrace((dif v)/(dif t) arw(u_theta), "2") - underbrace(v^2 / R arw(u_r), "1") $

On dit hassoul les coordonées de Fresnel enfait c'est des coordonnées polaires:
$ arw(a) = (diaer(r) - r dot(theta)^2) arw(u_r) + (2 dot(r) dot(theta) + r diaer(theta)) arw(u_theta) $
Si on est sur une trajectoire circulaire:
$ r = R $

$ arw(a) = underbrace(- R dot(theta)^2 arw(u_r), "1") + underbrace(R diaer(theta) arw(u_theta), "2") $

On identifie entre 1 et 2

= Exemples de mouvements
== Mouvement rectiligne

Mouvement le long d'une droite.

$ arw(O M) = x(t) arw(u_x) $

Attention au piège «Mouvement rectiligne sinusoïdale»: \
C'est que $ x(t) = X cos (omega t + phi) $
$ arw(v) = (dif arw(O M))/(dif t) = dot(x) arw(u_x) $
$ dot(x) = - omega X sin(omega t + phi) $
$ diaer(x) = - omega^2 X cos(omega t + phi) $


== Mouvement à accélération constante

On a $arw(a)$ un vecteur constant qu'on note $arw(a_0)$.

On a donc:
$ arw(v) = integral arw(a) = arw(a_0) t + arw(v_0) $

Si $arw(v_0)$ et $arw(a_0)$ sont colinéaires, on aura une trajectoire rectiligne (dans l'axe de $arw(a_0)$ et $arw(v_0)$). \
Sinon, on se déplacera dans le plan défini par ces deux vecteurs.

== Mouvements uniforme, accéléré, décéléré

Un mouvement est dit:
- #def[Uniforme]: si le module de la vitesse reste constant
- #def[Accéléré]: si le module de la vitesse est croissant
- #def[Décéléré]: si le module de la vitesse est décroissant

Dans le cas rectiligne:
- Si le mouvement est uniforme, $arw(v)$ aura une direction et une magnitude constante, donc l'accélération sera nulle
- Si le mouvement est accéléré, l'accélération est dans le même sens que le vecteur vitesse ($arw(a) dot arw(v) = norm(arw(a)) norm(arw(v)) > 0$)
- Si le mouvement est décéléré, l'accélération est opposé au vecteur vitesse ($arw(a) dot arw(v) = norm(arw(a)) norm(arw(v)) < 0$)

== Mouvement circulaire

Avec une trajectoire circulaire, on est dans un plan.
On utilise les coordonées polaires.

En prenant le centre du cercle comme centre de la trajectoire, 
on a l'équation de trajectoire:
$ r = R $

On connait les expressions de $arw(v)$ et $arw(a)$:
$ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) $
$ arw(a) = (diaer(r) - r dot(theta)^2)arw(u_r) + (2 dot(r) dot(theta) + r diaer(theta)) arw(u_theta) $

Or:
$ r = R => dot(r) = 0 "et" diaer(r) = 0 $
$ arw(v) = R dot(theta) arw(u_theta) $
$ arw(a) = - R dot(theta)^2 arw(u_r) + R diaer(theta) arw(u_theta) $

Mouvement circulaire uniforme:
On a $norm(arw(v)) = c$ avec c une constante, donc:
$ R abs(dot(theta)) = c \
abs(dot(theta)) = c/R \
dot(theta) = c/R "par continuité"
$

Donc $diaer(theta) = 0$, donc:
$ arw(a) = underbrace(- R dot(theta)^2 arw(u_r), "constant") $

On aura une accélération "centripète" constante:

#figcan({
	import draw: *
	circle((0, 0), radius: 1, name: "c")

	set-style(stroke: (paint: red, thickness: 2pt))
	arrow("c.30%", ("c.30%", 1, "c.31%"))

	set-style(stroke: (paint: green, thickness: 2pt))
	arrow("c.30%", ("c.30%", 1, "c.center"))
})

= Caractère relatif du mouvement - Changement de référentiel


