#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Principes de la dynamique - Lois de Newton]

= Point matériel ou systèmes de point matériels - Définition et propritétés

== Notion de solide

On considère qu'un solide est un objet parfaitement indéformable.
C'est à dire:
$ forall A,B in S, A B "est constante dans le temps" $

== Modélisation d'un solide par un point matériel

On modélise un solide (donc un ensemble de point) par un seul point dans l'espace, positionné en son centre de masse.

On néglige donc la rotation du solide sur lui même. (Approximation douteuse)

== Notion de masse - Masse inertielle

#def[Masse inertielle]: Grandeur scalaire qui mesure la difficulté à mettre un objet en mouvement, d'unité [kg].

== Quantité de mouvement

On associe la masse à une grandeur vectorielle, la *Quantité de mouvement*:

$ arw(p_(\/R)) (M) = m times arw(v_(\/R)) (M) $

== Ensemble de points matériels

Pour passer de la mécanique d'un point à toute la mécanique d'un système,
on associe à chaque point $M_i$ sa masse $m_i$:

La masse totale du système est donc définit par 
$m_"tot" = sum_i m_i$

On peut aussi se placer d'un point de vu continu (pour modéliser un solide par une infinité de points), avec $m_"tot" = integral_Omega m(x) dif x$

== Centre d'intertie ou de gravité

On appelle $G$ le centre d'inertie.

#def[Centre d'inertie]: le barycentre de l'ensemble des points du système 
du système par-rapport à leur masse. (C'est la moyenne poindérée de la position des points).

#let M = "Tartanpion"

$ m_"tot" arw(O G) = sum_(i) m_i arw(O #M _i) $

D'où:
$ m_"tot" arw(O G) = sum_(i) m_i (arw(O G) + arw(G #M _i)) <=>
sum_i m_i arw(G #M _i) = arw(0) $

== Quantité de mouvement d'un système de points matériels

On a:
$ m_"tot" arw(O G) = sum_i m_i arw(O M_i) $

On dérive:
$ m_"tot" (dif arw(O G))/(dif t) &= sum_i m_i ((dif arw(O M_i))/(dif t))_(\/R) \
m_"tot" arw(v_(\/R)) (G) &= sum_i m_i arw(v_(\/R)) (M_i) \
arw(p_(\/R)) (G) &= sum_i arw(p_(\/R)) (M_i)
$

= Première loi de Newton ou principe d'inertie - Référentiel galiléen

== Énoncé

#theorem[Il existe des référentiels privilégiés, appellés "référentiels galliléens", dans lesquels un point matériel isolés aura un mouvement rectiligne, uniforme.]

C'est un principe d'existence: il y en aura forcément un.

Tous les référentiels ne sont pas équivalents:
il y a des référentiels dîts "galiléens" et "non-galiléens".

Pour savoir si un référentiel galiléen:
- On prend un point matériel isolé (donc aucune force ne s'applique à lui)
- On regarde son mouvement
- Si il est rectiligne et uniforme, notre référentiel est galiléen

Toutes nos propriétés seront énoncés dans des référentiels galiléens.

Il existe une infinité de référentiels galiléens.
En utilisant la loi de composition des vitesses (qui est admise pour l'instant):
$ arw(v_(\/R') (M)) = arw(v_(\/R)) (M) + arw(v_(e)) (R'\/R) $

On prend un point $M$ isolé, et le référentiel est galiléen,
donc $M$ possède un mouvement rectiligne uniforme. \
Donc $arw(v_(\/R)) (M) = "constante"$

$R'$ sera galilén si $arw(v_(\/R')) (M) = "constante"$

Par loi de composition:
$ arw(v_e) (R'\/R) = "constante" $
Donc $R'$ est en translation rectiligne uniforme par rapport à $R$.

== Recherche d'un référentiel galiléen

On serait tenté de prendre la Terre comme référentiel galilén.
Non. Tout ne se passe pas bien. 

On prend un objet. On le lâche d'une certaine hauteur. Il se déplace un peu vers l'est. De quelques centimètres, mais le référentiel n'est donc pas galiléen.

La Terre tourne sur elle même, donc le référentiel n'est pas galiléen.
On prend donc le centre de la Terre. Mais la Terre, elle tourne autour du Soleil. Mais le Soleil, etc...

En toute rigueur, on devrait prendre le centre de l'univers comme référentiel galiléen. Malheureusement, on ne sait pas où il est.

Selon la précision demandée, on peut considérer ces différents référentiels comme à peu près galiléens.

= Causes ou origines des mouvements - Forces ou actions mécaniques

== Notion de force

#def[Force]: Pertubation permettant de mettre en mouvement un système, *dans un système de points*.

#def[Action mécanique]: Pertubation mettant en mouvement un solide (on se libère donc de l'approximation du point). On ne le verra qu'en s'intéressant à la rotation d'un solide autour d'un axe.

Dans un sytème de points matériels (donc dans tout les chapitres de mécanique, sauf un): on utilise des forces. \
Dans un système de solides: on utilise des actions mécaniques.

On décrit une force par un vecteur:
- Une direction, un sens, une norme

#tip[
	Parfois, il nous manquera un composant du vecteur. \ 
	Il faudra alors tenir compte des inconnues,
	et faire avec, ou résoudre.
]

== Les 4 interactions fondamentales

=== Interaction gravitionelle
De constante fondamentale
$G = 6.67 times 10^(-11) upright(N dot "kg"^(-2) dot m^2)$.

Soient deux points masses $(A_1, m_1), (A_2, m_2)$:

$ arw(f_(2->1)) = G arw(A_2 A_1) (m_1 m_2)/(A_1 A_2)^3 $

Aussi noté:
$ arw(f_(2->1)) = G hat(u)_(2->1) (m_1 m_2)/r^2 $

Avec $r = A_1 A_2$, $hat(u) = arw(A_2 A_1)/norm(arw(A_2 A_1))$ le vecteur normalisé de $A_2$ vers $A_1$.

// #figcan({
// 	import draw: *
//
// 	let g = gradient.linear(..color.map.viridis)
//
// 	let a = (0, 0)
// 	let va = (0, 0)
// 	let ma = 20
// 	let b = (3, 0)
// 	let vb = (0, 0.2)
// 	let mb = 2
//
// 	let G = 0.01
// 	let dt = 0.5
//
// 	let N = 300
//
// 	for i in range(N) {
// 		let color = g.sample(100% * (i / N))
//
// 		circle(a, radius: 0.3, stroke: color)
// 		circle(b, radius: 0.3, stroke: color)
//
// 		let (ax, ay) = a
// 		let (bx, by) = b
// 		let (dx, dy) = (ax - bx, ay - by)
// 		let len = calc.sqrt(dx*dx + dy*dy)
// 		let len_cube = len*len*len
//
// 		let acc_a = G * mb / len_cube
// 		let acc_b = G * ma / len_cube
//
// 		let (vax, vay) = va
// 		let (vax, vay) = (vax + dt*acc_a*dx, vay + dt*acc_a*dy)
// 		va = (vax, vay)
// 		let (vbx, vby) = vb
// 		let (vbx, vby) = (vbx + dt*acc_b*dx, vby + dt*acc_b*dy)
// 		vb = (vbx + dt*acc_b*dx, vby + dt*acc_b*dy)
//
// 		a = (ax + vax, ay + vax)
// 		b = (bx + vbx, by + vby)
// 	}
// })

=== Interaction électromagnétique

$ arw(f) = q (arw(E) + arw(v) and arw(B)) $

Cas particulier: interaction de Coulomb

Soient deux points masses $(A_1, m_1), (A_2, m_2)$ de charge $q_1$ et $q_2$:

$ arw(f)_(2->1) = 1/(4 pi epsilon_0) (q_1 q_2)/(A_1 A_2)^3 arw(A_2 A_1) $

Très similaire à l'attraction gravitationelle,
mais la force peut être répulsive si les charges sont de même signe.

$epsilon_0$ est la permissivité électrique du vide avec 
$epsilon_0 = 8.854 dot 10^(-12) upright(" " F dot m^(-1))$

=== Interaction forte



=== Interaction faible

== Troisième loi de Newton : principe de l'action et de la réaction ou principe des actions réciproques

#theorem[
	Si un point matériel $A$ exerce sur un point matériel $B$ une force $arw(f_(A->B))$, alors le point $B$ exerce une force $arw(f_(B->A))$ sur $A$ telle que $arw(f_(A->B)) = -arw(f_(B->A))$
]

== Deuxième loi de Newton : principe fondamental de la dynamique

#theorem[
La dérivée de la quantité de mouvement est égale à la somme des forces:
$ (dif arw(p))/(dif t) = sum_i arw(f)_i $
]

Si on connaît l'ensemble des actions s'appliquant à un point matériel, on peut en déduire le mouvement.

Souvent, on ne connaît pas toutes les interactions qui agissent sur un point. Avec l'information du mouvement, on peut trouver l'accélération, et de là déterminer certaines des forces qui s'appliquent au point.

== Cas de la statique

Un point est statique si il n'y a pas de mouvement: la vitesse et l'accélération est nulle.

Vitesse nulle et $ sum_i arw(f)_i = 0 $

== Méthode de résolution en quatre étape

Un problème de mécanique se résout en quatres points:
+ Définition du système
+ Définition du référentiel
+ Bilan des forces
+ Résolution par choix d'une méthode, pour l'instant le principe fondamental de la dynamique

= Mouvement dans le champ de pesanteur

== Poids

#def[Poids]: Le poids est la force appliquée par la Terre sur un objet. Il tient compte de l'attraction gravitationelle et de la rotation de la Terre  (donc en général il n'est pas dirigé exactement vers le bas, on le verra en spé). On n'en tiendra pas rigueur, notre poids sera strictement vers le bas.

On pose le poids $arw(P)$
$ arw(P) = m arw(g) $
Avec $m$ la masse, et $arw(g)$ l'accélération de pesanteur orientée vers le bas.

== Mouvement d'un point $M$ de masse $m$ dans le champ de pesanteur

On se limite à la pesanteur et on ne considère pas les frottements.

En suivant notre plan de route:
+ On définit le système: c'est le point $M$
+ On prend le référentiel terreste (qu'on suppose galiléen parce qu'on se place sur une intervalle de temps suffisement courte, on ne voit pas l'effet de la rotation terrestre)
+ On fait le bilan des forces: $arw(F) = m arw(g)$
+ On résout avec le principe fondamental de la dynamique:
  $ (dif arw(p))/(dif t) = m arw(a) (M) = m arw(g) $
  On obtient l'équation différentielle du mouvement:
  $ arw(a) = arw(g) $

Par la suite on dinstinguera deux cas:
- La chute libre, on laisse tomber un objet avec une vitesse initiale nulle 
- Le tir, on lance un objet et on voit où il tombe

== Mouvement en chute libre

#image("exo1.png", width: 100%)

On a déjà établi l'équation différentielle du mouvement:
$ arw(a) = arw(g) $

On se place dans les coordonées cartésiennes.

On pose notre équation horaire à partir de notre accelération:
$ cases(diaer(x) = 0, diaer(y) = 0, diaer(z) = -g) $
On intègre:
$ cases(dot(x) = x_0, dot(y) = y_0, dot(z) = -g t + z_0) $
On utilise les conditions initiales: vitesse nulle à l'origine,
donc $x_0 = y_0 = z_0 = 0$ \
Et on intègre à nouveau:
$ cases(x = x_1, y = y_1, z = -1/2 g t^2 + z_1) $
On utilise les conditions initiales, on suppose l'origine placé dans le même axe que $M$, et qu'il est placé au niveau du sol. L'objet est laché à une hauteur $h$, d'où:
$ cases(x = 0, y = 0, z = h - 1/2 g t^2) $

On arrive au sol en $z = 0$, on résout donc:
$ h - 1/2 g t_s^2 = 0 <=> t_s^2 = 2/g h \ <=> t_s = sqrt((2 h)/g) "car t positif" $

On a la vitesse en tout $t$ avec l'équation horaire.
On substitue $t_s$:
$ dot(z) = -g sqrt((2h)/g) = -sqrt(2 h g) $

== Tir dans le vide

#image("exo2.png")

1. On peut séparer le problème en deux partie: l'ascension parfaitement verticale, le moment où la vitesse s'annulle, la chute libre.

On supposera donc $alpha in.not {-1/2, 1/2}$

2. On fait la somme des forces ($arw(a) = arw(g)$):

3.
$ cases(diaer(x) = 0, diaer(y) = 0, diaer(z) = -g) $
On intègre, les conditions initiales nous donnent $x_0 = cos(alpha) v_0$, $z_0 = sin(alpha) v_0$, $y_0 = 0$ car on se place dans le plan du lancé.
$ cases(dot(x) = cos(alpha)v_0, dot(y) = 0, dot(z) = -g t + sin(alpha)v_0 ) $
D'où (on place notre référentiel au point de lancé):
$ cases(
	x = cos(alpha) v_0 t,
	y = 0,
	z = sin(alpha)v_0 t -1/2 g t^2
) $

4. Pour obtenir l'équation de la trajectoire, on veut éliminer la variable $t$:
$ t = x/(cos(alpha) v_0) (alpha != 0) $
$ z &= x sin(alpha)/cos(alpha) - 1/2 g x^2/(cos(alpha)^2 v_0^2)
$

La trajectoire est donc de forme parabolique.

5. On sait que si un extremum est atteint, alors la dérivée de $z$ s'anulle. On cherche donc:
$ dot(z) = 0 $

On peut soit dériver $z$ avec les équations horaires (par-rapport à $z$), ou avec l'équation de trajectoire (par-rapport à $x$).
$ - g t + v_0 sin(alpha) = 0 $
$ t = (v_0 sin(alpha))/g $

On substitue dans les équations horaires:
$ cases(
	x = v_0^2 cos(alpha) sin(alpha) 1/g, 
	z = (sin(alpha)^2 v_0^2)/g - (sin(alpha)^2 v_0^2)/(2 g) = (sin(alpha)^2 v_0^2)/(2 g)
) $

$z >= 0$, donc cet extremum est un maximum.

6. On cherche le $x_P$ où la balle retombe au sol. On utilise l'équation de la trajectoire:
$ z = 0 $
$ -(g)/(2 cos(alpha)^2 v_0^2) x_P^2 + x_P sin(alpha)/cos(alpha) = 0 $
$ x_P (-(g)/(2 cos(alpha)^2 v_0^2) x_P + sin(alpha)/cos(alpha)) = 0 $

Soit $x_P = 0$ (lancement de la balle), soit:
$ x_P = sin(alpha)/(cos(alpha)) (2 cos(alpha)^2 v_0^2)/(g) = 2 sin(alpha) cos(alpha) v_0^2/g = sin(2alpha) v_0^2/g $

7. On cherche $alpha_1$ et $alpha_2$ tels que:
$ x_P (alpha_1) = x_P (alpha_2) $
$ sin(2 alpha_1) v_0^2/g = sin(2 alpha_2) v_0^2/g $
$ sin(2 alpha_1) - sin(2 alpha_2) = 0 $
$ sin(alpha_1) cos(alpha_1) - sin(alpha_2) cos(alpha_2) = 0 $
$ sin(alpha_1 - alpha_2) = 0 $
$ alpha_1 eq.triple alpha_2 [pi] "ou" alpha_1 eq.triple - alpha_2 [pi] $

#figcan({
	import draw: *
	catmull((0, 0), (3, 1.5), (5.85, 0), mark: (end: ">"), name: "a")
	catmull((0, 0), (3, 4), (6, 0), mark: (end: ">"), name: "b")

	line("a.80%", (6, 2))
	content((6.1, 2), [Tir tendu], anchor: "west")
	line("b.60%", (6, 4))
	content((6.1, 4), [Tir en cloche], anchor: "west")

	arrow((0, 0), (0, 4))
	arrow((0, 0), (8, 0))

	cetz.angle.angle((0, 0), "a.1", (1, 0), radius: 1)
	cetz.angle.angle((0, 0), "b.0.5", (1, 0))
})

= Influence d'un frottement fluide

== Forces de frottement fluide

Un point dans un fluide sera affecté par ce fluide par deux force:
- La portance $arw(P)$, la force qui permet aux avions de voler
- La trainée $arw(T)$, la force de frottement fluide

L'effet du fluide est la somme des deux.

#figcan({
	import draw: *
	point((0, 0))
	arrow((0, 0), (2, 0))
	arrow((0, 0), (0, 2))
	arrow((0, 0), (-2, 0))

	content((0, -0.3), [Point matériel $M$], anchor: "north")
	content((-1.8, -0.3), [Trainée $arw(T)$], anchor: "north-east")
	content((0, 2.1), [Portance $arw(P)$], anchor: "south")
	content((2, 0.3), [$arw(v)$])
})

== Chute avec un frottement fluide

#image("exo3.png")

1. On définit notre système: le point $M$ \
  On fait un bilan des forces: gravitation $m arw(g)$, et frottement fluide $- k arw(v)$
