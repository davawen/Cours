#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[Étude des circuits linéaires en régime continu]

= Influence de la résistance des appareils de mesure

#def[Appareil de mesure]: Ampèremètre, voltmètre, etc...

#def[Ampèremètre]: Mesure des intensités, en série, dans la branche où on veut mesurer des intensités \
#def[Voltmètre]: Mesure des tension, en parallèle aux bornes de la portion de circuit dont on veut connaître la tension.

Exemple, on veut connaitre la tension et l'intensite de ce résistor:
#figcan({
  resistor((0, 0), u: tenserl($u$), name: "r")

  node((-1, 0), name: "A")
  node((1, 0), name: "B")

  fil("A", "r.l", "B", "r.r")
})

== Montages en courte dérivation ou en longue dérivation

Branchement en courte dérivation:

#figcan({
  resistor((0, 0), u: tenserl($u$), name: "r")

  node((-2, 0), name: "A")
  node((2, 0), name: "B")

  voltmetre((0, 1), name: "V")
  amperemetre((3, 0), name: "Am")

  fil("A", "r.l", "B", "r.r", i: $i_R$)
  fil("V.l", "A", "V.r", "B", i: $i_A$)
  fil("B", "Am.l")
  fil((-3, 0), "A", "Am.r", (4, 0), i: $i$)
})

On mesure la bonne tension, mais une partie de l'intensité va partir dans la branche du voltmètre.

Branchement en longue dérivation:

#figcan({
  node((-4, 0), name: "A")
  node((4, 0), name: "B")

  voltmetre((0, 1), name: "V")

  serie((0, 0), name: "D", i: $i_R$,
    apply(resistor, u: tenserl($u_R$)),
    apply(amperemetre, u: tenserl($u_A$))
  )

  fil("A", (-3, 0), (3, 0), "B", i: $i$)
  fil((-3, 0), "D.l", "D.r", (3, 0))
  fil("V.l", (-3, 0), "V.r", (3, 0), i: $i_V$)
})

On mesure la bonne intensité, mais une partie de la tension va venir de l'ampèremètre.
