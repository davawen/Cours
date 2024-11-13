#import "@preview/xarrow:0.3.0"
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import cetz: draw, canvas, vector

#let figcan(body, caption: none) = {
  figure(caption: caption, canvas(body))
}

#let plot(x, y: none, x-tick: auto, y-tick: auto, color: blue, ..fs) = {
	import cetz-plot: plot
	let (x-min, x-max) = x

	let (y-min, y-max) = if y == none {
		(auto, auto)
	} else {
		y
	}

	let style = if color == auto { (:) } else {
		(stroke: color)
	}

	// let (y-min, y-max) = y
	let fs = fs.pos()

	let x-tick = if x-tick == auto {
		(x-max - x-min)/5
	} else {
		x-tick
	}

	figcan({
		plot.plot(axis-style: "school-book", size: (4, 4), x-min: x-min, x-max: x-max, y-min: y-min, y-max: y-max, x-tick-step: x-tick, y-tick-step: y-tick, {
			for f in fs {
				if type(f) == "array" {
					let (domain, f) = f
					plot.add(style: style, domain: domain, f)
				} else {
					plot.add(style: style, domain: (x-min, x-max), f)
				}
			}
		})
	})
}

#let point(pos, value: [], anchor: "south-east", color: black, padding: 5pt, name: none) = {
  import draw: circle, content
  circle(pos, radius: 1.5pt, stroke: color, fill: color, name: name)
  content(pos, value, anchor: anchor, padding: padding)
}

#let double_arrow(p1, p2, ..params) = {
  import draw: line
  line(p1, p2, mark: (start: "straight", end: "straight"), ..params)
}

#let arrow(p1, p2, ..params) = {
  import draw: line
  line(p1, p2, mark: (end: "straight"), ..params)
}

/// Draws a line going through the two points
/// The line stops at the edges of the box, degined by the top-left and the bot-right corner 
/// If the line is outside the box or grazes, this may not compile
#let line_through(a, b, box: (none, none), name: none, ..style) = {
  import draw: *

  group(name: name, {
    get-ctx(ctx => {
      let (cetz, a, b) = cetz.coordinate.resolve(ctx, a, b)

      let (ax, ay, _) = a
      let (bx, by, _) = b

      let dy = by - ay
      let dx = bx - ax

      let sx = (ax - 10*dx, ay - 10*dy)
      let sy = (bx + 10*dx, by + 10*dy)

      let (boxa, boxb) = box
      intersections("i", {
        hide({
          line(sx, sy)
          rect(boxa, boxb)
        })
      })

      line("i.0", "i.1", name: "__tmpLine", ..style)
		copy-anchors("__tmpLine")
    })
  })
}
