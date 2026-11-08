#import "theme.typ": *

// ============================================================
// Header & Footer Helpers
// ============================================================

#let note-header = context {
  let headings = query(selector(heading.where(level: 1)).before(here()))
  let current-title = if headings.len() > 0 {
    let last = headings.last()
    text(size: 8.5pt, fill: luma(100), font: heading-font)[
      #if last.numbering != none {
        numbering(last.numbering, ..counter(heading).at(last.location()))
        [ ]
      }
      #last.body
    ]
  } else { none }

  grid(
    columns: (1fr, auto),
    align: (left + bottom, right + bottom),
    current-title,
    text(size: 8.5pt, fill: luma(120), font: heading-font)[Commutative Algebra],
  )
  v(-0.4em)
  line(length: 100%, stroke: 0.4pt + stroke-color)
}

#let note-footer(pattern) = align(center)[
  #text(size: 9pt, fill: luma(100), font: heading-font, context counter(page).display(pattern))
]

#let section-page-content(show-first, content) = context {
  if show-first or counter(page).get().first() > 1 { content }
}

// ============================================================
// Section Environments (Frontmatter / Mainmatter / Appendix)
// ============================================================

#let section-pages(pattern, restart: true, show-first: false, body) = {
  set page(
    numbering: pattern,
    header: section-page-content(show-first, note-header),
    footer: section-page-content(show-first, note-footer(pattern)),
  )
  if restart { counter(page).update(1) }
  body
}

#let frontmatter(body) = {
  set heading(numbering: none)
  section-pages("i", body)
}

#let mainmatter(body) = {
  set heading(numbering: "1.1")
  section-pages("1", {
    counter(heading).update(0)
    body
  })
}

#let appendix(body) = {
  set heading(numbering: "A.1")
  show heading: set heading(outlined: false, bookmarked: true)
  show heading.where(level: 1): set heading(outlined: true)
  section-pages("1", restart: false, show-first: true, {
    counter(heading).update(0)
    body
  })
}

// ============================================================
// Main Template: math-note
// ============================================================

#let math-note(
  title: none,
  subtitle: none,
  author: none,
  date: none,
  version: none,
  logo: none,
  body,
) = {
  // Document metadata
  set document(
    title: if title != none { title } else { "" },
    author: if author != none { author } else { () },
    date: date,
  )

  // Page geometry & styling
  set page(
    paper: "a4",
    margin: (x: 2.2cm, top: 2.6cm, bottom: 2.3cm),
    header: section-page-content(false, note-header),
    footer: section-page-content(false, note-footer("1")),
  )

  // Typography
  set text(
    lang: "en",
    font: body-font,
    size: 10.5pt,
    fallback: true,
  )

  set par(
    justify: true,
    leading: 0.75em,
    spacing: 1.0em,
    first-line-indent: 0em,
  )

  set block(spacing: 1.0em)

  // Heading styles
  show heading: set text(font: heading-font, fill: primary-color)

  // Level 1: Chapter
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    pagebreak(weak: true)
    v(0.6em)
    it
    v(0.8em)
  }

  // Level 2: Section
  show heading.where(level: 2): it => {
    v(1.0em, weak: true)
    it
    v(0.5em)
  }

  // Level 3: Subsection
  show heading.where(level: 3): it => {
    v(0.8em, weak: true)
    text(font: heading-font, size: 11pt, weight: "bold", fill: secondary-color)[#it]
    v(0.4em)
  }

  // Equation numbering by chapter: (1.1), (1.2)...
  set math.equation(numbering: n => {
    numbering("(1.1)", counter(heading).get().first(), n)
  })

  // Code blocks & Links
  show raw: set text(font: code-font)
  show raw.where(block: true): it => block(
    width: 100%,
    fill: fill-color,
    stroke: 0.5pt + stroke-color,
    inset: 1em,
    radius: 3pt,
    it,
  )
  show link: set text(fill: link-color)
  show link: it => underline(it)

  // Title page
  if title != none {
    v(14mm)
    align(center)[
      #text(font: heading-font, size: 28pt, weight: "bold", fill: primary-color, title)
      #if subtitle != none {
        v(0.6em)
        text(font: heading-font, size: 13.5pt, weight: "medium", fill: secondary-color, subtitle)
      }
      #if author != none {
        v(0.8em)
        text(font: heading-font, size: 11.5pt, fill: luma(80), author)
      }

      #v(1fr)
      #if logo != none { logo }
      #v(1.3fr)

      #if version != none or date != none {
        let bottom-items = ()
        if version != none {
          bottom-items.push(text(font: heading-font, size: 10pt, weight: "medium", fill: luma(90), version))
        }
        if date != none {
          let date-str = if type(date) == datetime { date.display("[year].[month].[day]") } else { str(date) }
          bottom-items.push(text(font: heading-font, size: 10pt, fill: luma(110), date-str))
        }
        bottom-items.join([ #h(1.2em) | #h(1.2em) ])
        v(8mm)
      }
    ]
  }

  body
}
