#import "theme.typ": *
#import "theorems.typ": show-theorems, set-theorion-numbering

// ============================================================
// Header & Footer Helpers
// ============================================================

#let note-header = context {
  let here-page = here().page()
  // Suppress header on any page containing a level-1 heading (e.g. Chapter start)
  let has-h1-on-page = query(heading.where(level: 1)).any(h => h.location().page() == here-page)
  if has-h1-on-page { return none }

  let h1s = query(selector(heading.where(level: 1)).before(here()))
  let last-h1 = if h1s.len() > 0 { h1s.last() } else { none }

  let right-title = if last-h1 != none {
    text(size: 8.5pt, fill: luma(100), font: heading-font)[
      #if last-h1.numbering != none {
        numbering(last-h1.numbering, ..counter(heading).at(last-h1.location()))
        [ ]
      }
      #last-h1.body
    ]
  } else { none }

  // Level-2 heading in the current chapter (either starting on this page or preceding it)
  let h2-on-page = query(heading.where(level: 2)).filter(h => h.location().page() == here-page)
  let last-h2 = if h2-on-page.len() > 0 {
    h2-on-page.first()
  } else if last-h1 != none {
    let h2s = query(selector(heading.where(level: 2)).after(last-h1.location()).before(here()))
    if h2s.len() > 0 { h2s.last() } else { none }
  } else {
    none
  }

  let author = document.author.join(", ")
  let running-title = if author == "" {
    document.title
  } else if document.title == none {
    author
  } else {
    [#author: #document.title]
  }

  let left-title = if last-h2 != none {
    text(size: 8.5pt, fill: luma(100), font: heading-font)[
      #if last-h2.numbering != none {
        numbering(last-h2.numbering, ..counter(heading).at(last-h2.location()))
        [ ]
      }
      #last-h2.body
    ]
  } else {
    text(size: 8.5pt, fill: luma(120), font: heading-font, running-title)
  }

  grid(
    columns: (1fr, 1fr),
    align: (left + bottom, right + bottom),
    left-title,
    align(right + bottom, right-title),
  )
  v(-0.4em)
  line(length: 100%, stroke: 0.4pt + stroke-color)
}

#let note-footer(pattern) = align(center)[
  #text(size: 9pt, fill: luma(100), font: heading-font, context counter(page).display(pattern))
]

// ============================================================
// Section Environments (Frontmatter / Mainmatter / Appendix)
// ============================================================

#let frontmatter(body) = {
  set page(
    numbering: "i",
    header: note-header,
    footer: note-footer("i"),
  )
  counter(page).update(1)
  set heading(numbering: none)
  body
}

#let mainmatter(body) = {
  set page(
    numbering: "1",
    header: note-header,
    footer: note-footer("1"),
  )
  counter(page).update(1)
  set heading(numbering: (..nums) => {
    let list = nums.pos()
    if list.len() <= 2 {
      numbering("1.1", ..list)
    }
  })
  show heading.where(level: 1): set heading(supplement: [Chapter])
  show heading.where(level: 2): set heading(supplement: [Section])
  counter(heading).update(0)
  body
}

#let appendix(body) = {
  set page(
    header: note-header,
    footer: note-footer("1"),
  )
  set heading(numbering: "A.1")
  show heading: set heading(outlined: false, bookmarked: true)
  show heading.where(level: 1): set heading(outlined: true)
  show heading.where(level: 2): set heading(outlined: true)
  counter(heading).update(0)
  set-theorion-numbering("A.1.1")
  body
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
  paper: "a4",
  margin: (x: 2.2cm, top: 2.6cm, bottom: 2.3cm),
  equation-numbering: "(1.1)",
  theorems: true,
  body,
) = {
  set document(
    title: if title != none { title } else { "" },
    author: if author != none { author } else { () },
    date: date,
  )

  set page(
    paper: paper,
    margin: margin,
    header: none,
    footer: none,
  )

  set text(
    font: body-font,
    size: 10.5pt,
    fill: text-color,
    spacing: 120%,
    lang: "en",
  )

  set par(
    leading: 0.75em,
    linebreaks: "optimized",
    first-line-indent: (amount: 1.5em, all: false),
    justify: true,
  )

  show link: set text(fill: link-color)
  show ref: set text(fill: link-color)

  // Raw code styling
  show raw: set text(font: code-font, size: 9pt)
  show raw.where(block: false): box.with(
    fill: fill-color,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw.where(block: true): block.with(
    fill: fill-color,
    inset: 8pt,
    radius: 4pt,
    width: 100%,
    stroke: 0.5pt + stroke-color,
  )

  // Unified heading rules with clean vertical rhythm
  show heading: it => {
    set text(font: heading-font, fill: primary-color)
    if it.level == 1 {
      if equation-numbering != none {
        counter(math.equation).update(0)
      }
      pagebreak(weak: true)
      v(1.8em)
      text(size: 18pt, it)
      v(1.4em)
    } else if it.level == 2 {
      v(1.2em)
      text(size: 13pt, it)
      v(0.6em)
    } else if it.level == 3 {
      v(0.9em)
      text(size: 11pt, it)
      v(0.4em)
    } else {
      v(0.6em)
      text(size: 10.5pt, it)
      v(0.3em)
    }
  }

  // Chapter-based equation numbering (e.g. (1.1) or (A.1))
  set math.equation(numbering: if equation-numbering != none {
    n => {
      let h1s = query(selector(heading.where(level: 1)).before(here()))
      let last-h1 = if h1s.len() > 0 { h1s.last() } else { none }
      if last-h1 != none and last-h1.numbering != none {
        let ch-str = numbering(last-h1.numbering, counter(heading).at(last-h1.location()).first())
        [(#ch-str.#n)]
      } else {
        [(#n)]
      }
    }
  } else { none })

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

  if theorems {
    show: show-theorems
    body
  } else {
    body
  }
}
