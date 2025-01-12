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

#figcan({
	import draw: *

	let g = gradient.linear(..color.map.viridis)

	let a = (0, 0)
	let va = (0, 0)
	let ma = 10
	let b = (3, 0)
	let vb = (0, 0.1)
	let mb = 2

	let G = 0.01
	let dt = 0.2

	let N = 400

	for i in range(N) {
		let color = g.sample(100% * (i / N))

		circle(a, radius: 0.3, stroke: color)
		circle(b, radius: 0.3, stroke: color)

		let (ax, ay) = a
		let (bx, by) = b
		let (dx, dy) = (ax - bx, ay - by)
		let len = calc.sqrt(dx*dx + dy*dy)
		let len_cube = len*len*len

		let acc_a = G * mb / len_cube
		let acc_b = G * ma / len_cube

		let (vax, vay) = va
		let (vax, vay) = (vax + dt*acc_a*dx, vay + dt*acc_a*dy)
		va = (vax, vay)
		let (vbx, vby) = vb
		let (vbx, vby) = (vbx + dt*acc_b*dx, vby + dt*acc_b*dy)
		vb = (vbx + dt*acc_b*dx, vby + dt*acc_b*dy)

		a = (ax + vax, ay + vax)
		b = (bx + vbx, by + vby)
	}
})

=== Interaction électromagnétique

$ arw(f) = q (arw(E) + arw(v) and arw(B)) $

Cas particulier: interaction de Coulomb

Soient deux points masses $(A_1, m_1), (A_2, m_2)$ de charge $q_1$ et $q_2$:

$ arw(f)_(2->1) = 1/(4 pi epsilon_0) (q_1 q_2)/(A_1 A_2)^3 arw(A_2 A_1) $

Très similaire à l'attraction gravitationelle,
mais la force peut être répulsive si les charges sont de même signe.

===
===
