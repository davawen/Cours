#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Action du champ magnétique]

= Action de $arw(B)$ sur un courant - Force de Laplace 

== Rappel: Force de Lorentz

On rappelle qu'une particule de charge $q$ et de vitesse $arw(v)$ dans un champ magnétique $arw(B)$ subit une force magnétique dîte de Lorentz
définie par $arw(F) = q arw(v) and arw(B)$

== Action sur un courant

Par courant, on parle d'ensemble de particule chargées animé
d'un mouvement collectif (de même vitesse).

De manière discrète, on considère $N$ particules chargées
de vitesse $arw(v)$ identique.

La résultante des forces magnétiques sur le système est:
$ arw(F) = sum_i q_i arw(v) and arw(B) $

De manière continue, on considère pour chaque volume différentiel
la force qui résulte de ce volume. Avec $n$ la densité volumique
de charge et $dif tau$ le volume élémentaire:
$ dif arw(F) = underbrace((n q arw(v)), arw(j)) and arw(B) dif tau $

On définit la *densité de force volumique*:
$ (dif arw(F))/(dif tau) = arw(j) and arw(B) $

== Action sur un fil parcouru par un courant - Force de Laplace

On considère un fil parcourut par un courant:
#figcan({
  import draw: *

  line((-2, 1), (2, 1))
  line((-2, -1), (2, -1))

  point((-1, 0), value: $q$)
  arrow((-1, 0), (0, 0), tip: $arw(v)$)

  arrow((2, 0), (2.6, 0), tip: $I$, pad: 0.1)
  arrow((-3, 0), (-2.4, 0), tip: $I$, pad: 0.1)
})

Si on applique un champ magnétique à ce fil, les charges vont subir
une force magnétique:
#figcan({
  import draw: *

  line((-2, 1), (2, 1))
  line((-2, -1), (2, -1))

  point((-1, 0), value: $q$)
  arrow((-1, 0), (0, 0), tip: $arw(v)$)

  arrow((2, 0), (2.6, 0), tip: $I$, pad: 0.1)
  arrow((-3, 0), (-2.4, 0), tip: $I$, pad: 0.1)

  set-style(stroke: red)


  circle((0, 2), radius: 0.2)
  circle((0, 2), radius: 0.075, fill: red)
  content((0.5, 2), $arw(B)$)

  arrow((-1, 0), (-1, -0.4), tip: $arw(F_"mag")$)
})

Les charges positives vont s'accumuler d'un coté, ce qui va causer
une accumulation de charges négatives de l'autre côté du fil.
C'est *l'effet Hall*.

La différence de charge crée un potentielle et donc un champ électrique,
c'est le *champ de Hall* $arw(E_H)$

Le champ magnétique et le champ de Hall finissent par se compenser en régime permanent (_pourquoi??_):
$ q arw(E_H) + q arw(v) and arw(B) = arw(0) $
$ => arw(E_H) = - arw(v) and arw(B) $

Donc au final, les charges mobiles ne subissent aucune force.
Mais le fil possède aussi des charges fixes.
Ces charges vont subir l'action du champ de Hall.
Indirectement, les charges fixes (le fil en lui-même) subissent
donc la force magnétique appliquée aux charges mobiles.

Pour trouver la valeur de cette force,
on reprend l'expression différentielle de la force sur une petite
unité de volume du fil:
$ dif arw(F) = arw(j) dif tau and arw(B)  $
On s'intéresse à un fil, donc on considère le volume linéique:
$ arw(j) dif tau = I arw(dif L) $

La force subie par le fil, la *force de Laplace* vaut donc:
#resultb[$ dif arw(F_L) = I dif arw(l) and arw(B) $]

== Ancienne définiton légale de l'Ampère

On va considérer que certains fils sont actifs (ils vont créer
des champs magnétiques) et que certains fils sont passif
(ils vont subir l'effet de champ magnétiques).

On considère deux fils parcourus par des courants $I_1$ et $I_2$, distants
de $d$.

Si on considère le fil $1$ comme actif, il créé un champ magnétique 
autour de lui-même. Le fil $2$ considéré comme passif subit
alors une force de Laplace:

#figcan({
  import draw: *

  line((0, 0), (0, 3), mark: (end: "straight", pos: -50%))
  content((0, -0.3), [fil 1])
  content((0, -0.7), [actif])

  circle((-1, 1), radius: 0.2)
  circle((-1, 1), radius: 0.075, fill: black)
  content((-1.7, 1), $arw(B)_(1->)$)

  circle((1, 1), radius: 0.2)
  cross((1, 1))
  content((1.7, 1), $arw(B)_(1->)$)

  line((4, 0), (4, 3), mark: (end: "straight", pos: -50%))
  content((4, -0.3), [fil 2])
  content((4, -0.7), [passif])

  line((3.8, 2), (4.2, 2))
  line((3.8, 2.5), (4.2, 2.5))
  content((4.6, 2.25), $dif arw(cal(l))$)

  set-style(stroke: red)
  arrow((4, 2.25), (3, 2.25), tip: $arw(dif F)_(L 1 ->2)$, pad: 0.7)

})

Mais l'action est réciproque: en considérant le fil $2$ comme actif, 
il créé de même un champ magnétique, et le fil $1$ subit
une force de Laplace.
#todo[
  Schéma inverse
]

Le fil $1$ crée un champ magnétique d'intensité:
$ arw(B)_1 = (mu_0)/(2 pi) I_1/r arw(u_theta) $
Une portion de taille $l$ du fil $2$ subit:
$ arw(F_(1->2)) = I_2 l arw(u_z) and (mu_0)/(2 pi) I_1/d arw(u_theta)
= - (mu_0)/(2 pi) I_1 I_2 l/d arw(u_r) 
$

On définit l'ampère comme l'intensite du courant qui
maintenu dans deux conducteurs rectilignes, infinis, parallèles,
de section circulaire négligeable et distants de $1 "m"$ produit une 
force d'interaction entre ces deux conducteurs égale à $2 dot 10^(-7) " N"dot"m"^(-1) $

== Résultante des forces de Laplace

On considère un conducteur $cal(C)$ (un ensemble de points). \
On somme la force de Laplace sur l'intégralité du conducteur:
$ arw(F_L) = integral_(P in cal(C)) I(P) dif arw(cal(l))_P and arw(B)(P) $

=== Exemple

#figure(image("exemple.png"))

On étudie le système de la barre,
on se place dans le référentiel terrestre supposé Galiléen,
on fait un bilan des forces:
- Poids
- Réaction des rails (par de frottement donc on considère uniquement
  une réaction normale)
- Force de Laplace $arw(F_L)$

On calcule la force de Laplace:

$ arw(F_L) &= integral_0^(-a) I (dif x arw(u_x)) and B arw(u_z) \
&= - integral_0^a I (dif x arw(u_x)) and B arw(u_z) \
&= integral_0^a I B dif x arw(u_y) \
&= I a B arw(u_y)
$


== Puissance des forces de Laplace

La puissance est définie par:
$ cal(P)_L = arw(F)_L dot arw(v) $
#warn[
  Ici, $arw(v)$ se réfère à la *vitesse du circuit* et pas la
  vitesse des charges du courant.
]

En reprenant l'exemple précedent, la vitesse va nécessairement être
dirigée le long de l'axe $arw(u_y)$:
$ cal(P)_L = (I a B arw(u_y)) dot (v arw(u_y))
= I a B v != 0
$

== Couple de Laplace sur une spire rectangulaire

Une spire rectangulaire est un cadre rectangulaire parcouru
par un courant $$

#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  figcan(caption: [Vue du dessus], {
    import draw: *

    line((0, 0), (0, 4), (3, 4), (3, 0), (0, 0))
    point((0, 0), value: $N$, anchor: "north-east")
    point((3, 0), value: $P$, anchor: "north-west")
    point((0, 4), value: $M$)
    point((3, 4), value: $Q$, anchor: "south-west")

    arrow((1.5, -0.5), (1.5, 4.5), tip: $arw(u_y)$)

    // vecout((1.5, 2), $arw(n)$, (0.5, 0))

    circle((1.5, 2), radius: 0.2)
    circle((1.5, 2), radius: 0.075, fill: black)
    content((2, 2), $arw(n)$)

    line((-0.5, 0), (-0.5, 4), mark: (start: "straight", end: "straight"))
    content((-1, 2), $b$)

    line((0, -1), (3, -1), mark: (start: "straight", end: "straight"))
    content((1.5, -1.5), $a$)
  }),
  figcan(caption: [Vue de coté], {
    import draw: *

    arrow((-2, 0), (2, 0), tip: $arw(u_x)$)

    line((-1, 2), (1, -2))
    line((0, -2), (0, 2), stroke: (dash: "dotted"))

    arrow((0, 0), (1, 1), tip: $arw(n)$)
    cetz.angle.angle((0, 0), (1, 0), (1, 1))
    content((0.7, 0.35), $alpha$)

    set-style(stroke: red)
    arrow((0, 0), (1, 0))
    content((1, -0.4), $arw(B)$)
  })
)

On calcule les forces de Laplace sur chacun des fils du cadre:
$ arw(F)_(M Q) &= I a B sin(pi/2 - alpha) arw(u_z) \
&= I a B cos alpha arw(u_z) $
$ arw(F)_(P N) = - I a B cos alpha arw(u_z) $
$ arw(F)_(Q P) = - I b B arw(u_y) $
$ arw(F)_(N M) = I b B arw(u_y) $

En fait la résultante des forces:
$ arw(F) = arw(F)_(M Q) + arw(F)_(P N) + arw(F)_(Q P) + arw(F)_(N M) = arw(0) $

De plus, les forces sont à une même distance du centre $O$.

Les forces $arw(F)_(M Q), arw(F)_(N P)$ et $arw(F)_(Q P), arw(F)_(M N)$ 
forment des couples.

On calcule les moments qui résultent:
#let mom = $arw(cal(M))_O$

On pose $T$ le milieu du segment $[M Q]$ et $J$ le milieu du
segment $[Q P]$

$ mom (arw(F)_(M Q)) = arw(O T) and arw(F)_(M Q) = arw(0) $
$ mom (arw(F)_(P N)) = arw(0) $
$ mom (arw(F)_(Q P)) = arw(O J) and arw(F)_(Q P)
= - (a/2 sin alpha) I b B arw(u_z)
$
$ mom (arw(F)_(N M)) = - a/2 sin alpha I b B arw(u_z) $

On calcule le couple:
$ arw(Gamma) &= mom (arw(F)_(Q P)) + mom(arw(F)_(N M)) \
&= - a sin alpha I b B arw(u_z) $
Comme l'angle entre la normale $arw(n)$ et l'axe $arw(u_x)$ vaut
$alpha$, et que $(arw(n), arw(u_x), arw(u_z))$ forme une base indirecte,
on a:
$ arw(n) and arw(u_x) = - sin alpha arw(u_z) $
Donc:
$ arw(Gamma) = I a b B (arw(n) and arw(u_x)) = I a b (arw(n) and arw(B))
= arw(cal(M)) and arw(B) "avec" arw(cal(M)) = I a b arw(n) $

On appelle $arw(cal(M))$ le moment magnétique et $arw(Gamma)$ le couple de Laplace. $arw(Gamma)$ est un moment.
(On peut aussi poser $arw(S) = a b arw(n)$ et on a $arw(cal(M)) = I arw(S)$)

== Puissance du couple de Laplace

$arw(Gamma)$ est sur l'axe $(O_z)$, donc:
$ arw(Gamma) = Gamma arw(u_z) $

Donc le cadre tourne autour de l'axe $(O_z)$. On pose le vecteur rotation
$arw(Omega) = Omega arw(u_z)$ du cadre, et on a:
$ cal(P) = arw(Gamma) dot arw(Omega)
= Gamma Omega
= (- I a b B sin alpha) dot(alpha)
$

= Action d'un champ magnétique sur un aimant

== Résultante des forces sur un dipole magnétique dans un champ uniforme

On veut calculer la résultante des forces de Laplace sur un dipole
magnétique, défini par un contour parcouru par un courant:
#figcan(caption: [Le dipole], {
  import draw: *

  catmull((0, 0), (1, -1), (3, -1), (4, 1), (2, 0.5), close: true, name: "c")

  mark("c.20%", "c.21%", symbol: "straight")
  mark("c.40%", "c.41%", symbol: "straight")
  mark("c.70%", "c.71%", symbol: "straight")
  mark("c.90%", "c.91%", symbol: "straight")
})

#tip[
  On s'interesse au cas général de la spire rectangulaire vu ci-dessus.
]

On calcule la force de Laplace pour chacun des points appartenant
au contour du dipole:
$ arw(F_L) = integral.cont_(M in cal(C) "fermé") I dif arw(O M) and arw(B)(M) $
On suppose que le champ magnétique $arw(B)$ est uniforme:
$ arw(F_L) = I (integral.cont_(M in cal(C)) dif arw(O M)) and arw(B) $
Or l'intégrale du mouvement élémentaire sur un contour vaut $0$, donc
la résultante des forces est nulle:
$ arw(F_L) = arw(0) $
Donc la seule action mécanique qu'on peut attendre sur un dipole,
c'est un couple.
On ne pourra pas obtenir de translation.

#warn[
  Si on retire l'hypothèse de champ uniforme, ce résultat est (de manière plutôt logique) faux.
]

== Moment exercé sur un dipole magnétique

$ arw(Gamma) = arw(cal(M)) and arw(B) = I arw(S) and arw(B) $

Avec $cal(M)$ allant du pôle sud vers le pôle nord, et $arw(S)$
le vecteur normal de la boucle de courant multiplié par sa surface.

== Energie potentielle d'un dipôle magnétique dans un champ magnétique

On a:
$ E_p = - arw(cal(M)) dot arw(B) $

== Orentiation d'un aimant dans un champ magnétique

On étudie les positions d'équilibres. En notant
$theta$ l'angle entre $arw(cal(M))$ et $arw(B)$,
on est à l'équilibre si:
$ (dif E_p)/(dif theta) = 0 $
On a:
$ E_p = - cal(M) B cos theta $
Donc:
$ (dif E_p)/(dif theta) = cal(M) B sin theta = 0
<=> sin theta = 0 <=> theta eq.triple 0 [pi]
$
Ces positions d'équilibres sont stables si:
$ (dif^2 E_p)/(dif theta^2) > 0 $

$ (dif^2 E_p)/(dif theta^2) = cal(M) B cos(theta) $
Si $theta = 0$, l'équilibre est stable. Si $theta = pi$, l'équilibre est instable.

= Création d'un champ magnétique tournant - Effet moteur

== Création du champ magnétique tournant

Pour créer un champ magnétique tournant, on utilise deux bobines situées
sur les axes $(O_x)$ et $(O_y)$, qui créent des champs magnétiques sur
ces axes:

#figcan({
  import draw: *

  arrow((-2, 0, 0), (2, 0, 0))
  arrow((0, -2, 0), (0, 2, 0))
  arrow((0, 0, -2), (0, 0, 2))

  set-style(stroke: blue)
  on-yz(x: -2, circle((0, 0), radius: 0.5))
  on-yz(x: -2.1, circle((0, 0), radius: 0.5))
  on-yz(x: -2.2, circle((0, 0), radius: 0.5))


  set-style(stroke: red)
  on-xz(y: -2, circle((0, 0), radius: 0.5))
  on-xz(y: -2.1, circle((0, 0), radius: 0.5))
  on-xz(y: -2.2, circle((0, 0), radius: 0.5))

  arrow((0, 0, 0), (1.2, 0, 0), stroke: blue + 2pt)
  arrow((0, 0, 0), (0, 0.7, 0), stroke: red + 2pt)

  arrow((0, 0, 0), (1.2, 0.7, 0), stroke: purple + 2pt, tip: $arw(B)$)

  content((0.7, -0.5), $arw(B_x)$)
  content((-0.5, 0.5), $arw(B_y)$)

})

On alimente les bobines avec deux courant alternatifs $i_x$ et $i_y$ en quadrature de phase:
$ arw(B_x) (t) = K_x i_x (t) arw(u_x) = K I_0 cos(omega_0 t) arw(u_x) $
$ arw(B_y) (t) = K_y i_y (t) arw(u_y) = K I_0 sin(omega_0 t) arw(u_y) $

On place un aimant au centre du dispositif.

Par principe de superposition, on peut obtenir le champ magnétique
subit par l'aimant:
$ arw(B)(t) = K I_0 (cos(omega_0 t) arw(u_x) + sin(omega_0 t) arw(u_y)) $

Le champ magnétique $arw(B)$ est donc un vecteur
qui tourne avec une vitesse angulaire $omega_0$.

L'aimant essaye constamment de s'aligner avec ce champ magnétique:
on obtient un mouvement de rotation de l'aimant.
