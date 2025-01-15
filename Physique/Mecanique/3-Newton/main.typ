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
  On fait un bilan des forces: gravitation $m arw(g)$, et frottement fluide $- k arw(v)$ \
  On établit l'équation différentielle du mouvement:
  $ (dif arw(v))/(dif t) + k/v arw(v) = arw(g) $

2. En sah il y a pas de vitesse horizontale ou en profondeur, donc $v = (dif z)/(dif t)$, \
  mais on peut juste intégrer les vecteurs.

3. $ arw(v) (t) = arw(v_H) (t) + arw(v_P)(t) $
  Donc solution particulière de la forme:
  $ arw(v_H) = arw(V) e^(-k/m t) $
  On peut poser $tau = m/k$
  
  Le second membre est constant, donc on cherche $arw(v_P)$
  de la forme d'une constante. Donc:
  $ (dif arw(v_P))/(dif t) = arw(0) $
  D'où:
  $ k/m arw(v_P) = arw(g) <=> arw(v_P) = m/k arw(v_P) $
  $ arw(v) (t) = arw(V) e^(-t/tau) + tau arw(g)  $
  Pas de vitesse initiale, donc:
  $ arw(v)(0) = arw(0) = arw(V) + tau arw(g) $
  Donc $arw(V) = -tau arw(g) = -m/k arw(g)$
  D'où:
  $ arw(v)(t) = tau arw(g) (1 - e^(-t/tau))  $

4. Deux manière:
  + On a la solution, et on a que 
    $ arw(v)(t) -->_(t -> +oo) tau arw(g) $
  + Si $arw(v)(t)$ tend vers une constante, alors $(dif arw(v))/(dif t) -> 0$.

    On reporte dans l'équa-diff, et on a $arw(v_cal(l)) = tau arw(g)$

== Chute avec frottement proportionnel au carré de la vitesse

#image("exo4.png")

+ On définit notre système: le point $M$, dans un référentiel galiléen terrestre.

  On fait le bilan des forces:
  - Le poids $m arw(g)$
  - Le frottement $k v arw(v)$
  
  On applique le principe fondamental de la dynamique:
  $ m (dif arw(v))/(dif t) = m arw(g) + k v arw(v) $
  
  On projète sur l'axe $O arw(z)$ (car les autres axes ne servent à rien):
  $ m (dif v)/(dif t) = m g - k v^2 $
  
  On suppose que $v$ tend vers une vitesse limite $v_cal(l)$, donc $(dif v_cal(l))/(dif t) -> 0$, \
  On remplace:
  $ m g - k v_cal(l)^2 = 0 $
  $ v_cal(l) = sqrt((m g)/k) $
  Mais si $k$ n'a pas d'unité, $v_cal(l)$ n'est pas homogène à une vitesse:
  il faut changer l'unité de $k$
  
  De là, on récupère:
  $ m g = k v_cal(l)^2 $
  On remplace:
  $ m (dif v)/(dif t) = k (v_cal(l)^2 - v^2) $
  On suppose que la vitesse limite n'est jamais atteinte (pout diviser par $v_cal(l)^2 - v^2$):
  $ (dif v)/(v_cal(l)^2 - v^2) = k/m dif t $
  On multiplie par le signe intégral:
  $ integral (dif v)/(v_cal(l)^2 - v^2) = integral k/m dif t $
  Ensuite, on résout nos intégrales comme si on avait pas fait
  des maths de physiciens. \
  On fait une décomposition en élément simple:
  $ 1/(v_cal(l)^2 - v^2) &= a/(v_cal(l) - v) + b/(v_cal(l) + v) \
&= (a(v_cal(l) + v) + v(v_cal(l) - v))/((v_cal(l)+v)(v_cal(l)-v)) \
&= ((a + b)v_cal(l) + (a - b)v)/((v_cal(l)+v)(v_cal(l)-v))
  $
  Donc:
  $ cases(a = b, (a + b)v_cal(l) = 1) <=> a = b = 1/(2 v_cal(l)) $
  D'où:
  $ integral_0^v (dif v)/(v_cal(l)^2 - v^2) &= 
1/(2 v_cal(l)) (integral_0^v (dif v)/(v_cal(l) + v) + integral_0^v (dif v)/(v_cal(l) - v) ) \
&= 1/(2 v_cal(l)) ([ln(v_cal(l) + v)]_0^v - [ln(v_cal(l) - v)]_0^v) \
&= 1/(2 v_cal(l)) (ln((v_cal(l) + v)/(v_cal(l) - v))) \
$ 
  En revenant à l'égalité des intégrales, on a égalité avec:
  $ k/m t $
  Donc (on dit hassul les bornes c'est les même):
  $ (v + v_cal(l))/(v_cal(l) - v) = exp(2 v_cal(l) k/m t) = A $
  $ v + v_cal(l) = A v_cal(l) - A v $
  $ (A - 1)v_cal(l) = (A + 1)v $
  $ v = v_cal(l) (A - 1)/(A + 1) $
  $ v(t) &= v_cal(l) (exp(2 v_cal(l) k/m t) - 1)/(exp(2 v_cal(l) k/m t) + 1) \
&= v_cal(l) (exp(v_cal(l) k/m t) - exp(-v_cal(l) k/m t))/(exp(v_cal(l) k/m t) + exp(-v_cal(l) k/m t)) \
&= v_cal(l) tanh(v_cal(l) k/m t)
$

= Mouvement d'une masse suspendu au bout d'un fil

== Tension d'un fil

#figcan({
	import draw: *

	arrow((0, 0), (-2, 1))
	arrow((0, 0), ((0, 0), 1.5, (2, -1)))
	arrow((0, 0), ((0, 0), 1.5, (1, 2)))
	circle((0, 0), radius: 0.5, name: "C", fill: white)

	content((0.8, 0), $m$)
	content((-1, 1), $arw(T)$)
	content((1, -1), $arw(u_r)$)
	content((1, 1), $arw(u_theta)$)
})

La tensionn du fil est:
- Dans la direction du fil
- Dans le sens de la masse vers le fil
- De norme inconnue

Il va donc falloir se débarasser de la norme. On va projeter dans la direction perpendiculaire au fil.
On prendra donc $arw(u_theta)$ comme projection.

== Oscillations d'un pendule simple

#image("exo5.png")
#image("exo5-q.png")

1.
On définit notre système: le point $M$, dans un référentiel galiléen terrestre.

On fait le bilan des forces:
- Le poids: $m arw(g)$
- La tension du fil: $arw(R)$
- Le frottement fluide de fdp: $- k arw(v)$

On applique le principe fondamentale de la dynamique.

$ m arw(a) = m arw(g) + arw(R) - k arw(v) $

On passe par la vitesse:
$ v = dot(r) arw(u_r) + r dot(theta) arw(u_theta) + underbrace(dot(z) arw(u_r), =0) $
$ r = l => dot(r) = 0 $
Donc:
$ arw(v) = l dot(theta) arw(u_theta) $
$ arw(a) = dot(arw(v)) = l diaer(theta) arw(u_theta) - l dot(theta)^2 arw(u_r)  $

$arw(R)$ est inconnu, on doit le faire disparaître, on va le projeter $arw(a)$ sur $arw(u_theta)$.

Le terme multiplié par $arw(u_r)$ va disparaître. Pour les autres:

#figcan({
	import draw: *
	arrow((0, 0), (0.8, 0.8))
	line((-1.2, -1.2), (0, 0), stroke: (dash: "dashed"))

	line((-0.8, -0.8), (0, -1.5), stroke: (dash: "dotted"))

	arrow((0, 0), (0, -1.5))
	content((0, -1.8), $m arw(g)$)
	content((1, 1), $arw(u_theta)$)
})

$ cases(
	m arw(g)\/arw(u_theta) = - m g sin theta,
	arw(R)\/arw(u_theta) = 0,
	k arw(v)\/arw(u_theta) = k l dot(theta)
) $

Donc:
$ m l diaer(theta) = - m g sin theta - k l dot(theta) $
$ diaer(theta) + k/m dot(theta) + g/l sin theta = 0 $

2. On projette ensuite sur $arw(u_r)$:
$ - m l dot(theta)^2 = m g cos theta - R + 0 $
$ R = m g cos theta + m l dot(theta)^2 $

3. 
$ diaer(theta) + g/l sin theta = 0 $
On multiplie par $dot(theta)$
$ diaer(theta) dot(theta) + g/l sin theta dot(theta) = 0 $
On intègre:
$ 1/2 dot(theta)^2 - g/l cos theta = "constante" $
On a les conditions initiales:
en $t = 0$, $theta = theta_0$, donc $dot(theta) = 0$

$ 1/2 dot(theta)^2 - g/l cos theta = 0 - g/l cos theta_0 $
$ dot(theta)^2 = (2 g)/l (cos theta - cos theta_0) $
$ R = m g cos theta + 2 m g ( cos theta - cos theta_0 ) $
$ R = m g (3 cos theta - 2 cos theta_0) $

4.
En supposant $theta$ un angle faible, on peut faire l'approximation $sin theta approx theta$

On a donc notre équation différentielle:
$ diaer(theta) + g/l theta = 0 $
C'est l'équation d'un oscillateur harmonique: \
On a la pulsation $omega_0 = sqrt(g/l)$.

En rajoutant les frottements fluides:
$ diaer(theta) + k/m dot(theta) + theta = 0 $
On sait aussi résoudre ce genre d'équation.

= Poussée d'archimède

== Poussée d'archimède

La poussée d'archimède est une force égale à l'opposé du poids du
fluide déplacé.

Seulement, les points sont infinitésimaux, ils n'ont donc pas de volume.
Pour parler de poussée d'archimède, on est obligé de considérer le volume déplacé.

On se situe un peu entre la mécanique des points et la mécanique des solides.

#figcan({
	import draw: *
	line((-4, 0), (4, 0))

	catmull((1, -1), (2, -1.5), (1.8, -3), (0.3, -2.4), (0, -2), close: true, fill: blue)

	point((1.2, -2))
	arrow((1.2, -2), (1.2, -3.8))
	arrow((1.2, -2), (1.2, -0.2))
	content((1.2, -4.2), [Poids de l'eau de volume $V_"im"$])
	content((1.4, -0.3), [Poussée d'archimède $arw(pi)$], anchor: "west")
})

Problème: un solide peut-être à la fois dans l'eau et dans l'air:
#figcan({
	import draw: *
	line((-4, 0), (4, 0))

	line((-1, 1), (1, 1), (1, -1), (-1, -1), close: true, fill: white)

	line((-1, -1), (-1, 0), (1, 0), (1, -1), stroke: none, fill: blue)
	line((-1, 1), (-1, 0), (1, 0), (1, 1), stroke: none, fill: red)
})

On a donc à la fois une poussée d'archimède de l'eau, de l'air, et une répartition du volume qui change entre les deux.

== Exemple du glaçon

#image("exo6.png")

1.
On suppose la poussée d'archimède de l'air négligeable.

Si on ne fait rien, le glaçon finira à l'équilibre.
Donc le poids du glaçon sera égal à la poussée d'archimède:
$ m arw(g) + arw(pi) = 0 $
$ m arw(g) - rho_"eau" V_"im" arw(g) = 0 $
D'où:
$ V_"im" = m/rho_"eau" $

2.
Par conservation de la masse:
$ rho_"eau" V_"eau" = m $
Le volume d'eau obtenu est donc:
$ V_"eau" = m / rho_"eau" = V_"im" $

Donc le verre ne déborde pas :)
