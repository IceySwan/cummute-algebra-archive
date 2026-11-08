// ============================================================
// Note Theme: Fonts & Palettes
// ============================================================

#let cjk-font-stack(latin, cjk) = (
  (name: latin, covers: "latin-in-cjk"),
  cjk,
)

// Fonts Configuration (with graceful fallbacks)
#let heading-font = cjk-font-stack("Source Sans 3", "Noto Sans CJK SC")
#let body-font = cjk-font-stack("Source Serif 4", "Noto Serif CJK SC")
#let environment-font = cjk-font-stack("Source Serif 4", "LXGW WenKai")
#let code-font = "Maple Mono NF"

// Brand & Base Colors (Academic Navy Palette)
#let primary-color = rgb("#1b365d")   // Deep Academic Navy
#let secondary-color = rgb("#2b6cb0") // Steel Blue
#let link-color = rgb("#1d65a6")
#let stroke-color = luma(215)
#let fill-color = luma(248)
