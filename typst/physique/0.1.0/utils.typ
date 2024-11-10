#import "@preview/xarrow:0.3.0"
#import "@preview/cetz:0.3.0"
#import cetz: draw, canvas, vector, plot

#let figcan(body, caption: none) = {
  figure(caption: caption, canvas(body))
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
