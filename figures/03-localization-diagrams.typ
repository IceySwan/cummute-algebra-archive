// Commutative diagrams for the commutative algebra notes.
// Source: Ch3 §3.1, the universal property of S^{-1}A and of S^{-1}M, and the
// naturality of S^{-1}M ⊗_{S^{-1}A} S^{-1}N ≅ S^{-1}(M ⊗_A N).
//
// Usage from a chapter file:
//   #import "../figures/03-localization-diagrams.typ": (
//     localized-tensor-square-diagram,
//     module-localization-universal-diagram,
//     ring-localization-universal-diagram,
//   )

#import "@preview/commute:0.3.0": arr, commutative-diagram, node
#import "/styles/operator.typ": otimes

// Ring version: every g: A -> B inverting S factors uniquely through f.
#let ring-localization-universal-diagram() = align(center, commutative-diagram(
  node((0, 0), [$A$]),
  node((0, 2), [$S^(-1)A$]),
  node((1, 1), [$B$]),
  arr((0, 0), (0, 2), [$f$]),
  arr((0, 0), (1, 1), [$g$]),
  arr((0, 2), (1, 1), [$h$]),
))

// Module version: the A-linear map M -> S^{-1}M has the same universal property
// among A-linear maps from M to S^{-1}A-modules.
#let module-localization-universal-diagram() = align(center, commutative-diagram(
  node((0, 0), [$M$]),
  node((0, 2), [$S^(-1)M$]),
  node((1, 1), [$P$]),
  arr((0, 0), (0, 2), [$iota$]),
  arr((0, 0), (1, 1), [$g$]),
  arr((0, 2), (1, 1), [$h$]),
))

// Naturality square for f: M -> M' and g: N -> N'.
#let localized-tensor-square-diagram() = align(center, commutative-diagram(
  node((0, 0), [$S^(-1)M otimes_(S^(-1)A) S^(-1)N$]),
  node((0, 2), [$S^(-1)(M otimes_A N)$]),
  node((1, 0), [$S^(-1)M' otimes_(S^(-1)A) S^(-1)N'$]),
  node((1, 2), [$S^(-1)(M' otimes_A N')$]),
  arr((0, 0), (0, 2), [$F$]),
  arr((0, 0), (1, 0), [$S^(-1)f otimes S^(-1)g$]),
  arr((0, 2), (1, 2), [$S^(-1)(f otimes g)$]),
  arr((1, 0), (1, 2), [$F'$]),
))