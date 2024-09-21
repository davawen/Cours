#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Lentilles sphériques minces dans l'approximation de Gauss]

= Définitions

== Lentille

Une lentille est composée de deux dioptres formant un volume d'indice $n$ placés dans un milieu d'indice $n'$ 

#figure(caption: [Une lentille d'indice $n'$], canvas({
  import draw: *

  lentil(0)

  content((-1, 0), $n$)
  content((1, 0), $n$)

  content((0, 0), $n'$)

  content((-1, -1), [Dioptre 1])
  content((1, -1), [Dioptre 2])
}))

== Lentille sphérique

Dans une lentille sphérique, les deux dioptres sont des sphères.

== Lentille sphérique mince

#figure(caption: [Lentille sphérique], canvas({
  import draw: *

  line((-5, 0), (5, 0), mark: (end: "straight"))

  let dash_a = 40deg
  let lentil_a = 20deg

  point((-3, 0), value: $c_2$, name: "c2")
  point((3, 0), value: $c_1$, name: "c1")

  // circle("c1", radius: 3, stroke: (dash: "dashed"))
  arc("c1", start: 180deg - dash_a, delta: 2*dash_a, radius: 3.3, anchor: "origin", stroke: (dash: "dashed"), name: "c1dash")
  arc("c1", start: 180deg - lentil_a, delta: 2*lentil_a, radius: 3.3, anchor: "origin")

  arc("c2", start: -dash_a, delta: 2*dash_a, radius: 3, anchor: "origin", stroke: (dash: "dashed"), name: "c2dash")
  arc("c2", start: -lentil_a, delta: 2*lentil_a, radius: 3, anchor: "origin")

  line("c2", "c2dash.10%")
  content(("c2", 50%, "c2dash.10%"), angle: "c2dash.10%", $R_2$, anchor: "south", padding: .2)

  line("c1", "c1dash.90%")
  content(("c1", 50%, "c1dash.90%"), angle: "c1", $R_1$, anchor: "south", padding: .2)
}))

On doit définir deux points, $S_1$ et $S_2$, les sommets du dioptre sphérique.
L'épaisseur de la lentille $S_1 S_2$, qu'on note habituellement $e$ doit être faible devant $R_1$ et devant $R_2$

Pour des lentilles très fines, on a $e ~~> 0$, donc $S_1 approx S_2$.

== Centre
Comme $S_1 approx S_2$, on va les considérer comme un unique point $O$, le centre de la lentille.


== Différentes formes de lentille - Représentation

=== Lentilles sphérique à bord mince

#figure(image("fig1.png", width: 80%))

=== Lentilles sphériques à bord épaix

#figure(image("fig2.png", width: 80%))

=== Représentations

#figure(image("fig3.png", width: 80%))

#pagebreak()

= Lentilles et conditions de Gauss

== Stigmatisme des lentilles

#figure(caption: [Absence de stigmatisme pour une lentille mince sphérique en ne limitant pas le faisceau et stigmatisme approché d’une lentille mince sphérique en limitant le faisceau aux rayons arrivant au voisinage du centre], image("fig_stigmatisme.png"))

Le caractère de stigmatique rigoureux de la lentille n'est pas vérifié.

Si on pose les conditions de Gauss pour la lentille (en utilisaant un diaphragme), on observe un stigmatisme approché.

== Aplanétisme des lentilles

#figure(caption: [Absence d’aplanétisme pour une lentille mince sphérique lorsque les rayons arrivent trop inclinés sur la lentille], image("fig_aplanetisme.png"))

En déplaçant le point objet perpendiculairement, on voit que tant qu'on reste dans de conditions de Gausse (point pas trop éloigné de l'axe optique), l'aplanétisme approché est vérifié

== Stigmatisme et aplanétisme des conditions de Gauss

Les conditions de Gauss assurent le stigmatisme et l'aplanétisme peut importe la lentille (tant qu'elle est centrée).

== Caractère focal d'une lentille

#figure(caption: [Caractère focal d'une lentille mince sphérique], image("fig_focal.png", width: 80%))

== Foyers principaux, foyers secondaires

#def[Foyer principal]: Foyer sur l'axe optique \
#def[Foyer secondaire]: Autre foyer sur l'axe optique

Voir: _Chapitre 2. 2.4) Foyers secondaires - Plan focal_

== Distance focale et vergence

La distance focale est la distance algébrique du centre de la lentille ($O$) au foyer image.

$f' = ov(O F') = -ov(O F) = ov(F O)$

La vergence est l'inverse de la distance focale:
$ V = 1 / f' $

#tip[La vergence garde toujours le même signe que la distance focale.]

== Signe de la distance focale et caractère de la lentille

On aura:
- $f' > 0$ si la lentille est convergente
- $f' < 0$ si la lentille est divergente

= Construction d'une image

== Règles de construction

- #stack(dir: ltr, [Le rayon passant par le centre de la lentille est non dévié (], line(start: (0em, 0.3em)), [)])
- #stack(dir: ltr, [Le rayon arrivant $parallel$ à l'axe optique passe par $F'$ (], line(start: (0em, 0.3em), stroke: blue), [)])
- #stack(dir: ltr, [Le rayon passant par $F$ ressort $parallel$ à l'axe optique (], line(start: (0em, 0.3em), stroke: red), [)])

Ces règles de constructions ne sont valables que dans les conditions de Gauss, car "centre de la lentille" = sommet du premier dioptre + sommet du deuxième dioptre dans le cadre d'une lentille mince.

== Cas d'une lentille convergente

#figure(caption: [Conjugaison des objets et des images dans ne lentille divergente], image("fig_tab_convergente.png"))

== Cas d'une lentille divergente

#figure(caption: [Conjugaison des objets et des images dans une lentille divergente], image("fig_tab_divergente.png"))

= Relations de conjugaisons

== Formule de conjugaison avec origine au centre

Les relations qu'on va écrire ne dépendent pas d'un positionnement spécifique. On peut les utiliser pour n'importe quel type de lentille et de positionnement.

#figure(caption: [Relation de conjugaison par construction], image("fig_conjugaison_construction.png", width: 60%))

Dans le triangle $O F_1' A'$:
$ alpha + (pi - beta) + (-alpha') = pi $
#resultb($ alpha - alpha' = beta $)

On se place dans les conditions de Gauss, on peut donc travailler avec des petits angles.
$ alpha approx tan alpha $
$ alpha' approx tan alpha' $

On place le point $K$, on a:
$ beta = beta_1 + beta_2 $ 
$ beta_1 approx tan beta_1 &= ov(K I)/ov(K F'_1) "(dans le triangle " K I F'_ 1")" \
&= ov(K I)/ov(O F') $ 
$ beta_2 approx tan beta_2 = ov(O K)/ov(K F'_1) = ov(O K)/ov(O F') $

On donc:
$ beta = ov(K I)/ov(O F') + ov(O K)/ov(O F') = ov(O I)/ov(O F') $

De plus:
$ alpha approx tan alpha = ov(O I)/ov(A O) "(dans le triangle AOI)" $
$ alpha' approx tan alpha' = ov(O I)/ov(A' O) "(dans le triangle A'OI)" $

On remplace dans l'équation $alpha - alpha' = beta$:
$ ov(O I) / ov(A O) - ov(O I)/ov(A' O) = ov(O I)/ov(O F') $

On a donc bien:
#resultb($ 1 / ov(O A') - 1 / ov(O A) = 1 / ov(O F') = 1/f' $)

== Formule de conjugaison avec origines aux foyers dits de Newton

#figure(caption: [Formule de conjugaison de Newton], image("fig_conjugaison_newton.png", width: 60%))

On place l'angle $alpha$.
On se place dans les conditions de Gauss, donc:
$ alpha approx tan alpha &= ov(A B)/ov(A F) "(dans le triangle ABF)" \
&= ov(O I)/ov(A F) \
&= ov(O J) / ov(O F) "(dans le triangle OJF)" \
&= ov(A' B')/ov(O F)
$

On a donc:
$ ov(A B)/ov(A F) = ov(A'B')/ov(O F) <=> ov(A'B')/ov(A B) = ov(O F)/ov(A F) $


On place l'angle $beta$:
$ beta approx tan beta &= ov(O I)/ov(O F') = ov(A B)/ov(O F) "(dans le triangle OIF')" \
&= ov(A' B')/ov(A'F') = ov(O J)/ov(A' F') "(dans le triangle F'A'B')" $

On a donc que:
$ ov(A B)/ov(O F') = ov(A' B')/ov(A'F') <=> ov(A'B')/ov(A B) = ov(A'F')/ov(O F') $

Ce qui implique:
$ ov(O F)/ov(A F) = ov(A' F')/o(O F') \
<=> ov(O F) dot ov(O F') = ov(A F) dot ov(A' F') = ov(F A) dot ov(F' A') $
#resultb($ ov(F' A') dot ov(F A) = ov(O F) dot ov(O F') = -f'^2 $)

== Grandissement

Le grandissmenet $gamma$ est $gamma = ov(A'B')/ov(A B)$ par définition. \
On a l'expression du grandissement avec origines aux foyers:
#resultb($ gamma = ov(O F)/ov(A F) = ov(A F')/ov(O F') $)

Expression avec origines aux centre:
$ delta approx tan delta $
$ tan delta = ov(A B)/ov(A O) "(dans le triangle OAB)" $
Et
$ tan delta = ov(A'B')/ov(A'O) "(dans le triangle OA'B')" $

On a donc:
$ ov(A B)/ov(A O) = ov(A'B')/ov(A' O) $
$ <=> ov(A'B')/ov(A B) = ov(A' O)/ov(A O) = ov(O A')/ov(O A) $
Donc:
#resultb($ gamma = ov(O A')/ov(O A) $)

= Reconnaissance de la nature d'une lentille
Observation d'un objet lointain:
- Image renversée avec une lentille convergente
- Image virtuelle droite avec une lentille divergente

Observation d'un objet proche:
- Effet "loupe" avec une lentille convergente
- Image plus petite avec une lentille divergente


