// Inclusion diagram for the primary decomposition of a = (x^2, x y) in k[x, y].
// Source: Ch4 §4.2, the example after the first uniqueness theorem and the
// remark on minimal and embedded associated primes.
//
// The five nodes form a sublattice of the ideal lattice: a, the two primary
// components q1, q2, their sum q1 + q2 = (x, y^2), and the radical (x, y).
// The interval [a, (x, y)] itself is infinite, so no full Hasse diagram is drawn.
//
// Usage from a chapter file:
//   #import "../figures/04-associated-primes.typ": associated-primes-diagram
//   ...
//   #associated-primes-diagram()

#import "@preview/cetz:0.4.2": canvas, draw

#let associated-primes-diagram() = align(center, canvas({
  import draw: *

  let edge(a, b) = line(a, b, stroke: 0.75pt + black)

  // Math nodes (pure formulas, perfect symmetry)
  content((0, 3.0), [$(x, y)$], name: "top")
  content((0, 2.0), [$(x, y^2) = frak(q)_1 + frak(q)_2$], name: "join")
  content((-2.3, 1.0), [$frak(q)_1 = (x)$], name: "left")
  content((2.3, 1.0), [$frak(q)_2 = (x, y)^2$], name: "right")
  content((0, 0), [$frak(a) = (x^2, x y) = frak(q)_1 inter frak(q)_2$], name: "bottom")

  // Inclusions between ideal nodes
  edge("bottom", "left")
  edge("bottom", "right")
  edge("left", "join")
  edge("right", "join")
  edge("join", "top")

  // Explanatory annotations in academic italic
  content("top.east", text(size: 7.5pt, style: "italic")[ #h(0.5em) (embedded prime)], anchor: "west")
  content("left.west", text(size: 7.5pt, style: "italic")[(minimal prime) #h(0.5em)], anchor: "east")
  content("right.east", text(size: 7.5pt, style: "italic")[ #h(0.5em) ($(x,y)$-primary)], anchor: "west")
}))
