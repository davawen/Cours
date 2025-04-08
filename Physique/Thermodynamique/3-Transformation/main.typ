#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Transformation]

= Caractérisation des transformations

== Système et milieu extérieur

Il faut être capable de définir précisément le *système*,
l'ensemble des particules étudiées,
et le *milieu extérieur*, tout ce qui n'est pas dans le système.

Le système interagira souvent avec le milieu extérieur.

== Contraintes et évolution

Généralement, le milieu extérieur va imposer un certain nombre de 
*contraintes*: des paramètres qu'il impose au système
(par exemple, la pression du milieu extérieur).

Si l'on modifie les contraintes du milieu extérieur, le système
devra nécessairement s'adapter. On étudiera la transformation induite.

== Définition d'une transformation

On appelle une *tranformation thermodynamique* le passage
d'un état d'équilibre thermodynamique à un autre état
d'équilibre thermodynamique.

Le système passera par une succession d'états où il ne sera pas
à l'équilibre.

#figcan(caption: [Aux états $A'$ ou $B'$, le système n'est pas à l'équilibre], {
	import draw: *
	content((0, 0), [Variables d'états constantes (État $A$)])
	arrow((0, -0.5), (0, -2.5))
	content((0.5, -1.5), [Transformation \ thermodynamique], anchor: "west")
	content((0, -3), [Variables d'états constantes (État $B$)])

	point((0, -1), value: $A'$)
	point((0, -2), value: $B'$)
})


== Transformation élémentaire ou finie

On parle de *transformation élémentaire* si entre deux instants proches (séparés par un intervalle de temps arbitrairement petit $dif t$),
les variables d'états du système vont être très proche.
On peut la penser comme une transformation continue.

Sinon, on parle de *transformation finie* (transformation discontinue).

== Transformation quasi-statique

On parle de *transformation quasi-statique* si chaque
état par lequel on passe durant la transformation 
est "infiniment proche" d'un état d'équilibre. \
Une transformation quasi-statique est donc très lente par nature.

#note[
	La notion de pression dépend du fait que le 
	système est à l'équilibre.

	Pour pouvoir mettre une valeur sur la pression pendant une transformation,
	il faut que cette transformation soit quasi-statique.
]

== Différents types de transformation

On définit différents genre de transformation selon
les caractéristiques qu'elles vérifient:
- Une transformation est *monobare* si la pression extérieur $P_"ext"$
  reste constante pendant la transformation.
- Une transformation est *isobare* si elle est quasistatique et 
  que la pression $P$ à l'intérieur du système reste constante. \
  (On remarque qu'il faut que la transformation soit quasi-statique
  pour pouvoir parler de pression)
- Une transformation est *monotherme* si la température extérieur $T_"ext"$
  reste constante pendant la transformation.
- Une transformation est *isotherme* si elle est quasistatique et que la température $T$ du système reste constante.
- Une transformation est *isochore* si elle est quasistatique et que
  le volume $V$ du système reste constant.
- Une transformation est *polytropique d'ordre $k$* si elle est
  quasistatique et que $P V^k$ reste constant.
  
  Par exemple, pour $k = 1$, on a $P V$ constant, si on est face à un gaz parfait $n R T$ est constant,
  donc si on ajoute pas de matière, la température reste constante
  (et la transformation est isotherme).

#tip[
	- Une transformation est "mono$-X$" si le $X$ _extérieur_ reste constant pendant la transformation
	- Une transformation est "iso$-X$" si elle est quasistatique
	  et que le $X$ _intérieur_ reste constant.
]

= Formes et transfers d'énergie

== Analyse thermodynamique de la non conservation de l'énergie mécanique

On va s'intéresser de plus près aux frottements.
Lorsque des frottements s'appliquent, la conservation de 
l'énergie mécanique ne s'applique pas (puisque la force de frottement
n'est pas conservative). \
On va chercher à inclure cette forme d'énergie pour définir
une sorte d'énergie "totale" qui elle restera constante.

On observe une dissipation d'énergie sous forme de chaleur
(et donc une augmentation de la température)
là où il y a des frottements.

On inclus donc l'énergie perdu dans les frottements dans
*l'énergie interne* d'un système (on parle de transfert de l'énergie mécanique vers l'énergie interne), et on définit une nouvelle
valeur, *l'énergie totale* qui sera conservée.

== Formes d'énergies

On sépare donc:
- L'énergie mécanique $E_m = E_c + E_p$, qui décrit toutes les énergies
  *macroscopiques*
  (qui s'appliquent à un objet dans son ensemble, souvent à notre échelle).
- L'énergie interne $U = E_c_"micro" + E_(p_"micro")$
  qui décrit toutes les énergies *microscopiques*
  (somme d'énergies de particules individuelles).
  L'énergie interne sera toujours liée aux variables d'état du système.
  #note[
	Dans l'hypothèse des gaz parfaits
	on considère que $E_p_"micro" = 0$,
	mais on verra d'autres systèmes thermodynamiques qui eux possèdent
    une énergie potentielle (par exemple, le modèle de Van der Walls).
  ]

On nomme $E$ l'énergie totale, qui se conserve toujours et qui
décrit un système dans son ensemble:
$ E = E_m + U $

== Transfert d'énergie

On appelle transfert d'énergie le déplacement d'énergie
d'un endroit vers un autre ou la transformation d'une énergie en un autre type.

Un *travail* est un transfert d'énergie mécanique en énergie mécanique.

Il peut y avoir transfert d'énergie sans qu'il y ait de travail.
On parlera alors toujours de *transfert thermique*.

#note[
	Historiquement, on parlait de
	travail pour les transferts mécaniques,
	et de chaleur pour les transferts thermiques. \
	Puis, il fût décidé qu'il fallait banir le terme de chaleur,
	ce qui a causé la chûte de plus d'une copie de concours.

	Morale de Badel: c'est con, mais ne jamais dire chaleur.
]

#note[
	On différentie:
	- Un *transfert d'énergie*, qu'on notera avec un $delta$
	  (comme pour le travail élémentaire) (forme différentielle)
	- Une *variation d'énergie* avec un $dif$
	  (comme pour l'énergie cinétique) (différentielle totale exacte)
]

= Travail des forces de pression

== Quelle pression????????

Comme on l'a dit précédemment, on avait définit la pression à
l'équilibre.

Si on veut parler de travail des forces de pression, il faut qu'il y ait
travail, or si il y a travail il y a transfert d'énergie,
et on est plus à l'équilibre.

Pour parler de pression pendant un travail,
on utilisera la pression extérieur.

== Travail des forces de pression au cours d'une transformation

On prend un exemple assez simple:
#figcan({
	import draw: *

	line((0, 0), (0, 3))
	line((0, 0), (2, 0))
	line((2, 0), (2, 3))

	line((0, 2), (2, 2))
	line((1, 2), (1, 3))

	content((-1, 1), $P_"ext"$)
	content((0.5, 1), $P$)

	arrow((1.5, 2), (1.5, 1.5), tip: $arw(F)$, stroke: red)

	arrow((2.5, 0), (2.5, 3), tip: $arw(z)$)

	line((0, 3.4), (2, 3.4), mark: (end: "straight", start: "straight"))
	content((1, 3.7), $S$)
})

On appelle $arw(F)$ la force exercée par la pression extérieur sur le système (à travers le piston).

On pose le travail élémentaire de la force $arw(F)$:
$ delta W &= arw(F) dot dif arw(O M) \
&= - (P_"ext" S) dif z \
&= - P_"ext" (S dif z)
$

En prenant une situation un peu plus générale:

#figcan({
	import draw: *

	hobby((2.2, 1.2), (0, 2.2), (-1.2, -1.2), (-0.2, -1.2), (3.2, -0.2), close: true, name: "c2")
	hobby((2, 1), (0, 2), (-1, -1), (0, -1), (3, 0), close: true, name: "c")
	

	line("c.50%", "c.55%", stroke: (paint: red, thickness: 3pt))
	arrow("c.52%", (-0.7, 0), tip: $arw(F)$)
	content(("c.52%"), $dif S$, padding: 12pt, anchor: "north")

	content((2, 0), [Volume \ final])
	content((3, -1.6), [Volume initial])
})

On peut généraliser la relation vue précédemment:
$ delta W = - P_"ext" dif V $

Donc le travail au cours d'une transformation est:
$ W = - integral_"initial"^"final" P_"ext" dif V $

== Travail reçu ou fourni

Si le volume $V$ diminue pendant la transformation, 
$dif V$ le changement élémentaire du volume sera négatif,
et le travail élémentaire $delta W$ sera donc positif. \
Le travail sera donc *reçu* par le système.

À l'inverse, si le volume $V$ augment, le travail est fourni par le système.

#note[Convention: un travail positif est reçu et un travail négatif est fourni.]

#tip[
	Par exemple:
	Il faut fournir du travail pour gonfler un ballon
	(luter contre la pression extérieur), et le ballon
	se dégonfle "tout seul" par le travail de la pression extérieur.
]

== Travail des forces de pression pour des transformations quasistatiques

Dans une transformation quasistatique,
à chaque instant, on est infiniment proche d'un état d'équilibre
et donc notamment d'un équilibre mécanique.

Si on est à l'équilibre mécanique, alors il y a égalité
entre la pression extérieur et la pression intérieure.

Donc, en supposant $P_"ext" approx P$, on a:
$ delta W = - P_"ext" dif V approx - P dif V $

On a donc $W = - integral_"initial"^"final" P dif V$

C'est juste l'aire (opposée) sous la courbe du diagramme $(P,V)$!

#figcan({
	import draw: *

	arrow((0, 0), (0, 2), tip: $P$)
	arrow((0, 0), (4, 0), tip: $V$)

	line((0.5, 0.7), (1.8, 1.2), (2.5, 1.5), (3.7, 1.8), (3.7, 0), (0.5, 0), fill: gridpat, close: true)

	content((0.5, -0.2), [initial], anchor: "north")
	content((3.7, -0.2), [final], anchor: "north")
})


== Quelques calculs de travaux de forces de pression

Pour différentes types transformations:
- Isochore: le volume reste constant, donc $W = 0$ par définition
- Monobare: la pression extérieur reste constante, donc:
  $ W = - integral_"initial"^"final" P_"ext" dif V =  - P_"ext" Delta V  $
- Isobare: la transformation est quasistatique et la pression interne
  reste constante, donc:
  $ W = - integral_"initial"^"final" P_"ext" dif V approx
  - integral_"initial"^"final" P dif V  = - P Delta V  $
- Isotherme: (si on se place dans un gaz parfait)
  la transformation est quasistatique, et
  la température reste constante, donc si on ajoute pas de matière,
  $n R T$ reste constant:
  $ W = - integral_"initial"^"final" P_"ext" dif V
  &approx - integral_"initial"^"final" P dif V \
  &= - integral_"initial"^"final" (n R T)/V dif V \
  &= - n R T [ln V]_"initial"^"final" \
  &= n R T ln (V_"final"/V_"initial") 
$
- Polytropique d'ordre $k$: la transformation est quasistatique,
  et $P V^k$ est constant, donc:
  $ W = - integral_"init"^"final" P_"ext" dif V 
  &approx - integral_"init"^"final" P dif V \
  &= - integral_"init"^"final" P V^k 1/V^k dif V \
  &= - P V^k integral_"init"^"final" V^(-k) dif V \ $
  On pose $C = P V^k$, la valeur qui reste constante.
  On a donc $C = P_"init" V_"init"^k = P_"fin" V_"fin"^k$
  #grid(
	columns: (1fr, 1fr),
	align: center,
	[Si $k = 1$
	$ W &= - C [ln (V)]_"init"^"fin" \
    &= - C ln (V_"fin"/V_"init") \
	&= C ln (V_"init"/V_"fin") \
	&= P V ln (V_"init"/V_"fin")
	$
    ],
	[Si $k > 1$
	$ W &= - C [1/(k-1) V^(1-k)]_"init"^"fin" \
	&= - C/(k - 1) times (1/V_"fin"^(k-1) - 1/V_"init"^(k-1)) \
	&= 1/(k-1) times (C/V_"init"^(k-1) - C/V_"fin"^(k-1)) \
	&= 1/(k-1) times ((P_"init" V_"init"^k)/V_"init"^(k-1) - (P_"fin" V_"fin"^k)/V_"fin"^(k-1)) \
	&= (P_"init" V_"init" - P_"fin" V_"fin")/(k-1)
	$
    ]
)
