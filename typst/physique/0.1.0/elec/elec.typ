#import "utils.typ": *
#import "composants.typ": *

#let maille(pos, size, rev: false, anchor: none) = {
	import draw: *

	group({
		set-origin(pos)

		if rev {
			arc((0, 0), start: -60deg, stop: -315deg, radius: size, mark: (end: "straight"), anchor: "origin")
		} else {
			arc((0, 0), start: 45deg, stop: 300deg, radius: size, mark: (end: "straight"), anchor: "origin")
		}
	})
}

/// Permits to spread both positional and named arguments to a dictionnary
/// Use this to create components in `serie`, `derivation`, `carre` and `carre2`.
#let apply(f, ..args) = {
	(f: f, pos: args.pos(), named: args.named())
}

#let private_elec_get_name(params_named, i, prefix: "__tmpname") = {
	let name = params_named.at("name", default: none)
	if (name == none) {
		return prefix + str(i)
	} else {
		return name
	}
}

#let derivation(pos, rot: 0deg, name: none, layout: false, left: none, right: none, i: none, u: none, ..elems) = construct_component(pos, rot, name, layout, {
	import draw: *
	let get_name = private_elec_get_name
	let elems = elems.pos()

	let padding = 0.3

	let width = 0
	let height = 0

	let elems = for (i, elem) in elems.enumerate() {
		if "inset" in elem {
			height += elem.inset
			continue
		}

		let (f, pos: positional, named) = elem

		height += padding

		let name = get_name(named, i)
		let (comp, layout) = f((0, height), ..positional, ..named, name: name, layout: true)

		let comp = {
			translate((0, layout.height/2))
			comp
			translate((0, -layout.height/2))
		}

		height += layout.height + padding
		width = calc.max(width, layout.width)

		((comp: comp, name: name),)
	}
	if elems == none { elems = () }

	let elem-padding = 0.5
	width += elem-padding*2

	let global-padding = 1

	let comp = {
		anchor("l", (-width/2 - global-padding, 0))
		anchor("r", (width/2 + global-padding, 0))

		anchor("ln", (-width/2, 0))
		anchor("rn", (width/2, 0))

		if left != none { node("ln", name: left, round: true) }
		if right != none { node("rn", name: right, round: true) }

		fil("l", "ln", i: i)
		fil("r", "rn")

		if u != none {
			tension("l", "r", (0, -height/2), u, size: width)
		}

		translate((0, -height/2))
		for elem in elems {
			elem.comp

			fil(elem.name + ".l", "ln")
			fil(elem.name + ".r", "rn")
		}
	}

	(comp: comp, layout: (width: width + 2*global-padding, height: height))
})

#let serie(pos, rot: 0deg, name: none, layout: false, left: none, right: none, u: none, i: none, ..elems) = construct_component(pos, rot, name, layout, {
	import draw: *
	let get_name = private_elec_get_name

	let connections = ("l",)
	let pos = 0
	let height = 0

	let padding = 0.3

	let elems = elems.pos()

	if i != none {
		elems = (apply(intensite, i), ..elems, apply(intensite, i))
	}

	let elems = for (i, elem) in elems.enumerate() {
		if "inset" in elem {
			pos += elem.inset
			continue
		}

		if "i" in elem {
			elem = apply(intensite, elem.i, rev: elem.at("rev", default: false))
		}

		let (f, pos: positional, named) = elem

		pos += padding

		let name = get_name(named, i)
		let (comp, layout) = f((pos, 0), ..positional, ..named, name: name, layout: true)

		// uncenter component (place the origin on its left anchor)
		let comp = {
			translate((layout.width/2, 0))
			comp
			translate((-layout.width/2, 0))
		}

		connections.push(name + ".l")
		connections.push(name + ".r")

		pos += layout.width + padding
		height = calc.max(height, layout.height)

		(comp,)
	}

	if elems == none { elems = () }

	connections.push("r")

	let width = pos

	let comp = {
		translate((-width/2, 0))

		anchor("l", (0, 0))
		anchor("r", (width, 0))

		if left != none { node("l", name: left, round: true) }
		if right != none { node("r", name: right, round: true) }

		for comp in elems {
			comp
		}

		for (a, b) in connections.chunks(2) {
			line(a, b)
		}

		if u != none {
			tension("l", "r", (0, -height*0.5 - 1), u, size: width*0.9)
		}
	}

	(comp: comp, layout: (width: width, height: height))
})

/// Fonction à utiliser avec `carre` et `carre2`
/// pour créer une branche dans un circuit
#let branch(top: none, bot: none, u: none, ..elems) = {
	(branch: elems.pos(), top: top, bot: bot, u: u)
}

/// Fonction à utiliser avec `carre2`
/// pour placer des composants sur la branche de retour (en bas)
/// 
/// # Exemple
/// ```typst
/// carre2((0, 0), 
///   branch(),
///   apply(resistor),
///   retour(apply(condensateur), apply(condensateur)),
///   // ^ créé deux condensateurs entre les deux branches en dessous du resistor
///   branch(),
///   retour(apply(resistor))
///   branch()
/// )
/// ```
#let retour(..elems) = {
	(retour: elems.pos())
}

= Carre

Prend en argument une liste de composants appliqués.
```typst
carre2((0, 0), apply(resistor), apply(resistor))
```

De plus, elle peut prendre des dictionnaire de la forme suivante:
- `(branch: <arguments de carre2...>, [u: tension])`
- `(i: equation)`

#let carre(pos, rot: 0deg, name: none, layout: false, ..elems) = construct_component(pos, rot, name, layout, {
	import draw: *
	let get_name = private_elec_get_name

	let elems = elems.pos()

	// regroupe les composants en blocs "branche directe et branche retour", séparés par des branches
	let new_elems = ()
	let running = (direct: (), retour: ())

	let push_direct(new_elems, running) = {
		if running.direct.len() != 0 or running.retour.len() != 0 {
			new_elems.push((elem: running, type: "direct"))
			running.direct = ()
			running.retour = ()
		}
		(new_elems, running)
	}

	for elem in elems {
		if "branch" in elem {
			(new_elems, running) = push_direct(new_elems, running)
			new_elems.push((elem: elem, type: "branch"))
		} else if "retour" in elem {
			running.retour = elem.retour
		} else {
			running.direct.push(elem)
		}
	}

	(new_elems, running) = push_direct(new_elems, running)

	let elems = new_elems
	
	let branch-hor-padding = 0.4

	let width = 0
	let height = 0

	let pos = 0

	let max-height = 0

	// map les éléments du circuit vers leur représentation (comp, layout)
	let elems = for (i, elem) in elems.enumerate() {
		let out = if elem.type == "branch" { // branche du circuit
			// on créé la branche (note: le padding verticale de la branche est directement dans la série)
			let name = get_name((:), i)
			let (comp, layout) = serie((pos, 0), rot: -90deg, name: name, layout: true, u: elem.elem.u, ..elem.elem.branch)

			// la branche est une série tournée à 90 degré,
			// donc la taille horizontale de la branche est sa hauteur,
			// et inversement pour sa taille verticale

			max-height = calc.max(max-height, layout.width)

			// les branches du début et de la fin n'ont pas de padding gauche/droit
			let padding = layout.height + branch-hor-padding*2

			if i == 0 {
				pos += padding/2
			} else if i == elems.len() - 1 {
				comp = {
					translate((padding/2, 0))
					comp
				}
			} else {
				pos += padding
				comp = {
					translate((padding/2, 0))
					comp
					translate((-padding/2, 0))
				}
			}

			(comp: comp, layout: layout, name: name, top: elem.elem.top, bot: elem.elem.bot, type: "branch")
		} else if elem.type == "direct" {
			let name_direct = get_name((:), prefix: "__tmpdirect", i)
			let name_retour = get_name((:), prefix: "__tmpretour", i)

			// le padding est déjà inclus aux extrêmités de la série
			let direct = serie((pos, 0), layout: true, name: name_direct, ..elem.elem.direct)
			let retour = serie((pos, 0), layout: true, name: name_retour, ..elem.elem.retour)
			
			direct.name = name_direct
			retour.name = name_retour

			let max-width = calc.max(direct.layout.width, retour.layout.width)

			pos += max-width
			max-height = calc.max(max-height, direct.layout.height)

			direct.comp = {
				translate((max-width/2, 0))
				direct.comp
				translate((-max-width/2, 0))
			}

			retour.comp = {
				translate((max-width/2, 0))
				retour.comp
				translate((-max-width/2, 0))
			}

			(direct: direct, retour: retour, type: "direct")
		}
		(out,)
	}

	let comp = {
		translate((-pos/2, -max-height/2)) // center carre

		anchor("l", (0, 0))
		anchor("r", (pos, 0))

		let connections = ("l",)
		let connections-retour = ((0, -max-height),)

		let draw-connections(connections) = {
			for (a, b) in connections.chunks(2) {
				line(a, b)
			}
		}

		for elem in elems {
			if elem.type == "branch" {
				let top = (elem.name + ".l", "|-", (0, 0))
				let bot = (elem.name + ".r", "|-", (0, -max-height))

				connections.push(top)
				connections.push(top)

				connections-retour.push(bot)
				connections-retour.push(bot)

				translate((0, -max-height/2))
				elem.comp
				translate((0, max-height/2))

				line(elem.name + ".l", top)
				line(elem.name + ".r", bot)

				if elem.top != none { node(top, name: elem.top, round: true) }
				if elem.bot != none { node(bot, name: elem.bot, round: true) }
			} else if elem.type == "direct" {
				connections.push(elem.direct.name + ".l")
				connections.push(elem.direct.name + ".r")
				elem.direct.comp

				connections-retour.push(elem.retour.name + ".l")
				connections-retour.push(elem.retour.name + ".r")
			
				translate((0, -max-height))
				elem.retour.comp
				translate((0, max-height))
			}
		}

		connections.push("r")
		connections-retour.push((pos, -max-height))

		draw-connections(connections)
		draw-connections(connections-retour)
	}

	(comp: comp, layout: (width: pos, height: max-height))
})
