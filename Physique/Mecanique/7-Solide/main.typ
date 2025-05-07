#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#let axe = $Sigma$

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

$
momcin (S) &= integral.triple_(M in S) (arw(O M) and dif m arw(v_ref) (M)) \
&= integral.triple_(M in S) (arw(O M) and rho(M) dif tau arw(v_ref) (M)) \
momcina (S) &= 
integral.triple_(M in S) (arw(O M) and rho(M) dif tau arw(v_ref) (M)) dot arw(u_axe)
$
