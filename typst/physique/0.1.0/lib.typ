#import "utils.typ": *
#import "optique.typ"
#import "elec/elec.typ"

#let def(x) = underline([*#x*])
#let ov = math.overline
#let arw(x) = math.accent(x, math.arrow)

#let half_mark = (end: "straight", pos: -63%)

#let template(doc) = {
	show figure.caption: emph

	set text(lang: "fr")

	set heading(numbering: "1.1.1)")
	show heading.where(level: 1): h => {
		h
		// reset equation counter for each chapter
		counter(math.equation).update(0)
	}

	show ref: it => {
		let eq = math.equation
		let el = it.element
		if el != none and el.func() == eq {
		// Override equation references.
		numbering(
			el.numbering,
			..counter(eq).at(el.location())
		)
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
	
	show heading.where(level: 2): it => {
		stack(
			spacing: 0.32em,
			it,
			align(center, line(length: 100%, stroke: (paint: gray, thickness: 0.8pt)))
		)
	}

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

// Sir Lanceléthanol le best <3 -U
