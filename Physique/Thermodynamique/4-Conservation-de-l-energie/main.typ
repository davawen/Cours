#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Premier principe de la thermodynamique -
Énergie interne et conservation de l'énergie]

= Premier principe de la thermodynamique

== Énoncé

#principe[
	À tout système thermodynamique, on associe une fonction d'état appelée
	énergie interne, notée $U$ et vérifiant:
	+ $U$ est une _grandeur extensive_
	+ La variation d'énergie totale dans un système
	  est la somme des échanges énergétiques:
	  $ Delta (U + E_m) = Q + W $
]

== Forme intégrale ou différentielle

L'énoncé au-dessus est la forme intégrale du premier principe:
on étudie la différence entre un état $A$ et un état $B$:
$ Delta (U + E_m) = Q + W \
<=> (U + E_m) (B) - (U + E_m) (A) = Q + W \
<=> U(B) + E_m(B) - (U(A) + E_m(A)) = Q + W 
$

Il existe aussi une version différentielle qui observe
les changements infinitésimaux d'énergie:
$ d (U + E_m) = delta Q + delta W $

#note[On étend juste les définitions qu'on a vues avec l'énergie mécanique
à l'énergie totale d'un système.]

#note[
	Comme en mécanique,
	la variation d'énergie totale "ne dépend pas du chemin suivi",
	mais les transferts d'énergie en eux-mêmes si.
]

== Interprétation

Premièrement, l'énergie interne est une fonction d'état,
et ne dépend donc que de l'état à un moment donné,
et pas des transformations qui ont été appliquées jusqu'à ce moment.
(C'est la notion "d'indépendance du chemin suivi")

#tip[
	Peut être pratique si:
	- On étudie une transformation qui fait passer d'un état $A$
	  à un état $B$
	- Le calcul de la variation de cette transformation est très compliqué 
	- Une autre transformation nous permet d'arriver à l'état $B$ et
	  est plus simple à calculer
	On peut alors calculer la variation de cette transformation pour
	connaître la valeur de l'énergie interne en $B$.
]

Deuxièmement, l'énergie interne est extensive.
On peut donc découper un système en sous-systèmes,
résoudre l'énergie interne pour chacun des sous-systèmes,
puis faire la somme pour trouver l'énergie interne totale,

Troisièmement, ce principe traduit la *conservation de l'énergie*.
À condition d'être un système fermé (de ne rien échanger avec l'extérieur),
l'énergie totale reste constante.

== Quelques cas particuliers

=== Système isolé

Un système est isolé s'il n'y a aucun transfert énergétique.

$ cases(Q = 0, W = 0) => Delta (E_m + Q) = 0 $

=== Systèmes à énergie mécanique constante

La majorité des systèmes rencontrés seront dans ce cas.
On aura alors:
$ Delta U = W + Q $

On différencie encore deux cas particuliers.
- Dans le cas où $W = 0$,
  la majorité du temps, le seul travail
  présent sera celui des forces de pression, et
  toutes les transformations seront alors _isochores_.
  On aura alors:
  $ Delta U = Q $
- Dans le cas où $Q = 0$, toutes les transformations seront aediabatiques, donc:
  $ Delta U = W $

= Énergie interne

== Expression générale

On a besoin de deux variables intensives pour décrire l'état
d'un système.

L'énergie interne $U$ étant une fonction d'état, elle peut obligatoirement
s'exprimer à l'aide des deux variables intensives choisies.

Dans le cas de l'énergie interne, on choisit d'utiliser le volume $V$ et la
température $T$:
$ U(V,T) $

#note[
On comprend la logique:
la température est liée aux transferts thermiques,
et on a exprimé le travail des forces de pression avec un $dif V$.

Une variation de volume impliquera une variation d'énergie interne.
]

De ce fait, en dérivant $U$, on va avoir:
$ dif U = ((diff U)/(diff V))_T dif V + ((diff U)/(diff T))_V dif T $

== Gaz parfait - $1^"ère"$ loi de Joule

Dans un gaz parfait _monoatomique_, on avait posé l'énergie interne:
$ U = (3/2) n R T $
L'énergie interne ne dépend alors que de la température.

Cela correspond à la première loi de Joule.
On dit qu'un système vérifie la première loi de Joule si son
énergie interne ne dépend *que* de la température.

Dans un gaz parfait non-monoatomique, on avait posé:
$ U = C_V T "avec" C_V >= 3/2 n R $

Énergie microscopique :
- Liée uniquement à l'agitation des molécules
- donc uniquement à la température
- on néglige les intéractions entre les particules

== Capacité thermique à volume constant $C_V$

Elle peut être définie pour n'importe quel système

#def[
$ C_V = ((diff U)/(diff T))_V $
]

$ "On a alors : " dif U = ((diff U)/(diff V))_T dif V + C_V dif T $

Si on se place dans le cas particulier d'un gaz parfait (monoatomique),
on a alors:
$ U = 3/2 n R T  $
On calcule la dérivée partielle de la température par-rapport au volume:
$ ((diff U)/(diff T))_V = 3/2 n R ==> C_V = 3/2 n R $

Dans le cas d'un gaz parfait non-monoatomique:
$ U = C_V T => C_V >= 3/2 n R $

Dans l'hypothèse d'un gaz parfait qui ne dépend que de la température?
$ dif U = C_V dif T => U(T) = ((diff U)/(diff V))_T = 0  $

== Cas des gaz réels - Modèle de Van der Waals

Dans un autre modèle, on utilise l'expression correspondante.
On se place dans le modèle de Van der Waals pour un gaz monoatomique: 
$
U =  3/2 n R T - (n² a)/V\
"(On rappelle le modèle de Van der Waals)"\ (P+(n^2 a)/V^2)(V - n b) = n R T\
dif U = 3/2 n R dif T +
underbrace((n^2 a)/V^2 dif V, "vient du terme: " \ ((diff U)/(diff V))_T)
$
On constate que l'énergie interne dans le modèle
de Van der Waals ne dépend que d'un des paramètres en plus du modèle:
la pression moléculaire.

== Énergie interne des phases condensées - Capacité thermique

Pour modéliser les phases condensées, on utilise le modèle des fluides incompressibles:
$ "Comme fluide incompressible : " V = c^("te") => dif V = 0 $

L'énergie interne est donc proportionnelle à la température:
$ U = C T $

= Transformations monobare ou isobare - Enthalpie

Dans le cas des transformations monobares et isobares, on définira une nouvelle fonction d'état : l'enthalpie.

== Transfert thermique et transformation monobare ou isobare

Il faudrait avoir un moyen de calculer les transferts thermiques de manière bien (biennement: de manière bonne et bien).

Une manière de calculer les transferts thermiques est d'utiliser le 
premier principe: on sait calculer la différence d'énergie interne $Delta U$,
et la différence de travail $Delta W$, et on a alors:
$ Delta Q = Delta U - Delta W $

#note[On devra alors calculer le travail des forces de pression.
Il serait pratique de pouvoir calculer les transferts thermiques directement.
]

Dans le cas d'une transformation isochore : $W = 0$
On a :
$ Delta U = cancel(W) + Q = Q $ // faut barer le w
Dans le cas d'une transformation monobare : $P_("ext") = c^("te")$

On a $
P_i = P_("ext") "et" P_f = P_("ext")\
W = -P_("ext")(V_f - V_i)\
= -P_f V_f + P_i V_i \
= -Delta (P V)\
"Par le premier principe :" Delta U = W + Q \
Delta U = -Delta(P V) + Q\
==> Q = Delta (U + P V)
$

Cas de la transformation isobare:
on sait que la transformation est quasistatique, et
que la pression $P$ du système reste constante. Donc:
$ delta W = - P_"ext" dif V &approx - P dif V $

Comme $P$ est constante, on peut la rentrer dans la différentielle:
$
delta W = - dif (P V)\
dif U = delta W + delta Q = - dif (P V) + delta Q\
delta Q = dif U + dif (P V) = dif (U + P V)
$

#tip[
  Le raisonnement pour les deux transformations est plutôt proche,
  mais dans le cas d'une transformation isobare, l'égalité
  est vraie _à chaque instant_ (et en différentielle),
  alors que l'égalité est intégrale pour une transformation monobare (Ça marche que pour les $Delta$)
]

== Enthalpie

Définition de l'enthalpie $H$ (en joules):
$ H = U + P V $

L'enthalpie s'exprime uniquement avec des variables d'état. C'est donc une fonction d'état.

Ainsi, comme pour l'énergie interne:
- Les variations d'enthalpie ne dépendent
  pas du chemin suivi. (On utilise donc un $Delta$ et un $dif$).
- $H$ est une grandeur extensive car somme de $U$  et de $P V$ (grandeurs extensives) (C'est cool pour diviser les systèmes)

== Cas du gaz parfait

Il vérifie la première loi de Joule, donc l'énergie interne de dépend que  de la température. 

On a : $P V = n R T = f(T)$
L'enthalpie ne dépend donc que de la température: c'est la *seconde loi de Joule*.

== Capacité thermique à pression constante

On repart de l'expression de $H$ qu'on différencie:
$
H = U + P V\
dif H = dif U + P dif V + V dif P\
= ((diff U) / (diff V))_T dif V + ((diff U)/(diff T))_V dif T + P dif V + V dif P
$

On regarde ce qui se passe dans le cas particulier où
$dif U = delta Q + delta W = delta Q - P dif V$

De plus, si on est dans une transformation quasi-statique : $ delta W = - P_("ext") dif V approx - P dif V $

Comme $ dif U = ((diff U) / (diff T))_ V dif T + ((diff U)/(diff V ))_T dif V 
= delta Q - P dif V
$

On peut faire disparaître la dépendance en $V$ de $H$ en remplaçant le volume par la pression:
$ H(T,P) $

Ce qui nous permet d'écrire:
$ dif H = ((diff H)/(diff T))_P dif T + ((diff H)/(diff P))_T dif P $
On définit la *capacité thermique à pression constante*:
$ C_p =((diff H)/(diff T))_P $

== Remarque sur les capacités thermiques

On définit les capacités thermiques par des dérivés de grandeurs
extensives:
$ C_V = ((diff U)/(diff T))_V  "et" C_P = ((diff H)/(diff T))_P $
//rawr
Ce sont donc des grandeurs extensives aussi.
On peut dès lors en déduire des grandeurs intensives:
Les *capacités thermiques massiques* et les *capacités thermiques molaires*:
$ "Capacité thermique massique:"\ c_V = C_V / m "et" c_p = C_p / m $
$ "Capacité thermique molaire:"\ c_(V,m) = C_V / n "et" c_(p,m) = C_p / n $ 

#note[
Il n'y a pas de convention sur les notations des capacités thermiques massiques et molaires. On a ici mis un $m$ pour indiquer la capacité thermique molaire, mais ce ne sera généralement pas le cas.
Faire attention aux notations de l'énoncé et aux unités ! (homogène donc forcément vrai $checkmark$... ou pas)
]

== Fluides réels

Super paragraphe très informatif (il y aura des fluides réels au DS)

== Cas des phases condensées

$ H = U + P  V $
Comme phase condensée, $V = c^"te"$ car fluide incompressible.\
Loi empirique: $ H &approx U $
donc
$ dif H &= dif U $
La magie des approximations nous permet de dire que le produit $P V$ est toujours négligeable devant $U$. En effet, l'expérience montre que c'est toujours le cas, donc d'après l'absence de contre-exemple CQFD $qed$

"prépondérant" vous voyez c'est un mot que j'utilise beaucoup, on a donc
$
((diff H)/(diff T)) &approx ((diff U)/(diff T))\
C_P &approx C_V => C
$ 

= Premier principe et gaz parfait
== Relation de Mayer

#tip[
Il faut connaître les relations et savoir refaire les démonstration ici !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! (Elles seront souvent demandées en début d'exo)
]

On part de:
$ H = U + P V $
Or, dans un gaz parfait, $P V = n R T$, donc: $
H &= U + n R T\
H(T) &= U(T) + n R T\
dif H &= dif U + n R dif T
$
Par la première loi de Joule: $
C_P dif T = C_V dif T + n R dif T\
dif T ( C_p - C_v - n R) = 0
$
Cette relation est valide peut importe la variation $dif T$ (qui est non nulle).
On en déduit la *relation de Meyer*, qui lie les capacités thermiques:
$ C_P - C_V = n R  $

On peut l'exprimer avec les capacités thermiques massiques:
$ c_p - c_V = (n R)/m = R/M "avec M la masse molaire du système." $
Ou molaires:
$ c_(p,m) - c_(V,m) = R $

== Coefficient $gamma$ - Expression des capacités thermiques

Les capacités massiques, qu'elles soient à pression constante
ou à volume constant, ne sont pas indépendantes
(on peut en exprimer une en fonction de l'autre)

On définit $gamma$ le rapport entre les deux capacités thermiques:
$ gamma = C_P/C_V = c_p/c_V = c_(p,m)/(c_(p,V))  $

En utilisant la relation de Meyer: $
C_p - C_v = n R\
gamma = C_p / C_v ==> C_p = gamma C_v\
(gamma - 1)C_v = n R\
==> C_V = (n R)/(gamma - 1) "ou" C_p = (gamma n R)/(gamma - 1)
$
On est bien d'accord,
On en déduit également:$
C_(v,m) = R/(gamma - 1)\
C_p,m = (gamma R)/(gamma - 1)\
c_v = R/(M(gamma - 1))\
c_p = (gamma R)/(M(gamma - 1))
$

#tip[
  Vu qu'elles sont liées par les relations de Meyer,
  $gamma$ suffit à caractériser les capacités thermiques.
  Souvent, on nous donnera seulement la valeur de $gamma$ d'un gaz parfait. 
]

== Cas d'une transformation adiabatique

Dans le cas d'une transformation adiabatique, on a par définition:
$ Q = 0 $ 
ça c'est la définition d'une transformation adiabatique.

En reportant dans l'expression du premier principe:
$ Delta U = W + Q ==> Delta U = W $

Dans le cas du gaz parfait:$
Delta U = C_V Delta T
= (n R)/(gamma - 1) Delta T
$

Or, $ n R Delta T = Delta n R T = Delta P V "car gaz parfait" $
donc $ Delta U = (Delta P V)/(gamma - 1) $

#todo[À réecrire pour cause de _caca_ Badel:

Or, quand on avait calculé les travaux des forces de pression pour une transformation polytropique d'ordre $k$, on avait trouvé que:
$ W = Delta(P V)/(k - 1)  $

// Ouais la manière dont elle a fait son raisonnement logique n'a aucun sens
// Mais oui, c'est clair !
// TODO -> A réécrire je pense
Expression de $W$ pour une transformation polytropique d'ordre $gamma$
(conditions des lois de Laplace) Soit une transformation
- adiabatique
- quasistatique
- impliquant un gaz parfait
- polytropique d'ordre $gamma ==> P V^gamma = c^("te")$
]

Cette relation nous permet d'éliminer différentes expressions comme constantes.
On part de $P V^gamma "constante"$.
Par loi des gaz parfaits,$
P V = n R T\
==> V = (n R T)/P "et" P = (n R T)/V
$
On substitue (on ignore $n R$ qui est constant):$
P T^gamma/P^gamma = P^(1-gamma) T^gamma "constante et" T/V V^gamma = T V^(gamma-1) "constante"\
C_V dif t = -P dif V
$
Comme gaz parfait: $ P = (n R T)/V $
donc $
C_V (dif T) / T = -n R (dif V)/V\
C_V ln t = - n R ln V + "constante"
$
Qu'on peut écrire sous la forme:$
ln T^(C_V) V^(n R) = "constante"\
T^((n R)/(gamma - 1)) V^(n R) = "constante"
$
d'où $ T V^(gamma - 1) = "constante" $

#warn[
  Ces relations nécessitent de nombreuses hypothèses:
  - La transformation est adiabatique
  - La transformation est quasistatique
  - Le système étudié est un gaz parfait (on oublie les fluides incompressibles)
]

#resultb[Les 3 lois de Laplace en résumé
$
P V^gamma = c^"te"\
P^(1-gamma) T^gamma = c^"te" \
T V^(gamma-1) = c^"te"
$]

== Comparaison des pentes des adiabatiques et isothermes dans le diagramme de Watt

On se place le diagramme de Watt: $P = f(V)$

Dans le cadre d'une transformation isotherme et d'un gaz parfait:
$P V = n R T = c^("te")$

donc $P = K/V$ avec $K$ une constante

En traçant l'isotherme en fonction du volume d'une
transformation adiabatique (en rouge) et d'une transformation isotherme (en bleu),
on obtient des courbes de la forme:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $V$)
  arrow((0, 0), (0, 4), tip: $P$)

  intersections("i", {
    bezier-through((0.5, 4), (2, 1.5), (3.5, 0.5), stroke: red)
    bezier-through((0.3, 3.5), (2, 1.5), (3.5, 1.1), stroke: blue)
  })
  point("i.0", name: "p")
  line("p", ("p", "|-", (0, 0)), stroke: (dash: "dotted"))

  content((3.8, 0.5), $Q = 0$, anchor: "west")
  content((3.8, 1.2), $T = c^"te"$, anchor: "west")
})

On est adiabatique quasi-statique et gaz parfait, les lois de _*John Laplace*_ s'appliquent.
$ P = K'/(V^gamma) $
La question est est-ce que ma courbe est moins pentue ou plus pentue ?

On calcule la dérivée et on pourra ainsi affecter la courbe $Q = 0$ et $T = c^("te")$

#pagebreak()

- Isotherme:
$ P = K V ^(-1) \ (dif P)/(dif V) = -K V^(-2) $
- Adiabatique quasistatique:
$
P &= K ' V^(-gamma)\
(dif P)/(dif V) &= -gamma K' V^(-gamma-1)\
&= -gamma (K' V^(-gamma)) V^(-1)\
&= -gamma P V ^(-1)
$

Comparons les deux courbes:
Si on fait le rapport de la pente de la transformation adiabatique sur la pente
de la transformation isotherme:$
((dif P)/(dif V))_"adia"/((dif P)/(dif V))_"iso"
= (-gamma P V^(gamma - 1))/(-P V^(gamma - 1))
= gamma > 1
$

Donc la courbe de la transformation adiabatique est plus pentue que celle
de la transformation isotherme.\
On est bien d'accord que là on va commencer  être dans la situation où on va tracer des diagrammes, donnez un minimum de justification sur les courbes que vous allez tracer.\
Pas besoin de faire un roman mais dire que la pression est constante et que la droite est horizontale fin il y a besoin d'une demi ligne pour dire ça.\
Encore une fois pas la peine d'en écrire des tartines mais être concis et précis.

$Gamma ' alpha iota quad pi epsilon rho delta upsilon$


Et en plus j'ai faim.\
A Elbereth Gilthoniel,\
Silivren penna miriel,\
O menel aglar elennath.\
Na-chaered palan diriel,\
O galadhremin elorath.\
Fanuilos le linnathon,\
Nef aear, si nef aearon.\

= Calculs de transferts thermiques

== Principe

On a par le premier principe: $ Delta U = Q + W $

Dans le cas d'une transformation isotrope, on peut aussi utiliser que:
$ Delta H = Q $

Bien évidemment, l'objectif c'est de déterminer le transfert thermique $Q$

On calcule $Delta U$ à partir de l'expression interne.

En général, on sera dans une des deux situation suivantes:
- Cas d'un gaz parfait: $ U = C_V T $
  On peut alors calculer la variation d'énergie interne:
  $ Delta U = C_V Delta T $
- Cas avec un solide ou d'un liquide :  $ U = C T $ 
  
On se ramène au calcul du travail $W$ des forces de pression.

La question est comment on interprète les choses.

$ Q = Delta U - W  $

À condition de travailler à pression constante : $ Q = Delta H $
On tient compte du travail de la pression dans la variation
d'enthalpie.

== Exemple

#align(center, image("image0.gif", width: 50%))

On prend une mole de gaz parfait monoatomique décrivant le cycle suivant:
$ V_A = 22.4 "L", P_A = 1 "atm", P_B = 5 "atm", V_D = 44.8 "L" $

On suppose toute les transformations quasistatiques.

#figcan({
  import draw: *

  arrow((0, 0), (4, 0), pad: 0.5, tip: $V "(L)"$)
  arrow((0, 0), (0, 4), tip: $P "(atm)"$)

  point((1.5, 1), value: $A$, name: "a")
  point((1.5, 3), value: $B$, name: "b")
  point((3, 3), value: $C$, name: "c")
  point((3, 1), value: $D$, name: "d")

  line("a", "b", "c", "d", close: true)

  set-style(stroke: (dash: "dotted"))
  line("a", ("a", "|-", (0,  0)))
  line("d", ("d", "|-", (0,  0)))
  
  line("a", ("a", "-|", (0,  0)))
  line("b", ("b", "-|", (0,  0)))

  content(("a", "|-", (0, 0)), $22.4$, anchor: "north", padding: 0.2)
  content(("d", "|-", (0, 0)), $44.8$, anchor: "north", padding: 0.2)
  
  content(("a", "-|", (0, 0)), $1.0$, anchor: "east", padding: 0.2)
  content(("b", "-|", (0, 0)), $5.0$, anchor: "east", padding: 0.2)
})

On est face à un gaz parfaite monoatomique, donc $C_V = 3/2 n R = 3/2 R$

=== Nature des transformations

- $A -> B$ est à volume constant, donc isochore
- $B -> C$ est à pression constante, donc isobare
- $C -> D$ est à volume constant, donc isochore
- $D -> A$ est à pression constant, donc isobare

=== Températures aux différents points du cycle

On applique la loi des gaz parfaits:
$P V = n R T <=> T = (P V)/(n R)$

#align(center, table(
  columns: 4,
  [Point], $P$, $V$, $T$,
  [A], $1$, $22.4$, $273$,
  [B], $5$, $22.4$, $1366$,
  [C], $5$, $44.8$, $273$,
  [D], $1$, $44.8$, $546$,
))

=== Travail et quantitée de chaleur reçue

Les transformations isochores ont un travail nul.
Pour les deux autres, elles sont isobares, donc:
$ W_(D -> A) = P_(A,D) (V_D - V_A)  $
$ W_(B -> C) = -P_(B,C) (V_C - V_B)  $
$ W = W_(B->C) + W_(D->A) = - 9 "kJ"  $

On a:
$ Q = Delta U - W  $

Or on remarque que les transformation suivent un cycle:
l'énergie interne reste donc constante. Donc $Delta U = 0$.
On en déduit:
$ Q = - W = 9 "kJ" $

=== Variation d'énergie interne la plus grande au cours du cycle

On trace l'isotherme des transformation aux différentes température:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), pad: 0.5, tip: $V "(L)"$)
  arrow((0, 0), (0, 4), tip: $P "(atm)"$)

  point((1.5, 1), value: $A$, name: "a")
  point((1.5, 3), value: $B$, name: "b")
  point((3, 3), value: $C$, name: "c")
  point((3, 1), value: $D$, name: "d")

  line("a", "b", "c", "d", close: true)

  set-style(stroke: (dash: "dotted"))

  bezier-through((0, 4), (1.5, 1), (3, 0))
  translate((1, 0))
  bezier-through((0, 4), (1.5, 1), (3, 0))
  translate((1, 0))
  bezier-through((0, 4), (1.5, 1), (3, 0))
  translate((1, 0))
  bezier-through((0, 4), (1.5, 1), (3, 0))
})

On a:
$ Delta U_"max" = C_V (T_max - T_min) = C_V (T_C - T_A) = 30.6 "kJ" $

=== Échange de quantités de chaleurs

$ 
Delta U_i = phi_i + W_i $
$
Q_i &= Delta U_i - W_i \
&= C_V (T_("if") T_i) - W_i $
$
Q_(A -> B) = C_V (T_B - T_A) - W_(A B) = 13.7 "kJ" \
Q_(B -> C) = C_V (T_C - T_B) - W_(B C) \
= C_B (T_C - T_B) + P_B (V_C - V_B) = 28.3 "kJ" \
Q_(B->C) = C_P (T_C - T_B) = Delta H_( B C) \
Q_(C->D) = C_V (T_D - T_C) - W_(C D) = -27.3 "kJ" \
Q_(D->A) = C_V (T_A - T_D) - W_(D A) = C_P (T_D - T_A) = -5.7 "kJ"
$


= Calorimétrie

== Définition

On appelle *calorimétrie* la mesure et le calcul de transferts
thermiques en l'absence de travail extérieur.

C'est l'aspect expérimental lié à ce qui a été fait auparavant. 

#align(center, text(size: 20pt,
[#smallcaps[Joseph Perdu]\
$Iota omicron sigma epsilon phi quad Pi epsilon rho delta upsilon$ \
#smallcaps[ジェペるづ！]
]
))

== Calorimètres

L'objectif encore une fois c'est de limiter au maximum les échanges avec l'extérieur. (Transformation adiabatiques)

== Méthode des mélanges

On mélange de l'eau froide et de l'eau chaude (à deux températures différentes). On met tout ça dans le calorimètre et on attend que ça soit à l'équilibre.

On va considérer le système à pression constante et
à phase condensée,
et on considère $c_e$ la capacité thermique massique de l'eau.

On a donc $Delta H = Q$.

Les parois du système sont calorifugés,
il n'y a donc pas d'échange avec le milieu extérieur et
$Q = 0$. 

On découpe le système en deux sous-systèmes:
les masses d'eau $m_1$ et $m_2$, à température initiale respective
$T_1$ et $T_2$.

Par extensivité, on a:
$ Delta H &= Delta H_1 + Delta H_2 \
&= m_1 c_e (T_"final" - T_1) + m_2 c_e (T_"final" - T_2) \
&= 0 "(car parois calorifugées)"
$
Ainsi: $ T_f = (m_1 T_1 + m_2 T_ 2)/ (m_1 + m_2) $

Si on tient compte de la capacité du calorimètre, notre système est composé des masses $m_1$ et $m_2$ ainsi que le calorimètre. L'entièreté du système est calorifugé.

Toujours par extensivité:
$ Delta H = Delta H_1 + Delta H_2 + Delta H_"cal" $

La question est: "quelle température va-t-on utiliser pour le calorimètre?"

En général, on commence par mettre la première masse d'eau dans le calorimètre.
On va donc attendre que $m_1$ et le calorimètre soient en équilibre thermique.

On mesure alors la température pour connaître la température $T_1$.

On fait ensuite l'ajout de la masse $m_2$ à la température $T_2$.

La température $T_2$ sera elle mesurée à l'extérieur du calorimètre.

$ Delta H = m_1 c_e (T_f - T_1) + C_"cal" (T_f - T_1) + m_2 c_2 (T_f - T_2) $

Ici, expérimentalement, on mesure $m_1$, $m_2$, $T_1$ et $T_2$.
La seule chose qu'on ne connaît pas, c'est la capacité du calorimètre,
qu'on peut donc obtenir:
$ C_"cal" = - c_e (m_1 (T_F - T_1) + m_2 (T_f - T_2))/(T_f - T_1) $

En général, plutôt que de calculer la capacité du calorimètre,
on utilise plutôt le rapport $alpha = C_"cal"/c_e$

Homogénéité: $alpha$ est une masse.
On appelle $alpha$ la valeur en eau du calorimètre.

$alpha$ représente la masse d'eau qui aurait le même comportement vis-à-vis des échanges thermiques que le calorimètre.

==  Méthode électrique

Il y a aussi la méthode électrique où on plonge un résistance thermique dans l'eau et donc par effet joule de la puissance est délivrée dans l'eau.

Le système n'est pas calorifugé dans le sens qu'on rajoute de
l'énergie avec une résistance thermique, il y a donc un échange
thermique avec l'environnement extérieur et la transformation
n'est pas adiabatique.

Au bilan, comme $W$ et $Q$ jouent le même rôle, le résultat est le même. (par rapport à _quoi?_)

On met une masse $m$ d'eau dans le calorimètre. \
On tient compte de la valeur en eau du calorimètre $alpha$.

On rajoute une résistance chauffante qu'on décrit par un transfert thermique
$ Q = underbrace(R I^2, "Puissance thermique " \ "dégagée par"\ " effet Joule") Delta t $

#tip[
On a:
$ R I^2 = U^2/R = U I  $
Pour connaître la puissance ajoutée dans le calorimètre,
il suffit de mesurer
l'intensité et la tension parcourant la résistance.
]


$ Delta H = Q \ Delta H = Delta H_"eau" + Delta H_"cal" = (m + alpha) c_"eau" (T_f - T_i) $

Ainsi : 
$ (m + alpha) c_"eau" (T_f - T_i) = U I Delta t  $
$ T_f = T_i + (U I Delta t)/((m + alpha) c_"eau")
T(t) = T_i + (U I t)/((m + alpha) c_"eau")
$

L'intérêt de cette méthode, est qu'elle permet de tracer
la courbe de la température en fonction du temps.
On est sensé obtenir une droite.

Il suffit de déterminer la pente de la droite pour obtenir la valeur de la capacité thermique de l'eau.


= Transitions de phase et premier principe

== Généralisation du théorème des moments

Pour le premier principe, on a introduit deux grandeurs
extensives qui sont:
- L'énergie interne $U$
- L'enthalpie $H$

On peut genéraliser le théorème des moments à toute
grandeur extensive:

Si un système est composé de deux phases, 
respectivement de masse $m_1$ et $m_2$, d'énergie interne $U_1$ et $U_2$ et d'enthalpie $H_1$ et $H_2$.
On a:
$ U = U_1 + U_2 "et" H = H_1 + H_2 $

$ U = (m_1 + m_2) u = m_1 u_1 + m_2 u_2 $
En divisant par $m_1 + m_2$:
$ u = underbrace(m_1/(m_1 + m_2), "titre massique") u_1 + (m_2)/(m_1 + m_2) u_2 = x_1 u_1 + x_2 u_2 $


Or, on a : $ x_1 + x_2 = 1 => x_2 = 1 - x_1 $
Donc:
$ u = x_1 u_1 + (1 - x_1) u_2 $
Ainsi:
#resultb[$ x_1 = (u - u_1)/(u_1 - u_2) $]

On peut faire exactement la même chose sur $H$:
#resultb[$ x_1 = (h - h_1)/(h_1 - h_2)  $]


== Enthalpie ou chaleur latente de changement d'état
J'ai perdu

Moi aussi

Le changement d'état s'opère toujours à température et
à pression constante.

Comme on travaille à pression constante, la grandeur énergétique
appropriée est l'enthalpie.

On définit l'*enthalpie de changement de phase* comme étant
l'énergie nécessaire pour effectuer le changement de phase
de 1kg du corps étudié.

#tip[
C'est une grandeur extensive.
#image("thumbsup.png", width: 30%)
]

Comme $H$ dépend de la température et de la pression

$dif H = C_p dif T\ dif H = h_(1->2) dif m$


los dieciocho mejores peces : 
https://www.aquaportail.com/especies/ficha/pez/3923/scomber-japonicus

Bien évidemment, $H_(1->2)$ est relié au $H_1$ et au $H_2$
utilise dans le théorème des moments.

Si on passe du solide au liquide, on passe du solide saturant au 
liquide saturant, et on passe de l'enthalpie du solide
à l'enthalpie du liquide.

