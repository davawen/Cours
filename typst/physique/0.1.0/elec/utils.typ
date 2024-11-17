#import "../utils.typ": *

#let tenselr(label, rev: false, size: 0, offset: (0, 0)) = {
	(label: label, rev: rev, size: size, offset: offset)
}

#let tenserl(label, rev: false, size: 0, offset: (0, 0)) = {
	(label: label, rev: not rev, size: size, offset: offset)
}

#let tension(from, to, offset, tense, size: 1) = {
	import draw: *

	let midpoint = (from, 50%, to)

	let size = size + tense.size

	let from = (midpoint, size/2, from)
	let to = (midpoint, size/2, to)

	if tense.rev == true or tense.rev == 1 {
		(from, to) = (to, from)
	}

	group({
		let (ox, oy) = offset
		let (tox, toy) = tense.offset

		let offset = (ox + tox, oy + toy)
		line((rel: offset, to: from), (rel: offset, to: to), mark: (end: "straight"), name: "line")

		content((rel: ((0, 0), 0.3, offset), to: "line.50%"), tense.label)
	})
}

#let fil(a, b, rev: false, straight: true, i: none, ..points) = {
	import draw: *

	let intensity = i

	let points = (a, b, ..points.pos())
	if straight {
		for (a, b) in points.chunks(2, exact: true) {
			if rev == true or rev == 1 {
				line(a, (a, "|-", b), name: "__first")
				line((a, "|-", b), b)
			} else {
				line(a, (a, "-|", b), name: "__first")
				line((a, "-|", b), b)
			}
			if intensity != none {
				mark("__first.50%", ("__first.50%", 0.2, "__first.51%"), symbol: ">", fill: black)
				content((rel: (0, 0.8em), to: "__first.50%"), intensity)
			}
		}
	} else {
		for (a, b) in points.chunks(2, exact: true) {
			line(a, b, name: "__first")
			if intensity != none {
				mark("__first.50%", ("__first.50%", 0.2, "__first.51%"), symbol: ">", fill: black)
				content(("__first.50%", 0.8em, 90deg, "__first.51%"), intensity)
			}
		}
	}
}
