#import "@local/physique:0.1.0": *
#import optique: *

#show: doc => template(doc)

#titleb[Propagation de la lumière]

= Historique

(Voir #link("https://cahier-de-prepa.fr/mp2i-parc/download?id=852")[poly])

= Phénomène Lumineux

== La nature ondulatoire de la lumière

La lumière est une onde.
Une onde représente la propagation d'une différence énergétique dans un champ (ici, le champ électromagnétique).

Différentes ondes ont différentes fréquences (qui ensemble forment un spectre).

#def[Optique]: Étude de la lumière *visible* (les fréquences étant $approx 10^(-14)$ Hz ou $approx 600$ nm)

== Nature Corpusculaire de la lumière

#def[Effet photoélectrique]: éclairer une plaque arrache des électrons à cette plaque

Cette effet exibite un effet de seuil: une fréquence (= niveau d'énergie) minimale est nécessaire pour qu'il arrive
- Une "onde singulière" doit posséder une certaine quantité d'énergie
- On trouve ainsi une description corpusculaire, quantisée de la lumière

#def[Spectre de raies]: Décomposition de la lumière par un prisme
- En un spectre continue (décomposition de la *lumière blanche*)
- En un spectre discret (décomposition d'un laser ou lampe spectrale)

#def[Spectre d'émission]: Spectre de lumière émit par un certain élément, par désexcitation d'un électron

$E:$ Énergie \
$h$: Constante de Planck \ 
$D$: Fréquence

$ E = k D $

#figure(caption: "Niveaux d'énergie", canvas({
  import draw: *

  let level(y, num) = {
    line((0,y), (1, y))
    content((-0.3, y), $E_#num$)
  }

  let excite(y_end, y_start) = {
    bezier-through((-0.6, y_start), (-1.0, (y_end+y_start)/2), (-0.6, y_end+0.1), mark: (end: "straight"))
  }

  let photon(y) = {
    let x = 1.2
    while x < 1.6 {
      line((x, y - 0.05), (x + 0.1, y+0.05), (x + 0.2, y - 0.05))
      x = x + 0.2
    }
    line((x, y - 0.05), (x + 0.1, y))
    line((x + 0.1, y), (x + 0.4, y), mark: (end: "straight"))
  }

  level(0, 0)
  level(0.5, 1)
  level(1.2, 2)
  level(2.0, 3)

  photon(2.0)
  content((2.2, 2.0), anchor: "west", [Photon])

  excite(0, 0.5)
  excite(0.5, 1.2)
  excite(1.2, 2.0)

  translate(x: -0.4)
  excite(0, 1.2)

  excite(0.5, 2.0)

  translate(x: -0.4)
  excite(0, 2.0)
}))

#def[Spectre d'absorption]: Raies absentes sur un spectre de lumière blanche, par excitation d'un électron
- Le spectre d'absorption est complémentaire au spectre d'émission

Pour expliquer ces phénomènes, on associe une particule à l'onde: le photon

== Notion d'indice

Les ondes électromagnétiques sont caractérisées par leur fréquence qu'on peut associer à un longueur d'onde *dans un certain milieu*.

$v$: Vitesse de la lumière dans un milieu \
$nu$: Fréquence
$ lambda = v / nu $

Chaque fréquence peut-être associée à une longueur d'onde *dans le vide* unique.

$c$: Vitesse de la lumière dans le vide (m/s) \
$nu$: Fréquence ($s^(-1)$)
$ lambda_"onde" = c / nu $

La longueur d'onde change selon le milieu, car la vitesse de la lumière change selon le milieu.
Chaque milieu possède un indice correspondant à la vitesse de la lumière dans ce milieu.

= Notion de rayon lumineux

== Notion d'indice

$ n = c / v $

Un matériau est caractérisé par un indice $n$, qui décris la vitesse
de la lumière dans ce milieu.

#figure(
  table(columns: 2,
    [milieu], [indice $n$],
    [vide], [1],
    [air], [1.000277],
    [...], [(voir poly)]
  ),
  caption: [Quelques indices]
)

L'indice varie selon d'autres caractéristiques que la matière:
- avec la longueur d'onde (loi de Cauchy): $n = A + B/lambda^2 + C/lambda^4$ \
  toutes les couleurs ne se dispersent pas de la même manière (phénomène du prisme)
- avec la température (#link("https://fr.wikipedia.org/wiki/Loi_de_Gladstone")[loi de Gladstone]): car $(n-1)/rho$ est constant\
  $P V = n R T$ $n = m/M$ $rho = m/V = P M / R T$ \
  phénomène des mirages
- avec la direction de propagation (biréfringence): \
  (pas avec tout les matériaux) 

== Sources de lumière

Un système de lumière correspond soit à:
- Un système qui transforme de l'énergie autre en énergie lumineuse (lampes, Soleil) \
  \= Vrai source
- Une source qui le devient lorsqu'elle est éclairée (lune, objets du quotidient) \
  \= Sources indirectes

== Lumière monochromatique ou polychromatique
Une lumière est monochromatique si elle ne possède qu'une seule longueur d'onde. \
Exemple: Spectre de raies, chaque raie est "une" lumière monochromatique 

À l'inverse, une lumière polychromatique en possède plusieurs.

La lumière blanche possède toutes les longueurs d'onde du spectre visible. #footnote([La lumière blanche telle qu'elle est vue par l'homme peut ne posséder que du rouge, du vert et du bleu (perception des cônes)])  \

== Milieu homogène et isotrope

#def[Milieu homogène]: les propriétés de ce milieu sont les même en tout point.

#def[Milieu isotrope]: les propriétés de ce milieu sont les même peut importe la direction vers laquelle on se dirige (à l'inverse des milieux anistropes).

Attention: homogène $!=$ isotrope, par exemple les milieux biréfringents peuvent être homogènes, mais ne sont évidemment pas isotropes.

== Faisceau et rayon lumieux

On fait passer un faisceau lumineux à travers un diaphragme, qu'on projette sur un écran.
À mesure qu'on fait tendre le rayon du diaphragme vers zéro (pour isoler un seul rayon lumineux), on observe que la taille du cercle sur l'écran ne se réduit pas.
On observe un phénomène de *diffraction*.

En optique géométrique, on ignore ce phénomène.
On considère que l'on peut isoler un seul rayon lumineux de cette manière.

== Propagation rectiligne de la lumière

Dans un milieu homogène et isotrope, la lumière se propage de manière rectiligne.

Expérience: cuve remplie de thiosulfate, puis on rajoute de l'acide chloridrique.
On envoie de la lumière à travers la cuve, qu'on récolte sur un écran. \
Lorsque l'on rajoute l'acide, la lumière à l'interface des deux liquides est renvoyée latéralement. \
Raison: production de particules de souffre, qui diffusent la lumière dans les autres directions. \
La propagaiton rectiligne de la lumière est cassée par un milieu non homogène et non isotrope.

Expérience: On pose du sel au fond d'une cuve qu'on remplit d'eau.
On crée un gradient d'eau salée (donc, milieu non-homogène). On fait passer un laser par la cuve. Le rayon s'incurve.

#figure(image("fig10-12.png"))

En optique géométrique, on considèrera que la lumière se propage toujours de manière rectiligne.

== Indépendance des rayons ou interférences

La lumière possédant un caractère d'onde, différents rayons lumineux peuvent former des *interférences*.

En optique géométrique, on considèrera que chaque rayon est indépendant.

== Principe de retour inverse de la lumière

En optique géométrique, on admet le principe
#footnote([Principe: postulat qu'on ne cherche pas à démontrer et qu'on utilise tant qu'il est vérifié par les expérince])
du retour inverse de la lumière.

Étant donné un rayon partant d'un point $A$, traversant un système optique, et arrivant en $B$.
Si l'on place la source en $B$, partant dans l'inverse de la direction d'arrivée à $B$, le rayon de lumière arrivera à $A$.

#figure(image("fig14.png", width: 50%))

= Cadre de l'optique géométrique

Dans l'optiqe géométrique, on étudie des *rayons lumineux* dans un milieu transparent vérifiant:
- Homogène et isotrope (pas de diffusion et propagation rectiligne)
- Rayons indépendants (pas d'interférence)
- Dimension des objects plus grand qu'une longueur d'onde (pas de diffraction)

Ainsi, une modification de la propagation n'arrivera que par la traversée d'un dioptre #footnote([Dioptre: surface séparant deux milieux transparents homogènes et isotropes, d'indices de réfraction différents.]) ou la réflexion sur un miroir.

#figure(caption: "Modification de trajectoire par un dioptre", canvas({
  import draw: *

  intersections("i", {
    arc-through((-2, -0.5), (0, 0), (2, -0.5), name: "dioptre")
    hide(line((-1, 1), (1, -1)))
  })

  line((-1, 1), "i.0", mark: (end: "straight", pos: -63%), name: "rayon")
  line("i.0", (1, -1), stroke: (dash: "dotted"), name: "straight")
  line("i.0", (0.3, -1), mark: (end: "straight"), name: "modified")

  content("dioptre.end", [dioptre], anchor: "west")

  content("rayon.start", [rayon lumineux], anchor: "south", padding: 2pt)
  content("straight.end", [trajectoire initiale], anchor: "north-west", padding: 2pt)
  content("modified.end", [modifiée], anchor: "north-east", padding: 2pt)

  content((-1.3, 0.5), $n_1$)
  content((-1.3, -0.5), $n_2$)
}))

= Sources de lumière

== Source de lumière blanche

Les sources de lumière blanche sont essentiellement des lampes à incendéscence.

L'intensité lumineuse des lampes à incendescence suit une parabole par rapport à $lambda$.

Vérifie la loi de Wien: $lambda_max T = 2.987 dot 10^-3$

#figure(canvas({
  plot.plot(
    size: (2, 2),
    x-tick-step: none, y-tick-step: none,
    x-ticks: ((0, $lambda_max$),),
    x-label: $lambda$, y-label: none,
    axis-style: "left", {
    plot.add(domain: (-2, 2), x => -x*x)
  })
}))

#pagebreak()

== Lampes spectrales ou tubes à décharge

Les lampes spectrales émettent un spectre fixe. 
Elles fonctionnent par émission spontanée de photon d'électrons excités (par chaleur ou électricité...)

$Delta E$: Énergie libérée \
$h$: Constante de planck \
$nu$: Fréquence du photon (Hz)

$ Delta E = h nu $

#figure(image("fig15.png", width: 50%))

Comme les niveaux d'énergie sont fixes, chaque différence de niveau d'énergie éméttra un photon d'une certaine longueur d'onde (= une raie).

== Laser

Un laser utilise le même principe qu'une lampe spectrale, à part que l'émission sera *stimulée*.
Au laser est associée une cavitée laser qui va sélectionner certaines fréquences en son intérieur par un phénomène de résonnance (que l'on verra plus tard).
On obtient donc un faisceau quasiment monochromatique.

#figure(image("fig16.png", width: 20%))

== Modèle de la source ponctuelle monochromatique

Modèle très simplifié de ce qu'est une source de lumière:
- Ponctuelle: ne provient que d'un seul point et emet dans toutes les directions
- Monochromatique: Ne possède qu'une seule longueur d'onde

Aucune source de lumiére n'est ponctuelle ou monochromatique, mais les lasers ou les systèmes `Source -> Filtre -> Diaphragme` s'en approchent.

L'onde produite possède une périodicité spatiale et temporelle.

#columns(2, gutter: 11pt)[
$s(r, t)$: Amplitude de l'onde \
$r$: Distance \
$t$: Temps \
$K$: Constante \
$omega$: Fréquence \
$k$: Vecteur d'onde \
$phi_0$: Phase (origine du temps pour l'onde)

$ s(r, t) = K/r cos(omega t - k r + phi_0) $
]

La source possède une dépendence sur la distance, car l'energie est répartie sur une sphere de rayon $r$.
Ainsi, L'énergie à une certaine distance est divisée par $4pi r^2$.
Comme l'amplitude de l'onde est définie par la racine carrée de l'énergie,
on divise directement par $r$ dans le calcul de l'amplitude (le $4pi$ est inclus dans la constante).

Ce modèle ne fonctionne bien sûr que dans un milieu homogène et isotrope.
