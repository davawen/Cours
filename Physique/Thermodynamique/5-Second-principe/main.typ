#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Second principe de la thermodynamique - Entropie et évolution]

= Évolution des systèmes

Dans ce chapitre, on s'intéressera à l'évolution spontanée: notre
action se limite à changer les contraintes du système et à observer
sa réponse.

== Quelques observations expérimentales

- Spontanément, les objets inanimés aiment tomber par terre, fort.
- Spontanément, les éléments aiment se diffuser dans un milieu
- Spontanément, les gaz remplissent un volume 

On peut revenir en arrière, mais cela nécessite de l'énergie.

On se rappelle le premier principe:
"La variation d'énergie totale dans un système est la somme
des échanges énergétiques"

L'irréversibilité de ces réactions n'est pas explicable avec le premier
principe.

== Transformation réversible ou irréversible

La majorité des transformations rencontrée sont irréversible.
Les transformations réversible sont un idéal innateignable.

Une transformation est réversible si elle est *quasistatique* et
que l'évolution dans le sens inverse est possible.

#figcan(caption: [Exemple de transformation quasistatique non mécaniquement réversible], {
  import draw: *
  rect((-1, -1), (1, 1))
  rect((2, -1), (4, 1))
  line((1, -0.05), (2, -0.05))
  line((1, 0.05), (2, 0.05))
  content((0, 0), [Gaz])
  content((3, 0), [Vide])
})

- La transformation est bien quasi-statique
- La transformation n'est pas réversible (le gaz ne va pas se diffuser dans
  l'autre sens)

#figcan(caption: [Exemple de transformation mécaniquement réversible non réversible], {
  import draw: *
  rect((-1, -1), (1, 1))
  rect((2, -1), (4, 1))
  line((1, 0), (2, 0), stroke: 4pt)
  line((1.9, 0), (0.6, -1.8))
  content((0.5, -2), [Mauvais conducteur thermique])
})
- La transformation est bien quasi-statique
- La transformation est bien mécaniquement réversible (il n'y a pas de mouvement macroscopique de matière)
- La transformation n'est pas réversible (la chaleur ne va pas se diffuser dans l'autre sens)

$ "réversible" => "mécaniquement réversible" => "quasistatique" $

== Quelques causes de l'irréversibilité

- Frottement ou effet Joule (forces non conservatives: de l'énergie est "perdue")
- Inhomogénéité ou températures distinctes (la diffusion est irréversible)
- Durée de l'évolution (les expériences plus courtes aurons des variations plus faibles (et donc plus facilement réversible) et inversement pour les expériences plus longues)

= Second principe des systèmes fermés #underline[calorifugés]

#warn[
  Le premier principe s'appliquait à tout système fermé
  (sans apport de matière ou d'énergie). \
  Le second principe s'applique à tout système fermé *calorifugé*.
  Il est plus restreint.

  On devra considérer les transferts thermiques de manière différente.
  On verra qu'on peut découper des systèmes non calorifugés en systèmes calorifugés.
]

== Énoncé

#principe[
  Pour tout système thermodynamique, il existe une fonction
  d'état $S$ appellée *entropie*  telle que:
  - L'entropie est une grandeur extensive définie à l'équilibre.
  - Dans un système fermé et calorifugé, la variation d'entropie est positive.
  $ Delta S >= 0 $
]

== Principe d'évolution

Dans toute transformation, la variation d'entropie est positive.
On peut utiliser les valeurs de l'entropie pour savoir dans quel
_direction_ la transformation se déroule, parce qu'on a toujours:
$ S_"final" >= S_"intial" $

Quand on arrive à un état d'équilibre, l'entropie ne peut plus augmenter.
On dit que l'entropie augmente vers un *maximum d'entropie*.

== Cas d'une évolution réversible

Dans le cas d'une transformation réversible, une transformation
de $A -> B$ et de $B -> A$ est possible. On a donc:
$ S_B >= S_A "et" S_A >= S_B => S_A = S_B "et" Delta S = 0 $

== Interprétation statistiques de l'entropie

Statistiquement, l'entropie est une mesure du \"désordre\".

= Identités thermodynamiques

== Choix des variables d'état

L'entropie est fonction d'état. On peut l'utiliser pour définir une autre fonction d'état.
#parachute[
  Dans le cadre de la mécanique statistique, on trouve que c'est bien
  pratique d'utiliser l'entropie et le volume pour définir l'énergie interne
]
On a donc:
$ U(S, V) $
$ dif U = ((diff U)/(diff S))_V dif S + ((diff U)/(diff V))_S dif V  $

== Définition de la température et de la pression thermodynamique

Jusqu'a présent, on a définit la température et la pression "cinétique"
à partir de l'énergie des particules.

On va définir un autre type de température et de pression,
qu'on identifiera l'un à l'autre (ce serait dommage d'avoir deux pressions différentes).

On définit:
#grid(
  columns: (1fr, 1fr),
  align: center,
  [
  La *température thermodynamique*:
  $ T = ((diff U)/(diff S))_V dif S $
  ],
  [La *pression thermodynamique*:
  $ P = - ((diff U)/(diff V))_S dif V $
  ]
)
#note[
  On remarque cependant une grosse différence entre les définitions
  de $P,T$ cinétiques et thermodynamiques, c'est que les définitions
  thermodynamiques sont valides _même lorsque le système n'est pas à l'équilibre_.

  On aura juste besoin de vérifier que les deux définitions colllent
  quand le système est à l'équilibre.
]

== Identités thermodynamique

On a donc:
#resultb[$ dif U = T dif S - P dif V $]
On appelle cette relation la *1#super[ere] identité thermodynamique*.

On reprend l'expression de l'enthalpie:
$ H = U + P V $
$ dif H = dif U + P dif V + V dif P
 = T dif S + V dif P $

On obtient la *2#super[nd] identité thermodynamique*:
#resultb[$ dif H = T dif S + V dif P $]

== Remarque importante

Avec cette expression, le caractère extensif de la variable
ne se propage pas aux dérivées.
Il faut écrire les identités thermodynamique pour chaque sous-système
étudié (afin d'avoir une température et une pression définie)

== Identification de la Température/Pression

On avait définit la pression et la température cinétiques 
$P_"cin"$ et $T_"cin"$ seulement à l'équilibre thermodynamique.

Les définitions de la pression et de la température thermodynamiques
$P$ et $T$ sont définies n'importe quand.

On identifie les deux à proximité de l'équilibre thermodynamique. Démonstration:

On se place à l'équilibre thermodynamique, donc $dif S = 0$. On a:
$ dif U = T dif S - P dif V = - P dif V $
Par le premier principe:
$ dif U = delta W + delta Q $
Comme on applique le deuxième principe, le sujet étudié est calorifugé, donc:
$ dif U = delta W $
De plus, toute transformation au voisinage de l'équilibre est
quasistatique (par définition), donc:
$ delta W = - P_"ext" dif V approx - P_"cin" dif V $

On trouve donc:
#resultb[$ - P dif V = - P "cin" dif V => P = P_"cin" $]

Pour la température, on se place dans le cas des gaz parfaits:
$ P V = n R T_"cin" $
$ dif U = C_V dif T_"cin" $
On reprend la 1#super[ere] identité thermodynamique:
$ dif U = T dif S - P dif V => dif S = (dif U)/T - P/T dif V $
On substitue l'expression de la pression et de l'énergie interne:
$ dif S = C_V/T dif T_"cin" - (n R T_"cin")/(T V) dif V $

Or, l'entropie $S$ est définie en fonction de la température et du volume: $S(T_"cin", V)$. \
On peut donc dériver $S$ par-rapport à ces deux variables:
$ dif S = (diff S)/(diff T_"cin") dif T_"cin" + (diff S)/(diff V) dif V $
On identifie les deux expressions:
$ 
  (diff S)/(diff T_"cin") = C_V/T \
  (diff S)/(diff V) = (n R T_"cin")/(V T)
$

D'après le théorème de Schwartz, si $f(x, y)$ est une fonction à deux variables, alors:
$ (diff^2 f)/(diff x diff y) = (diff^2 f)/(diff y diff x) $
(La dérivation partielle commute)

On va dériver l'expression de haut selon $V$, et l'expression du bas
selon $T_"cin"$:
$
(diff S)/(diff T_"cin" diff V) = (diff)/(diff V) ((diff S)/(diff T_"cin")) = (diff)/(diff V) (C_V/T) = 0 "(dérivée d'une constante)" $
$T$ est une fonction qui dépend de $T_"cin"$: (on pose $T(T_"cin")$ en somme):
$
(diff S)/(diff T_"cin" diff V)
&= (diff)/(diff T_"cin") ((diff S)/(diff V)) \
&= (diff)/(diff T_"cin") ((n R T_"cin")/(V T(T_"cin"))) \
&= (n R)/(V T) - (n R T_"cin")/(V T^2) (diff T)/(diff T_"cin") \
&= (n R)/(V T) (1 - T_"cin"/T (diff T)/(diff T_"cin")) \
&= 0 "(égalité avec l'autre dérivée)"
$

Donc:
$ 1 - (T_"cin")/T (diff T)/(diff T_"cin") = 0 \
=> T_"cin" diff T = T diff T_"cin" \
=> (diff T)/T = (diff T_"cin")/T_"cin" \
ln T = ln T_"cin" + C "(on intègre des deux cotés)" \
T = alpha T_"cin" "(on passe à l'exponentielle)" \
$
$T$ et $T_"cin"$ ont les mêmes unités donc hassoul $alpha = 1$ (vrai justification).

= Entropie, équilibre et  évolution

== Thermique

#set math.equation(numbering: "(1)")

On prend un système isolé de l'extérieur:
#figcan({
  import draw: *
  rect((0, 0), (4, 2))
  line((2, 0), (2, 2))

  content((1, 1), $T_1$)
  content((3, 1), $T_2$)

  content((0.3, 0.3), $Sigma_1$)
  content((3.7, 0.3), $Sigma_2$)
})

On souhaite trouver quel est l'état d'équilibre.
Dans un premier temps, on suppose la cloison fixe.
Le système est à l'équilibre mécanique, donc:
$ dif V = 0 $
$ dif V_1 = 0 "et" dif V_2 = 0 $
Par la première identité thermodynamique (écrite pour chacun des sous-systèmes) (le système est calorifugé):
$ dif U = T dif S - P dif V $
$ dif U_1 = T_1 dif S_1 $ <id1>
$ dif U_2 = T_2 dif S_2 $ <id2>
Par extensivité de l'énergie interne et de l'entropie:
$ dif U = dif U_1 + dif U_2 $ <Uextensif>
$ dif U= T_1 dif S_1 + T_2 dif S_2 $
$ dif S = dif S_1 + dif S_2 $
On réutilise @id1 et @id2:
$ dif S = (dif U_1)/T_1 + (dif U_2)/T_2 $ <entropieUT>

Par le premier principe de la thermodynamique:
$ dif U = delta W + delta Q $
Les parois sont fixes, donc $delta W = 0$, et le système est calorifugé, donc $delta Q = 0$
On a donc par @Uextensif:
$ dif U_2 = - dif U_1 $
On reprend l'expression de l'entropie @entropieUT:
$ dif S = (1/T_1 - 1/T_2) dif U_1 $

On cherche la position d'équilibre, qui est atteinte quand $dif S = 0$:
$ 1/T_1 - 1/T_2 = 0 => T_1 = T_2  $
Donc l'équilibre est atteint quand les températures sont égales.

#tip[
  Le paramètre qui décrit *l'évolution* du système, c'est l'entropie.
  Quand on parle d'équilibre, on veut parler d'entropie.
]

Si on se place dans le cas où $T_2 > T_1$, on a $1/T_2 < 1/T_1$, donc:
$ dif S = underbrace((1/T_1 - 1/T_2), >= 0) dif U_1 $
Or la variation d'entropie est toujours positive.
Par produit, on a donc:
$ dif U_1 >= 0 \ underbrace(C_V, >0) dif T_1 >= 0 $

On prouve donc que la température du récipient de droite augmente.

== Mécanique

On reprend le système précedent, avec cette fois-ci une cloison
mobile, une même température des deux cotés et une pression différente:
#figcan({
  import draw: *
  rect((0, 0), (4, 2))
  line((2, 0), (2, 2))

  content((1, 0.5), $T_0$)
  content((3, 0.5), $T_0$)
  content((1, 1.5), $P_1$)
  content((3, 1.5), $P_2$)

  content((0.3, 0.3), $Sigma_1$)
  content((3.7, 0.3), $Sigma_2$)
})

Les parois du système sont fixes, donc le volume total ne change pas, donc:
$ dif V = dif V_1 + dif V_2 = 0 $ <Vextensif>
$ dif V_2 = - dif V_1 $

On pose l'entropie du système:
$ dif S = dif S_1 + dif S_2 $ <Sextensif>
Et par la première identité thermodynamique:
$ 
dif U_1 = T_1 dif S_1 - P_1 dif V_1 \
dif U_2 = T_2 dif S_2 - P_2 dif V_2
$

Par le premier principe:
$ dif U = delta W + delta Q = dif U_1 + dif U_2 $ <Uextensif2>
L'ensemble du système est calorifugé et les parois externes
sont fixes, donc $delta Q = 0$ et $delta W = 0$

Donc $dif U = 0$, et par @Uextensif2
$ dif U_2 = - dif U_1 $ <memeU>

Par la second identité thermodynamique:
$ dif S_1 = (dif U_1)/T_1 + (P_1)/T_1 dif V_1 $
$ dif S_2 = (dif U_2)/T_2 + (P_2)/T_2 dif V_2 $

On remplace dans @Sextensif avec @memeU
$ dif S = (1/T_1 - 1/T_2) dif U_1 + (P_1/T_1 - P_2/T_2) dif V_1 $
On a la même température des deux cotés:
$
dif S = (1/T_0 - 1/T_0) dif U_1 + (P_1 - P_2)/T_0 dif V_1 \
= 1/T_0 (P_1 - P_2) dif V_1
$

Quand on se place à l'équilibre (donc $dif S = 0$), on trouve:
$ P_1 = P_2 $

Si on fait l'hypothèse que $P_1 > P_2$, alors $dif S >= 0$ et
de la même manière, on trouve que $dif V_1 >= 0$ et que $dif V_2 <= 0$

= Second principe des systèmes non calorifugés

Dans la partie suivante, on enlève l'hypothèse de calorifugeage du système.

== Variation d'entropie au cours d'une transformation réversible

Comme le système n'est plus calorifugé, lors d'une transformation
on observera très probablement un transfert thermique,
donc mếme lors d'une transformation réversible, l'entropie risque de changer.

(Cependant, on s'attend à ce que l'expression de l'entropie soit de la forme $dif S = dif S_"calorifugé" + delta Q $)

On reprend la première identité thermodynamique:
$ dif U = T dif S - P dif V $ <premiereid>
$ => dif S = (dif U)/T + P/T dif V $
On prend le premier principe:
$ dif U = delta Q + delta W $
Or, l'énergie interne est une _fonction d'état_, donc peut importe
le chemin suivi lors d'une transformation pour aller de $A$ vers $B$,
le résultat sera le même.
On suppose donc qu'il existe une transformation réversible qui permette
de faire le chemin $A -> B$:
#let rev = $"réversible"$ 
$ dif U = delta Q_rev + delta W_rev $
Or, toute transformation réversible est quasistatique, donc:
$ delta W_rev = delta W_"quasistatique" = - P dif V $
Donc:
$ dif U = delta Q_rev - P dif V $
On substitue dans @premiereid:
#resultb[$ T dif S = delta Q_rev => dif S = (delta Q_rev)/T $]

Ce sera donc toujours le transfert thermique qui permettra de calculer la variation d'entropie. (mais on ne pourra pas trouver l'expression de $delta Q_rev$)

#set math.equation(numbering: none)

== Thermostat ou source de chaleur

On définit un *thermostat* (ou *source de chaleur*)
comme un système _fermé_, n'échangeant aucun travail, et capable
de fournir n'importe quel transfert thermique sans changer de température.

#let th = $"th"$
On aura donc $Q_th$ (ou $delta Q_th$) quelconque.
On a $W_th$ (ou $delta W_th$) qui est nul par définition.

Par le premier principe:
$ Delta U_th = Q_th + W_th = Q_th "(ou" dif U_th = delta Q_th + delta W_th ")" $

Depuis le début, la convention en thermodynamique était que les échanges
positif étaient reçus et que les échanges négatif étaient fournis.

On considèra un système et un thermostat (pour utiliser le thermostat
comme source des transferts thermiques). Ce qui nous intéresse,
c'est le transfert thermique reçu par le système.
On pose donc $ Q = -Q_th $
#figcan({
  import draw: *
  circle((-2, 0), radius: (1.3, 0.7), name: "c1")
  circle((2, 0), radius: (1.3, 0.7), name: "c2")

  content("c1.center", [Thermostat])
  content("c2.center", [Système])

  arc-through("c1.0%", (0, 1), "c2.0%", mark: (end: "straight"), name: "a1")
  arc-through("c2.50%", (0, -1), "c1.50%", mark: (end: "straight"), name: "a2")

  content("a1.chord-center", $Q$)
  content("a2.chord-center", $Q_th$)
})

On s'intéresse à la variation d'entropie du système $Delta S_th$.
Par la première identité thermodynamique:
$ dif U_th = T_th dif S_th - P_th dif V_th $
$ dif S_th = (dif U_th)/T_th - P_th/T_th V_th $
On suppose que le thermostat est très grand, afin de pouvoir encaisser n'importe quel transfert thermique (donc $V_th >> V$, donc $dif V_th = - dif V << V_th$).

On a:
$ dif S_th = (dif U_th)/(T_th) = (- delta Q)/(T_th) = dif S_th $
Comme le thermostat est super gros, on a $T_th approx "constant"$, donc:
$ Delta S_th = - Q/T_th $

== Second principe applique aux systèmes en contact avec un thermostat

On s'intéresse ici à $Q$ le transfert thermique reçu du système par la
thermostat.
Le système n'est pas calorifugé, mais si on s'intéresse à l'ensemble
du système et du thermostat, on peut considéré que cet ensemble est
calorifugé (puisque tout les échanges thermiques externes
se passent entre le système et le thermostat).

En nommant $S'$ l'entropie de cet ensemble, on a donc:
$ Delta S' = Delta S + Delta S_th $
Par le second principe, on a toujours $Delta S' >= 0$, donc:
$ Delta S >= - Delta S_th = Q/T_th $
La variation d'entropie peut donc être négative, selon les transferts
thermiques opérés avec l'extérieur.

$ Delta S' = Delta S + sum_i Delta S_(th,i) $
$ Delta S >= - sum_i Delta S_(th,i) $
$ Delta S >= sum_i Q_i/T_(th,i) $
Ou en différentielle:
$ dif S >= (delta Q)/T_(th,i) => dif S >= sum_i (delta Q_i)/T_(th,i) $

== Entropies créée et échangée

On définit l'*entropie créée* $S_"créée"$ et l'*entropie échangée* $S_"éch"$ par:
$ S_"éch" = sum_i Q_i/T_(th,i) "et" S_"créée" = Delta S - S_"éch" $

On a:
$ Delta S >= sum_i (Q_i)/T_(th,i) => Delta S - sum_i (Q_i)/T_(th,i) = S_"créée" >= 0 $

*L'entropie créée* est donc positive. C'est le second principe 
appliqué aux systèmes non calorifugés.

#caution[
  On utilise la même lettre et le même nom pour deux concepts différents:
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 5pt,
    [*L'entropie* est une fonction d'état. Elle ne dépend pas du chemin suivi. On a donc:
    - Forme intégrale: $Delta S$
    - Forme différentielle: $dif S$],
    [*L'entropie créée* et *échangée* sont analogues au travail.
    *Elles dépendent du chemin suivi*. 
    - Forme intégrale: $S$
    - Forme différentielle: $delta S$]
  )
]

== Bilans d'entropie

Pour déterminer si une transformation est réversible, on doit calculer
l'entropie créée. On fait un *bilan d'entropie*:
- On calcule le $dif S$ (ou $Delta S$) du système à l'aide des identités
  thermodynamiques
- On calcule l'entropie échangée avec les thermostats extérieurs:
  $ dif S_("ch",i) = (delta Q_i)/(T_(th,i)) "ou" S_("ch",i) = (Q_i)/(T_(th,i)) $
- On en déduit l'entropie créée:
  $ delta S_"créée" = dif S - sum_i delta S_("ch",i) "ou" S_"créée" = Delta S - sum_i S_("ch",i) $
  #tip[Un $S_"créée"$ négatif signifie que la transformation étudiée
  est *impossible* dans le sens étudié.]

= Quelques calculs d'entropie

== Cas d'un gaz parfait

On rappelle les identités thermodynamiques:
$ dif U = T dif S - P dif V $
$ dif H = T dif S + V dif P $

Par la première loi de joule :
$ dif U = C_V dif T = T dif S - P dif V $
$ => dif S = C_v (dif T)/T + P/T dif V \
=> dif S = C_V (dif T)/T + n R (dif V)/V
$
On intègre:
$ Delta S_(A->B) = C_V ln (T_B/T_A) + n R ln (V_B/V_A) $
Ainsi:
$ S = C_V ln T + n R ln V + "constante" $

Par la seconde loi de joule:
$ dif H = C_P dif T = T dif S + V dif P $
$ => dif S = C_P (dif T)/T + V/T dif P  \
=> dif S = C_P (dif T)/T + n R P/(dif P)
$
On intègre et de même:
$ S = C_P ln T + n R ln P + "constante" $

== Retour sur les lois de Laplace

On avait comme conditions pour les lois de Laplace:
- Le système est un gaz parfait
- La transformation étudiée est quasistatique
- La transformation étudiée est adiabatique
On rajoute l'hypothèse plus forte que la transformation est *réversible*.

On reprend la variation d'entropie:
$ Delta S = underbrace(S_"éch", = 0 \ "car adiabatique") + underbrace(S_"créée", = 0 \ "car réversible") $
En reprenant l'expression de la différence d'entropie calculée précedemment:
$ C_V ln T_2/T_1 + n R ln V_2/V_1 = 0 $
$ => C_V ln T + n R ln V = "constante" $
$ ln (T^(C_V) V^(n R)) = "constante" $
$ T^(C_V) V^(n R) = "constante" $
Comme $C_V = (n R)/(gamma - 1)$:
$ T^((n R)/(gamma - 1)) V^(n R) = "constante" => T V^(gamma - 1) = "constante" $

On retombe sur les lois de Laplace.
On peut faire la même chose en partant de l'entropie.

== Cas d'une phase condensée

Par la première identité thermodynamique:
$ dif U = T dif S - P dif V $
Or dans une phase condensée, le volume est constant, donc:
$ dif U = T dif S = C dif T $

Donc:
$ dif S = C (dif T)/T => Delta S = C ln T_B/T_A $

== Remarques sur ces calculs

On a surtout parlé de variations d'entropie.
On peut fixer l'origine de l'entropie avec le troisième principe
de la thermodynamique, mais cela n'est pas très utile, donc on 
ne le fait pas (être à une constante près suffit)

= Transitions de phase et 2#super[nd] principe

== Entropie massique - Théorème des moments

On suppose que le système étudié possède deux phases.
Par extensivité:
$ S = S_1 + S_2 $

$ m_"tot" s = m_1 s_1 + m_2 s_2 $
$ s = x_1 s_1 + x_2 s_2 "(avec" x_1 = m_1/m_"tot" "et" x_2 = m_2/m_"tot" ")" $
Or $x_1 + x_2 = 1$, donc:
$ s = x_1 s_1 + (1 - x_1) s_2
=> x_2 = (s - s_1)/(s_2 - s_1)
$

== Entropie de changement d'état

On considère $1 "kg"$ de corps pur, changeant d'un état $1$ 
d'entropie massique $s_1$ en un état $2$ d'entropie massique $s_2$.

On a donc $s_(1->2) (T) = s_2 (T) - s_1 (T)$ l'entropie de changement d'état.

#align(center)[#text(size: 13.2pt)[_*L'entropie de changement d'état, c'est la différence d'entropie
entre deux états.*_]]

On prend la deuxième identité thermodynamique:
$ dif H = T dif S + V dif P $
Un changement d'état se passe toujours à pression constante (équilibre entre deux phases), donc $dif P = 0$, donc:
$ dif H = T dif S $
Et *quand on est à température constante*:
$ Delta H = T Delta S $
$ m h_(1->2) = T (m s_(1->2)) $
$ s_(1->2) = (h_(1->2))/T $
#caution[
  L'entropie de changement d'état dépend de la température.
]

$ dif S = s_(1->2) dif m $
$ dif S = (h_(1->2))/T dif m $


