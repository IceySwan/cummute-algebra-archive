#import "styles/lib.typ": *
#import "styles/operator.typ": *
#import "assets/logo.typ": algebra-logo

#show: show-theorion

#show: math-note.with(
  title: "Commutative Algebra",
  subtitle: "Lecture Notes & Revision Guide",
  author: "XNC",
  date: datetime(year: 2026, month: 11, day: 8),
  version: "v0.26.2",
  logo: algebra-logo(size: 9.2cm),
)

#frontmatter[
  #heading(numbering: none, level: 1)[Preface]
  Written in spring 2025 and first updated in June 2025. Revised on 2026-11-08.
  - Professor: 丁岩峭
  - Textbook: M.F. Atiyah and I.G. Macdonald, _Introduction to Commutative Algebra_, Addison-Wesley.
  - Supplement: https://byeongsuyu.github.io/_pdf/Atiyah_Macdonald_Supplement.pdf
  - Exam scope: The first ten questions from the assignments for the chapter 1-4.

  #align(right)[XNC 于 ZZU 2025.06.25]

  #v(1.5em)
  #outline(title: "Contents", depth: 2, indent: auto)
]

#mainmatter[
  #include "contents/01-ring.typ"
  #include "contents/02-modules.typ"
  #include "contents/03-localization.typ"
  #include "contents/04-primary-decomposition.typ"
]
