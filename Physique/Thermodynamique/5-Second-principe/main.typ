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

On a donc:
$ dif U = T dif S - P dif V $
