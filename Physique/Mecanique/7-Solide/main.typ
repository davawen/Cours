#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#let axe = $Sigma$

#show link: it => underline[#it]

#titleb[Solide en rotation autour d'une axe fixe #axe]

= Mouvement d'un solide

== Rappel - Définition d'un solide

Un solide est un ensemble de points $S$ tel que:
$ forall A, B in S, norm(arw(A B)(t)) "est constante" $

== Description du mouvement d'un solide

Pour décrire le mouvement du solide dans son ensemble, on
s'interesse au mouvement d'un point particulier d'un solide. \
On prendra en général $G$ le centre de gravité/le centre d'inertie/le centre de masse du solide.

On s'intéresse de plus à la rotation du solide sur lui même:
on fixe des axes sur le solide et on note les angles entre les axes
relatifs du solide et les axes fixes du repère.

On obtient donc $6$ inconnus (3 pour la position et 3 pour la rotation)

On devra donc utiliser 2 méthodes de résolutions:
le PFD _et_ le théorème du moment cinétique.

== Mouvement de translation

On parle de *translation* quand tout les point se deplacent de la même façon (cela inclu un mouvement circulaire de l'ensemble des points du solide).

== Mouvement de rotation

On parle de *rotation* quand les points du solide se déplacent autour d'un axe du solide (les points ont des mouvement différents).

= Moment cinétique d'un solide par rapport à un axe $axe$
== Rappel : moment cinétique d'un point matériel

Un point $M$ de masse $m$ et de vitesse $arw(v)$ possède le moment
cinétique suivant:
#let ref = $\/cal(R)$
#let momcin = $arw(L_(O ref))$
#let momcina = $arw(L_axe)$

$ momcin (M) = arw(O M) and m arw(v_ref) (M) $
$ momcina (M) = momcin (M) dot arw(u_axe) $

== Moment d'inertie

En se plaçant  calculant le moment cinétique:
$ momcin (M)
= m (-z r dot(theta) arw(u_r) + (dot(r)z - dot(z)r) arw(u_theta)
+ r^2 dot(theta) arw(u_z)) $

En prenant $axe = (O_z)$ (donc $arw(u_axe) = arw(u_z)$),
on fait le produit scalaire:
$ momcina (M) = m r^2 dot(theta) $

On définit $J_axe$ le moment d'inertie (constant dans un solide donné), ici $J_axe = m r^2$

#tip[
  Pour le moment cinétique, $J_axe$ joue le même rôle que la masse
  dans la quantité de mouvement
]

== Moment cinétique d'un système de points

Pour obtenir le moment cinétique combiné de plusieurs points,
on les somme:
$ arw(L_O) = sum_i arw(L_(O,i)) "et"
L_axe = sum_i L_(axe,i)
$

== Moment cinétique d'un solide

Un solide est un système continu de points.
Pour obtenir son moment cinétique, on remplace la sommation discrète
par une sommation continue:

Dans un solide quelconque, la masse peut varier.
On a, en chaque point $M$ du solide:
$ underbrace(dif m, "\"masse" \ "élémentaire\"") = underbrace(rho (M), "masse" \ "volumique") underbrace(dif tau, "volume" \ " élementaire") $

#let intsolid = $integral.triple_(M in S)$

$
momcin (S) &= intsolid (arw(O M) and dif m arw(v_ref) (M)) \
&= intsolid (arw(O M) and rho(M) dif tau arw(v_ref) (M)) \
momcina (S) &= 
intsolid (arw(O M) and rho(M) dif tau arw(v_ref) (M)) dot arw(u_axe)
$

On se place en coordonnées cylindriques:
$
arw(O M) = r arw(u_r) + z arw(u_r) \
arw(v_ref) (M) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) + dot(z) arw(u_z) $
Donc:
$
arw(O M) and rho(M) dif tau arw(v_ref) = rho(M) dif tau (r^2 dot(theta) arw(u_z) + 
(- r dot(z) + z dot(r)) arw(u_theta) - r dot(theta) z arw(u_r))
$

On prend le produit scalaire avec $arw(u_axe) = arw(u_z)$, et on obtient:
$ L_axe = intsolid r^2 dot(theta) rho(M) dif tau $

== Moment d'inertie d'un solide

On pose $omega = dot(theta)$ la vitesse angulaire.
Tout les points du solide possèdent la même vitesse
angulaire, on peut donc le factoriser et on a:
$ L_axe = omega J_axe "avec" J_axe = intsolid r^2 rho(M) dif tau $

== Exemple de moment d'inertie

#figure(caption: [Les moments d'inertie étudiés], image("moment.png", width: 80%))

+ Moment d'inertie d'un cylindre de masse $M$, de densité constante $rho$, de rayon $R$
  et de hauteur $h$ autour d'un axe passant par le centre du cylindre.
  On a:
  $ dif m = rho dif tau = rho (dif r) (r dif theta) (dif z) = rho r dif r dif theta dif z $

  On intègre sur le cylindre (sur une ligne ($[0, R]$), qu'on balaye sur le cercle $[0, 2pi]$ et sur toute la hauteur ($[0, h]$)) d'où:
  $ J_axe &= integral_0^R integral_0^(2pi) integral_0^h r^3 rho r dif r dif theta dif z \
  &= rho integral_0^R (integral_0^(2pi) (integral_0^h 1 dif z) dif theta)r^3 dif r \
  &= rho integral_0^R (2pi h) r^3 dif r \
  &= 2 pi h rho [r^4/4]_0^R \
  &= (pi h rho R^4)/2
  $

+ Moment d'inertie d'une tige (infiniment fine) de masse $M$ de longueur $l$ de masse linéique $lambda = M/l$ 
  (en $"kg"dot"m"^(-1)$)
  par-rapport à un axe passant par son milieu:
  $ dif m = lambda dif x $
  $ J_axe = integral_(-l/2)^(l/2) (lambda dif x) r^2 $
  Comme la tige est infiniment fine, le rayon à partir du centre est égale à la distance au centrer sur l'axe $x$, d'où:
  $ J_axe &= integral_(-l/2)^(l/2) (lambda dif x) x^2 \
  &= lambda [x^3/3]_(-l/2)^(l/2) = (lambda l^3)/12 = (M l^2)/12
  $

+ Moment d'intertie d'une tige  de longueur $l$, de 
  $ J_axe = integral_0^l (lambda dif x) x^2 = (lambda l^3)/3 $

+ Moment d'interie d'une sphère de centre $O$, de rayon $R$,
  avec un axe $axe$ passant par son centre $O$.
  On se place en coordonnées sphériques:
  $ dif tau = (dif r) (r dif theta) (pi sin theta dif phi) $
  On appelle $x$ la *distance à l'axe* et $r$ la distance dans les coordonnées sphériques:
  #figcan({
    import draw: *
    line((0, -1), (0, 1))
    point((0, -1), value: $O$)
    line((0, -1), (1, 0))
    content((0.8, -0.6), $r$)

    line((0, 0), (1, 0))
    content((0.5, 0.3), $x$)

    cetz.angle.angle((0, -1), (1, 0), (0, 0))
    content((0.3, -0.3), $theta$)

    content((-0.3, 0.8), $axe$)
  })
  
  On a donc:
  $ x = r sin theta $

  $ J_axe &= integral_0^R integral_0^pi integral_0^(2pi) x^2 r dif r dif theta pi sin theta dif phi \
  &= integral_0^R integral_0^pi integral_0^(2pi) r^4 (sin theta)^3 dif r dif theta pi dif phi \
  &= pi integral_0^R (integral_0^pi (integral_0^(2pi) 1 dif phi) (sin^3 theta dif theta) r^4 dif r \
  &= pi integral_0^R (integral_0^pi 2pi sin^3 theta dif theta) r^4 dif r \
  &= 2 pi^2 integral_0^R (integral_0^pi sin^3 theta dif theta) r^4 dif r \
  &"(faire un changement de variable ou linéariser pour calculer le "sin^3 theta")" \
  &= 2 pi^2 integral_0^R 4/3 r^4 dif r  \
  &= 8/3 pi^2 integral_0^R r^4 dif r  \
  &= 2 times 4/3 pi^2 [r^5/5]_0^R \
  &= (2 pi^2 R^5)/5 4/3 
$

= Actions mécaniques s'exerçant sur un solide en rotation

#note[
  Dans ce chapitre, on n'utilisera jamais de PFD ou d'énergétique sur un seul point.
  On utilisera toujours le théorème des moments cinétiques. \
  Le point d'application de la force devient très important.
]

== Rappel: moment d'une force par rapport à un axe

#let momforce = $arw(cal(M)_O)$

Avec $arw(O M)_i$ le point d'application de la force $arw(F_i)$:

$ momforce (sum_i arw(f_i)) = sum_i arw(O M)_i and arw(F_i) 
"et"
cal(M)_axe = momforce (sum_i arw(F_i)) dot arw(u_axe)
$

== Couple de deux forces

#grid(
  columns: (2fr, 1fr),
  align: (auto, horizon),
  [
On dit que deux forces $arw(F_1)$ et $arw(F_2)$ forment un couple 
$(arw(F_1), arw(F_2))$ par-rapport à $axe$ si:
- Les deux forces sont *opposées*: $arw(F_1) = - arw(F_2)$
- Le moment de la résultante des forces n'est pas nul et est proportionnel à la distance:
  $ cal(M)_axe (arw(F_1) + arw(F_2)) = F d != 0  $

Avec $d_1$ la distance entre $O$ et le projeté orthogonal de $O$ sur $(F_1)$
  (la distance entre $O$ et $(F_1)$),
  $d_2$ la distance entre $O$ et $(F_2)$,
  et $d = d_1 + d_2$ la distance entre $arw(F_1)$ et $arw(F_2)$ $A$ et $B$

],
  figcan({
    import draw: *


    line((0.5, 2, -0.5), (0.5, -2, -0.5), name: "l", stroke: (dash: "dotted"))

    point((0, 0, 0), value: $A$, name: "A")
    point((1, 0, -1), value: $B$, name: "B")

    arrow((0, 0, 0), (-1, -1, 1), tip: $arw(F_1)$)

    line((-1, 0, 1), (-1, 0, -2), (2, 0, -2), (2, 0, 1), close: true, stroke: red)
    line((1, 0, -1), (0, -1, 0), stroke: (dash: "dashed"), name: "f2r")

    arrow((1, 0, -1), (2, 1, -2), tip: $arw(F_2)$)

    line((0, 0, 0), (1, 1, -1), stroke: (dash: "dashed"), name: "f1r")

    line("f1r.33%", "f2r.33%")

    content("f1r.33%", $d_1$, anchor: "north", padding: 4pt)
    content("f2r.33%", $d_2$, anchor: "south", padding: 5pt)


    // content((0.7, 0, 0.4), $d_1$)
    // content((1.3, 0, -0.2), $d_2$)

    point((0.5, 0, -0.5), value: $O$, padding: 8pt)

    content((0.8, 2, -0.5), $axe$)
  })
)

On parle de *couple moteur* si le couple augmente la vitesse de rotation,
et de *couple de freinage* si il diminue la vitesse de rotation.

#tip[
  Un couple de forces ne fait que appliquer une rotation et n'applique
  aucune translation.
]

#hp[
  Toute action mécanique sur un solide peut être décrîte par:
  - Une force sur le centre de gravité (qui n'applique qu'une translation)
  - Un couple (qui n'applique qu'une rotation)

  On parle alors de *torseur*.\
  Voir #link("https://fr.wikipedia.org/wiki/Torseur_cin%C3%A9tique")[Torseur cinétique] et #link("https://fr.wikipedia.org/wiki/Torseur_cin%C3%A9matique")[Torseur cinématique]
]

== Cas des couples de torsions

De la même manière qu'un ressort applique une force de rappel sur un point,
un couple de torsion applique un moment de rappel d'amplitude
$Gamma = - C alpha$ avec $alpha$ l'angle de torsion et $C$ la cosntante de
torsion du fil (équivalent à $k$ la raideur du ressort).

== Liaison pivot

On appelle *liaison pivot* une liaison entre des solides qui permet de limiter
le mouvement d'un solide à la rotation autour d'une axe fixe.

On supposera toujours que les liasons pivots sont parfaites et sans frottement.

= Théorème du moment cinétique par-rapport à un axe

== Rappel: théorème du moment cinétique par-rapport à un axe fixe pour un point matériel

$ (dif L_axe)/(dif t) = sum_i cal(M)_(axe,i) $

== Théorème du moment cinétique par-rapport à un axe fixe pour un système de point matériel

Pour un ensemble de points matériels, on somme le théorème des moments cinétique
pour chaque point:
$ (dif L_axe)/(dif t) = 
sum_k (dif L_(axe,k))/(dif t) = sum_k (sum_i cal(M)_(axe, k, i))
$

== Théorème du moment cinétique par-rapport à un axe fixe pour un solide

On passe d'une sommation discrète à une sommation continue:
$ $
