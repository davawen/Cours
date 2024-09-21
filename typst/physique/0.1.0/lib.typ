#import "@preview/cetz:0.2.2"
#import cetz: draw, canvas, vector

#let def(x) = underline([*#x*])
#let ov = math.overline

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

#let point(pos, value: [], anchor: "south", color: black, padding: 5pt, name: none) = {
  import draw: circle, content
  circle(pos, radius: 2pt, stroke: color, fill: color, name: name)
  content(pos, value, anchor: anchor, padding: padding)
}

#let half_mark = (end: "straight", pos: -63%)

#let template(doc) = {
  show figure.caption: emph

  set heading(numbering: "1.1.1)")
  doc
}

#let resultb(c) = align(center, (box(c, inset: 0.7em, stroke: rgb("#ee3050"))))
#let titleb(c) = align(center, box(text(c, size: 2em), inset: 1em, stroke: black))

#let infobox(symbol: none, info_text: "", color: black) = c => [
  #pad(left: 2em, box(stroke: color, width: 80%, inset: 10pt, [
    #text(fill: color, [#symbol #info_text]) \ 
    #c
  ]))
  #parbreak()
]

#let note = infobox(symbol: $Phi$, info_text: "Note:", color: blue)
#let tip = infobox(symbol: $checkmark$, info_text: "Tip:", color: green)
// #let important = infobox(symbol: )
#let warn = infobox(symbol: $triangle.stroked.nested$, info_text: "Warn:", color: orange)
