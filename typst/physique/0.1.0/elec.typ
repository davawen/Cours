#import "utils.typ": *

#let tenselr(label, rev: false, size: 0) = {
  (label: label, rev: rev, size: size)
}

#let tenserl(label, rev: false, size: 0) = {
  (label: label, rev: not rev, size: size)
}

#let tension(from, to, offset, tense, size: 0.7) = {
  import draw: *

  let midpoint = (from, 50%, to)

  let from = (midpoint, size + tense.size, from)
  let to = (midpoint, size + tense.size, to)

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

#let resistor(pos, rot: 0deg, u: none, label: none, name: none, size: 0.5) = {
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

    if u != none {
      tension("l", "r", (0, -0.6), u)
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
        content((rel: (0, 0.8em), to: "__first.50%"), intensity)
      }
    }
  } else {
    for (a, b) in points.chunks(2, exact: true) {
      line(a, b, name: "__first")
      if intensity != none {
        mark("__first.50%", "__first.51%", symbol: ">", fill: black)
        content((rel: (0, 0.8em), to: "__first.50%"), intensity)
      }
    }
  }
}

#let ground(pos, rot: 0deg, name: none) = {
  import draw: *
  group(name: name, {
    translate(pos)
    rotate(rot)

    anchor("l", (0, 0))
    anchor("r", (0, 0))

    line((0, 0), (0, -0.5))
    line((-0.3, -0.5), (0.3, -0.5))
    line((-0.2, -0.6), (0.2, -0.6))
    line((-0.1, -0.7), (0.1, -0.7))
  })
}

#let node(pos, offset: (-0.5em, 0.8em), id: none, name: none, round: false) = {
  import draw: *
  if id == none {
    id = name
  }

  group(name: id, {
    translate(pos)
    if round {
      circle((0, 0), radius: 0.07, fill: black)
    }

    anchor("default", (0, 0))

    if name != none {
      let label = eval("$" + name + "$")
      content(offset, label)
    }
  })
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

#let elem-letter(pos, letter: $G$, rot: 0deg, u: none, name: none) = {
  import draw: *

  group(name: name, {
    translate(pos)
    rotate(rot)

    circle((0, 0), radius: 0.4)
    content((0, 0), letter)

    anchor("l", (-0.4, 0))
    anchor("r", (0.4, 0))

    if u != none {
      tension("l", "r", (0, -0.6), u)
    }
  })
}

#let generateur = elem-letter.with(letter: $G$)
#let voltmetre = elem-letter.with(letter: $V$)
#let amperemetre = elem-letter.with(letter: $A$)

#let source-ideale(pos, rot: 0deg, label: none, u: none, name: none) = {
  import draw: *

  group(name: name, {
    translate(pos)
    rotate(rot)

    circle((0, 0), radius: 0.4)

    anchor("l", (-0.4, 0))
    anchor("r", (0.4, 0))

    line("l", "r")
    if label != none {
      tension("l", "r", (0, 0.6), label, size: 0.4)
    }
    if u != none {
      tension("l", "r", (0, -0.6), u)
    }
  })
}

#let source-ideale-courant(pos, rot: 0deg, label: none, u: none, name: none) = {
  import draw: *

  group(name: name, {
    translate(pos)
    rotate(rot)

    circle((0, 0), radius: 0.4)

    anchor("l", (-0.4, 0))
    anchor("r", (0.4, 0))

    line((0, 0.4), (0, -0.4))
    if label != none {
      tension("l", "r", (0, 0.6), label, size: 0.4)
    }
    if u != none {
      tension("l", "r", (0, -0.6), u)
    }
  })
}

#let bobine(pos, rot: 0deg, coils: 4, u: none, label: none, name: none) = {
  import draw: *

  group(name: name, {
    translate(pos)
    rotate(rot)

    anchor("l", (-0.3*(coils/2+1), 0))
    anchor("r", (0.3*(coils/2+1), 0))

    if label != none {
      content((0, 0.5), label)
    }

    if u != none {
      tension("l", "r", (0, -0.5), u)
    }

    line("l", (-0.3*coils/2, 0))
    line("r", (0.3*coils/2, 0))

    translate((-0.3*(coils/2) + 0.3, 0))

    for i in range(coils) {
      arc((0, 0), start: 0deg, stop: 180deg, radius: 0.15)
      translate((0.3, 0))
    }
  })
}

#let condensateur(pos, rot: 0deg, u: none, name: none) = {
  import draw: *
  group(name: name, {
    translate(pos)
    rotate(rot)

    let (plus, minus) = (0.1, -0.1)

    line((minus, -0.5), (minus, 0.5))
    line((plus, -0.5), (plus, 0.5))

    line((minus, 0), (3*minus, 0))
    line((plus, 0), (3*plus, 0))

    anchor("l", (3*minus, 0))
    anchor("r", (3*plus, 0))

    if (u != none) {
      tension("l", "r", (0, 0.7), u)
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
    translate(pos)
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
    translate(pos)
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
