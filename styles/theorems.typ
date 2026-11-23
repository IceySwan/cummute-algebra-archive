// ============================================================
// Theorem Environments Interface
// Decoupled from operators; wraps Theorion with clean academic styling
// ============================================================

#import "@preview/theorion:0.6.0": *
// The clouds theme provides quiet, elegant, academic-toned frames
#import cosmos.clouds: *
#import "theme.typ": primary-color, secondary-color, tint

// Corollaries share the theorem sequence, so they display as
// chapter.section.number (e.g. Corollary 3.8.3) instead of gaining an
// extra counter level. The clouds default uses `inherited-from:
// theorem-counter`, which appends a fourth number.
#let (_, _, corollary, show-corollary-fixed) = make-frame(
  "corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter,
  render: render-fn.with(fill: tint),
)

// Appendix corollaries share the section-level theorem sequence.
#let (_, _, appendix-corollary, show-appendix-corollary) = make-frame(
  "appendix-corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter,
  render: render-fn.with(fill: tint),
)

/// Unified show rule that activates all Theorion environments
/// and our fixed corollary/appendix-corollary show rules.
#let show-theorems(body) = {
  show: show-theorion
  show: show-corollary-fixed
  show: show-appendix-corollary
  body
}
