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

On a par loi des mailles l'équation électrique:
$ E + e - R i = 0 
<=> i = (E + e)/R
$

Équation mécanique.
Sujet: barre dans le référentiel terrestre suppose galiléen.
Bilan des actions mécaniques:
- Poids
- Réaction de la tige
- Force de Laplace $arw(F_L)$

$ dif arw(F_L) = i arw(dif l) and arw(B) $
$ arw(F_L) = i a B arw(u_y) $

On projette le PFD sur $(O_y)$:
$ m arw(a) = m arw(g) + arw(R) + arw(F_L) $
$ m (dif v)/(dif t) = i a B $
$ m (dif v)/(dif t) = a B (E - B a v)/R $
$ m (dif v)/(dif t) + (a^2 B^2)/(R) v = (a B E)/R  $

On résout l'équadiff:
$ v(t) = (tau/(a B)) (1 - e^(-t/tau)) "avec" tau = (m R)/(a^2 B^2) $


== Conversion de puissance mécanique en puissance électrique - Cas de la rotation

On prend un câdre métallique orienté par-rapport à un champ électrique.

#figcan({
  import draw: *

  line((-0.5, -1, 1), (-0.5, 1, 1), (0.5, 1, -1), (0.5, -1, -1), close: true, stroke: blue)

  arrow((0, -1.5, 0), (0, 1.5, 0), tip: $Delta$)

  arrow((0, 0, 0), (1.5, 0, 0), tip: $arw(B)$)
  arrow((0, 0, 0), (1.5, 0, 1.5), tip: $arw(S)$, pad: 0.9)
})

#figcan({
  arrow((2, 1), (0, 0), stroke: blue)
  vecout((1, 0.5), $Delta$, (-0.4, 0.5))
  arrow((1, 0.5), (2, 0.5), tip: $arw(B)$)
  arrow((1, 0.5), (1.5, -0.5), tip: $arw(S)$)
  
  cetz.angle.angle((1, 0.5), (2, 0.5), (2, 1))
  draw.content((1.5, 1), $theta$)
})



$ phi.alt = arw(B) dot arw(S) = B S cos(pi/2 - theta) = B S sin(theta) $

Le câdre va tourner, donc l'angle $theta$ va varier au cours du temps.

Si le câdre tourne à vitesse angulaire constante $omega$, on a
$theta = omega t$ (module $theta_0$ un angle initial)

On a donc $phi.alt = B S sin(omega t)$
$ phi.alt = B S $
$ e = - (dif phi.alt)/(dif t) = - B S omega cos(omega t) $

#figcan({
  carre((0, 0),
    branch(apply(source-ideale), u: tenselr($e$)),
    (i: $i$, rev: true),
    branch(apply(resistor, u: tenserl($u$)))
  )
})

Par loi des mailles:
$ e - R i = 0 $
$ => e = - B s omega cos(omega t) $

#let mom = $cal(M)$

On calcule la force de laplace:
$ arw(mom) = i arw(S) $
$ arw(F_L) = mom  $
Donc:
$ arw(F_L) = - (B^2 S^2 omega)/R cos^2 (omega t) arw(u_theta)  $

On fait un bilan des actions mécaniques:
- Poids du cadre (de moment nul)
- Liaison pivot supposée parfaite (donc de moment nul)
- Moment résultant de la force de laplace
- Moment d'entrainement imposé pour faire tourner le cadre $Gamma_"ext"$

#let momaxe = $L_Delta$

Par théorème du moment cinétique:
$ (dif momaxe)/(dif t) = 0 $
$ Gamma_"ext" + Gamma_L = 0 $
$ Gamma_"ext" = (B^2 S^2 omega)/R cos^2 (omega t) $
$ angle.l Gamma_"ext" angle.r = (B^2 S^2 omega)/R angle.l cos^2 (omega t) angle.r = (B^2 S^2 omega)/(2 R)  $

On fait un bilan énérgétique.

= Induction de Neumann - Circuit fixe et champ mangétique variable 

== Phénomène d'auto-induction

Un courant électrique créée un champ magnétique $arw(B)$.
Ce champ magnétique fiat apparaître un flux propre
(car propre au circuit) $phi.alt_P = arw(B) dot arw(S) $.

Or le champ magnétique $arw(B)$ sera proportionnel à l'intensité parcourant
le circuit, ce qui nous donne:
$ phi.alt_P = L i "avec" L "le coefficient d'inductance propre" $

=== Exemple

#figure(image("inductance_propre.png"))

On s'interesse à une spire:
$ phi.alt_P = arw(B) dot arw(S)
= mu_o N/l I arw(u_x) dot S arw(u_x)
= (mu_0 N/l S) I = L I
$

Pour l'entièreté du solénoide:
$ phi.alt_(P,"alt") = N phi.alt_P $
Donc:
$ L_"sol" = mu_0 (N^2 S)/l "avec" S = pi R^2 $

=== Force électromotrice auto-induite 

C'est une bobine:
$ e = - (dif phi.alt_P)/(dif t) = -(dif (L I(t)))/(dif t)
= - L (dif I)/(dif t) $

#figcan({
  serie((0, 0), (i: $i$), apply(source-ideale, u: tenselr($e$)), (i: $i$))
})

=== Cohérence avec la loi de modération de Lenz

=== Bilan d'énergie 

== Couplage par induction - Induction mutuelle

On considère deux circuits: $cal(C)_1$ et $cal(C)_2$.

=== Coefficient d'induction mutuelle

#let flux = $phi.alt$

$cal(C_1)$ créé un champ magnétique $arw(B_1)$ proportionnel
à $i_1$. De même, $cal(C)_2$ créé un champ magnétique $arw(B_2)$
proportionnel à $i_2$.

On considère le flux créé par le circuit 1 vers le circuit 2 et
inversement. On admet la relation suivante:
$ flux_(1->2) = M_(1->2) i_1 "et "flux_(2->1) = M_(2->1) i_2 $
Avec $M_(1->2)$ le coefficient d'inductance mutuelle de $cal(C)_1$ sur
$cal(C)_2$.
On admet de plus que $M_(1->2) = M_(2->1)$.

Le champ magnétique aura une composante suivant $arw(u_r)$ et une
composante suivant $arw(u_theta)$

=== Exemple de calul d'inductance mutuelle

#figure(image("inductance_mutuelle.png"))

#figcan({
  import draw: *

  circle((0, 0), name: "c1")
  mark("c1.70%", "c1.71%", symbol: "straight")
  content((0, 0), $cal(C)_1$)

  circle((3, 0), name: "c2")
  mark("c2.70%", "c2.71%", symbol: "straight")
  content((3, 0), $cal(C)_2$)
})


=== Force électromotrice induite dans les deux circuits

#figure(image("faraday.png", width: 80%))

On a:
$ e_1 = (-dif flux(->1))/(dif t) $
$ flux_1 = flux_(1 p) + flux_(2->1) = L_1 i_1 + M i_2  $

$ e_1 = - L_1 (dif i_1)/(dif t) - M (dif i_2)/(dif t) $
$ e_2 = - (dif flux_(->2))/(dif t) $

$ flux_(->2) = flux_(2 p) + flux_(1->2) = L_2 i_2 + M i_1 $
$ => e_2 = - L_2 (dif i_2)/(dif t) - M (dif i_1)/(dif t) $

== Exemple de circuit couplé

#figure(image("couplage.png", width: 50%))

#todo[
  Souligner les variables complexes
]

Par loi des mailles / loi des nœuds:
$ cases(
  e = - R_1 i_1 - L_1 (dif i_1)/(dif t) - M (dif i_2)/(dif t) = 0
  L_2 (dif i_2)/(dif t) + M (dif i_1)/(dif t) + R_2 i_2 = 0
) $

$
cases(
  R_1 i_1 + j L_1 omega i_1 = j M omega i_2 = e,
  j L_2 omega i_2 + j M omega i_1 + R_2 i_2 = 0
)
$

Donc:
$ i_2 (R_2 + j L_2 omega) = - j M omega i_1 $
$ i_2 = (- j M omega)/(R_2 + j L_2 omega) i_1 $
$ e = R_1 + j L_1 omega - (j M omega)^2/(R_2 + j L_2 omega) $

D'un point de vue énergitique:

=== Équations électriques

$
cases(
  R_1 i_1 + L_1 (dif i_1)/(dif t) + M (dif i_2)/(dif t) = e(t),
  R_2 i_2 + L_2 (dif i_2)/(dif t) + M (dif i_1)/(dif t) = 0
)
$

=== Régime sinusoïdal permanent

$ 
cases(
  R_1 i_1 + j L_1 omega i_1 + J M omega i_2 = e,
  R_2 i_2 + j L_2 omega i_2 + j M omega i_1 = 0
)
$

=== Transfert d'énergie par induction mutuelle

$ 

$

== Application: Transformateur

#figure(image("transfo.png", width: 50%))

Avec $N_1$ le nombre de spires à gauche et $N_2$ le nombre de spires
à droite.

Le premier bobinage va générer un champ magnétique.

On calcule le flux induit dans le deuxième bobinage:
$ flux_(1->2) = N_2 arw(B) dot arw(S) $
En appliquant la loi de Faraday:
$ e_2 = - (dif flux_2)/(dif t) = - N_2 S (dif B)/(dif t) $
$ flux_(2->1) = N_1 arw(B) dot arw(S) = N_1 B S $

$ e_1 = - (dif flux_1)/(dif t) = - N_1 S (dif B)/(dif t) $

$ e_2/N_2 = - S (dif B)/(dif t) = e_1/N_1 <=> u_2/u_1 = N_2/N_1 $
