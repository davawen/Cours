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

- Si $cal(P) > 0$, la force est dîte motrice, elle travaille dans le sens
  de la vitesse
- Si $cal(P) < 0$, la force est dîte résistante, elle s'oppose au mouvement

== Travail élémentaire

On sait que la puissance est une énérgie 
appliquée pendant un certain temps:

$ cal(P) = "énérgie"/"temps" $
$ "travail" = "grandeur énergétique" $

#warn[Le travail dépend du chemin suivi.]

On pose le travail élémentaire (infinitésimal):
$ delta W = cal(P) dif t $

Ainsi que le travail intégral:
$ W = cal(P) Delta t $

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
$ grad f = (diff f)/(diff r) arw(r)
+ 1/r (diff f)/(diff theta) arw(u_theta)
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

$ dif arw(O M) = dif r arw(u_r) 
+ r dif phi arw(u_phi)
+ r sin(theta) dif theta arw(u_theta)
$

D'où:
$ grad f = (diff f)/(diff r) arw(u_r)
+ 1/r (diff f)/(diff phi) arw(u_phi)
+ 1/(r sin theta) (diff f)/(diff theta) arw(u_theta)
$

#pagebreak()

== Énergie potentielle et gradient

#underline[*Proposition*]: \
Si $arw(f)$ est une force conservative, on peut l'écrire sous la forme
$arw(f) = - grad E_p$

#underline[*Preuve*]: \
Si $arw(f)$ est une force conservative, alors par définition:
$ delta W(arw(f)) = - dif E_p $
Par le définition du gradient:
$ dif E_p = grad E_p dot dif arw(O M) $
On peut reporter $dif E_p$:
$ delta W (arw(f)) = -grad E_p dot dif arw(O M) $
Or, par la définition du travail, on a aussi:
$ delta W(arw(f)) = arw(f) dot dif arw(O M) $
Donc, par identification:
#resultb[$ arw(f) = - grad E_p $]

== Exemple de forces conservatives

#tip[
	Pour montrer qu'une force est conservative, 
	on montrera que le travail $delta W$ a la forme
	$- dif (...)$ ou $- grad (...)$, avec $dif$ l'opérateur différentiel
	et $grad$ le gradient.
]

=== Poids $m arw(g)$

On oriente l'axe $arw(u_z)$ vers le haut.

On veut montrer que le poids est une force conservative.
Pour cela, on veut montrer qu'il dépend d'une énergie potentielle.

$ delta W = m arw(g) dot dif arw(O M) $
Le poids est totalement vertical, donc:
$ delta W = - m g dif z $
$m$ et $g$ sont constants, donc on peut les passer dans la différentielle:
$ delta W = - dif (m g z) $
On l'identifie à une énergie potentielle (c'est homogène tkt):
$ delta W = - dif E_p $

Et on a donc l'expression de l'énergie potentielle:
$ E_p = m g z + C $

=== Force éléctro-statique $arw(f) = q arw(E)$

...avec $q$ la charge électrique et $arw(E)$ le champ électrique.

#note[En première année, on ne s'inquiète pas de la forme
du champ électrostatique: il est toujours donné.]

#parachute[
	Le champ électrique $arw(E)$ est de la forme:
	$ arw(E) = - grad V $
	Avec $V$ le potentiel électrique. 
]

On a donc:
$ arw(f) = q arw(E) = q (- grad V) $
La charge est une constante, donc on peut la passer dans le gradient:
$ arw(f) = - grad (q V) $
Donc $arw(f)$ est une force conservative et l'énergie potentielle
électro-statique est:
$ E_p = q V + C $

=== Force du rappel d'un ressort $arw(F) = - k (l - l_0) arw(u_"ext")$

On se place sur l'axe horizontal $arw(u_x)$:
#figcan({
	import draw: *
	cetz.decorations.coil(line((0, 0), (3, 0)), amplitude: 0.5)
	point((3, 0))
	arrow((3, 0), (4, 0))
	content((4.1, 0), $arw(u_"ext")$, anchor: "west")
})

On prend l'origine des $x$ à la position à vide du ressort,
avec: $x = l - l_0$

On a donc:
$ arw(F) = - k x arw(u_x) $
D'où:
$ delta W &= arw(F) dot dif arw(O M) \
&= - k x arw(u_x) dot (dif x arw(u_x) + dif y arw(u_y) + dif z arw(u_z)) \
&= - k x dif x $

Le $k$ est constant, mais
on ne peut pas juste sauvagement rentrer le $x$ dans la différentielle.
On fait un coup de trafalgar:
$ delta W = - dif (1/2 k x^2) $

D'où l'énergie potentielle:
$ E_p &= 1/2 k x^2 + C \
&= 1/2 k (l - l_0)^2 + C $

=== Forces newtoniennes

On appelle force newtonienne une force $arw(f)$ qui est:
- Centrale, c'est à dire toujours dirigée vers l'origine $O$
  (on utilisera donc les coordonnées sphériques)
- Inversement proportionnelle au carré de la distance: $ arw(f) = K/r^2 arw(u_r) $
  Avec $K$ une constante (dans le cadre du mouvement, mais elle peut changer entre les objets).

La gravitation ($K = -G m_1 m_2$) et 
l'électromagnétisme quand les charges sont de signe différents ($K = 1/(4 pi epsilon_0) q_1 q_2$ négatif) sont des forces newtoniennes.

On pose le travail:
$ delta W &= arw(f) dot dif arw(O M) \
&= K/r^2 arw(u_r) dot (dif r arw(u_r) + r dif theta arw(u_theta) + r sin theta dif phi arw(u_theta)) \
&= K/r^2 dif r \
&= - dif (K/r)
$

Donc:
$ E_p = K/r + C $

#warn[En général, la constante est nulle (car l'énergie potentielle est nulle à l'infini), mais ce n'est pas tojours le cas dans certains problèmes
qui traitent d'objets de longueur infinies.]

== Exemple de force non conservative, la force de frottement fluide

On pose la force de frottement fluide proportionel à la vitesse $arw(f) = - lambda arw(v)$, et on calcule le travail:
$ delta W &= arw(f) dot dif arw(O M) \
&= - lambda arw(v) dot arw(v) dif t "  (rappel: " dif arw(O M) = arw(v) dif t ")"\
&= - lambda v^2 dif t $

On a une dépendance temporelle claire: on ne pourra jamais l'exprimer sous la forme d'une énergie potentielle (qui ne dépend que de l'espace)

La force de frottement fluide est donc non conservative.

== Application

On pose trois points $A$, $B$, et $C$.

On pose un champ de force $arw(F) = c^2 r^2 arw(u_theta)$ avec $c$ constant

On veut observer le travail effectué par un point se déplaçant
au point $C$:
- En passant par le point $B$, puis par le point $C$ en ligne droite
- En allant au point $C$ avec un arc de cercle de rayon $R$

#figcan({
	import draw: *

	point((0, 0), value: "B")
	point((0, 2), value: "C")
	point((2, 0), value: "A", anchor: "south-west")

	arrow((2, 0), (0, 0))
	arrow((0, 0), (0, 2))

	arc((0, 0), start: 0deg, stop: 90deg, radius: 2, anchor: "origin", mark: (end: "straight"))
})

On calcule le travail avec:
$ delta W = arw(F) dot dif arw(O M) $
$dif arw(O M)$ n'aura pas la même expression selon le chemin suivi. \
- Si on suit le chemin en arc de cercle, on aura:
  $ dif arw(O M) = R dif theta arw(u_theta) $
  D'où:
  $ delta W &= (r^2 c^2 arw(u_theta)) dot (R dif theta arw(u_theta)) \
  &= R r^2 c^2 dif theta \
  &= R^3 c^2 dif theta "car on suit le cercle"
  $
  On intègre:
  $ W = integral_0^(pi/2) c^2 R^3 dif theta = c^2 R^3 pi/2 $
- Si on suit le chemin en ligne droite:
  on separe le chemin en deux:
  $ W = W_(A B) + W_(B C) $
  Pour le chemin $A B$:
  $ dif arw(O M) = - dif r arw(u_r) $
  $ delta W_(A B) = - r^2 c^2 arw(u_theta) dot dif r arw(u_r) = 0 $
  $ W_(A B) = 0 $
  De même pour le chemin $B C$:
  $ dif arw(O M) = dif r arw(u_r) $
  $ delta W_(B C) = 0 $
  $ W_(B C) = 0 $
Donc la force $arw(F)$ est évidemment non conservative.


Si on change le champ force à $arw(F) = r^2 c^2 arw(u_r)$,
on a, pour tout chemin:
$ delta W &= arw(F) dif arw(O M) \
&= r^2 c^2 arw(u_r) dot (dif r arw(u_r) + r dif theta arw(u_theta)) \
&= r^2 c^2 dif r \
&= - dif (-1/3 c^2 r^3) $

Donc la force est conservative.

= Énergie mécanique

== Définition

// Voir @mecanique

On a $E_m = E_c + E_p$, avec $E_c$ l'énergie cinétique et
$E_p$ l'énergie potentielle, définie par toutes les forces conservatives.

L'energie mécanique permet d'englober
toute l'énergie conservative.

== Conservation ou non conservation de l'énergie mécanique

L'énergie mécanique se conservera que si l'on est uniquement face
à des forces conservatives, et elle ne sera modifiée que par les forces
non conservatives.

== Théorème de l'énergie mécanique

#theorem[
	Le changement d'énergie mécanique est égal à
	la somme du travail des forces non conservatrices.
]

#underline[*Preuve*]: \
On applique le théorème de l'énergie cinétique:

$ Delta E_c = sum_i W(arw(f_i))
= sum_i_c W(arw(f_i_c)) + sum_i_"nc" W(arw(f_i_"nc")) $

Or, $sum_i_c W(arw(f_i_c)) = - Delta E_p$, donc:
$ Delta E_c = - Delta E_p + sum_i_"nc" W(arw(f_i_"nc")) $
$ Delta E_c + Delta E_p = sum_i_"nc" W(arw(f_i_"nc")) $
$ Delta E_m = sum_i_"nc" W(arw(f_i_"nc")) $

== Utilisation de la conservation de l'énergie mécanique

#image("exo_mecanique.png")

#figcan({
	import draw: *
	
	point((0, 2), value: "A")
	point((2, 0), value: "B")
	arc((2, 2), start: 180deg, stop: 270deg, radius: 2, anchor: "origin")
	line((2, 0), (4, 0))
	point((4, 0), value: "C")
})

On réduit l'enfant à un point $M$ de masse $m$, et on considère ce système.
On se place dans le référentiel galiléen terrestre.

On fait un bilan des forces:
- Le poids $m arw(g)$
- La réaction de la neige $arw(R) = arw(R_N) + arw(R_T)$

On ignore le frottement solide ($arw(R_T) = arw(0)$), et la réaction
normale ne travaille pas, donc la seul force travaillant
est le poids, qui est une force conservatrice.

On applique le TEM:
$ Delta E_m = W(arw(R_N)) + W(arw(R_T)) = 0 $
Donc l'énergie mécanique reste constante.

On calcule le différentiel d'énergie potentielle entre $A$ et $B$:
$ Delta E_"pp" (arw(A B)) = -m g R $

Par conservation de l'énergie mécanique:
$ Delta E_"c" = m g R = 1/2 m v^2 $
Donc:
$ v = sqrt(2 g R) $
Et cette vitesse est la même en $C$.

#pagebreak()

= Étude qualitative des mouvements et des équilibres

#caution[
On supposera dans cette partie que l'énergie mécanique est constante.
]

== Conséquence de la positivité de l'énergie cinétique

On sait l'énergie mécanique est définie par:
$ E_m = E_p + E_c <=> E_c = E_m - E_p $

Or, l'énergie cinétique est toujours positive:
$ E_c = 1/2 m v^2 >= 0 $
Donc l'énergie mécanique est toujours plus grande que
l'énergie potentielle.
$ E_m - E_p >= 0 $
#resultb[$ E_m >= E_p $]

== Nature du mouvement en fonction de l'énergie mécanique

Supposons que l'on a trouvé une expression $E_p (M)$ de
l'énergie potentielle.
Si on obtient une valeur $E_c$ de l'énergie mécanique, on sait que
cette énergie va rester constante, et on sait que
$E_m >= E_p$ est toujours vérifié.

Cela permet de conclure que tout les points $M$ tels que
$E_p (M) > E_c$ sont _inatteignable_.

On parle de #def[mouvement lié] si les posititions accessibles
sont restreintes à une zone finie
(pour un système modulé par $x$, le mouvement est lié
si on a nécessairement $x_0 <= x <= x_1$).

On parle de #def[mouvement libre] sinon.

#tip[
	Si on trouve une énergie mécanique complètement invalide,
	on s'est probablement trompés.
]

== Équilibre

On parle d'équilibre si $arw(v) = 0$ et $arw(a) = 0$.

Donc par PFD, la somme des forces est nulle.

#warn[
	Si la somme des forces est nulle, l'équilibre n'est pas
	nécessairement atteint (vitesse initiale!)
]

#tip[
	Les questions d'équilibre auront généralement la forme
	"Existe-il une position d'équilibre?"
]

== Détermination des positions d'équilibre

On peut prendre une approche énergétique:
comme chacune des forces est conservative, on peut les écrire
sous la forme
$ arw(f_i) = - grad (E_p_i) $

Si on se place dans un système ne dépendant qu'un seul paramètre $x$,
on a:
$ arw(f_i) &= - (diff E_p_i)/(diff x) arw(u_x) \
&= - (dif E_p_i)/(dif x) arw(u_x)
$

Donc $x_0$ est une position d'équilibre *potentielle* si,
pour toutes les forces,
#resultb[$ (dif E_p_i)/(dif x) (x_0) = 0 $]

#note[
	Une position d'équilibre potentielle est
	un point où on sera à l'équilibre 
	si la vitesse est nulle en ce point.
]

== Stabilité des positions d'équilibre

#figcan({
	import draw: *
	bezier-through((-3, 1), (-2, 0), (-1, 1))
	content((-2, -0.5), [Équilibre stable])

	bezier-through((1, 0), (2, 1), (3, 0))
	content((2, -0.5), [Équilibre instable])
})

On dit qu'un équilibre est #def[stable] si,
quand on s'en écarte un peu, on y revient.

On a $arw(f) = - grad(E_p) = - dif (E_p)$.

#let smallo(under) = $limits(o)_under$
#let smalloat(x0, pow) = $smallo(x -> x0) ((x - x0)^pow)$

On fait un DL d'ordre $2$ au voisinnage de la position d'équilibre:
$ E_p (x) &= E_p (x_0) + (dif E_p)/(dif x) (x_0) (x - x_0)
+ 1/2 (dif^2 E_p)/(dif x^2) (x_0) (x - x_0)^2
+ smalloat(x_0, 2) \
&= E_p (x_0)
+ 1/2 (dif^2 E_p)/(dif x^2) (x_0) (x - x_0)^2
+ smalloat(x_0, 2)
$
On dérive le DL:
$ (dif E_p)/(dif x) = (dif^2 E_p)/(dif x) (x_0) (x - x_0)
+ smalloat(x_0, 1) $
$ arw(f) = - (dif^2 E_p)/(dif x^2) (x_0) (x - x_0) arw(u_x) $

Donc, si $x$ se déplace un peu par-rapport à $x_0$:
#figcan({
	import draw: *

	arrow((-4, 0), (4, 0))
	point((0, 0), value: $x_0$)

	point((-2, 0), value: $x$)
	point((2, 0), value: $x$)

	set-style(stroke: red)
	arrow((-2, 0), (-1, 0))
	arrow((2, 0), (1, 0))

	content((-1, -0.4), $arw(f)_"rappel"$)
	content((1, -0.4), $arw(f)_"rappel"$)
})

Si on se déplace vers la gauche, $x - x_0 < 0$, donc la dérivée seconde doit être positive pour qu'on revienne vers $x_0$.

Si on se déplace vers la droite, $x - x_0 > 0$, donc la dérivée seconde
doit être positive pour qu'on revienne vers $x_0$.

On est donc sur un équilibre #def[stable] si:
#resultb[$ (dif^2 E_p)/(dif x^2) (x_0) > 0 $]

== Étude d'un équilibre _via_ son énergie potentielle

#image("exo_equilibre.png")

+ $E_0$ a la dimension d'une énergie
+ Une position d'équilibre est obtenue si la somme des forces est nulle,
  or $arw(f) = - dif (E_p)$, donc quand $(dif E_p)/(dif theta) = 0$,
  donc:
  $ E_0 + m g R sin theta = 0 $
  On a:
  $ -1 <= sin theta <= 1 $
  $ E_0 - m g R <= (dif E_p)/(dif theta) <= E_0 + m g R $
  Donc $(dif E_p)/(dif theta)$ ne peut s'annuler que si
  $E_0 <= m g R $
+ On cherche les points d'annulation en $theta$. On a:
  $ sin theta = - E_0 / (m g R) $
  $ theta = arcsin( - E_0 / (m g R)) $
  $ theta_1 = - arcsin(E_0 / (m g R)) $
  $ theta_2 = pi + arcsin(E_0 / (m g R)) $
+ On calcule la dérivée seconde:
  $ (dif^2 E_p)/(dif theta^2) = m g R cos theta $
  On a:
  $ (dif^2 E_p)/(dif theta^2) (theta_1) 
  &= m g R cos (arcsin(E_0 / (m g R))) \
  &= m g R sqrt(1 - underbrace((E_0/(m g R))^2, < 1))
  $
  Donc $theta_1$ est un équilibre stable. À l'inverse:
  $ (dif^2 E_p)/(dif theta^2) (theta_2) 
  &= - m g R sqrt(1 - (E_0/(m g R))^2)
  $ 
  Donc $theta_2$ est un équilibre instable.

= Oscillateurs harmoniques

== Exemples d'oscillateurs harmonique

On a déjà obtenu des oscillateurs harmoniques en mécanique
dans au moins trois situations:
- les ressorts (horizontaux et verticaux)
- les pendules

On regarde le cas où on se place au voisinnage d'une position d'équilibre stable.

On arrive à dire que la résultante des forces qui s'exercent est:
$ arw(f) = - (dif^2 E_p)/(dif x^2) (x_0) (x - x_0) arw(u_x) $

$arw(f)$ est la force qui s'exerce au voisinnage de la position
d'équilibre, avec $x_0$ la position d'équilibre.

Comme cette position d'équilibre est stable, on a:
$ (dif^2 E_p)/(dif x^2) (x_0) > 0 $

On fait un bilan des forces:
- On a une résultante des forces $arw(f)$ dont on vient de donner
  l'expression

On applique le principe fondamental de la dynamique:
$ m arw(a) = arw(f) $
On projette dans la direction $arw(u_x)$:
$ m diaer(x) = - (dif^2 E_p)/(dif x^2) (x_0) (x - x_0) $
$ diaer(x) + 1/m (dif^2 E_p)/(dif x^2) (x_0) (x - x_0) = 0 $

\ \ \ 
On pose $X = x - x_0$, avec $diaer(X) = diaer(x)$ \
On obtient l'équation d'un oscillateur harmonique:
$ diaer(X) + 1/m (dif^2 E_p)/(dif x^2) (x_0) X = 0 $

On résout alors l'équation d'un oscillateur harmonique:
$ X = A cos(omega_0 t) + B sin(omega_0 t) $
Avec:
$ omega_0 = sqrt(1/m ((dif^2 E_p)/(dif x^2) (x_0))) $

Une autre façon de procéder est de développer:
$ diaer(x) + 1/m ((dif^2 E_p)/(dif x^2) (x_0)) x = 1/m (dif^2 E_p)/(dif x^2) (x_0) x_0 $

Et de résoudre l'équation avec un second membre:
$ x = A cos(omega_0 t) + B sin (omega_0 t) + x_0 $

