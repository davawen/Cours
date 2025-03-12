#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Description thermodynamique - Etats de la matière]

= Description Thermodynamique

== Historique
(Voir poly)

== Pourquoi la thermodynamique?
Si on veut observer l'évolution microscopique
d'un système, il faudrait prendre en compte chaque particule.

Étudier chaque particule devient très rapidement impossible,
même numériquement.

Plutôt que regarder particule par particule, l'approche thermodynamique
est une description macroscopique du système.
On considère des nouvelles variables qui caractérisent le
système entier et qui décrivent son évolution,
en utilisant l'outil statistique.

== Équilibre thermodynamique

#def[Équilibre thermodynamique]:
un système où les variables macroscopique restent constantes.
On autorise un mouvement désordonné des particules elles même.
(Il n'y a pas de mouvement d'ensemble).

== Variables d'état

Une variable d'état est une grandeur qui décrit le
système à l'échelle macroscopique

Par exemple:
- La température (agitation mécanique des particules)
- La pression 
- Le volume
- La quantité de matière
- La masse
- La charge

On parle de variable d'état *extensive* si elle est
proportionelle à la quantité de matière dans le système.
Sinon, on parle de variable *intensive*.

#tip[On peut souvent parler de valeur extensive $V$ si en coupant 
un système $Sigma$ en sous-systèmes $(Sigma_n)$, on peut obtenir la 
valeur de $V$ en
additionnant les valeurs $(V_n)$]

#pagebreak()
On a deux catégories de variables intensives:
- Les variables intensives intrinsèques
  - La température, la pression
- Les variables intensives fabriquées
  - La masse volumique ($rho = m/V$)
  On peut construire une grandeur intensive en prenant
  deux grandeurs extensives au pif et en faisant le rapport des deux.
  C'est une grandeur intensive fabriquées.

#tip[La propriété d'extensif ou d'intrinsèque doit correspondre 
des deux cotés d'une égalité.]

== Phase

Une phase est un système thermodynamique ayant les mêmes
caractéristiques qualitatives partout
des caractéristique quantitatives
décritent par des fonctions continues de l'espace.

Une phase est dîte homogène si il n'y a pas
de changements brusques de paramètres intensifs.
Sinon, le système est hétérogène, et
on observera alors une interface entre les deux phases
d'un système.

== Équation d'état

On parle d'équation d'état
toute équation qui va lier entre elles plusieurs
variables d'état.

Par exemple,
$ P V = n R T $

Les équations d'état réduisent le nombre de variables
indépendantes qui décrivent le système.

== Variables indépendantes - Variance

Les variables indépendantes sont les variables nécessaires
et suffisantes pour décrire l'état d'un système.

#def[Variance]:
nombre de paramètres *intensifs* nécessaire pour décrire l'état du
système.

Par exemple:
$ P V = n R T <=> P = n/V R T = C R T $
$C$ et $T$ sont des paramètres intensifs: la variance du 
système du gaz parfait est $2$.

= Notion de température - Équilibre thermique

== Définition

La question qui va effectivement se poser
en terme de température, et ben si on
revient sur le coté historique des choses,
on a tous pu faire l'expérience 
qu'on a eu les sensations de chaud ou de froid qui peuvent
effectivement se mettre en place.
Le gros probleme des sentiments de chaud et de froid
c'est qu'on a pas tous la même.
Tout ça pour dire que ces notions de chaud ou de froid ont le 
mauvais goût d'être très subjectifs.
En fonction de ça, bien évidemment on est bien d'accord
que si ça depend de la personne, ça pose un problème
puisque l'une des règles scientifiques
c'est que tout le monde doit pouvoir s'accorder sur la même chose.
La notion de température c'est justement la variable qui va être
chargé de trancher, de pouvoir dire: "il fait telle température"
Et la tout le monde est d'accord, que certains trouve que
cette température là, elle est chaude, c'est très bien.
Que d'autre disent: "Non, cette température est froide!", très bien.

Donc l'idée c'est effectivement de vérifier ça objectivement,
et l'idée qui va permettre de mettre tout le monde d'accord,
c'est le principe zéro de la thermodynamique.

Deux systèmes sont en équilibre thermique si leurs température
est égale.

#def[Principe 0 de la thermodynamique]:
Si deux systèmes $Sigma_1$, $Sigma_2$ sont en équilibre thermique
avec un système de référence $Sigma_"ref"$, alors ces deux systèmes
sont en équilibre thermique entre eux.

#warn[Dans les TP de thermodynamique, il faudra _attendre_ l'équilibre thermique.]

== Quelques valeurs de température

L'unité de température officielle, c'est le kelvin K.

- Température ambiente: $approx 300$ K
- Gel de l'eau: $273.15$ K
- Surface du soleil: $6000$ K
- Centre du soleil: $15 000$ kK
- Hélium liquide: $3$ K

== Repérage de températures

== Échelles centésimales linéaires

Pour une grandeur thermométrique $g$,
on peut définir une échelle centimétrique
en prenant deux points de référence
(par exemple, le gel et l'ébullition de l'eau)
$g_0$ et $g_100$, et en posant:
$ g = (g_100 - g)/100 t + g_0 $
$ t = 100 (g - g_0)/(g_100 - g_0) $

= Étude expérimentale du gaz parfait

== Pression évanouissantes

On parle de pression évanouissante quand on est face
à des pressions tendant vers $0$ (pressions de l'ordre du $"Pa"$)

Quelques unités de pression:
- Le pascal (Pa)
- Le bar: $1 "bar" = 10^5 "Pa"$
- L'atmosphère: $1 "atm" = 10135 "Pa"$
- Le millimètre de mercure: $1 "mmhG" = 1/760 "atm"$

== Définition expérimentale du gaz parfait

On fixe la température, et on fait varier la pression
et le volume pour cette température.

On utilise les coordonées d'Amagat, qui consistent en tracer
le produit $P V$ comme une fonction de $P$.

Quelle que soit la nature du gaz, il se comportera à peu près
de la même façon.

Le gaz parfait se traduit par une droite horizontale.

#figure(image("amagat.png", width: 50%))

Dire qu'un gaz est parfait ne marche donc que dans le cadre des pressions
évanouissantes.

== Propriétés expérimentales du gaz parfait

- Pour différents gaz parfaits, à $P$ constante, le rapport des 
  volumes à deux températures différentes est indépendant du gaz. 

- Pour différents gaz parfaits, le rapport des pressions
  à deux températures différentes est indépendant du gaz.

- Le produit $P V$ à une température $T$ fixée est proportionnel
  au nombre de molécules.
  $ P V = underbrace(n, "mol") R T $

#note[
	Quand on utilise la quantité de matière,
	on peut soit travailler avec le nombre de particules $N$,
	soit travailler en mol avec $n = N/N_0$
]

== Définition de la température absolue

Le produit $P V$ est proportionel à la température pour un gaz parfait
quand $P -> 0$.

#figure(image("gas_temp.png", width: 50%))

Pour définir la température, on utilise une quantité 
de gaz et un volume donné et on regarde la valeur de la pression.

On peut ainsi définir des rapports relatifs entre température.

Ici, on a:
$ (A_T_1)/(A_T_2) = T_1/T_2 "et" (A_T_2)/(A_T_3) = T_2/T_3 $

On prend le point triple de l'eau comme origine des 
rapports ($O = 273.16 " ""K"$).

== Mesure des températures

#figure(image("mesures.png", width: 40%))

= Théorie cinétique des gazs parfaits

== Hypothèses du modèle du gaz parfait

On considère qu'un gaz parfait est constitué de particules
toutes identiques, et que chacune de ces particule
est une sphère parfaite et ponctuelle, que les interactions
entre les particules sont négligeables
(d'où le fait que l'approximation ne marche que si les pressions sont faibles).

Les seules intéractions qu'on considère, c'est les collisions des
particules sur les parois du contenant du gaz.

== Pression cinétique

#figcan({
	import draw: *

	hobby((2, 1), (0, 2), (-1, -1), (0, -1), (3, 0), close: true, name: "c")
	
	content((1.5, 0), [Fluide])

	line("c.50%", "c.55%", stroke: (paint: red, thickness: 3pt))
	arrow((-0.7, 0), "c.52%")
	content((-0.6, 0.3), $arw(F)_"pression"$)
	content(("c.52%"), $S$, padding: 4pt, anchor: "north")

	content((3, 1), [Paroi])
})

On pose la force de pression $arw(F)_"pression"$, qui est
la force qui s'exerce sur la surface.

On définit la pression $P$ comme étant 
norme de la force de pression divisée par l'aire de cette surface, soit:
$ P = norm(arw(F)_"pression")/S $

Pour calculer la force exercée par le fluide sur la paroi:

=== Calcul de la variation de la quantitée de mouvement liée à la force exercée par la paroi sur une particule du fluide

On considère que la surface est un cercle d'aire $dif S$.

On considère le système des particules du fluide, on se place
dans le référentiel terrestre supposé galiléen.

On considère une particule allant à une vitesse $arw(v)$.

Bilan des forces: La force exercée par la paroi $arw(f)$

On applique le PFD:
$ (dif arw(p))/(dif t) = m (dif arw(v))/(dif t) = arw(f) $

Pour calculer la variation de la quantitée de mouvement, 
on distingue deux phases:
- La phase d'adsorption, où la vitesse va de $arw(v)$ à $arw(0)$,
  donc $Delta arw(p_a) = m (arw(0) - arw(v)) = - m arw(v)$
- La phase de désorption où la vitesse va de $arw(v)$ à $arw(0)$,
  donc $Delta arw(p_d) = m (arw(v) - arw(0)) = m arw(v)$

=== Calcul du nombre de particules ayant une vitesse $arw(v)$ arrivant pendant $dif t$ sur la surface élémentaire $dif S$

On considère toutes les particules se déplaçant à la vitesse $arw(v)$ 
et arrivant sur la surface.

Pour que ces particules puissent arriver sur la surface, elles doivent
se situer dans le cylindre
Les particules sont dans un cylindre de base $dif S$ eet de génératrice
$arw(v) dif t$

#figure(image("cylindre.png", width: 60%))

On prend $arw(O_x) = dif arw(S)$.
On calcule le volume du cylindre:
$ V = V_1 + V_2 = (arw(v) dif t)_x dif S = v_x dif t dif S $

On pose $N_arw(v)$ le nombre de particules se déplaçant à la vitesse
$arw(v)$ dans le cylindre, donc
$N_arw(v)/V$ est la densité de particules se déplaçant à la vitesse $arw(v)$ dans le cylindre.

On considère enfin le nombre de particules ayant la vitesse $arw(v)$
*pendant* l'intervalle $dif t$:
$ - N_arw(v)/V v'_x dif t dif S $

=== Variation de quantité de mouvement de l'ensemble des particules ayant la vitesse $arw(v)$ arrivant pendant $dif t$

La variation de la quantité de mouvement totale,
c'est la variation de la quantité de mouvement d'une particule ayant
la vitesse $arw(v)$, fois le nombre de particule ayant cette vitesse arrivant pendant l'intervalle $dif t$ sur la surface:
- Pendant la face d'adsorption:
  $ dif^2 arw(p)_(a,arw(v)) = N_arw(v)/V arw(v_x) dif t dif S (- m arw(v)) = - N_arw(v)/V arw(v)_x dif t dif S m arw(v) $
- Pendant la face de désorption
  $ dif^2 arw(p)_(a,arw(v)) = - N_arw(v')/V arw(v'_x) dif t dif S (- m arw(v')) = - N_arw(v')/V arw(v')_x dif t dif S m arw(v') $

=== Variation de la quantité de mouvement pour l'ensemble des particules ayant n'importe quelle vitesse

Comme on est dans un milieu isotrope,
il y a autant de particule arrivant d'un coté comme de l'autre.

Ainsi les vitesses horizontales/verticales s'annulent:
il ne reste que les forces s'appliquant parallèlement à la paroi.

=== On trouve ainsi la force élémentaire exercée par la paroi sur l'ensemble des particules

Par PFD:
$ (dif^2 arw(p))/(dif t) = - (m d S)/(V) N (<v^2>)/(3) arw(u_x) = 
dif arw(F)_("paroi"->"particule")
$

=== Par troisième loi de Newton

$ arw(F)_("particule"->"paroi") =  $

=== Pression cinétique

On pose $n^* = N/V$ la densité de particule et $u^*$ la vitesse quadratique moyenne.

$ P = 1/3 n^* m u^(*2) $


== Énergie interne

On définit l'énergie interne $U$ comme l'énergie mécanique
contenue dans le gaz, c'est à dire la somme
des énergies mécaniques de chaque particule:

$ U = sum_(i=0)^N E_(c,i) + E_(p,i) = E_(c,"micro") + E_(p,"micro") $

Or, on considère qu'il n'y a pas d'interaction entre les particules
dans un gaz parfait, donc les particules n'ont
aucune énergie potentielle: $E_(p,"micro") = 0$

On fait la moyenne des énergies cinétiques:
$ U = 1/2 N m u^(*2) $

== Température cinétique

Définition de la température:
$ U = 3/2 N k_B T $

Donc $ T = (m u^(* 2))/(3 k_B) $

On a donc:
$ 1/2 N m u^(*2) = 3/2 N k_B T\
<=> T = 1/3 m (u^(* 2))/(k_B) \
<=> u^(* 2) = (3 k_B T)/m
$

Or, on avait trouvé que:
$ P = 1/3 N/V m u^(*2) = 1/3 N/V m (3 k_B T)/m
= k_B T N/V
$

On retrouve ainsi la formule des gaz parfaits:
$ P V = k_B N T $

#note[La constante $3/2$ correspond à un gaz monoatomique.
Pour un gaz qui n'est pas monoatomique, les interactions intermoléculaire
	change l'agitation thermique. La constante sera souvent $5/2$.
	La constante sera en tout cas toujours supérieur à $3/2$.
]

= Mélange idéal de gaz parfaits

== Définition

Un mélange de gaz est dit idéal si il n'introduit
pas de nouvelles interactions entre les particules.

Par exemple: L'eau interagit avec l'éthanol, donc leur mélange
n'est pas parfait (et le volume du mélange d'eau et d'éthanol est plus 
petit que la somme de leur volume)

Un mélange idéal de gaz parfait est un gaz parfait.

== Pression partielle

Étant donné un mélange parfait $M$ d'une espèce $A$ avec une espèce $B$,
ce mélange possédant un certain volume et une certaine température,
on appelle *pression partielle* de $A$ la pression $P_A$
qu'aurait $A$ dans les même conditions de pression et de volume que $M$.

