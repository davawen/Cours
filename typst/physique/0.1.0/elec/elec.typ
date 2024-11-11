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


#let apply(f, ..args) = {
	(f: f, pos: args.pos(), named: args.named())
}

/// Use apply to create an element for this method
/// Example:
/// ```typst
/// derivation((0, 0), 
///   apply(resistlr, name: "d1"),
///   apply(ground, rot: 45deg)
/// )
/// ```
#let derivation(pos, rot: 0deg, left: none, right: none, width: 5, inset: 1, i: none, u: none, name: none, ..elems) = {
	import draw: *

	let elems = elems.pos()

	group(name: name, {
		set-origin(pos)
		rotate(rot)

		anchor("l", (-width/2, 0))
		anchor("r", (width/2, 0))

		node((-width/2 + 1, 0), id: "ln", name: left, round: true)
		node((width/2 - 1, 0), id: "rn", name: right, round: true) 

		fil("l", "ln", i: i)
		fil("r", "rn", i: i)

		if u != none {
			tension("l", "r", (0, inset * (elems.len())/2), u, size: width/4)
		}

		for (i, elem) in elems.enumerate() {
			let (f, pos: positional, named) = elem

			if (named.at("name", default: none) == none) {
				named.insert("name", "__tmpname")
			}

			let name = named.at("name")

			f((0, inset * ((elems.len() + 1)/2 - i - 1)), ..positional, ..named)

			fil(name + ".l", "ln")
			fil(name + ".r", "rn")
		}
	})
}

#let serie(pos, rot: 0deg, inset: 1.8, left: none, right: none, u: none, i: none, name: none, ..elems) = {
	import draw: *

	let elems = elems.pos()

	let get_name(i) = {
		let name = elems.at(i).at("named").at("name", default: none)
		if (name == none) {
			return "__tmpname" + str(i)
		} else {
			return name
		}
	}

	group(name: name, {
		set-origin(pos)
		rotate(rot)

		node((-inset * (elems.len()+1)/2, 0), id: "l", name: left)
		node((inset * (elems.len()+1)/2, 0), id: "r", name: right)

		for (i, elem) in elems.enumerate() {
			let (f, pos: positional, named) = elem

			named.insert("name", get_name(i))
			f((-inset * ((elems.len() + 1)/2 - i - 1), 0), ..positional, ..named)
		}

		if elems.len() > 0 {
			fil("l", get_name(0) + ".l", i: i)
			fil(get_name(elems.len()-1) + ".r", "r", i: i)
		} else {
			fil("l", "r", i: i)
		}

		for i in range(1, elems.len()) {
			let a = get_name(i - 1)
			let b = get_name(i)

			fil(a + ".r", b + ".l")
		}

		if u != none {
			tension("l", "r", (0, -1.2), u, size: inset*(elems.len()-1))
		}
	})
}

/// iterates f with windows from the list:
/// `windows((1, 2, 3), 2, f)`
/// will call f with 1, 2 and 2, 3
/// NOTE: the function is called variadically
/// in this case, it should be `(a, b) => { ... }` and not `((a, b)) => { ... }`
#let windows(list, size, f) = {
	for i in range(0, list.len()+1-size) {
		f(..list.slice(i, count: size))
	}
}

/// fonction à utiliser avec `carre`
/// pour créer une branche dans un circuit
#let branch(top: none, down: none, u: none, ..elems) = {
	let r = (branch: elems.pos())
	if top != none { r.top = top }
	if down != none { r.down = down }
	if u != none { r.u = u }
	r
}

/// 
#let carre(pos, rot: 0deg, inset: 1.8, left: none, right: none, u: none, i: none, name: none, ..elems) = {
	import draw: *

	let elems = elems.pos()

	let get_name(params_named, i) = {
		let name = params_named.at("name", default: none)
		if (name == none) {
			return "__tmpname" + str(i)
		} else {
			return name
		}
	}

	let draw-connections(connections) = {
		for (a, b) in connections.chunks(2) {
			if type(a) == dictionary {
				let (co, i, rev) = a
				if rev == none {
					fil(co, b, i: i, straight: false)
				} else {
					fil(b, co, i: i, straight: false)
				}
			} else {
				fil(a, b, straight: false)
			}
		}
	}

	group(name: name, {
		set-origin(pos)
		rotate(rot)

		let offset = inset/2
		let ret-offset = 0
		let max-height = inset*1.2

		// on parcourt les éléments pour calculer le layout
		for elem in elems {
			if "branch" in elem {
				if type(elem.branch) != array {
					elem.branch = (elem.branch,)
				}

				let height = 0
				for elem in elem.branch {
					if "inset" in elem {
						height = height + elem.inset
					} else {
						height = height + inset
					}
				}
					
				if height > max-height {
					max-height = height
				}
			}
		}

		let connections = ((offset, 0), )
		let ret-connections = ((offset, -max-height), )

		for (i, elem) in elems.enumerate() {
			if "branch" in elem { // on part en dérivation
				let branch-name = "__t" + str(i)
				anchor(branch-name, (offset, 0))

				// on ajoute le haut de la branche aux connections du circuit
				connections.push(branch-name)
				connections.push(branch-name)

				group({
					anchor(branch-name, (offset, 0))
					anchor("__d", (offset, -max-height))
					if "top" in elem {
						node(branch-name, name: elem.top, round: true)
					}
					if "down" in elem {
						node("__d", name: elem.down, round: true)
					}
					if "u" in elem {
						tension(branch-name, "__d", (-0.6, 0), elem.u, size: max-height/3.0)
					}

					if type(elem.branch) != array {
						elem.branch = (elem.branch,)
					}
					
					// on définit une nouvelle liste de connections
					// pour la branche
					let connections = (branch-name,)

					let branch-offset = -inset/2
					for (i, elem) in elem.branch.enumerate() {
						if "inset" in elem {
							branch-offset = branch-offset - elem.inset
							continue
						}
						if "i" in elem {
							let rev = elem.at("rev", default: none)

							let last = connections.last()
							connections.at(-1) = (co: last, i: elem.i, rev: rev)
							continue
						}

						let (f, pos: positional, named) = elem

						name = get_name(named, i)
						named.name = name
						connections.push(name + ".l")
						connections.push(name + ".r")

						f((offset, branch-offset), rot: -90deg, ..positional, ..named)

						branch-offset = branch-offset - inset
					}

					connections.push("__d")

					draw-connections(connections)

					if branch-offset > max-height {
						max-height = branch-offset
					}

					offset = offset + inset
				})
			} else if "return" in elem { // branche de retour
				let (f, pos: positional, named) = elem

				name = get_name(named, i)
				named.name = name
				ret-connections.push(name + ".l")
				ret-connections.push(name + ".r")

				f((ret-offset, max-height), ..positional, ..named)

				ret-offset = ret-offset + inset
			} else if "i" in elem {
				let rev = elem.at("rev", default: none)

				let last = connections.last()
				connections.at(-1) = (co: last, i: elem.i, rev: rev)
			} else { // buisness as usual
				let (f, pos: positional, named) = elem

				name = get_name(named, i)
				named.name = name
				connections.push(name + ".l")
				connections.push(name + ".r")
				f((offset, 0), ..positional, ..named)

				offset = offset + inset
			}
		}

		connections.push((offset - inset, 0))
		ret-connections.push((offset - inset, -max-height))

		draw-connections(connections)
		draw-connections(ret-connections)
	})
}
