#import "utils.typ": *

#let axe-optique() = {
  import cetz: draw
  import draw: *
  line((-5, 0), (5, 0), mark: (end: "straight"))
}

#let lentil(openess, height: 1, fill: none, name: none) = {
  import draw: translate, bezier, group, anchor

  group(name: name, {
    translate((-openess, 0))
    bezier((0, height), (0, -height), (-1, 0), name: "left", fill: fill)
    translate((openess * 2, 0))
    bezier((0, height), (0, -height), (1, 0), name: "right", fill: fill)
    translate((-openess, 0))

    anchor("north", (0, height))
    anchor("south", (0, -height))
 })
}

#let miroir-plan(a, b, invert: true, amplitude: 0.2, padding: 0.05, density: 0.2, ..style) = {
	if density <= 0 {
		density = 0.1
	} 
	if padding <= 0 and -padding > density {
		padding = 0
	}

	import draw: *

	get-ctx(ctx => {
		let (ctx, a, b) = cetz.coordinate.resolve(ctx, a, b)
		let (ax, ay, az) = a 
		let (bx, by, bz) = b

		// let's act like we're in 2d
		let (dx, dy) = (bx - ax, by - ay)

		let dist = calc.sqrt(dx*dx + dy*dy)

		let (dx, dy) = (dx/dist, dy/dist)
		let (nx, ny) = if invert { (dy, -dx) } else { (-dy, dx) }

		line(a, b, ..style)

		let t = 0.0
		while t < dist - density {
			let px = ax + dx*t
			let py = ay + dy*t
			line(
				(px + nx*amplitude, py + ny*amplitude),
				(px + dx*density, py + dy*density),
				..style
			)
			t = t + density + padding
		}
	})
}

#let draw_lentil_rays(focal, obj, height: 1) = figure(canvas({
  import draw: *

  line((-4, 0), (4, 0), mark: (end: "straight"))

  line((0, 2), (0, -2), name: "lentil")

  let mult = if focal > 0 { 1 } else { -1 }

  let virt = if obj > 0 { 1 } else { -1 }

  mark("lentil.start", (rel: (0, mult * 0.1)), symbol: "straight")
  mark("lentil.end", (rel: (0, mult * -0.1)), symbol: "straight")


  point((-focal, 0), value: $F$, name: "F")
  point((2 * -focal, 0), value: $2F$)
  point((focal, 0), value: $F'$, name: "F'")
  point((2 * focal, 0), value: $2F'$)

  point((-obj, 0), value: $A$, name: "A", anchor: "north")
  point((-obj, height), value: $B$, name: "B")
  line("A", "B")

  // parallel
  line((-4, height), (0, height), stroke: red)
  line((0, height), (4, height), stroke: (paint: red, dash: "dotted"))

  line_through((0, height), "F'", box: ((0, 2), (4, -2)), stroke: (paint: red))
  line_through((0, height), "F'", box: ((-4, 2), (0, -2)), stroke: (paint: red, dash: "dotted"))

  // centered
  line_through("B", (0, 0), box: ((-4, 2), (4, -2)), stroke: (paint: blue))

  // through F
  intersections("with_lentil", {
    line_through("F", "B", box: ((-4, -2), (0, 2)), stroke: green, name: "through_object")
  }, "lentil")

  line_through("F", "B", box: ((-4, -2), (4, 2)), stroke: (paint: green, dash: "dotted"))

  line("with_lentil.0", (rel: (4, 0)), stroke: (paint: green))
  line("with_lentil.0", (rel: (-4, 0)), stroke: (paint: green, dash: "dotted"))

  // Image
  // 1/(OaA') = 1/(OaFa') + 1/(OaAa)

  let image_x = 1/(1/(focal) + 1/(-obj))
  let growth = (image_x)/(-obj)

  point((image_x, 0), value: $A'$, anchor: "north-east", name: "A'")
  point((image_x, height*growth), value: $B'$, anchor: "north-east", name: "B'")
  line("A'", "B'")
}))

#let figure_lentille_convergente = figure(canvas({
  import draw: *

  line((-4, 0), (4, 0), mark: (end: "straight"))
  line((0, 2), (0, -2), name: "lentil")

  mark("lentil.start", (rel: (0, 0.1)), symbol: "straight")
  mark("lentil.end", (rel: (0, -0.1)), symbol: "straight")

  point((0, 0), value: $O$, anchor: "south-east")

  let focal = 1.3

  line((-focal, 0), (-focal, 2), stroke: (dash: "dotted"))
  line((2 * -focal, 0), (2 * -focal, 2), stroke: (dash: "dotted"))

  line((focal, 0), (focal, -2), stroke: (dash: "dotted"))
  line((2 * focal, 0), (2 * focal, -2), stroke: (dash: "dotted"))

  point((-focal, 0), value: $F$, name: "F", anchor: "north")
  point((2 * -focal, 0), value: $2F$, name: "2F", anchor: "north")
  point((focal, 0), value: $F'$, name: "F'")
  point((2 * focal, 0), value: $2F'$, name: "2F'")


  // A
  set-style(stroke: blue)
  circle((2.5 * -focal, 1), radius: 0.4, name: "A")
  content("A", $A$)

  circle((1.5 * focal, -1), radius: 0.4, name: "A'")
  content("A'", $A'$)

  // B
  set-style(stroke: red)
  circle((1.5 * -focal, 1), radius: 0.4, name: "B")
  content("B", $B$)

  circle((2.5 * focal, -1), radius: 0.4, name: "B'")
  content("B'", $B'$)

  // C
  set-style(stroke: green)
  circle((0.5 * -focal, 1), radius: 0.4, name: "C")
  content("C", $C$)

  circle((1.5 * -focal, -1.7), radius: 0.4, name: "C'")
  content("C'", $C'$)
  line((-2.8 * focal, -1), (-0.2 * focal, -1), mark: (start: "straight", end: "straight"))

  // D
  set-style(stroke: orange)
  circle((1.5 * focal, 1.7), radius: 0.4, name: "D")
  content("D", $D$)
  line((2.8 * focal, 1), (0.2 * focal, 1), mark: (start: "straight", end: "straight"))

  circle((0.5 * focal, -1), radius: 0.4, name: "D'")
  content("D'", $D'$)
}))

#let figure_lentille_divergente = figure(canvas({
  import draw: *

  line((-4, 0), (4, 0), mark: (end: "straight"))
  line((0, 2), (0, -2), name: "lentil")

  mark("lentil.start", (rel: (0, -0.1)), symbol: "straight")
  mark("lentil.end", (rel: (0, 0.1)), symbol: "straight")

  point((0, 0), value: $O$, anchor: "south-east")

  let focal = 1.3

  line((-focal, 0), (-focal, -2), stroke: (dash: "dotted"))
  line((2 * -focal, 0), (2 * -focal, -2), stroke: (dash: "dotted"))

  line((focal, 0), (focal, 2), stroke: (dash: "dotted"))
  line((2 * focal, 0), (2 * focal, 2), stroke: (dash: "dotted"))

  point((-focal, 0), value: $F$, name: "F")
  point((2 * -focal, 0), value: $2F$, name: "2F")
  point((focal, 0), value: $F'$, name: "F'")
  point((2 * focal, 0), value: $2F'$, name: "2F'")

  // A
  set-style(stroke: blue)
  circle((1.5 * -focal, 1.7), radius: 0.4, name: "A")
  content("A", $A$)
  line((-2.8 * focal, 1), (-0.2 * focal, 1), mark: (start: "straight", end: "straight"))

  circle((-0.5 * focal, -1), radius: 0.4, name: "A'")
  content("A'", $A'$)

  // B
  set-style(stroke: red)
  circle((0.5 * focal, 1), radius: 0.4, name: "B")
  content("B", $B$)

  circle((1.5 * focal, -1.7), radius: 0.4, name: "B'")
  content("B'", $B'$)
  line((2.8 * focal, -1), (0.2 * focal, -1), mark: (start: "straight", end: "straight"))

  // C
  set-style(stroke: green)
  circle((1.5 * focal, 1), radius: 0.4, name: "C")
  content("C", $C$)

  circle((2.5 * -focal, -1), radius: 0.4, name: "C'")
  content("C'", $C'$)

  // D
  set-style(stroke: orange)
  circle((2.5 * focal, 1), radius: 0.4, name: "D")
  content("D", $D$)

  circle((1.5 * -focal, -1), radius: 0.4, name: "D'")
  content("D'", $D'$)
}))

#let divergente(x, height: 2) = {
	import draw: *
	line((x, height), (x, -height), name: "lentil")

	mark("lentil.start", (rel: (0, -0.05)), symbol: "straight")
	mark("lentil.end", (rel: (0, 0.05)), symbol: "straight")
}
