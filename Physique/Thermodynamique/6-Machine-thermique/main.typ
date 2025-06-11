#import "@local/physique:0.1.0": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#show: doc => template(doc)

#titleb[Machines thermiques]

= Les 2 principes appliqués aux machines

Les machines thermiques ont été l'un des motivateurs principaux de la thermodynamique. On va appliquer les premiers et second principe dans cette optique.

== 1#super[er] principe

Rappel:
#principe[
  $Delta(U + E_m) = Q + W$
]

Dans une machine, on aura $Delta E_m = 0$, et une machine aura un fonctionnement cyclique, donc sur un cycle $Delta U = 0$.

La version du 1#super[er] principe utilisé dans les machines sera donc:
$ Q + W = 0 $

- Si le travail est positif, le travail est reçu, donc $Q < 0$ $->$ réfrigérateurs, pompe à chaleur
- Si le travail est négatif, il est fourni $->$ moteurs

== Second principe version clausius

On a:
$ Delta S = S_"cr" + S_"éch" $
On sait que $S_"cr" >= 0$ et $S_"éch" = sum Q_i/T_i$
Donc:
$ Delta S >= sum Q_i/T_i $

Sur un cycle, on revient au même point et $S$ est une fonction d'état, donc:
$ Delta S = 0 $
Donc:
$ sum Q_i/T_i <= 0 $

== Second principe version Kelvin - Inexistence des moteurs monothermes

Dans le cas d'une machine monotherme (1 seule source de chaleur), on a:
$ Q/T_"th" <= 0 => Q <= 0$

Comme $Q <= 0$, alors $W >= 0$. Il est donc *impossible* de créer un 
moteur monotherme.

== Machines dithermes = Diagramme de Raveau

Dans le cas d'une machine ditherme, on considère deux thermostat,
une source chaude $T_c$ et une source froide $T_f$ (avec $T_f < T_c$)

#figcan({
  import draw: *

  circle((0, 0), radius: (2, 1), name: "a")
  content("a.center", [Machine])

  circle((4, 2), radius: (2, 1), name: "b")
  content("b.center", [Source chaude \ $ T_c $])

  circle((-4, 2), radius: (2, 1), name: "c")
  content("c.center", [Source froide \ $ T_f $])

  line("a.80%", "b.50%")
  line("c.60%", "a.20%")
})

- Par le premier principe, $W + Q_c + Q_f = 0$
- Par le second principe, $ Q_c/T_c + Q_f/T_f <= 0 $
  $ => Q_C <= -underbrace(T_c/T_f, >1) Q_f $

Donc:
#figcan({
  import draw: *
  arrow((-4, 0), (4, 0), tip: $Q_f$)
  arrow((0, -2), (0, 2), tip: $Q_c$)

  set-style(stroke: green)
  line((-1, 2), (1, -2))
  content((1.2, -2.5), anchor: "west", [pente $-T_c/T_f$])
  
  content((2, 1), align(center)[Zone interdite \ par le second principe])

  set-style(stroke: red)
  line((-1.8, 1.8), (1.8, -1.8))
  content((2, -1.5), [Courbe $Q_c = Q_f$], anchor: "west")

  content((-1, 1.4), [*1*])
  content((-2, 0.5), [*2*])
  content((-1, -1), [*3*])
  content((0.3, -1.5), [*4*])
})

En reprenant le 1#super[er] principe:
$ W + Q_c + Q_f = 0 <=> Q_c = - W - Q_f $
- Dans la zone *2*, on a:
  $ cases(Q_C > 0, Q_F < 0, W > 0) $
  La machine reçoit de l'energie pour faire un transfert de la source chaude vers la source froide. La machine ne sert donc à rien.
- Dans la zone *3*, on a:
  $ cases(Q_C < 0, Q_F < 0, W > 0) <=> Q < 0 $
  Pas intéressant car équivalent à une machine monotherme.
- Dans la zone *1*, on a $W < 0$, donc $Q_c >= -Q_f$. C'est un moteur.
- Dans la zone *4*, on a $W > 0$, $Q_F > 0$ et $Q_C < 0$. La machine reçoit
  un travail pour faire un transfert thermique de la source froide vers la source chaude (pour refroidir la source froide).
  La machine est donc un réfrigérateur ou une pompe à chaleur.

= Diagramme entropique $T = f(S)$

== Définition

On parle de diagramme entropique si 
on trace la température en fonction de l'entropie.

== Allure des différentes transformations dans ce diagramme

Une transformation isotherme forme une droite horizontale:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $S$)
  arrow((0, 0), (0, 2), tip: $T$)

  set-style(stroke: red)
  line((1, 1), (3, 1))
})

Une transformation isentropique (adiabatique et réversible) forme une droite verticale. \
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $S$)
  arrow((0, 0), (0, 2), tip: $T$)

  set-style(stroke: red)
  line((2, 0.5), (2, 2))
})

Cas d'une transformation isochore, avec un gaz parfait:
$ dif U = C_V dif T = T dif S - P dif V $
$ dif S = C_V (dif T)/T + P/T dif V = C_V (dif T)/T + n R (dif V)/V $
$ Delta S = C_V ln (T_F/T_i) + n R ln (V_f/V_i) $
Comme la transformation est isoschore:
$ V_f = V_i => Delta S = C_V ln (T_F/T_I) $
Donc:
$ T = K e^(S/C_V) $
La courbe aura donc une allure exponentielle:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $S$)
  arrow((0, 0), (0, 2), tip: $T$)

  set-style(stroke: red)
  catmull((0.5, 0.5), (1, 0.6), (2, 1.3), (3, 2.5))
})

Dans le cas d'une transformation isobare avec un gaz parfait:
$ dif H = C_P dif T = T dif S + V dif P $
$ dif S = C_P (dif T)/T - V/T dif P $
$ dif S = C_P (dif T)/T - n R (dif P)/P $
$ Delta S = C_P ln (T_f/T_i) - n R ln (P_f/P_i) = C_P ln (T_f/T_i) $
Donc la courbe possède la même allure:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $S$)
  arrow((0, 0), (0, 2), tip: $T$)

  set-style(stroke: red)
  catmull((0.5, 0.5), (1, 0.6), (2, 1.3), (3, 2.5))
})

== Interprétation de l'aire d'un cycle dans le diagramme entropique

On se rapelle le diagrame $(P, V)$. Si la transformation étudiée est
quasistatique, l'aire dans le diagramme $(P, V)$ correspond au travail des forces de pression du système ($delta W = - P_"ext" dif V approx - P dif V$).

Pour un même cycle, si on le parcours dans le sens inverse, le travail
est opposé (on peut fournir ou recevoir du travail en inversant
l'ordre des transformations).


Dans le diagramme entropique, dans un cycle on a:
$ W + Q = 0 => W = - Q $
Si la transformation du cycle est réversible:
$ dif S = (delta Q_"rev")/T => delta Q_"rev" = T dif S $
Donc:
$ W_"rev" = - Q_"rev" = - integral T dif S $

Donc l'aire dans le diagramme entropique correspond de même au travail du système.

#tip[
  Avec certains cycles, il sera plus facile de calculer l'aire dans le diagramme $(P, V)$ que dans le diagramme $(T, S)$
]

= Moteurs thermiques

== Principe

Un moteur est un système thermodynamique ditherme qui fournit du travail.

Montrons qu'il reçoit de la chaleur d'une source chaude et
qu'il en fournit à une source froide
( Donc $Q_C > 0$ et $Q_F < 0$ )

Comme $W < 0$:
- Par premier principe, $W + Q_F + Q_C = 0$
- Par second principe, $Q_F/T_F + Q_C/T_C <= 0$
Donc: $Q_F = - W - Q_C$
$ (- W - Q_C)/T_F + Q_C/T_C <= 0 $

$ Q_C (1/T_C - 1/T_F) <= W/T_F < 0 "(par hypothèse)"  $
$ T_C > T_F <=> 1/T_C < 1/T_F $
Donc:
$ 1/T_C - 1/T_F < 0 $
$ => Q_C > 0 $
Et:
$ Q_F <= - T_F/T_C Q_C < 0 => Q_F < 0 $

== Efficacité / Rendement

La grosse différence entre les moteurs et les autres machines thermiques, c'est que le rendement d'un moteur sera toujours inférieur à $1$.
Les pompes à chaleur et les réfrigérateurs permettent eux un
rendement supérieur à $1$ (le travail est utilisé pour transférer la chaleur)

On définit le rendement par:
$ r = "grandeur utile"/"grandeur coûteuse" $
Ici, la grandeur utile est $W$ et la grandeur coûteuse est $Q_C$.
Ici, le travail étant négatif et $Q_C$ étant positif, on pose:
$ r = - W/Q_C $

== Maximum théorique d'efficacité - Théorème de Carnot

On étudie un moteur, donc:
- $W < 0$
- $Q_C > 0$
- $Q_F < 0$

Par le premier principe:
$ W + Q_C + Q_F = 0 $
Par le second principe:
$ Q_C/T_C + Q_F/T_F <= 0 $

On pose le rendement:
$ e = -W/Q_C $

En reformulant le premier principe:
$ W = -Q_C - Q_F $
Donc en reprenant le rendement:
$ e = (Q_C + Q_F)/Q_C = 1 + Q_F/Q_C $
Donc:
$ Q_F <= -T_F/T_C Q_C $

On obtient donc le théorème de Carnot, qui correspond au rendement
maximal obtenable avec un moteur:
#resultb[
  $ e <= 1 - T_F/T_C = e_C "le rendement de Carnot" $
]

== Cycle de Carnot

On étudie un gaz parfait.

On pose le cycle suivant, avec
deux transformations isothermes (avec $P V = "constante"$)
et deux transformations adiabatiques (avec $P V^gamma = "constante"$):

#figcan({
  import draw: *
  arrow((0, 0), (4, 0), tip: $V$)
  arrow((0, 0), (0, 4), tip: $P$)

  // catmull((1, 3), (2, 1.5), (4, 1), (3, 2.5), (1, 3))
  bezier-through((1, 3), (1.5, 2), (2, 1.5))
  bezier-through((2, 1.5), (3, 1.1), (4, 1))

  bezier-through((1, 3), (2, 2.6), (3, 2.5))
  bezier-through((3, 2.5), (3.5, 1.5), (4, 1))

  content((0.7, 2), $Q = 0$)
  content((4.1, 2), $Q = 0$)
  content((2.1, 3), $T = T_C$)
  content((3.1, 0.6), $T = T_F$)

  point((1, 3), value: $A$)
  point((3, 2.5), value: $B$, anchor: "south-west")
  point((4, 1), value: $C$, anchor: "north-west")
  point((2, 1.5), value: $D$, anchor: "north-east")
})

On veut calculer le travail et le transfert thermique pour chacune
des transformations, afin de calculer le rendement de ce cycle:
- Pour les transformations isothermes,
  $ Delta U = Q + W = 0 " par 1"^"ere" "loi de joule" $
  $ W = - n R T ln (V_"f")/V_"i" $
  - Pour la transformation à température chaude:
    $ W = - n R T_C ln (V_B/V_A) $
    $ => Q_C = n R T_C ln (V_B/V_A) $
  - Pour la transformation à température froide
    $ W = - n R T_F ln (V_D/V_C) $
    $ Q_F = n R T_F ln (V_D/V_C) $
- En utilisant les transformations adiabatiques, on peut calculer
  les volumes:
  $ P V^gamma = "constante" <=> T V^(gamma-1) = "constante" $
  $ => T_C V_A^(gamma-1) = T_F V_D^(gamma-1) => V_D = V_A (T_C/T_F)^(1/(gamma-1)) $
  $ "et" V_C = V_B (T_C/T_F)^(1/(gamma-1)) $
Donc:
$ Q_F = n R T_F ln ((V_A (T_C/T_F)^(1/(gamma-1)))/(V_B (T_C/T_F)^(1/(gamma-1)))) = - n R T_F ln (V_B/V_A)  $
Donc:
$ e = 1 + Q_F/Q_C = 1 - T_F/T_C = e_C $

#resultb[Il existe donc une transformation
moteur qui permet d'obtenir un rendement de Carnot.]

Dans le diagramme $(S, T)$, le cycle de Carnot est un rectangle:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $S$)
  arrow((0, 0), (0, 4), tip: $T$)
  rect((1, 1), (3, 3))
})


== Autres cycles

=== Cycle de Rochas / Otto

#tip[Si on nous demande de faire un tracé, il faut
justifier l'allure des courbes]

#figcan({
  import draw: *

  arrow((0, 0), (0, 4), tip: $P$)
  arrow((0, 0), (4, 0), tip: $V$)

  bezier-through((1, 3), (2, 2.3), (3, 2))
  line((3, 2), (3, 0.5))
  bezier-through((1, 1.5), (2, 0.8), (3, 0.5))
  line((1, 3), (1, 1.5))

  content((1, -0.5), $V_"min"$)
  content((3, -0.5), $V_"max"$)

  content((2.5, 2.8), $Q = 0$)
  content((1.3, 0.6), $Q = 0$)
})

En notant $a = V_"max"/V_"min"$, on a:
$ e = 1 - a^(1-gamma) $

#todo[
  À reprouver (exercice)
]

Le cycle de Rochas/Otto est celui sur lequel sont basés
les moteurs thermiques à essence.

=== Le cycle Desiel

#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $V$)
  arrow((0, 0), (0, 4), tip: $P$)

  line((1, 3), (2, 3))
  bezier-through((2, 3), (2.5, 2.2), (3, 2))
  line((3, 2), (3, 1))
  bezier-through((1, 3), (2, 1.2), (3, 1))

  content((3, 2.8), $Q = 0$)
  content((1, 1), $Q = 0$)

  content((1, -0.5), $V_B$)
  content((2, -0.5), $V_C$)
  content((3, -0.5), $V_A$)
})

Le cycle de __ est celui sur lequel sont basés les moteurs thermiques
diesel.

On pose:
$ alpha = V_A/V_B "et" beta = V_A/V_C $
Le rendement est alors de la forme:
$ e = 1 - (alpha^(-gamma) - beta^(-gamma))/(gamma  (alpha^(-1) - beta^(-1))) $

=== Le cycle de Brayton

#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $V$)
  arrow((0, 0), (0, 4), tip: $P$)

  line((1, 3), (2.5, 3))
  bezier-through((2.5, 3), (3, 1.7), (4, 1))
  line((2, 1), (4, 1))
  bezier-through((1, 3), (1.5, 1.5), (2, 1))

  content((3.5, 2), $Q = 0$)
  content((0.7, 1.5), $Q = 0$)
})

$ a = P_max/P_min $
$ e = 1 - a^((-1 - gamma)/gamma) $

=== Le cycle de Stirling (qu'on fera en TP)

#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $V$)
  arrow((0, 0), (0, 4), tip: $P$)

  line((1, 3), (1, 1.5))
  bezier-through((1, 3), (2, 2.2), (3, 2))
  bezier-through((1, 1.5), (2, 0.7), (3, 0.5))
  line((3, 2), (3, 0.5))

  content((2, 2.5), $T_C$)
  content((1.5, 0.5), $T_F$)
})

Il possède le même rendement que le cycle de Carnot:
$ e = 1 - T_F/T_C = e_C $

= Machines frigorifiques

Le principe d'une machine frigorifique est de maintenir une source
froide à sa température.

On considère qu'une source froide se réchauffe de manière spontanée
(par transfert thermique avec la source chaude)

La machine reçoit un transfert thermique $Q_F$ de la source froide, 
un travail extérieur et
un transfert thermique $Q_C$ de la source chaude:
- $W > 0$, $Q_F > 0$, $Q_C < 0$
#warn[
  Ici, on suppose que $Q_C$ représente le transfert reçu de la source
  chaude. Comme la machine frigorifique envoit un transfert vers la
  source chaude, le transfert reçu est négatif. Faire attention
  aux conventions.
]

== Efficacité

On rappelle qu'on définit l'efficacité par:
$ e = "utile"/"couteux" = Q_F/W $

= Théorème de Carnot

Pour le théorème de carnot, on a:
Par le premier principe:
$ W + Q_C + Q_F = 0 $
$ => W = - Q_C - Q_F $
Alors:
$ e = Q_F/(- Q_C - Q_F) = (-1)/(1 + Q_C/Q_F) $

Par le second principe:
$ Q_F/T_F + Q_C/T_C <= 0 $
$ 1 + Q_C/Q_F <= 1 - T_C/T_F $
On passe à l'inverse:
$ 1/(1 + Q_C/Q_F) >= 1/(1 - T_C/T_F) $
Donc:
$ e = (-1)/(1 + Q_C/Q_F) <= 1/(T_C/T_F - 1) = T_F/(T_C - T_F) = e_C $

= Pompe à chaleur

== Principe

Le principe d'une pompe à chaleur est de maintenir une source
chaude à sa température en ponctionnant de la chaleur
dans une source froid.

La machine reçoit un transfert thermique $Q_F$ de la source froide, 
un travail extérieur et
un transfert thermique $Q_C$ de la source chaude:
- $W > 0$, $Q_F > 0$, $Q_C < 0$

== Efficacité

$ e = "utile"/"couteux" = -Q_C/W $

== Théorème de Carnot

Par le premier principe:
$ W + Q_C + Q_F = 0 $
$ => W = - Q_C - Q_F $
Alors:
$ e = Q_C/W = Q_C/(-Q_C-Q_F) = 1/(1+(Q_F/Q_C)) $

Par le second principe:
$ Q_F/T_F + Q_C/T_C <= 0 $
$ <=> Q_F <= - T_F/T_C Q_C  $
$ <=> 1 + Q_F/Q_C >= -T_F/T_C + 1 $
D'où:
#resultb[
$ e = 1/(1 + (Q_F/Q_C)) <= 1/(1 - T_F/T_C) = T_C/(T_C-T_F) = e_C $
]

#pagebreak()

= Machines réelles

== Quelques exemples de rendements pour des machines courantes

#{
set text(10pt)
align(center, table(
  columns: 5,
  [Machine], [Source Froide], [Source chaude], [Rendement de Carnot],
  [Rendement Réel],
  [Moteur de voiture], [Atmosphère, $300 "K"$],
  [Combustion de gaz, $3000 "K"$],
  $approx 90 "%"$, [Entre $15$ et $36$ %],
  [Centrale thermique], [Eau, $300 "K"$],
  [Au plus $600 "K"$], $approx 50 "%"$, [Entre 30 et 40 %],
  [Réfregirateur], [$-15 degree "C"$],$20 degree "C"$,[5],[Environ 2],
  [Pompe à chaleur], [$7 degree "C"$], [$35 degree "C"$],
  $11$, [Entre 3 et 5]
))
}

== Cogénération

L'idée de la cogénération est d'utiliser la chaleur générée
par un système réfrigérateur ou moteur comme source chaude
pour un autre système.

On considère le système suivant:
- Un moteur de travail utile $W_U < 0$
- Une soruce chaude (combustion) $Q_C > 0$
- On récupère un transfert thermique utile $Q_U$

On définit le *rendement global*:
$ r_G = (abs(W_U) + abs(Q_U))/abs(Q_C)  $
Ainsi que le *rapport chaleur force*:
$ C_F = abs(Q_U)/abs(W_U) $

=== Exemple d'exercice de cogénération

#figure(image("exo1.png", width: 100%))

#figure(caption: [Diagramme des transferts énergitiques], diagram(
  node-stroke: 1pt,
  edge((-1, -1), "<|-", $cal(P)_C = 1.5 "GW" $),
  node((0, 0), "Moteur"),
  edge((0, 1), "-|>", $cal(P) = 900 "MW"$),
  edge("-|>", $cal(P)_(F 1)$),
  node((2, 0), [Système de chauffage]),
  edge((4, 0), "-|>", [$80 "%"$ de $cal(P)_(F 1)$]),
  node((0, 1), [Pertes]),
  edge((0, 2), "-|>", $cal(P)_U = "90 %" cal(P)$)
))

+ On a:
  $ Delta U = 0 = Q_C - Q_(F 1) - W $
  $ 0 = cal(P)_C - cal(P)_(F 1) - cal(P) $
  $ cal(P)_(F 1) = cal(P)_C - cal(P) = 600 "MW" $
  
+ $ cal(P)_U = "90 %" times cal(P) = 810 "MW" $
  $ cal(P)_("th,U") = "80 %" times cal(P)_(F 1) = 480 "MW" $
+ $ r_g = (cal(P)_U + cal(P)_"th,U")/(cal(P)_C) = 86 "%" $
+ $ r = cal(P)_U/cal(P)_C = "54 %" $
+ $ C_F = (cal(P)_"th,U")/(cal(P)_U) = "59 %" $ 

== Moteur à explosion

On rappelle le modèle théorique du moteur à explosion, le cycle
Rochas/Otto:

#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $P$)
  arrow((0, 0), (0, 4), tip: $V$)

  bezier-through((1, 3), (2, 2.3), (3, 2))
  line((3, 2), (3, 0.5))
  bezier-through((1, 1.5), (2, 0.8), (3, 0.5))
  line((1, 3), (1, 1.5))

  content((1, -0.5), $V_"min"$)
  content((3, -0.5), $V_"max"$)

  content((2.5, 2.8), $Q = 0$)
  content((1.3, 0.6), $Q = 0$)
})

Dans la réalité, on ajoute des étapes en plus:
- On a une phase d'admission: on doit faire rentrer les gaz à brûler
- Une phase d'allumage (on a besoin d'un transfert thermique)
- Une phase de combustion
- Une phase d'éjection (on doit faire sortir les gazs de combustion)

On ajoute donc deux étapes au cycle de Rochas/Otto, au début et à la fin,
correspondant à la phase d'admission et d'éjection:

#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $P$)
  arrow((0, 0), (0, 4), tip: $V$)

  bezier-through((1, 3), (2, 2.3), (3, 2), mark: (end: "straight"))
  line((3, 2), (3, 0.5), mark: (end: "straight"))
  bezier-through((1, 1.5), (2, 0.8), (3, 0.5), mark: (start: "straight"))
  line((1, 3), (1, 1.5), mark: (start: "straight"))

  line((3, 0.5), (1, 0.5), mark: (start: "straight", end: "straight"))

  content((1, -0.5), $V_"min"$)
  content((3, -0.5), $V_"max"$)

  content((2.5, 2.8), $Q = 0$)
  content((1, 0.8), $Q = 0$)
})

Ou, dans la vrai vie:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $P$)
  arrow((0, 0), (0, 4), tip: $V$)

  // bezier-through((1, 3), (2, 2.3), (3, 2), mark: (end: "straight"))
  // line((3, 2), (3, 0.5), mark: (end: "straight"))
  // bezier-through((1, 1.5), (2, 0.8), (3, 0.5), mark: (start: "straight"))
  // line((1, 3), (1, 1.5), mark: (start: "straight"))
  //
  // line((3, 0.5), (1, 0.5), mark: (start: "straight", end: "straight"))

  catmull((3, 0.5), (2, 0.4), (1, 0.5), (2, 0.6),
    (3, 0.5), (1, 1.5), (1, 3), (3, 2), (3, 0.5),
    name: "c"
  )

  mark("c.10%", "c.11%", symbol: "straight")
  mark("c.24%", "c.25%", symbol: "straight")
  mark("c.47%", "c.48%", symbol: "straight")
  mark("c.57%", "c.58%", symbol: "straight")
  mark("c.78%", "c.79%", symbol: "straight")
  mark("c.93%", "c.94%", symbol: "straight")
})

== Réfrigérateur à fréon

Les étapes d'un réfrigérateur sont:
+ Détente isenthalpique de joule thomson $ A B$ diminuant la
  température du fluide
+ Vaporisation à pression et température constante $B C$ en recevant $Q_F$,
  de source froide (contenu du réfrigérateur)
+ Compression calorifugée $C D$
+ Évolution isotherme et isobare dans condenseur cédant $Q_C$ à source
  chaude (air de la pièce)

#figure(image("diag_frigo.png", width: 60%))

#figure(image("tab.png", width: 40%))

Exercice: caluler l'efficacité.

==  Machine de Sterling

(On verra en TP)

= Tableau récapitulatif

#figure(table(
  columns: 4,
  align: horizon,
  inset: 8pt,
  [], [Moteurs], [Frigo], [Pompe à chaleur],
  $W$, $<0$, $> 0$, $> 0$,
  $Q_C$, $>0$, $< 0$, $< 0$,
  $Q_F$, $< 0$, $>0$, $>0$,
  [Grandeur utile], $W$, $Q_F$, $Q_C$,
  [Grandeur coûteuse], $Q_C$, $W$, $W$,
  [Efficacité], $-W/Q_C$, $Q_F/W$, $-Q_C/W$,
  [Eff. de Carnot], $1 - T_F/T_C$, $T_F/(T_C - T_F)$, $T_C/(T_C - T_F)$
))
