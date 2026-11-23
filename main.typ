#import "/styles/lib.typ": *
#import "/assets/atiyah-commute-cover.typ": commutative-algebra-logo

#show: math-note.with(
  title: "Commutative Algebra",
  subtitle: "Lecture Notes & Revision Guide",
  author: "XNC",
  date: datetime(year: 2026, month: 11, day: 23),
  version: "v0.26.3",
  logo: commutative-algebra-logo(),
)

#frontmatter[
  #heading(numbering: none, level: 1)[Preface]
  Written in spring 2025 and first updated in June 2025. Revised on 2026-11-23.
  - Professor: 丁岩峭
  - Textbook: M.F. Atiyah and I.G. Macdonald, _Introduction to Commutative Algebra_, Addison-Wesley.
  - Supplement: https://byeongsuyu.github.io/_pdf/Atiyah_Macdonald_Supplement.pdf
  - Arrangement: the chapters follow the textbook; examples and proofs are expanded for revision.
  - Exam scope: The first ten questions from the assignments for chapters 1–4.

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
