#import "@local/physique:0.1.0"
#import physique: *

#show: doc => template(doc)

= Lentilles convergentes/divergentes

Lentille convergente:
1. Un rayon passant par le centre de la lentille n'est pas dévié
2. Un rayon arrivant parallèle a l'axe optique ressort en passant par le foyer image $F'$
3. Un rayon passant par le foyer objet $F$ ressort parallèlement à l'axe optique

#figure(canvas({
  import draw: *

  line((-4, 0), (4, 0), mark: (end: "straight"))
  line((0, 2), (0, -2), mark: (symbol: ">"))

  set-style(circle: (radius: 3pt, fill: black))

  circle((0, 0), name: "O")
  content("O", $O$, anchor: "north-west", padding: 5pt)

  circle((2, 0), name: "F'")
  content("F'", $F'$, anchor: "north", padding: 5pt)

  circle((-2, 0), name: "F")
  content("F", $F$, anchor: "north", padding: 5pt)

  line((-4, -1), (4, 1), mark: (end: "straight"), stroke: blue)

  line((-4, -1), (0, 1), stroke: green)
  line((0, 1), (4, 1), mark: (end: "straight"), stroke: green)

  line((-4, -1), (0, -1), stroke: red)
  line((0, -1), (4, 1), mark: (end: "straight"), stroke: red)
}))

Lentille divergente:
1. Un rayon passant par le centre de la lentille n'est pas dévié
2. Un rayon arrivant parallèle a l'axe optique ressort en passant par l'image virtuelle $F'$
3. Un rayon passant par le foyer objet virtuel $F$ ressort parallèlement à l'axe optique

#figure(canvas({
  import draw: *

  line((-4, 0), (4, 0), mark: (end: "straight"))
  line((0, 2), (0, -2), mark: (symbol: "<"))

  set-style(circle: (radius: 3pt, fill: black))

  circle((0, 0), name: "O")
  content("O", $O$, anchor: "north-west", padding: 5pt)

  circle((2, 0), name: "F")
  content("F", $F$, anchor: "north", padding: 5pt)

  circle((-2, 0), name: "F'")
  content("F'", $F'$, anchor: "north", padding: 5pt)

  line((-4, -2), (4, 2), mark: (end: "straight"), stroke: blue)

  line((-4, 1), (0, 1), stroke: green)
  line((0, 1), (2, 2), mark: (end: "straight"), stroke: green)
  line((-4, -1), (2, 2), stroke: (paint: green, dash: "dotted"))

  line((-2, -2), (0, -1), stroke: red)
  line((0, -1), (4, -1), mark: (end: "straight"), stroke: red)
  line((0, -1), (4, 1), stroke: (paint: red, dash: "dotted"))
}))

Questions avec une lentille convergente/divergente:
- Peut-on former une image réel avec un objet virtuel?

