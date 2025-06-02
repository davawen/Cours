#import "@local/physique:0.1.0": *

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
$ dif S = C_P (dif T)/T - n R dif P $
$ Delta S = C_P ln (T_f/T_i) - n R ln P_f/P_i = C_P ln (T_f/T_i) $
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
quasistatique, l'air dans le diagramme $(P, V)$ correspond au travail des forces de pression du système ($delta W = - P_"ext" dif V approx - P dif V$).

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
Les pompes à chaleur et les réfrégirateurs permettent eux un
rendement supérieur à $1$ (le travail est utilisé pour transférer la chaleur)

On définit le rendement par:
$ r = "grandeur utile"/"grandeur coûteuse" $
Ici, la grandeur utile est $W$ et la grandeur coûteuse est $Q_C$.
Ici, le travail étant négatif et $Q_C$ étant positif, on pose:
$ r = - W/Q_C $

== Maximum théorique d'efficacité - Théorème de Carnot
