#import "utils.typ": *

#let tenselr(label, rev: false) = {
  (label: label, rev: rev)
}

#let tenserl(label, rev: false) = {
  (label: label, rev: not rev)
}

#let tension(from, to, offset, tense, size: 0.7) = {
  import draw: *

  let midpoint = (from, 50%, to)

  let from = (midpoint, size, from)
  let to = (midpoint, size, to)

  if tense.rev == true or tense.rev == 1 {
    (from, to) = (to, from)
  }

  group({
    line((rel: offset, to: from), (rel: offset, to: to), mark: (end: "straight"), name: "line")

    content((rel: ((0, 0), 0.3, offset), to: "line.50%"), tense.label)
  })
}

#let maille(pos, size, rev: false) = {
  import draw: *

  group({
    translate(pos)

    arc((0, 0), start: 45deg, stop: 225deg, radius: size, mark: (end: "straight"))
  })
}

#let resistlr(pos, rot: 0deg, tense: none, label: none, name: none, size: 0.5) = {
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

    if tense != none {
      tension("l", "r", (0, 0.7), tense)
    }
  })
}

#let resisttd(pos, rot: 0deg, label: none, name: none, size: 0.5) = {
  import draw: *
  group(name: name, {
    translate(pos)
    rotate(rot)
    rect((-size/2, -size), (size/2, size))

    anchor("l", (0,  size))
    anchor("r", (0, -size))

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
    for (a, b) in points.chunks(2, exact: true) {
      if rev == true or rev == 1 {
        line(a, (a, "|-", b), name: "__first")
        line((a, "|-", b), b)
      } else {
        line(a, (a, "-|", b), name: "__first")
        line((a, "-|", b), b)
      }
      if intensity != none {
        mark("__first.50%", (rel: (0.2, 0), to: "__first.51%"), symbol: ">", fill: black)
        content("__first.50%", intensity, anchor: "south", padding: 5pt)
      }
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

#let node(pos, anch: "south-east", id: none, name: none, round: false) = {
  import draw: *
  if id == none {
    id = name
  }

  group({
    translate(pos)
    if round {
      circle((0, 0), radius: 0.07, fill: black)
    } else {
      line((-0.05, -0.05), (0.05, 0.05))
      line((-0.05, 0.05), (0.05, -0.05))
    }

    if name != none {
      let label = eval("$" + name + "$")
      content((0, 0), label, anchor: anch, padding: 3pt)
    }
  })

  if id != none {
    hide(circle(pos, radius: 0, name: id))
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
#let derivation(pos, rot: 0deg, width: 5, inset: 1, i: none, tense: none, name: none, ..elems) = {
  import draw: *

  let elems = elems.pos()

  group(name: name, {
    translate(pos)
    rotate(rot)

    anchor("l", (-width/2, 0))
    anchor("r", (width/2, 0))

    node((-width/2 + 1, 0), id: "ln", round: true)
    node((width/2 - 1, 0), id: "rn", round: true) 

    fil("l", "ln", i: i)
    fil("r", "rn", i: i)

    if tense != none {
      tension("l", "r", (0, inset * (elems.len())/2), tense, size: width/4)
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

#let serie(pos, rot: 0deg, tense: none, i: none, name: none, ..elems) = {
  import draw: *

  let elems = elems.pos()
}
