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
par-rapport à son centre,
dans les quatres directions cardinales (similairement à un AABB),
dans son espace local (sans rotation ou échelle appliquée).
Il est défini par un dictionnaire de la forme:
`(left: number, right: number, top: number, bot: number)`

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

#let dots(pos, rot: 0deg, name: none, layout: false) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		anchor("l", (-0.375, 0))
		anchor("r", (0.375, 0))

		line((-0.375, 0), (0.375, 0), stroke: (dash: "dotted"))
	}
	(comp: comp, layout: (left: 0.375, right: 0.375, top: 0, bot: 0))
})

/// Dessine un resistor de largeur `size` et de hauteur `size/2`
#let resistor(pos, rot: 0deg, name: none, layout: false, label: none, u: none, size: 1) = construct_component(pos, rot, name, layout, {
	import draw: *

	let layout = (left: size/2, right: size/2, top: size/4, bot: size/4)

	let comp = {
		rect((-size/2, -size/4), (size/2, size/4))

		anchor("l", (-size/2, 0))
		anchor("r", (size/2, 0))

		if label != none {
			layout.top += 0.5
			content((rel: (0, 0.3), to: (0, size/4)), label)
		}

		if u != none {
			layout.bot = size/2 + 0.1 + 0.5
			tension("l", "r", (0, -size/2 - 0.1), size: size, u)
		}
	}
	(comp: comp, layout: layout)
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
		(comp: comp, layout: (left: 0.07, right: 0.07, top: 0.3, bot: 0.07))
	} else {
		comp
	}
}

#let intensite(pos, intensity, rot: 0deg, name: none, layout: false, rev: false) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		anchor("l", (-0.001, 0))
		anchor("r", (0.001, 0))
		if not rev {
			mark((0, 0), "r", symbol: ">", fill: black, anchor: "center")
		} else {
			mark((0, 0), "l", symbol: ">", fill: black, anchor: "center")
		}
		content((0, 0.3), intensity)
	}
	(comp: comp, layout: (left: 0, right: 0, top: 0.5, bot: 0.3))
})

#let interrupteur(pos, rot: 0deg, name: none, layout: false, closed: false, label: none) = construct_component(pos, rot, name, layout, {
	import draw: *
	let layout = (left: 0.5, right: 0.5, top: 0.3, bot: 0.0)
	let comp = {
		anchor("l", (-0.5, 0))
		anchor("r", (0.5, 0))

		if closed {
			line("l", "r", stroke: (thickness: 0.8pt))
		} else {
			line("l", (rel: (0, 0.3), to: "r"), stroke: (thickness: 0.8pt))
		}

		if label != none {
			layout.top = 0.6
			content((0, 0.4), label)
		}
	}
	(comp: comp, layout: layout)
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
	(comp: comp, layout: (left: 0.3, right: 0.3, top: 0.1, bot: 0.7))
})

#let masse(pos, rot: 0deg, name: none, layout: false) = construct_component(pos, rot, name, layout, {
	import draw: *
	let comp = {
		anchor("l", (0, 0))
		anchor("r", (0, 0))

		line((0, 0), (0, -0.3))
		line((-0.3, -0.3), (0.3, -0.3))
		for i in range(4) {
			let i = i/6
			line((-0.3 + i, -0.5), (-0.2 + i, -0.3))
		}
	}
	(comp: comp, layout: (left: 0.3, right: 0.3, top: 0.1, bot: 0.5))
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
	(comp: comp, layout: (left: 0.3, right: 0.3, bot: 0.3, top: 0.4))
})

#let elem-letter(pos, rot: 0deg, name: none, layout: false, u: none, letter: $G$) = construct_component(pos, rot, name, layout, {
	import draw: *
	let layout = (left: 0.4, right: 0.4, top: 0.4, bot: 0.4)
	let comp = {
		circle((0, 0), radius: 0.4)
		content((0, 0), letter)

		anchor("l", (-0.4, 0))
		anchor("r", (0.4, 0))

		if u != none {
			layout.bot = 1.1
			tension("l", "r", (0, -0.6), u)
		}
	}
	(comp: comp, layout: layout)
})

#let generateur = elem-letter.with(letter: $G$)
#let voltmetre = elem-letter.with(letter: $V$)
#let amperemetre = elem-letter.with(letter: $A$)

#let gbf(pos, rot: 0deg, name: none, layout: false, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *
	let layout = (left: 0.4, right: 0.4, top: 0.4, bot: 0.4)
	let comp = {
		circle((0, 0), radius: 0.4)
		content((0, 0), $attach(limits(G), b: ~)$)

		anchor("l", (-0.4, 0))
		anchor("r", (0.4, 0))

		if u != none {
			layout.bot = 1.1
			tension("l", "r", (0, -0.6), u)
		}
	}
	(comp: comp, layout: layout)
})

#let source-ideale(pos, rot: 0deg, name: none, layout: false, label: none, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *

	let layout = (left: 0.4, right: 0.4, top: 0.4, bot: 0.4)
	let comp = {
		circle((0, 0), radius: 0.4)

		anchor("l", (-0.4, 0))
		anchor("r", (0.4, 0))

		line("l", "r")
		if label != none {
			layout.top = 1.1
			tension("l", "r", (0, 0.6), label, size: 0.4)
		}
		if u != none {
			layout.bot = 1.1
			tension("l", "r", (0, -0.6), u)
		}
	}
	(comp: comp, layout: layout)
})

#let source-ideale-courant(pos, rot: 0deg, name: none, layout: false, label: none, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *

	let layout = (left: 0.4, right: 0.4, top: 0.4, bot: 0.4)
	let comp = {
		circle((0, 0), radius: 0.4)

		anchor("l", (-0.4, 0))
		anchor("r", (0.4, 0))

		line((0, 0.4), (0, -0.4))
		if label != none {
			layout.top = 1.1
			tension("l", "r", (0, 0.6), label, size: 0.4)
		}
		if u != none {
			layout.bot = 1.1
			tension("l", "r", (0, -0.6), u)
		}
	}
	(comp: comp, layout: layout)
})

#let bobine(pos, rot: 0deg, name: none, layout: false, coils: 6, u: none, label: none) = construct_component(pos, rot, name, layout, {
	import draw: *

	let width = 0.15*(coils+2)
	let layout = (left: width/2, right: width/2, top: 0.1, bot: 0.1)
	let comp = {
		anchor("l", (-width/2, 0))
		anchor("r", (width/2, 0))

		if label != none {
			layout.top = 0.7
			content((0, 0.5), label)
		}

		if u != none {
			layout.bot = 1
			tension("l", "r", (0, -0.5), u)
		}

		cetz.decorations.coil(line("l", "r"), start: 0.15, end: 0.15, amplitude: 0.25, segments: coils)
	}
	(comp: comp, layout: layout)
})

#let condensateur(pos, rot: 0deg, name: none, layout: false, label: none, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *

	let layout = (left: 0.3, right: 0.3, top: 0.5, bot: 0.5)
	let comp = {
		let (plus, minus) = (0.1, -0.1)

		line((minus, -0.5), (minus, 0.5))
		line((plus, -0.5), (plus, 0.5))

		line((minus, 0), (3*minus, 0))
		line((plus, 0), (3*plus, 0))

		anchor("l", (3*minus, 0))
		anchor("r", (3*plus, 0))

		if label != none {
			layout.top = 1
			content((0, 0.8), label)
		}

		if (u != none) {
			layout.bot = 1.2
			tension("l", "r", (0, -0.7), u)
		}
	}
	(comp: comp, layout: layout)
})

#let neon(pos, rot: 0deg, name: none, layout: false, u: none) = construct_component(pos, rot, name, layout, {
	import draw: *

	let layout = (left: 0.6, right: 0.6, top: 0.5, bot: 0.5)
	let comp = {
		anchor("l", (-0.6, 0))
		anchor("r", (0.6, 0))

		circle((0, 0), radius: 0.5)

		line("l", (-0.3, 0))
		line("r", (0.3, 0))

		arc((0, 0), start: -45deg, stop: 45deg, radius: 0.3, anchor: "origin")
		arc((0, 0), start: 180deg - 45deg, stop: 180deg + 45deg, radius: 0.3, anchor: "origin")

		if u != none {
			layout.bot = 1.2
			tension("l", "r", (0, -0.7), u)
		}
	}

	(comp: comp, layout: layout)
})
