#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Corps pur sous plusieurs phases]

= Définitions et généralités

== Notion de corps pur / Mélange

#def[Corps pur]: Système constitué d'un seul type d'espèce chimique

Exemple:
- L'air n'est pas un corps pur
- L'ean du robinet n'est pas un corps pur
- L'eau distillée est en principe pur

== Phases usuelles d'un corps pur

On considère les phases habituelles:
- Solide, liquide, gas
- Il existe aussi des variétés dîts allotropiques.
  C'est à dire différentes phases usuelles ayant des propritétés
  différentes (par exemple Glace I à IX)

== Mise en évidence expérimentale d'un changement de phase

== Définition des transitions de phases

#figcan({
	import draw: *

	content((0, 0), [Liquide])
	rect((-1, -0.5), (1, 0.5))

	content((-4, -1), [Solide])
	rect((-5, -1.5), (-3, -0.5))

	content((4, -1), [Gazeux])
	rect((3, -1.5), (5, -0.5))
})


