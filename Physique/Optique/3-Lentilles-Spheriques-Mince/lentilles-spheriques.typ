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
#def[Foyer secondaire]: Autre foyer pas sur l'axe optique

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
#figure_lentille_convergente

== Cas d'une lentille divergente

#figure_lentille_divergente

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

= Construction d'un rayon transmis ou d'un rayon incident - Utilisation des foyers secondaires

#figure(caption: [Obtention du rayon transmis par une lentille convergente], image("fig_rayon_transmis.png", width: 80%))

#figure(caption: [Obtention du rayon transmis par une lentille divergente], image("fig_rayon_transmis_div.png", width: 80%))

Pour construire un rayon transmis quelconque, on trace le rayon parallèle à celui-ci qui passe par le centre de la lentille.

Le rayon étudié passe forcément par l'intersection du rayon parallèle et du plan focal image.

On peut utiliser la même méthode avec le foyer objet. On place l'intersection du plan focal objet et du rayon incident, et on trace le rayon qui passe par cette intersection et par le centre de la lentille. Le rayon transmis est parallèle avec ce rayon.


= Projection d'une image à l'aide d'une lentille

Le problème posé est: «on a un objet, et l'objet en question, ça peut-être une observation, et vous voulez par exemple le projeter sur un écran, imaginez par exemple un petit objet et je veux vous la montrer et que tout le monde la voie»

On veut faire une projection pour récuperer une image réelle plus grande (ou plus petite) que l'objet utilisé.

On a un objet réel, on veut en faire une image réelle, avec des critères de grandissement qui peuvent changer (entre plus petit et plus grand).

== Choix du type de lentille

#grid(columns: (1fr, 1fr), gutter: 4em,
figure_lentille_convergente,
figure_lentille_divergente
)

On va utiliser une lentille convergente (seul moyen de faire réel $->$ réel). On aura donc une image renversée.

== Condition de projection d'un objet réel

On a la relation de conjugaison:
$ 1/ov(O A') - 1/ov(O A) = 1/f' $

On pose: $D = ov(A A')$ et $x = ov(O A')$.

On a une image réelle si et seulement si $x > 0$.

Où faut-il mettre la lentille entre les deux pour pouvoir conjuguer l'objet $A$ avec son image $A'$

#figure(canvas({
  import draw: *

  line((-4, 0), (4, 0), mark: (end: "straight"))

  line((0, -2), (0, 2), mark: (start: "straight", end: "straight"))

  point((-3, 0), value: $A$)
  point((2, 0), value: $A'$)

  line((-3, -0.5), (2, -0.5), mark: (start: "straight", end: "straight"), name: "D")

  line((0, 1), (2, 1), mark: (start: "straight", end: "straight"), name: "x")

  content("D.50%", $D$, anchor: "north", padding: 5pt)
  content("x.50%", $x$, anchor: "south", padding: 5pt)
}))

On a $ov(O A) = ov(O A') + ov(A' A) = x - D$

On veut déterminer la position de la lentille, donc on veut déterminer les 

On a donc:
$ 1/x - 1/(x - D) = 1/f' $
$ ((x - D) - x)/(x(x - D)) = 1/f' $
$ (x(x - D))/((x - D) - x) = f' $
$ x(x - D) = f'((x - D) - x) $
$ x(x - D) = f'(x - D) - f'x $

D'où:
$ f'(x - D) - x f' = x(x - D) $
$ f'x - f' D - x f' = x^2 - D x  $
$ -f' D = x^2 - D x $
#resultb($ x^2 - D x + f' D = 0 $)

En résolvant l'équation pour $x$:
$ Delta = D^2 - 4f' D $

On aura des solutions réelles que si $Delta >= 0$.
Interprétation physique: $x$ est une distance, donc $x in RR^+$.

$ D (D - 4f') >= 0 $

On veut $A$ objet réel et $A'$ image réelle, donc $ov(A A') > 0$, donc $D > 0$. Pour que l'équation ait une solution réelle, il faut que $D >= 4f'$.

== Condition sur le grandissement <condition>

On suppose que la condition précédente est vérifiée ($D >= 4f'$), et que par conséquent $x$ est positif.

On a:
#box(height: 5em)[
#columns[
$ x_1 = (D + sqrt(D(D - 4f')))/2 $
$ x_2 = (D - sqrt(D(D - 4f')))/2 $
]]

On a $D >= 0$, donc $sqrt(D(D - 4f')) >= 0$, donc $x_1 > x_2$. \
$x_1$ est trivialement positif. \
$sqrt(D(D - 4f')) = sqrt(D^2 - 4D f') < sqrt(D^2)$, donc $x_2$ est positif.

On a donc deux positions valides.

On définit le grandissement:
$ gamma = ov(O A')/ov(O A) $

On connait déjà $ov(O A')$ (c'est $x$), mais il faut encore définir $ov(O A)$:
$ ov(O A) = ov(O A') + ov(A' A) = x - D $

On pose:
$ y_1 = ov(O A) = x_1 - D = (-D + sqrt(D(D - 4f')))/2 $
$ y_2 = ov(O A) = x_2 - D = (-D - sqrt(D(D - 4f')))/2 $

On a $y_2$ trivialement négatif, et par la même méthode qu'avant, $y_1$ est négatif aussi.

On a donc:
$ gamma = x/y $

Soit:
$ gamma_1 = x_1/y_1 = (D + sqrt(D (D - 4f')))/(-D + sqrt(D (D - 4f'))) $

$ gamma_2 = x_2/y_2 = (D - sqrt(D (D - 4f')))/(-D - sqrt(D (D - 4f'))) $

Dans les deux cas, on a un numérateur positif et un dénominateur négatif, donc on a toujours un grandissement négatif (image renversée).

On prend la valeur absolue (on prend l'opposé pour avoir une fraction positive):

$ abs(gamma_1) = (D + sqrt(D (D - 4f')))/(D - sqrt(D (D - 4f'))) $
$ abs(gamma_2) = (D - sqrt(D (D - 4f')))/(D + sqrt(D (D - 4f'))) $

On a donc: $abs(gamma_1) > 1$ et $abs(gamma_2) < 1$.
Quand on a besoin d'aggrandir un objet, on utilisera donc la solution $x_1$, et quand on a besoin de réduire (téléscope), on utilisera $x_2$.

== Choix de la lentille

On a besoin de $D >= 4f'$, donc ne pas choisir une lentille avec une distance focale trop grande (sinon, le système optique ne rentrera pas sur le rail)

== Problème de luminosité

Dû aux conditions de Gauss (et donc à la faible surface et taille de lentille utilisables), on risque de perdre beaucoup de lumière.

On utilisera éventuellement un condenseur.

= Focométrie des lentilles

#def[Focométrie]: Détermination de la distance focale d'une lentille

Toutes les méthodes que l'on va énoncer ne fonctionnent que pour les lentilles convergentes.

== Méthode des points conjugués

On prend un objet, on forme son image, on détermine donc $ov(O A)$ et $ov(O A')$, et on utilise la relation de conjugaison pour récuperer la valeure de $f'$. On a:

$ f' = (ov(O A) times ov(O A'))/(ov(O A) - ov(O A')) $

== Méthode de Silbermann

La méthode de Silbermann a pour but de former une image de même taille que l'objet.
On pose un objet et une lentille sur notre axe optique, ainsi qu'un écran qu'on va bouger jusqu'a trouver une image de la même taille que l'objet.

#figure(caption: [Méthode de Silbermann], canvas({
  import draw: *

  line((-4, 0), (4, 0), mark: (end: "straight"))

  line((0, -2), (0, 2), mark: (start: "straight", end: "straight"))
  
  point((-3, 0), value: $A$, anchor: "north")
  point((-3, 1), value: $B$)
  line((-3, 0), (-3, 1))

  line((2.5, -1.5), (2.5, 1.5), name: "ecran")
  content("ecran.end", [écran], anchor: "south-west")

  line((2, -1.6), (3, -1.6), mark: (start: "straight", end: "straight"))
}))

On aura donc:
$ gamma = ov(O A')/ov(O A) = -1 $
$ <=> ov(O A') = ov(-O A) $

$ 1/ov(O A') - 1/ov(O A) = 1/f' \
<=> -1/ov(O A) - 1/ov(O A) = 1/f' \
<=> -2/ov(O A) = 1/f' \
<=> f' = -ov(O A)/2 = ov(O A')/2 $

#resultb($ f' = ov(A A')/4 $)

== Méthode de Bessel

On utilise les formules de projection d'un objet réel vers une image réelle qu'on a démontré en @condition.

#figure(caption: [Méthode de Bessel], canvas({
  import draw: *

  line((-5, 0), (5, 0), mark: (end: "straight"))

  point((-3, 0), value: $A$, anchor: "north", name: "A")
  point((-3, 1), value: $B$, name: "B")
  line((-3, 0), (-3, 1), name: "AB")

  line((0, 2), (0, -2), stroke: blue, mark: (start: "straight", end: "straight"), name: "lentil1")
  line((2, 2), (2, -2), stroke: blue, mark: (start: "straight", end: "straight"), name: "lentil2")

  line((4, 1.5), (4, -1.5), name: "ecran")

  line("lentil1.0.5", "lentil2.0.5", mark: (start: "straight", end: "straight"), name: "d")
  content("d.50%", $d$, anchor: "south", padding: 2pt)

}))

On place la lentille dans une des deux positions valides.
On utilise la distance entre l'objet et son image pour calculer la distance focale.

On a donc:
$ x_1 = (D + sqrt(D(D - 4f')))/2 $
$ x_2 = (D - sqrt(D(D - 4f')))/2 $

Ainsi:
$ d &= x_1 - x_2 \
&= sqrt(D(D - 4f')) $
$ d^2 = D^2 - 4D f' $
$ 4D f' = D^2 - d^2 $
#resultb($ f' = (D^2 - d^2)/(4D) $)

== Méthode d'autocollimation

#figure(caption: [Méthode de Bessel], canvas({
  import draw: *

  line((-4, 0), (2, 0), mark: (end: "straight"))

  line((0, 2), (0, -2), mark: (start: "straight", end: "straight"), name: "lentil")
  line((0.5, 2), (0.5, -2), name: "miroir")

  for i in range(11) {
    line((0.55, -2 + i*0.4), (0.9, -1.8 + i *0.4))
  }
  
  point((-3, 0), value: $A$, anchor: "north", name: "A")
  point((-3, 1), value: $B$, name: "B")
  line((-3, 0), (-3, 1))

  line("A", "lentil.0.7", mark: half_mark)
  line("lentil.0.7", "miroir.0.7", mark: half_mark)
  line("miroir.0.9", "lentil.0.9", mark: half_mark)
  line("lentil.0.9", "A", mark: half_mark)

  line((-2.8, -1), (-0.2, -1), mark: (start: "straight", end: "straight"), name: "focal")

  content("focal.50%", $f'$, anchor: "north", padding: 2pt)
}))

Méthode très pratique qui ne nécessite pas de faire des calculs numériques poussés. Elle présente aussi l'avantage d'être pratique en terme de réalisation. Elle nécéssite cependant un miroir plan.

On place un miroir plan derrière la lentille, et on va décaler les deux simultanéments. On va essayer d'obtenir la distance focale comme la distance entre l'objet et la lentille.

On a:
$ A -> cal(L) -> A_1 -> m -> A'_1 -> cal(L) ("dans le sens inverse") -> A' $

On veut que $A$ soit posé au foyer objet de la lentille, ce qui nous donnera donc:
$ F -> cal(L) -> oo -> m -> oo -> cal(L) ("dans le sens inverse") -> F'_"retour" $

On regarde sur le plan de l'objet si l'image s'est bien formée "à l'identique". Il suffit de mesurer la distance entre l'objet et la lentille pour obtenir la distance focale.
