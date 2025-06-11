#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Induction: Lois, circuit fixe et champ magnétique variable,
circuit mobile et champ magnétique stationnaire]

= Phénomène d'induction

== Mise en évidence expérimentale

=== Expérience de Faraday

On prend deux bobines de cuivre adjacentes mais qui ne se touchent pas.
On alimente une des bobine avec un courant éléctrique. 
Si on déplace une des deux bobines, on observe
un courant électrique dans l'autre bobine:
le courant est transmit "sans fil".

=== Expérience avec un aimant

On observe le même résultat avec un aimant et une bobine électrique.
On peut induire un courant dans une bobine en mettant un aimant en mouvement.

== Flux d'un champ magnétique

On décide d'un sens pour orienter le contour.
Le sens du vecteur normal $arw(n)$ dépend du sens pris pour orienter
ce contour:

#figcan({
  import draw: *

  on-xz({
    circle((0, 0), name: "c")
  })
  mark("c.80%", "c.79%", symbol: "straight")
  arrow((0, 0, 0), (0, 1, 0), tip: $arw(n)$)

  translate((3, 0, 0))

  on-xz({
    circle((0, 0), name: "c")
  })
  mark("c.90%", "c.91%", symbol: "straight")
  arrow((0, 0, 0), (0, -1, 0), tip: $arw(n)$)
})

Si on a pris le "mauvais" sens par-rapport au sens du champ magnétique, il faudra rajouter des $-$ un peu partout.

On définit le *flux* du champ magnétique par:
$ phi.alt = arw(B) dot S arw(n) = arw(B) dot arw(S) "en T" dot "m"^2 = "Wb (weber)" $

#figcan({
  import draw: *

  on-xz({
    circle((0, 0), name: "c")
  })
  mark("c.80%", "c.79%", symbol: "straight")
  arrow((0, 0, 0), (0, 1, 0))
  content((-0.4, 0.9, 0), $arw(n)$)
  arrow((0, 0, 0), (0, 1.5, 0), tip: $arw(B)$)

  translate((3, 0, 0))

  on-xz({
    circle((0, 0), name: "c")
  })
  mark("c.80%", "c.79%", symbol: "straight")
  arrow((0, 0, 0), (0, 1, 0), tip: $arw(n)$)
  arrow((0, 0, 0), (1, 1.5, 0), tip: $arw(B)$)
  cetz.angle.angle((0, 0, 0), (1, 1.5, 0), (0, 1, 0), radius: 0.7)
  content((0.3, 1, 0), $alpha$)

  translate((3, 0, 0))

  on-xz({
    circle((0, 0), name: "c")
  })
  mark("c.80%", "c.79%", symbol: "straight")
  arrow((0, 0, 0), (0, 1, 0), tip: $arw(n)$)
  arrow((0, 0, 0), (2, 0, 0), tip: $arw(B)$)
  cetz.angle.right-angle((0, 0, 0), (2, 0, 0), (0, 1, 0), radius: 0.3, label: none)
})

== Loi de Faraday

#theorem[
  Le courant induit dans le circuit est égal à celui produit
  par un générateur fictif
  de force électromotrice $e$ appellée force électromotrice
  induite dont l'expression est:
  $ e = - (dif phi.alt)/(dif t) $
]
Ainsi, pour obtenir un courant induit, le flux doit *nécessairement être
variable.*

#figcan({
  import draw: *

  on-xz({
    circle((0, 0), name: "c")
  })
  mark("c.80%", "c.79%", symbol: "straight")
  arrow((0, 0, 0), (0, 1, 0))
  content((-0.4, 0.9, 0), $arw(n)$)
  arrow((0, 0, 0), (0, 1.5, 0), tip: $arw(B)$)

  circle("c.92%", radius: 0.3)
  arrow((-0.2, -1), (0.5, -0.8))
  content((0.2, -1.2), $e$)

  translate((3, 0, 0))
})

#warn[
  Ici, le générateur fictif doit être en convention générateur
  (après tout, on genère un courant dans le fil).
]

== Limites de la loi de Faradary

- Il faut qu'on puisse définir un flux à chaque instant. 
  Si, par exemple, à un moment le circuit s'ouvre, on ne peut plus
  définir de surface, donc on ne peut plus définir de flux.
  Pourtant, on observera quand même un phénomène d'induction
  (on peut le montrer avec les équations de Maxwell: 2#super[eme] année)
- Il faut que les lignes de champ magnétique soient coupées par le 
  flux conducteur. Dans l'autre cas, on doit introduire la notion de flux "coupé", ce qui nécessite à nouveau les équations de Maxwell.

== Loi empirique ou loi de modération de Lenz

#theorem[
  Les phénomènes d'induction s'opposent aux effets qui les cause.
]

La loi de Lenz est pratique pour expliquer avec les mains "qu'est-ce qui
va se passer".

= Induction de Lorenz - Circuit mobile et champ magnétique stationnaire

== Conversion d'énergie mécanique en énergie électrique - Cas de la translation - Rails de Laplace générateur

#figcan({
  import draw: *

  arrow((0, 2), (0, -1), tip: $arw(x)$)
  arrow((0, 2), (4, 2), tip: $arw(y)$)

  line((0, 0), (4, 0))
  line((0, 2), (4, 2))

  vecout((1, 1), $arw(B)$, (0.5, 0))
  vecout((1, 0.5), $arw(n)$, (0.5, 0))

  set-style(stroke: blue)
  line((2, 2), (0, 2), (0, 0), (2, 0), close: true, name: "l")

  mark("l.10%", "l.11%", symbol: "straight")
  mark("l.40%", "l.41%", symbol: "straight")
  mark("l.70%", "l.71%", symbol: "straight")

  line((2, -1), (2, 3), stroke: red)
  arrow((2, 1), (3, 1), stroke: red, tip: $arw(F)$)

  set-style(stroke: black)

  vecout((0, 2), $arw(z)$, (-0.3, 0.3))

})

La force de Laplace est ici paramétrée par $B$ et $S$.
Ici, le champ magnétique $B$ est constant, mais
la surface de la spire rectangulaire (formée par la boucle de courant)
est variable.

D'après la loi de Lenz, la force de Laplace s'oppose aux causes
donc elle va ici s'opposer à la force $arw(F)$ et freiner la barre,
et on obtiendra une génération de courant électrique dans le circuit.

La force $arw(F)$ déplace la tige. 
On considère $y$ la position horizontale de la barre.
La surface de la spire rectangulaire $S$ vaut $a y$ avec $a$
la largeur des rails.

On calcule le flux magnétique:
$ phi.alt = arw(B) dot arw(S) = B a y $

Par le loi de Faraday:
$ e = - (dif phi.alt)/(dif t) = - (dif)/(dif t) (B a y) = - B a dot(y) $

#import elec: *

On considère le circuit créé, avec $e$ le générateur fictif et
$R$ la résistance totale du circuit:
#figcan({
  carre((0, 0),
    branch(apply(source-ideale, u: tenselr($arw(e)$))),
    retour(apply(intensite, $i$)),
    branch(apply(resistor, label: $R$))
  )
})

Par loi des mailles:
$ e - R i = 0 <=> i = e/R = (- B a dot(y))/R $

On étudie le système de la barre dans le référentiel terrestre supposé
galiléen. On fait un bilan des actions mécaniques:
- Poids $m arw(g)$
- Réaction des rails $arw(R) = R arw(u_z)$ perpendiculaire aux rails
- La force $arw(F)$ appliquée sur la barre (inconnue)
- La force de Laplace $arw(F_L)$

On a:
$ dif arw(F_L) = i dif arw(l) and arw(B) $
On intègre sur la longueur de la barre:
$ arw(F_L) = i a B arw(u_y) $

On applique le principe fondamental de la dynamique:
$ m arw(a) = m arw(g) = arw(R) + arw(F) + arw(F_L) $
$ m diaer(y) &= F + F_L \
&= F + i a B \
&= F - (B a v)/R a B $
On obtient l'équation différentielle du mouvement:
$ (dif v)/(dif t) + (B^2 a^2 v)/(R m) = F/m $

C'est une équation différentielle du premier ordre:
$ v(t) = v_H (t) + v_P (t)
= A e^(-t/tau) + (R F)/(a^2 B^2)
$
On trouve $tau = (m R)/(a^2 B^2)$

On considère une vitesse initiale nulle:
$ v(0) = 0 => A = - (R F)/(a^2 B^2) $
Donc:
$ v(t) = (R F)/(a^2 B^2) (1 - e^(-t/tau)) $
Dans la limite, on a donc:
$ v(t) -->_(t -> +oo) (R F)/(a^2 B^2) $

On calcule la tension générée:
$ e = - B a v = R i <=> B a v + R i = 0 $

On fait un bilan énergétique:
#tip[On multiplie la tension par l'intensité pour obtenir l'énergie
du circuit électrique et la force par la vitesse pour obtenir l'énergie
cinétique]

$ cases(
  B a v + R i = 0,
  m (dif v)/(dif t) = F + i a B
) \
=> cases(
  B a v i + R i^2 = 0,
  m v (dif v)/(dif t) = i a B v + F v
) \
=> cases(
  B a v i + R i^2 = 0,
  (dif)/(dif t) (1/2 m v^2) = i a B v + F v
)
$

On substitue $i a B v$ par $- R i^2$:
#resultb[
  $ F v = dif/(dif t) (1/2 m v^2) + R i^2 $
]

#note[
  On a $F v$ la puissance de la force $F$, et $R i^2$ la puissance
  du circuit électrique.
]

== Freinage par induction

La force de Laplace $arw(F_L)$ est proportionelle à la vitesse:
$ arw(F_L) = - (a^2 B^2)/R arw(v) = - lambda arw(v) $

La force de Laplace va causer un freinage de type frottement fluide
proportionnel à la vitesse sur le rail.

On peut donc l'utiliser pour freiner des matériaux magnétiques.

L'énergie de ce freinage n'est pas perdu: il engendre un courant
électrique dans le circuit (c'est ce qu'on a vu plus haut dans un
cas spécifique) appellé courant de Foucault.

Les pertes par effet joule causent un échauffement du matériau
(utilisé dans les plaques à induction par exemple).

On peut utiliser un matériau feuilleté (conducteur,
isolant, conducteur, isolant, etc..) pour limiter les courants
de Foucaults.

== Conversion de puissance électrique en puissance mécanique - Cas de la translation - Rails de Laplace récepteurs

On reprend presque le même circuit. On rajoute juste une
force électrique qui alimente le circuit.

#figcan({
  import draw: *

  arrow((0, 2), (0, -1), tip: $arw(x)$)
  arrow((0, 2), (4, 2), tip: $arw(y)$)

  line((0, 0), (4, 0))
  line((0, 2), (4, 2))

  vecout((1, 1), $arw(B)$, (0.5, 0))
  vecout((1, 0.5), $arw(n)$, (0.5, 0))

  set-style(stroke: blue)
  line((2, 2), (0, 2), (0, 0), (2, 0), close: true, name: "l")

  mark("l.10%", "l.11%", symbol: "straight")
  mark("l.70%", "l.71%", symbol: "straight")

  circle((0, 1.4), radius: 0.3)
  arrow((-0.5, 1.7), (-0.5, 1.1))
  content((-0.8, 1.4), $E$)

  circle((0, 0.6), radius: 0.3)
  arrow((-0.5, 0.9), (-0.5, 0.3))
  content((-0.8, 0.6), $e$)

  line((2, -1), (2, 3), stroke: red)
  arrow((2, 1), (3, 1), stroke: red, tip: $arw(F)$)

  set-style(stroke: black)

  vecout((0, 2), $arw(z)$, (-0.3, 0.3))

})

On a par loi des mailles:
$ E + e - R i = 0 
<=> i = (E + e)/R
$
$ dif arw(F_L) = i dif l and arw(B) $
$ arw(F_L) = i a B arw(u_z) $
