#import "utils.typ": *

#let resistlr(pos, rot: 0deg, label: none, name: none, size: 0.5) = {
  import draw: *
  group(name: name, {
    translate(pos)
    rotate(rot)
    rect((-size, -size/2), (size, size/2))

    anchor("l", (-size, 0))
    anchor("r", (size, 0))

    if label != none {
      content((0, size/2), label, angle: rot, anchor: "south", padding: 4pt)
    }
  })
}

#let resisttd(pos, rot: 0deg, label: none, name: none, size: 0.5) = {
  import draw: *
  group(name: name, {
    translate(pos)
    rotate(rot)
    rect((-size/2, -size), (size/2, size))

    anchor("t", (0,  size))
    anchor("d", (0, -size))

    if label != none {
      content((size/2, 0), angle: rot, label, anchor: "west", padding: 4pt)
    }
  })
}

#let fil(a, b, rev: false, straight: true, i: none, ..points) = {
  import draw: *

  let intensity = i

  let points = (a, b, ..points.pos())
  if straight {
    for i in range(points.len()-1) {
      let a = points.at(i)
      let b = points.at(i+1)
      if rev == true or rev == 1 {
        line(a, (a, "|-", b), name: "__first")
        line( (a, "|-", b), b)
      } else {
        line(a, (a, "-|", b), name: "__first")
        line( (a, "-|", b), b)
      }
    }

    if intensity != none {
      mark("__first.50%", "__first.51%", symbol: ">", fill: black)
      content("__first.50%", intensity, anchor: "south", padding: 5pt)
    }
  } else {
    line(..points)
  }
}

#let connect(..elems) = {
  import draw: *

  intersections("__tmp_connect_intersect", {
    elems
  })
  for-each-anchor("__tmp_connect_intersect", (name) => {
    circle("__tmp_connect_intersect." + name, radius: 0.1, fill: black)
  })
}

#let ground(pos, rot: 0deg, name: none) = {
  import draw: *
  group(name: name, {
    translate(pos)
    rotate(rot)

    anchor("p", (0, 0))

    line((0, 0), (0, -0.5))
    line((-0.3, -0.5), (0.3, -0.5))
    line((-0.2, -0.6), (0.2, -0.6))
  })
}

#let node(pos, anch: "south-east", name: none, round: false) = {
  import draw: *
  group({
    if round {
      circle(pos, radius: 0.07, fill: black)
    }

    if name != none {
      let label = eval("$" + name + "$")
      content(pos, label, anchor: anch, padding: 3pt)
    }
  })

  if name != none {
    hide(circle(pos, radius: 0, name: name))
  }
}

#let pile(pos, rot: 0deg, rev: false, name: none) = {
  import draw: *
  group(name: name, {
    translate(pos)
    rotate(rot)

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
  })
}

#let tension(from, to, offset, label, rev: false) = {
  import draw: *

  let midpoint = (from, 50%, to)

  // let perp = ()

  let from = (midpoint, 0.7, from)
  let to = (midpoint, 0.7, to)

  if rev == true or rev == 1 {
    (from, to) = (to, from)
  }

  group({
    line((rel: offset, to: from), (rel: offset, to: to), mark: (end: "straight"), name: "line")

    content((rel: ((0, 0), 0.3, offset), to: "line.50%"), label)
  })
}

#let generator(pos, rot: 0deg, name: none) = {
  import draw: *

  group(name: name, {
    translate(pos)
    rotate(rot)

    circle((0, 0), radius: 0.4)
    content((0, 0), $G$)

    anchor("l", (-0.4, 0))
    anchor("r", (0.4, 0))
  })
}

#figcan({
  let resisttd = resisttd.with(size: 0.4)
  let resistlr = resistlr.with(size: 0.4)

  generator((0, 0), name: "gen")

  node((-2, 0), name: "A")
  node((2, 0), name: "D")
  node((3, 0), name: "E")

  node((0, -2), name: "C")

  node((-2, -4), name: "B")
  node((0, -4), name: "H")

  node((3, -4), name: "G")

  resisttd((-2, -2), name: "d1")
  resistlr((-1, -1), rot: -45deg, name: "d2")
  resistlr((-1, -3), rot: 45deg, name: "d3")

  resistlr((-1, -4), name: "d4")
  resistlr((1, -4), name: "d5")

  resistlr((1, -1), rot: 45deg, name: "d2")
  resistlr((1, -3), rot: -45deg, name: "d3")

  fil("A", "gen.l", i: $I_g$)
  fil("gen.r", "D", i: $I_g$)
  fil("D", "E", i: $I_g$)

  // fil("")
})
