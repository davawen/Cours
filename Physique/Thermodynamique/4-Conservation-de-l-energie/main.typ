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

Énoncé au-dessus est la forme intégrale du premier principe:
on étudie la différence entre un état $A$ et un état $B$:
$ Delta (U + E_m) = Q + W \
<=> (U + E_m) (B) - (U + E_m) (A) = Q + W \
<=> U(B) + E_m(B) - (U(A) + E_m(A)) = Q + W 
$

Il existe aussi une version différentielle qui observe
les changements infinitésimaux d'énergie:
$ d (U + E_m) = delta Q + delta W $

#note[On étend juste les définitions qu'on a vu avec l'énergie mécanique
à l'énergie totale d'un système.]

#note[
	Comme en mécanique,
	la variation d'énergie totale "ne dépend pas du chemin suivi",
	mais les transferts d'énergie en eux même si.
]

== Interprétation

Premièrement, l'énergie interne est une fonction d'état,
et ne dépend donc que de l'état à un moment donné,
et pas des transformations qui ont étés appliquées jusqu'a ce moment.
(C'est la notion "d'indépendance du chemin suivi")

#tip[
	Peut-être pratique si:
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

Un système est isolé si il n'y a aucun transfert énergétique.

$ cases(Q = 0, W = 0) => Delta (E_m + Q) = 0 $

=== Systèmes à énergie mécanique constantes

La majorité des systèmes rencontrés seront dans ce cas.
On aura alors:
$ Delta U = W + Q $

On différentie encore deux cas particuliers.
- Dans le cas où $W = 0$,
  la majorité du temps, le seul travail
  présent sera celui des forces de pression, et
  toutes les transformations seront alors _isochores_.
  On aura alors:
  $ Delta U = Q $
- Dans le cas où $Q = 0$, toutes les transformations seront aediabatiques, donc:
  $ Delta U = W $

= Énergie interne


