#import "utils.typ": *

= Explication du module

== Composant
Un composant est une fonction qui dessine un composant électrique avec CetZ.

Un composant doit au-moins posséder les paramètres suivant:
- `pos`, la position du composant, en 1er argument
- `rot` (degrees), la rotation appliquée, en argument nommé (défaut: `0deg`)
- `name` (str), le nom du groupe CetZ du composant, en argument nommé (défaut: `none`)
- `layout` (bool), si le composant doit renvoyer son `layout`

Un composant doit:
- Créer un groupe (`draw.group`) avec le nom qui lui a été passé en paramètre
- Appliquer les transformations de `pos` et de `rot` dans ce groupe (avec `draw.set-origin` et `draw.rotate`)
- Définir au moins les ancres (`draw.anchor`) gauche (`l`) et droite (`r`)
- Si `layout == false`:
  - Renvoyer le groupe CetZ directement
- Si `layout == true`:
  - Renvoyer un dictionnaire de la forme (comp: `groupe CetZ`, layout: `layout`)

Ces fonctionnalités sont implémentées par la fonction `construct_component`.
Le prototype "de base" d'un composant doit donc ressembler à:
```typst
let composant(pos, rot: 0deg, name: none, layout: false /* autres paramètres... */) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		/* créer les bornes `l` et `r` */
		/* dessiner le composant centré à l'origine */
	}

	(comp: comp, layout: `layout`)
})
```

Il existe en plus quelques paramètres nommés "standards" des composants:
- `label`: Pour indiquer du texte au-dessus/en-dessous du composant
- `i`: Prend en entrée une équation (créée avec `$...$`) pour indiquer une intensité
- `u`: Prend en entrée une tension (créée avec `tenserl` ou `tenselr`) pour indiquer une tension

== Layout
Le layout d'un composant indique la taille que ce dernier prend,
de sa borne gauche à sa borne droite, ainsi que sa hauteur (par-rapport au centre),
dans son espace local (donc toujours de gauche à droite, sans rotation ou échelle appliquée).
Il est défini par un dictionnaire de la forme:
`(width: number, height: number)`

#let construct_component(pos, rot, name, layout, body) = {
	let (comp, layout: out_layout) = body
	let group = draw.group(name: name, {
		draw.set-origin(pos)
		draw.rotate(rot)
		comp
	})

	if layout {
		(comp: group, layout: out_layout)
	} else {
		group
	}
}

/// Dessine un resistor de largeur `size` et de hauteur `size/2`
#let resistor(pos, rot: 0deg, name: none, layout: false, label: none, u: none, size: 1) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		rect((-size/2, -size/4), (size/2, size/4))

		anchor("l", (-size/2, 0))
		anchor("r", (size/2, 0))

		if label != none {
			content((rel: (0, 1em), to: (0, size/4)), label)
		}

		if u != none {
			tension("l", "r", (0, -size/2 - 0.1), size: size, u)
		}
	}
	(comp: comp, layout: (width: size, height: size/2))
})

#let node(pos, name: none, layout: false, offset: (-0.5em, 0.8em), id: none, round: false) = {
	import draw: *
	if id == none {
		id = name
	}

	let comp = group(name: id, {
		set-origin(pos)
		if round {
			circle((0, 0), radius: 0.07, fill: black)
		}

		anchor("default", (0, 0))
		anchor("l", (0, 0))
		anchor("r", (0, 0))

		if name != none {
			let label = eval("$" + name + "$")
			content(offset, label)
		}
	})

	if layout {
		(comp: comp, layout: (width: 0.1, height: 0.1))
	} else {
		comp
	}
}

#let intensite(pos, intensity, rot: 0deg, name: none, layout: false, rev: false) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		anchor("l", (-0.2, 0))
		anchor("r", (0.2, 0))
		fil("l", "r")
		if not rev {
			mark((0, 0), "r", symbol: ">", fill: black)
		} else {
			mark((0, 0), "l", symbol: ">", fill: black)
		}
		content((0, 0.3), intensity)
	}
	(comp: comp, layout: (width: 0.4, height: 0.8))
})

#let ground(pos, rot: 0deg, name: none, layout: false) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		anchor("l", (0, 0))
		anchor("r", (0, 0))

		line((0, 0), (0, -0.5))
		line((-0.3, -0.5), (0.3, -0.5))
		line((-0.2, -0.6), (0.2, -0.6))
		line((-0.1, -0.7), (0.1, -0.7))
	}
	(comp: comp, layout: (width: 0.6, height: 0.7))
})

#let pile(pos, rot: 0deg, name: none, layout: false, rev: false) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		let (plus, minus) = (0.1, -0.1)
		if (rev) {
			plus = -0.1
			minus = 0.1
		}

		line((minus, -0.2), (minus, 0.2))
		line((plus, -0.3), (plus, 0.3))

		content((1.5*minus, 0.3), "-", anchor: "south", padding: 3pt)
		content((1.5*plus, 0.3), "+", anchor: "south", padding: 3pt)

		line((minus, 0), (3*minus, 0))
		line((plus, 0), (3*plus, 0))

		anchor("l", (3*minus, 0))
		anchor("r", (3*plus, 0))
	}
	(comp: comp, layout: (width: 0.6, height: 0.6))
})

#let elem-letter(pos, rot: 0deg, name: none, layout: false, u: none, letter: $G$) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		circle((0, 0), radius: 0.4)
		content((0, 0), letter)

		anchor("l", (-0.4, 0))
		anchor("r", (0.4, 0))

		if u != none {
			tension("l", "r", (0, -0.6), u)
		}
	}
	(comp: comp, layout: (width: 0.8, height: 0.8))
})

#let generateur = elem-letter.with(letter: $G$)
#let voltmetre = elem-letter.with(letter: $V$)
#let amperemetre = elem-letter.with(letter: $A$)

#let source-ideale(pos, rot: 0deg, name: none, layout: false, label: none, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		circle((0, 0), radius: 0.4)

		anchor("l", (-0.4, 0))
		anchor("r", (0.4, 0))

		line("l", "r")
		if label != none {
			tension("l", "r", (0, 0.6), label, size: 0.4)
		}
		if u != none {
			tension("l", "r", (0, -0.6), u)
		}
	}
	(comp: comp, layout: (width: 0.8, height: 0.8))
})

#let source-ideale-courant(pos, rot: 0deg, name: none, layout: false, label: none, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		circle((0, 0), radius: 0.4)

		anchor("l", (-0.4, 0))
		anchor("r", (0.4, 0))

		line((0, 0.4), (0, -0.4))
		if label != none {
			tension("l", "r", (0, 0.6), label, size: 0.4)
		}
		if u != none {
			tension("l", "r", (0, -0.6), u)
		}
	}
	(comp: comp, layout: (width: 0.4, height: 0.4))
})

#let bobine(pos, rot: 0deg, name: none, layout: false, coils: 4, u: none, label: none) = construct_component(pos, rot, name, layout, {
	import draw: *
	let width = 0.3*(coils+2)
	let comp = {
		anchor("l", (-width/2, 0))
		anchor("r", (width/2, 0))

		if label != none {
			content((0, 0.5), label)
		}

		if u != none {
			tension("l", "r", (0, -0.5), u)
		}

		line("l", (-0.3*coils/2, 0))
		line("r", (0.3*coils/2, 0))

		translate((-0.3*(coils/2) + 0.3, 0))

		for i in range(coils) {
			arc((0, 0), start: 0deg, stop: 180deg, radius: 0.15)
			translate((0.3, 0))
		}
	}
	(comp: comp, layout: (width: width, height: 0.2))
})

#let condensateur(pos, rot: 0deg, name: none, layout: false, label: none, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		let (plus, minus) = (0.1, -0.1)

		line((minus, -0.5), (minus, 0.5))
		line((plus, -0.5), (plus, 0.5))

		line((minus, 0), (3*minus, 0))
		line((plus, 0), (3*plus, 0))

		anchor("l", (3*minus, 0))
		anchor("r", (3*plus, 0))

		if label != none {
			content((0, 0.8), label)
		}

		if (u != none) {
			tension("l", "r", (0, -0.7), u)
		}
	}
	(comp: comp, layout: (width: 0.6, height: 1))
})

#let neon(pos, rot: 0deg, name: none, layout: false, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		anchor("l", (-0.6, 0))
		anchor("r", (0.6, 0))

		circle((0, 0), radius: 0.5)

		line("l", (-0.3, 0))
		line("r", (0.3, 0))

		arc((0, 0), start: -45deg, stop: 45deg, radius: 0.3, anchor: "origin")
		arc((0, 0), start: 180deg - 45deg, stop: 180deg + 45deg, radius: 0.3, anchor: "origin")
	}

	(comp: comp, layout: (width: 1.2, height: 1))
})
