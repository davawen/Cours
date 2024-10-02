#import "@local/physique:0.1.0": *
#import "@preview/bob-draw:0.1.0": render

#show: doc => template(doc)

#titleb[Introduction à l'électricité]

= Historique

(Voir poly)

= Mouvements de porteurs de charge

== Electrisation

Phénomène qui permet de faire apparaître des charges par frottement ou déplacement, qui vont notemment appliquer des forces en utilisant la force de Coulomb:
$ arw(f)_(1->2) = 1/(4pi epsilon_0) (q_1 q_2)/(M_1 M_2)^3 arrow(M_1 M_2) $

Avec $M_1$, $M_2$ les positions des particules, $q_1$, $q_2$ leur charge.

«D'un point de vue, on a $1/(4 pi epsilon_0)$»

La force de Coulomb peut être attractive ou répulsive suivant le produit des charges.

== Notion de charge électrique

La charge électrique est dîte:
- Scalaire, c'est un nombre (et pas un vecteur)
- Conservative, la quantité totale de charge dans un système fermé reste la même
- Invariante, quel que soit le référentiel, la charge aura la même mesure
- Quantifiée, $q = plus.minus Z e $ avec $Z$ un entier, et $e$ la charge élémentaire ($approx 1.6 dot 10^(-19)$)
  Les échanges de charges ne sont pas continus, on ne peut pas ajouter ou retirer moins de $e$ charge électrique. 
- Extensive, on peut prendre un système, le sub-diviser en sous-systèmes,
  chacun ayant sa propre charge, et la charge du système sera la sommes charges des sous-systèmes.
- Signé, le choix du signe en lui même est arbitraire et est une convention. Les électrons ont une charge négative, et les protons ont une charge positive.

== Porteurs de charge

On a différents moyens de transporter des charges:
- Les électrons dans les métaux qui se déplacent dans les lattices.
- les ions (anions ou cations) permettent d'assurer la conduction dans les solutions
- Les électrons dans le plasma (milieu ionisé)
- Dans les semi-conducteurs:
  - Par des électrons qui se déplacent et qui crée des charges négatives (dopés N)
  - Par des trous (manque d'électrons) qui se déplacent et qui crée des charges positives (dopés P)

Les porteurs de charges sont soumis à des mouvements:

== Mouvement microscopique ou agitation thermique

N'importe qu'elle particule va être soumis à un mouvement d'agitation thermique. Plus la température est élevée, plus l'agitation est "intense".

Ce mouvement est désordonné et nul en moyenne. Il va créer des micro-courants de manière constante, mais on ne peut pas l'utiliser pour faire transiter de l'énergie à l'échelle macroscopique.

On reviendra sur ce mouvement en Thermodynamique.

== Mouvement d'ensemble

On parle de mouvement d'ensemble quand on a un même déplacement pour de nombreuses particules.

On va s'intéresser plus particulier aux mouvements d'ensemble d'origine électrique.

Si on place de nombreuses charge dans un même champ électrique, toutes les charges subiront le même mouvement #sym.arrow mouvement d'ensemble électrique.

$ arw(f)_(1->2) = q_2 underbrace((1/(4 pi epsilon_0) q_1/(M_1 M_2)^3) arrow(M_1 M_2), arrow(E)(M_2)) $
$ arw(f)_(1->2) = q_2 arrow(E)(M_2) $

On pose $arw(E)(M_2)$ le champ électrique en $M_2$.
On va principalement utiliser les mouvement résultant de ce genre de champs.

= Courant électrique

== Définition

#def[Courant électrique]: Le déplacement des charges électriques dans un fil sous l'action d'un champ électrique

#figure(canvas({
  import draw: *

  line((-0.5, 1.3), (0.5, 1.3), mark: (end: "straight"), name: "E")
  content("E.50%", $arw(E)$, anchor: "south", padding: 3pt)

  line((-3, -1), (3, -1))
  line((-3, 0.8), (3, 0.8))

  point((0, 0), value: $q > 0$, color: yellow)
  line((0, -0.2), (1, -.2), mark: (end: "straight"), name: "f", stroke: yellow)
  content("f.end", $arw(f) = q arrow(E)$, anchor: "west")

  line((0, -0.5), (1.5, -0.5), mark: (end: "straight"), name: "v", stroke: red)
  content("v.end", $arw(v)$, anchor: "north-west")
}))

== Sens conventionnel

Le courant possède un sens conventionnel arbitraire: il est opposé au sens des électrons

#figure(canvas({
  import draw: *

  line((-0.5, 1.3), (0.5, 1.3), mark: (end: "straight"), name: "E")
  content("E.50%", $arw(E)$, anchor: "south", padding: 3pt)

  line((-3, -1), (3, -1))
  line((-3, 0.8), (3, 0.8))

  point((0, 0), value: $e$, color: yellow)
  line((0, -0.2), (-1, -.2), mark: (end: "straight"), name: "f", stroke: yellow)
  content("f.end", $arw(f) = q arrow(E)$, anchor: "east")

  line((0, -0.5), (-1.5, -0.5), mark: (end: "straight"), name: "v", stroke: red)
  content("v.end", $arw(v)$, anchor: "north-east")

  line((1, 0), (2.5, 0), mark: (end: "straight"), stroke: (dash: "dashed"), name: "sens")

  content("sens.end", [sens conventionnel \ du courant], anchor: "west")
}))

== Intensité

On appelle la grandeur $I$ l'intensité du courant électrique, exprimée par
la mesure du débit des particules.
C'est à dire, le nombre de charge qui traverse une section $S$ du fil, par unité de temps.

#let dq = $dif q$

On peut donc définir $I$ par:
$ I = (dif q)/(dif t) $

Avec $dif q$ la quantité de charges ayant traversé la section, et $dif t$ l'interval de temps.

#warn[
  L'intensité peut-être négative! \
  Si les électrons ne se déplacent pas dans le sens prévu, l'intensité mesurée sera négative (débit en sens inverse).
]

= Ordre de grandeur des intensités

On peut travailler avec une très large gamme d'intensité:
- À la maison: $approx 10 "A"$
- En électronique (transistors, circuits intégrés, capaciteurs): du pA à $approx 10 "mA"$
- Dans l'industrie électrique: du kA au centaines de kA.

= Tension et potentiel

== Définition

#def[Tension]: Différence de potentiel entre deux points sur un circuit. On mesure la tension d'un point par rapport à un point de référence (le port COM sur un voltmètre).

On note $U_(B A)$ la tension de $A$ vers $B$, avec:
$ U_(B A) = V_B - V_A = -U_(A B) $


#align(center, render(```

     -------------------->
         +--------+
  A *----|        |----* B
         +--------+
     <--------------------
```))

#move(dx: 20em, dy: -11em, $U_(B A)$)
#move(dx: 20em, dy: -4.5em, $U_(A B)$)

== Ordre de grandeur des tensions

- Potentiel d'action (nom donné à la tension en biologie...): $75 "mV"$
- Piles électriques: quelques volts
- Tension du secteur: de $120$ à $250$ V
- Réseau de distribution: $500$ V, $10 "kV"$, $125 "kV"$
- Foudre: $100 "MV"$

== Références de potentiels, Masse et Terre

#def[Masse]: origine des potentiels (le point de référence dit plus haut)

#def[Terre]: conducteur Terre auxquels sont reliées les carcasses des appareils pour des raisons de sécurités souvent pris comme masse
