#let conf(
  homework: none,
  lecture: none,
  author: [ B13902105 卓育安 ],
  page: context [ #counter(page).display("1/1", both: true) ], // https://typst.app/docs/guides/page-setup-guide/#custom-footer-with-page-numbers
  doc
) = {
  // fonts
  show regex("[\p{scx:Han}]"): set text(font: "Noto Serif CJK SC") // https://github.com/typst/typst/issues/794

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
  ///// content /////
  doc
}

///// table /////
#import "@preview/pillar:0.3.1"

///// theorem /////
// https://raw.githubusercontent.com/typst/packages/main/packages/preview/ctheorems/1.1.3/assets/manual.pdf

#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#let definition = thmbox( "definition", "Definition" ).with(base: none, breakable: true)
#let remark = thmbox( "remark", "Remark" ).with(base: none, breakable: true)
#let problem = thmbox( "problem", "Problem" ).with(base: none, breakable: true)
#let claim = thmbox( "claim", "Claim" ).with(base: none, breakable: true)
#let lemma = thmbox( "lemma", "Lemma" ).with(base: none, breakable: true)
#let proof = thmproof("proof", "Proof")
#let sol = thmproof("sol", "Solution")

///// math /////
#show math.equation: set block(breakable: true) // https://github.com/typst/typst/pull/4226#issue-2311216543
#show math.equation.where(block: false): math.display // https://forum.typst.app/t/how-can-i-use-display-mode-for-in-line-math/1179/2
#let ags(x) = $lr(angle.l #x angle.r)$
#let eps = $epsilon$
#let itg = $integral$
#let quad = h(10pt)
#let big(x) = $lr( #x , size: #150%)$

#import "@preview/quick-maths:0.2.1": shorthands
#show: shorthands.with(
  ($*$, $dot$),
  ($...$, $dots.c$),
  ($+-$, $plus.minus$),
  ($-+$, $minus.plus$)
)

///// custom /////
#let pr(x) = [*#x* #quad] 

