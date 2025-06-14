///// table /////
#import "@preview/pillar:0.3.1"

///// theorem /////
#import "@preview/lemmify:0.1.8": *

#let (
  theorem, lemma, corollary, remark, proposition, example,
  rules: thm-rules
) = default-theorems("thm-group",
  lang: "en",
  thm-numbering: thm-numbering-linear
)

#let (claim, rules: claim-rules) = new-theorems("thm-group-claim",
  ("claim": "Claim"),
  thm-numbering: thm-numbering-linear
)

#let (proof, rules: proof-rules) = new-theorems("thm-group-proof",
  ("proof": "Proof."),
  thm-numbering: thm-numbering-proof,
  thm-styling: thm-style-proof
)

#let (sol, rules: sol-rules) = new-theorems("thm-group-proof",
  ("sol": "Solution."),
  thm-numbering: thm-numbering-proof,
  thm-styling: thm-style-proof
)

#let (case, rules: case-rules) = new-theorems("thm-group-case",
  ("case": "Case"),
  thm-numbering: thm-numbering-linear
)

///// math /////

#let ags(..x) = $lr(angle.l #x.pos().join($,$) angle.r)$
#let eps = math.epsilon
#let itg = math.integral
#let quad = h(10pt)
#let big(..x) = math.lr(..x, size: 150%)
#let pmod(..x) = $#h(5pt) (mod #x.pos().join($,$))$
#let aligned(..x) = math.cases(delim: none, ..x)

///// title /////
// https://github.com/npikall/rubber-article/blob/main/src/constructors.typ

#let maketitle(
  /// The title of the document.
  /// -> string | content
  title,
  /// The authors of the document.
  /// -> array
  authors: ("卓育安",),
  /// The date of the document.
  /// -> string | content | datetime
  date: datetime.today().display("[month repr:long] [day], [year]"),
) = {
  // Author information.

  let authors-text = {
    set text(size: 1.1em)
    pad(
      top: 0.5em,
      bottom: 0.5em,
      x: 2em,
      grid(
        columns: (1fr,) * calc.min(3, authors.len()),
        gutter: 1em,
        ..authors.map(author => align(center, author)),
      ),
    )}
    // Frontmatter

    align(center)[
      #v(60pt)
      #block(text(weight: 400, 18pt, title))
      #v(1em, weak: true)
      #authors-text
      #v(1em, weak: true)
      #block(text(weight: 400, 1.1em, date))
      #v(20pt)
    ]
  }

///// custom /////

#let pr(x) = [*#x* #quad] 

#import "@preview/quick-maths:0.2.1": shorthands
#let conf(
  homework: none,
  lecture: none,
  author: [ B13902105 卓育安 ],
  page: context [ #counter(page).display("1/1", both: true) ], // https://typst.app/docs/guides/page-setup-guide/#custom-footer-with-page-numbers
  doc
) = {
  // fonts
  set text(font: "Noto Serif CJK TC")

  ///// fancy header & footer /////

  import "@preview/chic-hdr:0.5.0": *
  show: chic.with( // https://typst.app/universe/package/chic-hdr/
    chic-footer(
      left-side: author,
      right-side: page
    ),
    chic-header(
      left-side: homework,
      right-side: lecture
    ),
    chic-separator(1pt),
    chic-offset(7pt),
    chic-height(1.5cm)
  )
  
  ///// theorem /////
  show: thm-rules
  show: claim-rules
  show: proof-rules
  show: sol-rules
  show: case-rules

  ///// math /////
  
  show math.equation: set block(breakable: true) // https://github.com/typst/typst/pull/4226#issue-2311216543
  show math.equation.where(block: false): math.display // https://forum.typst.app/t/how-can-i-use-display-mode-for-in-line-math/1179/2

  show: shorthands.with(
    ($*$, $dot$),
    ($...$, $dots.c$),
    ($+-$, $plus.minus$),
    ($-+$, $minus.plus$),
    ($||$, $mid(\|)$)
  )

  ///// update /////
  show smallcaps: set text(font: ()) // https://github.com/typst/typst/issues/3138
  show link: set text(fill: blue)
  
  ///// content /////
  doc
}

