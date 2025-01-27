#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Approche énergetique]

= Travail et puissance d'une force

== Notations

On considère un point $M$, dans un référentiel $cal(R)$,
auquel on applique une force $arw(F)$,
et qui est animé d'une vitesse $arw(v)_(\/cal(R)) (M)$

On a un déplacement élémentaire:
$ dif arw(O M) = lim_(dif t -> 0) arw(M (t) M(t + dif t)) $

== Puissance d'une force

On définit la puissance d'une force par:
$ cal(P) = arw(f) dot arw(v) (M) $

#note[La puissance dépend donc du référentiel]

La puissance est donc un scalaire. 
La méthode énergétique transforme donc des relations
vectorielles en relations scalaires.
On perd de l'information.

- Si $cal(P) > 0$, la force est dite motrice, elle travaille dans le sens
  de la vitesse
- Si $cal(P) < 0$, la force est résistante, elle s'oppose au mouvement

== Travail élémentaire

On sait que la puissance est une énérgie 
appliqué pendant un certain temps:

$ cal(P) = "énérgie"/"temps" $
$ "travail" = "grandeur énergétique" $

#warn[Le travail dépend du chemin suivi.]

On pose le travail élémentaire (infinitésimal):
$ delta W = cal(P) dif t $

Ainsi que le travail intégral:
$ W = Delta t $

On utilise pas les même variables selon les situations:

Pour une variable quelconque $G$:

#figure(table(
	columns: 3,
	[], [Dépendante du chemin suivi], [Indépendante du chemin suivi],
	[Intégrale], $G$, $Delta G$,
	[Différentielle], $delta G$, $dif G$,
	[Exemple], [Travail $W$], [$E_c$]
))

On a:
$ delta W = arw(f) dot arw(v)_(\/cal(R)) (M) dot dif t $
$ delta W = arw(f) dot dif arw(O M) $

Cela correspond au travail observé pendant un petit déplacement $dif arw(O M)$:

#figcan({
	import draw: *
	point((0, 0), value: $M(t)$)
	point((2, -1), value: $M(t + dif t)$, anchor: "south-west")

	arrow((0, 0), (2, 0.5), stroke: red)
	arrow((0, 0), (2, -1))

	content((2.5, 0.5), $arw(F)$)
})

== Travail au cours d'un déplacement

Pour obtenir le travail complet, on fait la somme de ces petits
travaux:
$ W_(1->2) (arw(F)) = integral_("etat 1")^("etat 2") delta W (arw(F))
= integral_("etat 1")^("etat 2") cal(P)(arw(F)) dif t
= integral_("etat 1")^("etat 2") arw(F) dot dif arw(O M )
$

= Théorème de l'énergie cinétique

== Énergie cinétique

On s'est intéressé aux grandeurs mécaniques associées aux actions mécaniques.
Pour faire le lien avec les causes des mouvements, 
on va définir l'énergie cinétique.

$ E_(c \/cal(R)) (M) = 1/2 m v_(\/cal(R))^2 (M) 
= 1/2 m arw(v)_(\/cal(R)) dot arw(v)_(\/cal(R))
$

L'énergie cinétique dépend du point où on se place. \
Dès lors que l'on connait la vitesse en des point $M_1$ et $M_2$, 
on peut calculer l'énergie cinétique en ces points.

On ne sait pas ce qu'il s'est passé entre les points $M_1$ et $M_2$.

L'énergie cinétique est donc une grandeur indépendante du chemin suivi.

On a:
$ dif E_c (M) = m arw(v)_(\/cal(R)) (M) dot dif arw(v)_(\/cal(R)) (M) $
$ Delta E_c = E_c (M_2) - E_c (M_1) = 1/2 m v^2(M_2) - 1/2 m v^2 (M_1) $

#note[
	Rigueur mathématique:
	- Le $dif$ signigie différentielle totale exacte
	- Le $delta$ signifie forme différentielle
	On peut passer d'une forme différentielle à la différentielle totale
	exacte si les fonctions dérivées respectent certaines conditions.
]

== Théorème de l'énergie cinétique

#theorem[
	La variation d'énergie cinétique est égale à la somme des travaux des forces qui s'appliquent.

	$ dif E_c = sum_i delta W (arw(f)_i) "  (i)" $
	$ Delta E_c = sum_i W(arw(f)_i) "  (ii)" $
]

Pour passer de la forme (i) à la forme (ii), on fait un calcul d'intégral.

=== Démonstration

#let ref = $\/cal(R)$

On a, pour la forme (i):
$ dif E_c = m arw(v)_ref (M) dot dif arw(v)_ref (M) $
D'après le principe fondamental, la quantité de mouvement est égal à
la somme des forces:
$ m arw(a)_ref (M) = sum_i arw(f)_i $
D'où:
$ m dif arw(v)_ref (M) = ( sum_i arw(f)_i ) dif t $
Ainsi, on substitue $m dif arw(v)_ref (M)$:
$ dif E_c = arw(v)_ref (M) dot (sum_i arw(f)_i) dif t $
On rentre le $dif t$ dans la vitesse:
$ dif E_c = sum_i arw(f)_i dif arw(O M) $
#resultb[ $ dif E_c = sum_i delta W (arw(f)_i) $ ]

#pagebreak()

== Utilisation du théorème de l'énergie cinétique - Interêt

On fera une utilisation similaire au principe fondamental 
au théorème de l'énergie cinétique.

Soit: 
- On connait les forces, et on trouve les variations sur l'énergie cinétique. \
  Comme on travail surtout avec des systèmes à masse fixe,
  le théorème de l'énergie cinétique nous donne en réalité l'évolution
  du module de la vitesse.

#tip[
	Si on a juste besoin de la vitesse scalaire
	(pour montrer qu'un mouvement est uniform ou accéléré, par exemple),
	ce sera beaucoup plus rapide de passer directement par
	le théorème de l'énergie cinétique, que d'appliquer
	le principe fondamental et d'obtenir les équations horaires.
]

Soit:
- Entre deux points, on connait la variation de l'énergie cinétique.
  Si on connait le travail de toutes les forces sauf une,
  on peut appliquer le TEC pour trouver la valeur de son travail
  (et non la véritable force).


#note[
	Dans un système à un degré de liberté,
	le théorème de l'énergie cinétique ne perd aucune information.
]

== Exemples

===

#image("exo1.png")

1. 
$ E_c_1 = 1/2 m v_0^2 $
$ E_c_f = 0 $

2.
On définit notre système: le point $M$.
On se place dans le référentiel terrestre galiléen.
On fait le bilan des forces:
- Le poids $m arw(g)$
- Réaction normale $arw(R_N)$
- Force de frottement $- F_0 arw(u_x)$
On a que le poids est orthogonal au mouvement,
et que $arw(R_N)$ est orthogonal au mouvement

On calcul le travail:
$ delta W &= arw(F) dif arw(O M) \
&= - F_0 arw(u_x) dot dif x arw(u_x) $

$ delta W &= - F_0 dif x $ 
$ W &= - integral_0^(M_0) F_o dif x \
&= - F_0 O M_0 \
&= - F_0 D
$

3.
On applique le théorème de l'énergie cinétique:
$ Delta E C = 1/2 m v_f^2 - 1/2 m v_i^2 = - 1/2 m v_0^2 $

$ Delta E C = W(m arw(g)) + W(arw(R_N)) + W(arw(F)) $
$ -1/2 m v_0 ^2 = - F_0 D $
$ v_0 = sqrt((2 F_0 D)/(m)) approx 0.27 " "upright(m dot s^(-1) ) $

===

#figure(image("exo2.png"))

#figcan({
	import draw: *
	arrow((0, -1), (0, 3))
	line((-2, 0), (2, 0))
	
	arc((0, 0), start: 0deg, stop: 180deg, anchor: "origin", radius: 2, name: "a")
	point("a.30%", name: "p")
	arrow("p", ("a.origin", 3, "p"))
	arrow("p", ("a.30%", 1, "a.29%"))

	arrow("p", ("p", "|-", (1, 0)), stroke: red)
	arrow("p", ("a.origin", 3.5, "p"), stroke: red)
	content((0.7, 0.4), $m arw(g)$)
	content((2.5, 2.5), $arw(R_N)$)
})

On définit notre système, le point matériel $M$.
On se place dans le référentiel terrestre galiléen.
On fait un bilan des forces:
- Le poids $m arw(g)$
- On se place sur de la glace, on considère que les frottements sont nuls.
  Donc on considère une réaction normale $arw(R_N)$

On établit l'équation différentielle du mouvement:
+ Première méthode, par principe fondamental:
  - $ m arw(a) = m arw(g) + arw(R_N) $
  - On va projeter.
	- On peut soit projeter dans les coordonées polaires, \
	  soit projeter sur les axes $arw(u_x)$ et $arw(u_y)$
	- Projeter sur les coordonées polaires permet de dégager
	  $arw(R_N)$, dont on ne connait pas la norme.
  - On projette sur $arw(u_theta)$:
	$ arw(a) = arw(u_r) (diaer(r) - r dot(theta)^2) + arw(u_theta) (2 dot(r) dot(theta) + diaer(theta) r) $
	Ici, $r$ est constant, donc $dot(r) = 0$ et $diaer(r) = 0$, donc:
	$ arw(a) = - arw(u_r) r dot(theta)^2 + arw(u_theta) diaer(theta) r  $
	$ m r diaer(theta) = 0 + m g sin theta $
	#resultb[$ diaer(theta) - g/r sin theta = 0 $]
+ Deuxième méthode, on passe par l'énergie.
  Le passage par l'énergie est pertinent:
  il n'y a qu'un seul paramètre de position, $theta$, et
  l'inconnue $arw(R_N)$ ne travaille pas.
  
  On applique le théorème de l'énergie cinétique:
  $ dif E_c = sum_i delta W (arw(f)_i) $
  On intègre:
  $ Delta E_c = sum_i W (arw(f)_I) $
  
  De plus, $E_c = 1/2 m v^2$
  On se place en coordonées polaires:
  $r = a$, $r$ est constant donc $dot(r) = 0$
  D'où: $ arw(v) = r dot(theta) arw(u_theta) $
  
  $ E_c = 1/2 m (a dot(theta))^2 $
  $ E_c = 1/2 m a^2 dot(theta)^2 $
  
  $arw(R_N) perp$ au déplacement, donc:
  $ delta W (arw(R_N)) = 0 = W (arw(R_N)) $
  $ delta W (m arw(g)) = m arw(g) dot dif arw(O M) $
  $ delta W (m arw(g)) &= m g a dif theta cos(pi/2 - theta) \
  &= m g a sin theta dif theta $
  Ainsi:
  $ m arw(g) = - m g cos theta arw(u_r) + m g sin theta arw(u_theta) $
  $ dif arw(O M) = underbrace(dif a arw(u_r), = 0) + a dif theta arw(u_theta)  $
  $ m arw(g) dot dif arw(O M) = m g a sin theta dif theta $
  $ (dif E_c)/(dif t) = 1/2 m a^2 2 diaer(theta) (dif theta)/(dif t) $
  $ dif E_c &= m a^2 diaer(theta) dif theta \
  &= m g a sin theta dif theta $
  $ a diaer(theta) = g sin theta $
  D'où:
  #resultb[$ diaer(theta - g/a sin theta = 0) $]
  
  On peut alternativement passer par la forme intégrale:
  $ E_c (t) - E_c (0) &= W (m arw(g) + W (arw(R_N)) \
  &= integral_0^t m g a sin theta underbrace(dot(theta), (dif theta)/(dif t)) dif t \
  &= integral_(theta(0))^(theta(t) = theta) m g a sin theta dif theta \
  &= m g a [- cos theta]_0^theta \
  &= - m g a cos theta + m g a \
  &= m g a (1 - cos theta)
  $
  On a aussi:
  $ E_c (t) - E_c (0) &= 1/2 m a^2 dot(theta)^2 -
  1/2 m a^2 underbrace(dot(theta)^2 (0), =0) $
  Donc:
  $ 1/2  a^2 dot(theta)^2 = m g a (1 - cos theta) $
  On dérive:
  $ 1/2 m a^2 2 dot(theta) diaer(theta) = m g a sin theta dot(theta) $
  $ dot(theta) ( a diaer(theta) - g sin theta) = 0 $
  Pour avoir un mouvement, il faut que $dot(theta) != 0$, donc:
  #resultb[$ a diaer(theta) - g sin theta = 0 $]

Question 2:
On sait que la réaction est dans l'axe $arw(u_r)$, mais on ne connait pas sa norme.
Une méthode énergétique est proscrite, cette force ne travaillant pas.

On projette le principe fondamental sur $arw(u_r)$:
$ m (underbrace(diaer(a), = 0) - a dot(theta)^2) = R_N - m g cos theta $
$ - m a dot(theta)^2 = R_N - m g cos theta  $
$ R_N = m g cos theta - m a dot(theta)^2 $

Lorsqu'on a traduit le théorème de l'énergie cinétique de manière intégrale, on récupère:
$ m a dot(theta)^2 = 2 m g (1 - cos theta) $

On le réinjecte:
$ R_N &= m g cos theta + (-2 m g + 2 m g cos theta) \
&= 3 m g cos theta - 2 m g \
&= m g (3 cos theta - 2)
$

Question 3:
On a décollage lorsqu'il n'y a plus de réaction du support:
$ R_N = 0 $

On a $m g != 0$, donc on veut:
$ 3 cos theta - 2 = 0 <=> cos theta = 2/3 $
$ theta = arccos(2/3) approx 48 degree $

Après décollage, il y a un mouvement de chute libre uniforme.

#pagebreak()

= Energie potentielle et  forces conservatives

== Définition

Une force $arw(f)$ est conservative (ou dérive d'un potententiel)
si le travail effectué par $arw(f)$ est indépendant du chemin suivi.

C'est à dire que:
$ delta W (arw(f)) = - dif E_p $

== Interprétation physique

On suppose que $arw(f)$ est conservative.
On applique le théorème de l'énergie cinétique:
$ dif E_c = delta W (arw(f)) = - dif E_p $

$ dif E_c = - dif E_p <=> dif (E_c + E_p) = 0 $
Donc:
$ E_c + E_p = "constante" $

L'énergie totale d'un système est conservée.

On appelle énergie mécanique la somme des énergies cinétiques et de potentiel.

$ E_m = E_c + E_p $

Dans le cas général, il y aura des forces non conservatives.
On pourra utiliser l'énergie potentielle avec les forces
conservatives, mais pour les forces non conservatives, on sera
constraint d'utiliser $W (arw(f))$ et $delta W(arw(f))$

On a:
$ dif E_c &= sum_i delta W (arw(f)_i) \
&= sum_(i,c) delta W(arw(f)_(i,c)) + sum_(i,"nc") delta W (arw(f)_(i,"nc")) \
&= - dif E_p + sum_(i,"nc") delta W (arw(f)_(i,"nc")) 
$

Donc $dif E_m != 0 $ dans la majorité des cas.

== Notion de gradient

Un gradient est une fonction scalaire $f$ de l'espace.
Par exemple:
$ f(x, y, z) = ..., f(r, theta, z) = ..., f(r, theta, phi) = ... $

#let grad = arw("grad")

On définit $grad$ par: 
$ grad f(M) dot dif arw(O M) = dif f  $

On va se placer dans différents systèmes de coordonées:

=== Cartésiens

Avec $f(x, y, z)$:

$ diff f = 
((diff f)/(diff x))_(y,z) dif x 
+ ((diff f)/(diff y))_(x,z) dif y
+ ((diff f)/(diff z))_(x,y) dif z
$

$ dif arw(O M) = dif x arw(u_x) + dif y arw(u_y) + dif z arw(u_z) $
$ grad f(M) dot dif arw(O M) 
&= vec(grad_x f(M), grad_y f(M), grad_z f(M)) dot vec(dif x, dif y, dif z) \
&= grad_x f dot dif x + grad_y f dot dif y + grad_z f dot dif z
$

Donc, par identification (on peut identifier car on est dans une base orthonormée):
$ grad f(M) = (diff f)/(diff x) arw(u_x) + (diff f)/(diff y) arw(u_y) + (diff f)/(diff z) arw(u_z) $

=== Cylindriques

Avec $f(r, theta, z)$
$ diff f = (diff f)/(diff r) dif r + (dif f)/(dif theta) dif theta
+ (diff f)/(diff z) dif z
$

$ grad f &= (grad f)_r arw(u_r) + (grad f)_theta arw(u_theta) + 
(grad f)_z arw(u_z) $
$ dif arw(O M) = dif r arw(u_r) + r dif theta arw(u_theta)
+ dif z arw(u_z)
$

On identifie:
$ grad f = (diff f)/(diff r) arw(u_theta)
+ 1/r (diff f)/(diff theta) 
+ (diff f)/(diff z) arw(u_z)
$

=== Sphériques
$ diff f = (diff f)/(diff r) dif r
+ (diff f)/(diff theta) dif theta
+ (diff f)/(diff phi) dif phi
$

$ grad f = (grad f)_r arw(u_r)
+ (grad f)_theta arw(u_theta)
+ (grad f)_phi arw(u_phi)
$
