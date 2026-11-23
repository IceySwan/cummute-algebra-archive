// Commutative diagrams for the commutative algebra notes.
// Sources: Ch2 §2.6 (snake lemma) and Ch2 §2.7 (universal property of M ⊗_A N).
//
// Usage from a chapter file:
//   #import "../figures/02-modules-diagrams.typ": snake-lemma-diagram, tensor-universal-diagram


#import "@preview/commute:0.3.0": arr, commutative-diagram, node
#import "/styles/operator.typ": otimes

#let snake-lemma-diagram() = align(center, commutative-diagram(
  node((0, 0), [$0$]),
  node((0, 1), [$M'$]),
  node((0, 2), [$M$]),
  node((0, 3), [$M''$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$N'$]),
  node((1, 2), [$N$]),
  node((1, 3), [$N''$]),
  node((1, 4), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$u$]),
  arr((0, 2), (0, 3), [$v$]),
  arr((0, 3), (0, 4), []),
  arr((0, 1), (1, 1), [$f'$]),
  arr((0, 2), (1, 2), [$f$]),
  arr((0, 3), (1, 3), [$f''$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$u'$]),
  arr((1, 2), (1, 3), [$v'$]),
  arr((1, 3), (1, 4), []),
))

// Universal property of M ⊗_A N: every A-bilinear b: M × N -> P factors
// uniquely through the universal bilinear map g.
#let tensor-universal-diagram() = align(center, commutative-diagram(
  node((0, 0), [$M times N$]),
  node((0, 2), [$M otimes_A N$]),
  node((1, 1), [$P$]),
  arr((0, 0), (0, 2), [$g$]),
  arr((0, 0), (1, 1), [$b$]),
  arr((0, 2), (1, 1), [$h$]),
))
