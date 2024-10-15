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

== Valeur de la résistance mesurée

=== Branchement en longue dérivation
$ R_"mes" = U_"mes"/I_"mes" = U/I $

L'intensité mesurée est correcte, mais la tension mesurée ne l'est pas:
$ U = (R + R_A) I $

D'où
$ R_"mes" = R + R_A $

On voit que $R_"mes" approx R$ quand $R_A << R$. On le préferera quand $R$ est grand.

=== Branchement en courte dérivation

La tension mesurée est correcte, mais l'intensité ne l'est pas:
$ I = I_V + I_R = U/R_V + U/R = U (R + R_V)/(R R_V) $

D'où:

$ R_"mes" = U_"mes"/I_"mes" = U/I = (R R_V)/(R + R_V) $

On voit que $R_"mes" approx R$ quand $R << R_V$. On le préfera quand $R$ est petit.

== Valeurs à priviligier pour les appareils

Quand on place un ampèremètre sur un circuit, il faut que la tension à ses bornes soit négligable pour ne pas perturber le circuit.

Ainsi, la résistance interne de l'ampèremètre doit être le plus faible possible. (de l'ordre de grandeur de quelques $ohm$).

De même, pour que le voltmètre ne perturbe pas une mesure, l'intensité qui le parcourt doit être très petite, donc il doit avoir une résistance interne très grande.

Il faut connaître l'ordre de grandeur des résistance de voltmètre: quelques M$ohm$.

Il faudra aussi faire attention à la résistance interne des générateurs ($approx 50 ohm$) et des oscilloscopes.

= Ponts diviseurs de tension et de courant

== Pont diviseurs de tension

#figcan({
  serie((0, 0), rot: -90deg, i: $i$, u: tenserl($u$), inset: 1.5,
    apply(resistor, label: $R_2$, u: tenserl($u_2$)),
    apply(resistor, label: $R_1$, u: tenserl($u_1$))
  )
})

Maître Badel dit: Si on veut appliquer le pont diviseur de tension, il faut identifier le pont diviseur de tension.

On considère un pont diviseur de tension si l'intensité partant d'un nœud entre deux résistances est quasi-nulle.

On peut donc se permettre de rajouter un dipôle en parallèle de $R_1$, si ce dernier possède une résistance $>> R_1$ (comme un voltmètre).

#figcan({
  serie((0, 0), rot: -90deg, i: $i$, u: tenserl($u$), inset: 1.2, name: "D",
    apply(resistor, label: $R_2$, u: tenserl($u_2$)),
    apply(node, name: "A", round: true),
    apply(resistor, label: $R_1$, u: tenserl($u_1$))
  )

  fil("D.A", (rel: (2, 0), to: "D.A"), i: $i = 0$, straight: false)
})

On a:
$ u = (R_1 + R_2)i \
<=> i = u / (R_1 + R_2)
$

$ u_1 = R_1 i = u R_1/(R_1 + R_2) $
$ u_2 = R_2 i = u R_2/(R_1 + R_2) $

== Pont diviseur de courant

On a un courant qui arrive. Si on veut le diviser, on va mettre deux résistances en parallèle:

#figcan({
  derivation((0, 0), i: $i$, u: tenserl($u$), inset: 2,
    apply(serie, inset: 1.2, i: $i_1$, apply(resistor, label: $R_1$)),
    apply(serie, inset: 1.2, i: $i_2$, apply(resistor, label: $R_2$))
  )
})

On a:
$ u = R_1 i_1 = R_2 i_2 \
<=> i_2 = R_1/R_2 i_1
$

$ i = i_1 + i_2 = i_1 + R_1/R_2 i_1 \
= i_1((R_1 + R_2)/R_2) $

$ i_1 = i R_2/(R_1 + R_2) $

// On peut faire les deux en même temps:
On peut aussi utiliser une résistance de charge:

#figcan({
  derivation((0, 0), inset: 2, width: 8, i: $i$, u: tenserl($u$),
    apply(serie, i: $i_1$,
      apply(resistor, label: $R_1$),
      apply(resistor, label: $R_c$)
    ),
    apply(serie, i: $i_2$, apply(resistor, label: $R_2$))
  )
})

On a:
$ u = (R_1 + R_c) i_1 = R_2 i_2 $

$ i_2 = i_1 (R_1 + R_c)/R_2 $

$ i = i_1 + i_2 \
= i_1 + i_1 (R_1 + R_c)/R_2 \
= i_1 (R_1 + R_2 + R_c)/R_2
$

$ i_1 = i R_2/(R_1 + R_2 + R_c) $

En choissisant judicieusement les valeurs de $R_1$ et $R_2$, on peut choisir exactement quelle intensité va parcourir le dipôle de résistance $R_c$.

= Exemples d'applications

On peut utiliser les ponts pour connaître la tension et l'intensité à n'importe quel point du circuit.

== Lois de Kirchehhofhf

Example de circuit:
#figcan({
  serie((0, 0), name: "D",
    apply(resistor, label: $R_1$),
    apply(node, name: "A", round: true),
    apply(resistor, label: $R_2$)
  )

  node((0, -3), name: "B", round: true)

  resistor((0, -1.5), rot: -90deg, name: "d")

  fil("D.A", "d.l")
  fil("d.r", "B")
  fil("D.l", "B", "D.r", "B", rev: 1)

  source-ideale((-3.6, -1.5), rot: -90deg, u: tenserl($E_1$), name: "e1")
  source-ideale((3.6, -1.5), rot: -90deg, u: tenserl($E_2$), name: "e2")

   maille((-1.5, -1.5), 0.5, rev: true)
  maille((1.5, -1.5), 0.5)
})

On veut retrouver les intensites $i_1$, $i_2$, et $i_3$.

On commence par appliquer les loi des nœuds et des mailles:
On a:
- Lois des nœuds: $i_1 + i_2 + i_3 = 0$
- Lois des mailles (1): $E_1 - R_1 i_1 + R_3 i_3 = 0$
- Lois des mailles (2): $E_2 - R_2 i_2 + R_3 i_3 = 0$
- Lois des mailles (3): $E_1 - R_1 i_1 + R_2 i_2 - E_2 = 0$

$
cases(
  i_3 = -i_1 - i_2,
  E_1 - R_1 i_1 + R_3(-i_1 - i_2) = 0,
  E_2 - R_2 i_2 + R_3 (-i_1 - i_2) = 0
) \
<=> 
cases(
  i_3 = -i_1 - i_2,
  E_1 - (R_1 + R_3) i_1 - R_3 i_2 = 0 times R_3,
  E_2 - R_3 i_1 - (R_2 + R_3)i_2 = 0 times -(R_1 + R_3)
) \
<=> cases(
  i_3 = -i_1 - i_2,
  R_3 E_1 - R_3^2 i_2 - (R_1 + R_3)E_2 + (R_2 + R_3)(R_1 i R_3) = 0,
  (R_2 + R_3)E_1 - (R_2 + R_3)(R_1 + R_2)i_1 - R_3 E_2 + R_3^2 i_1 = 0
) \
<=> cases(
  i_3 = -i_1 - i_2,
  i_2 = ((R_1 + R_3)E_2 - R_3 E_1)/(R_1 R_2 + R_1 R_3 + R_2 R_3),
  i_1 = ((R_2 + R_3)E_1 - R_3 E_2)/(R_1 R_2 + R_1 R_3 + R_2 R_3)
)
$

$ (V dot A^(-1) dot V - V dot A^(-1) dot V)/(V^2) \
(V^2 dot A^(-1))/( V^2 dot A^(-2) ) = A
$

== Utilisation du pont diviseur de tension

#figcan({
	carre((0, 0), 
		(branch: (
			apply(resistor, label: $R$),
			apply(source-ideale, label: tenserl($E$))
		)),
		apply(resistor, label: $2R$),
		(top: "B", down: "A", u: tenserl($u$),
			branch: apply(resistor, label: $3R$)
		),
		apply(resistor, label: $R$),
		(branch: (apply(resistor, label: $3R$))),
		(branch: (apply(resistor, label: $2R$))),
	)
})

D'abord, on réduit notre circuit au maximum (résistances en série et en parallèle).
On a:
1. $ R_2 = R + 2R = 3R $
2. $ 3R parallel 2R => R_"eq" = 1/(1/(3R) + 1/(2R)) = 1/(6/R) = (6R)/5 $

On réduit les deux résistances maintenant en parallèle:

$ R'_"eq" = R + R_"eq" = R + (6R)/5 = 11/5 R $

$ R_1 = 1/(1/(3R) + 1/(R'_"eq")) = 1/(1/(3R) + 5/(11R)) &= (33R)/(11 + 15) \
&= 33/26 R
$

Une fois que notre circuit est réduit à:
#figcan({
	carre((0, 0), 
		branch(apply(source-ideale)),
		apply(resistor, label: $3R$),
		branch(top: "B", down: "A", apply(resistor, label: $3R$)),
		branch(apply(resistor, label: $(6R)/5$)),
		// (branch: )
	)
})

On veut connaître la tension $u_1$.

On applique le pont diviseur de tension:

$ u _1 = R_1 E(R_1 + R_2) = (33/26 R)/(33/26 R + 3 R) E \
= (3 times 11)/(3 times 11 + 3 times 26)E = 11/37 E
$

Mettons qu'on veuille connaître la tension $v$ comme il suit:

#figcan({
	carre((0, 0), 
		branch(
			apply(resistor, label: $R$),
			apply(source-ideale, label: tenserl($E$))
		),
		apply(resistor, label: $2R$),
		branch(top: "B", down: "A",
			apply(resistor, label: $3R$)
		),
		apply(resistor, label: $R$),
		branch(apply(resistor, label: $3R$)),
		branch(u: tenserl($v$), apply(resistor, label: $2R$)),
	)
})

On se place sur la droite du circuit, et on utilise la tension de $u_1$ qu'on a déjà caculé.

On trouve:
$ v = (R_"eq" u)/(R + R_"eq") = ((6R)/5 (11E)/37)/(R + (6R)/5) = (6E)/37 $

== Utilisation du pont diviseur de courant

#figcan({
	carre((0, 0),
		branch(),
		apply(resistor, label: $2R$),
		branch(apply(resistor, label: $3R$)),
		apply(resistor, label: $R$),
		branch(apply(resistor, label: $3R$)),
		branch(apply(source-ideale-courant, label: tenserl($I_0$)))
	)
})

On veut connaître le courant $i_1$ passant par la résistance $R_2$.

On va fusionner toutes les autres résistances en une grosse résistance $R_2$, et on va appliquer le pont diviseur de courant pour trouver l'intensité $i_1$.

#todo[]

On calcule la valeur de la résistance $R_2$:
1. On a l'association en série de $R$ et de $2R$ de résistance $R_"eq" = 3R$
2. $R_"eq"$ et $3R$ en parallèle, d'où: $ R'_"eq" = 1/(1/R_"eq" + 1/(3R)) = 1/(1/(3 R) + 1/(3R)) = (3 R)/2 $
3. $R'_"eq"$ et $R$ en série: $R_2 = (3R)/2 + R = 5/2 R$

Il ne reste plus qu'a appliquer le pont diviseur de courant:

$ R_1 i_1 = R_2 i_2 <=> i_2 = R_1/R_2 i_1 $
$ I_0 = i_1 + i_2 = i_1 + R_1/R_2 i_1 = i_1 (R_1 + R_2)/R_2 $
$ i_1 = (R_2 I_0)/(R_1 + R_2) $
$ i_1 = (5/2 R I_0)/(3R + 5/2 R) = 5/11 I_0 $

On peut maintenant calculer l'intensité passant par la résistance du milieu:

On dit que $R_2$ n'est plus que les deux résistances à la fin

On applique la loi des nœuds:
$ i_2 = I_0 - i = I_0 - 5/11 I_0 = 6/11 I_0 $

On a $R_1 = 3R$, $R_2 = R + 2R = 3R $

On applique le pont diviseur de courant:
$ i' = (3R 6/11 I_0)/(3R + 3R) = 3/11 I_0  $

== Double pont diviseur de tension

Ne pas tomber dans le "piège" des doubles ponts diviseur de tension.

#todo[Schéma]

#figcan({
  serie((0, 0),
    apply(source-ideale),
    apply(resistor, label: $R_1$),
    apply(derivation,   )
  )
})

1. On nous demande de calculer $u_2$ en fonction de $u_1$:
On utilise un pont diviseur de tension:
$ u_2 = (R_4 u_1)/(R_3 + R_4) $

2. On réduit l'association en série de $R_3$ et de $R_4$:
$ R_"eq" = (R_2 (R_3 + R_4))/(R_2 + R_3 + R_4) $
$ u_1 = (R_"eq" E)/(R_"eq" + R_1) = (R_2 (R_3 + R_4) E)/(R_2 (R_3 + R_4) + R_1 (R_2 + R_3 + R_4)) $

On substitue:
$ u_2 = (R_4)/(R_3 + R_4)  u_1 \ 
= (R_2 R_4 E)/(R_2 (R_3 + R_4) + R_1(R_2 + R_3 + R_4))
$

== Loi des nœuds en terme de potentiel - Théorème de Millman

#hp[[Résultat hors-programme: il faudra le démontrer à chaque utilisation]]

#figure(caption: [Millman], image("./millman.png", width: 50%))

La loi des nœuds s'exprime en intensité, et ne devrai pas pouvoir s'exprimer en termes de tension.

Ici, on a:
$ i_1 + i_2 + i_3 + i_4 + i_5 + i_6 + i_7 = 0 $

Or, toutes ces intensités proviennent de résistances, d'où:
$ u_1/R_1 + u_2/R_2 + ... + u_7/R_7 = 0 $

Qu'on peut exprimer en terme de potentiel:
$ (V_A_1 - V_N)/R_1 + (V_A_2 - V_N)/R_2 + ... + (V_A_7 - V_N)/R_7 = 0 $

Et on sort les $V_N$:
$ V_A_1/R_1 + V_A_2/R_2 + ... + V_A_7/R_7 = V_N (1/R_1 + 1/R_2 + ... + 1/R_7)  $


On peut l'utiliser:

#todo[schéma...]

On exprime $V_A$ en appliquant la relation:
$ V_A = (V_C/R_1 + V_B/R_3 + V_D/R_2)/(1/R_1 + 1/R_2 + 1/R_3) $

On place la masse en $B$, donc on considère que $V_B = 0$.
On a donc $u_3$ la tension de $R_3$ qui est:
$ u_3 &= V_A - V_B = V_A  \
&= (E_1/R_1 + E_2/R_2)/(1/R_1 + 1/R_2 + 1/R_3) \
&= (R_3 (R_2 E_1 + R_1 E_2))/(R_2 R_3 + R_1 R_3 + R_2 R_1)
$

Donc on calcule $i_3$:




