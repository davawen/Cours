#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Lentilles sphériques minces dans l'approximation de Gauss]

= Définitions

== Lentille

Une lentille est composée de deux dioptres formant un volume d'indice $n$ placés dans un milieu d'indice $n'$ 

TODO: `(Schéma lentille)`

== Lentille sphérique

Dans une lentille sphérique, les deux dioptres sont des sphères.

== Lentille sphérique mince

TODO: `(Schéma LM)`

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

$f' = overline(O F') = -overline(O F) = overline(F O)$

La vergence est l'inverse de la distance focale:
$ V = 1 / f' $

#tip[La vergence garde toujours le même signe que la distance focale.]

== Signe de la distance focale et caractère de la lentille

On aura:
- $f' > 0$ si la lentille est convergente
- $f' < 0$ si la lentille est divergente
