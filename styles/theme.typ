// ============================================================
// Note Theme: Fonts, Palettes & Visual Design Tokens
// ============================================================

#let cjk-font-stack(latin, ..cjk) = (
  latin,
  ..cjk.pos(),
)

// 1. Fonts Configuration (with robust cross-platform fallbacks)
#let heading-font = (
  "Source Sans 3",
  "Noto Sans CJK SC",
  "Source Han Sans SC",
  "Microsoft YaHei",
)

#let body-font = (
  "Source Serif 4",
  "Noto Serif CJK SC",
  "Source Han Serif SC",
  "SimSun",
)

#let code-font = (
  "Maple Mono NF",
  "Consolas",
)

// 2. Brand & Semantic Colors (Academic Navy Palette)
#let primary-color = rgb("#1b365d")   // Deep Academic Navy
#let secondary-color = rgb("#2b6cb0") // Steel Blue
#let link-color = rgb("#1d65a6")      // Academic Link Blue
#let alert-color = rgb("#d9381e")     // Academic Crimson for Highlights & Singularities
#let text-color = rgb("#222222")      // Charcoal Reading Text
#let stroke-color = luma(215)         // Light Structural Stroke
#let fill-color = luma(248)           // Neutral Light Background

// 3. Shared Tokens for Geometric Figures & Diagrams
#let ink = primary-color
#let accent = secondary-color
#let guide = stroke-color.darken(28%)
#let tint = primary-color.lighten(92%)
#let accent-tint = secondary-color.lighten(91%)
#let fig-font-size = 7.5pt
