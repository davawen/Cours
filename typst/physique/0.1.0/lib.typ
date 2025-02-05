#import "utils.typ": *
#import "optique.typ"
#import "elec/elec.typ"

#let def(x) = underline([*#x*])
#let ov = math.overline
#let arw(x) = math.accent(x, math.arrow)

#let half_mark = (end: "straight", pos: -63%)

#let template(doc, gloria: true) = {
	show figure.caption: emph

	set text(lang: "fr")

	set page(footer: context [
		#set text(8pt)
		#if gloria {
			grid(
				columns: (1fr, 1fr, 1fr),
				align: (left, center, right),
				smallcaps[Glioria sit pingvino],
				counter(page).display(
				  "1/1",
				  both: true,
				),
				smallcaps[Lycée du Parc - $upright(H X) i^2$]
			)
		} else {
			set align(center)
			counter(page).display(
			  "1/1",
			  both: true,
			)
		}
	])

	// dumb numbering to force counter reset
	set heading(numbering: "1.")

	let header_counter(level) = context {
		counter(heading).display((..nums) => {
			let c = nums.pos().last()
			if level == 1 { numbering("I.", c) }
			else if level == 2 { numbering("1)", c) }
			else if level == 3 { numbering("a)", c) }
			else { numbering("i)", c) }
		})
	}

	show heading: it => {
		header_counter(it.level)
		h(3pt)
		it.body
	}

	show heading.where(level: 1): it => {
		pad(left: 1em, it)
		// reset equation counter for each chapter
		counter(math.equation).update(0)
	}
	
	show heading.where(level: 2): it => {
		stack(
			spacing: 0.32em,
			it,
			align(center, line(length: 100%, stroke: (paint: gray, thickness: 0.8pt)))
		)
	}

	show ref: it => {
		let eq = math.equation
		let el = it.element
		if el != none and el.func() == eq {
		// Override equation references.
		link(el.location(), numbering(
			el.numbering,
			..counter(eq).at(el.location())
		))
	} else {
		// Other references as usual.
		it
	}
	}
		
	// show heading.where(level: 1): it => {
	// 	align(center, rect(
	// 		inset: 1.2em,
	// 		stroke: (thickness: 0.5pt),
	// 		width: 90%,
	// 		[
	// 		#place(top + left, dy: -1.85em,
	// 			rect(stroke: none, fill: white, 
	// 				context { numbering("1", ..counter(heading).get()) }
	// 			)
	// 		)
	// 		#it.body
	// 	]
	// 	))
	// }

	doc
}

#let resultb(c) = align(center, (box(c, inset: 0.7em, stroke: rgb("#ee3050"))))
#let titleb(c, show_outline: true) = {
	set document(title: c)
	align(center, box(text(c, size: 2em), inset: 1em, stroke: black))
	if show_outline {
		outline(title: none, depth: 1)
	}
}

#let infobox(symbol: none, info_text: "", color: black) = c => [
	#pad(left: 2em, box(stroke: color, width: 80%, inset: 10pt, [
		#text(fill: color, [#symbol #info_text]) \ 
		#c
	]))
	#parbreak()
]

#let note = infobox(symbol: $Phi$, info_text: "Note:", color: blue)
#let tip = infobox(symbol: $checkmark$, info_text: "Tip:", color: green)
#let caution = infobox(symbol: $excl.double$, info_text: "Caution:", color: red)
#let warn = infobox(symbol: $minus.triangle$, info_text: "Warn:", color: orange)
#let todo = infobox(symbol: $supset.double$, info_text: text(fill: teal)[TODO:], color: teal)
#let hp = infobox(symbol: $alpha$, color: yellow, info_text: text(fill: yellow)[
	Hors-programme:
])

#let parachute = infobox(symbol: "🪂", color: navy, info_text: text(fill: navy)[Parachutage: ])

#let tation = infobox(symbol: "🗣️", color: maroon, info_text: text(fill: maroon)[Citation: ])

#let theorem = infobox(symbol: $Theta$, color: gradient.linear(..color.map.rainbow), info_text: smallcaps[Théorème: ])

// Sir Lanceléthanol le best <3 -U
