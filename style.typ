

// setting up the font families
#let mincho = ((name: "Times New Roman", covers: "latin-in-cjk"), "Harano Aji Mincho")
#let gothic = ((name: "Helvetica", covers: "latin-in-cjk"), "Harano Aji Gothic")
#let mathf = ("Latin Modern Math")
#let codef = ("Noto Mono for Powerline")

// import packages
#import "@preview/equate:0.2.1": equate
#import "@preview/roremu:0.1.0": roremu
#import "@preview/physica:0.9.4": *
#import "@preview/unify:0.7.0": *
#import "@preview/subpar:0.2.0"
#import "@preview/enja-bib:0.1.0": *
#import bib-setting-jsme: *

// import files
#import "local_functions.typ": *

#let init(
  number: [1A1],
  japanese-title: [飛行機シンポジウム講演集原稿書式の見本],
  english-title: [How to Prepare the Paper for the 62st Aircraft Symposium of JSASS],
  author: (
      (
        japanese-name: [航空一郎],
        english-name: [Ichiro Koku],
        is-speaker: true,
      ),
      (
        japanese-name: [宇宙花子],
        english-name: [Hanako Uchu],
        is-speaker: false,
      ),
    ),
  statement: (
    japanese: [日本航空宇宙学会],
    english: [JSASS],
  ),
  keywords: ([Society Activities], [etc...]),
  abstract: [
    This is the manual for how to prepare your manuscript for the 62th Aircraft Symposium of Japan Society for Aeronautical and Space Science (JSASS). All the final drafts should be written by word processors with the format specified in this manual. Your final draft in a form ready for photo-printing must arrive at the Society Head-quarters by 9th August, 2024. Any questions regarding this manual should be addressed to headquarters.
  ],
  body
) = {

  // set the language and text
  set text(lang: "ja", cjk-latin-spacing: auto, fallback: false)

  // paragraph settings
  set par(
    justify: true,
    first-line-indent: (amount: 1em, all: false),
    leading: 0.65em,
    spacing: 1em
  )

  // text settings
  set text(
    size: 9.5pt,
    font: mincho,
    weight: "regular",
  )

  // set page size
  set page(
    paper:"a4",
    margin: (left: 23mm, right: 23mm, top: 25mm, bottom: 25mm),
    columns: 2,
  )

  set columns(2, gutter: 2.6em)

  place(
    top + center,
    scope: "parent",
    float: true,
  )[
      #align(center, text(size: 16pt, number + [　] + japanese-title))

      #set text(size: 10.5pt)
      #v(0.5em)
      #let num = 0
      #for name in author{
        if name.is-speaker{
          sym.circle.big
        }
        name.japanese-name
        if num != author.len() - 1{
          [、]
          num += 1
        }
      }
      （#statement.japanese）

      #v(0.5em)
      #english-title

      #author.map(x => x.english-name).join([, ])
      （#statement.english）

      #v(0.5em)
      Key Words:
      #keywords.join([, ])

      #v(0.5em)
      // Abstract
      #align(center, [Abstract])
      #v(-0.45em)
      #align(left, {
        set par(first-line-indent: 0em)
        abstract
      })
  ]

  // set headings for level 2, 3, 4...
  set heading(numbering: "1.", supplement: [第])
  show heading: (it => {
    set text(font: mincho, size: 9.5pt, weight: "regular")
    set par(first-line-indent: 0em)
    if it.numbering != none{
      let tmp = counter(heading).get().map(x => str(x)).join("．")
      change-number-half-to-full(tmp)
      [　] +it.body
    }
    else{
      it.body
    }
  })

  // set headings for level 1
  show heading.where(level: 1): it => {

    set text(font: mincho, size: 9.5pt, weight: "medium")
    set par(first-line-indent: 0em)

    v(1em)

    if it.numbering != none{
      context {
        let tmp = str(counter(heading).get().at(0))
        change-number-half-to-full(tmp)
      }
      [．] +it.body
    }
    else{
      it.body
    }
  }

  // math settings
  show math.equation: set text(font: mathf)
  show math.equation: set block(spacing: 1em)
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    it
  }
  set math.equation(numbering: num =>
    "(" + str(num) + ")"
  )
  /* show math.equation.where(block: true): set align(left)// set block equation align
  show math.equation.where(block: true): it => {// set block equation space
    grid(
      columns: (2em, auto),
      [],it
    )
  } */
  show: equate.with(breakable: true, number-mode: "line")
  show math.equation.where(block: false): it => {
    let ghost = hide(text(font: "Adobe Blank", "\u{375}")) // 欧文ゴースト
    ghost; it; ghost
  }

  // figure settings
  set figure.caption(separator: [　])
  show figure: set block(breakable: true)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: raw): set figure.caption(position: top)
  show figure.where(kind: raw): set figure(supplement: [コード])
  set figure(numbering: num =>
    figure-number(num)
  )

  set table(stroke: none)
  set table.hline(stroke: 0.5pt)
  set table.vline(stroke: 0.5pt)
  // code settings
  show raw.where(block: true): it => {
    set text(font: codef)
      set table(stroke: (x, y) => (
        //left: if x == 1 { 0.5pt } else { 0pt },
        //right: if x == 1 { 0.5pt } else { 0pt },
        top: if y == 0 and x == 1{ 0.5pt } else { 0pt },
        bottom: if x == 1 { 0.5pt } else { 0pt },
      ))
      table(
        columns: (5%, 95%),
        align: (right, left),
        ..for value in it.lines {
          (text(fill: black,str(value.number)), value)
        }
      )
  }
  show raw.where(block: false): it =>{
    set text(font: codef)
    h(0.5em)
    it
    h(0.5em)
  }

  // list settings
  set list(indent: 2em, body-indent: 0.75em, spacing: 1em, marker: ([•]))
  set enum(indent: 2em, body-indent: 0.75em, spacing: 1em)

  // underline settings
  set underline(offset: 2pt)

  // footnote settings
  let footnote-numbering(.., last) = "*" * last
  set footnote(numbering: footnote-numbering)

  // set vertical space
  v(-1em)

  // set bibliography
  show: bib-init

  // change number size
  let cjk-number = regex("[０-９]")
  show cjk-number: it => text(size: 0.95em, it.text.match(cjk-number).text)

  // set CJK spacing
  let cjkre = regex("([\u3000-\u303F\u3040-\u30FF\u31F0-\u31FF\u3200-\u9FFF\uFF00-\uFFEF][　！”＃＄％＆’（）*+，−．／：；＜＝＞？＠［＼］＾＿｀｛｜｝〜、。￥・]*)[ ]+([\u3000-\u303F\u3040-\u30FF\u31F0-\u31FF\u3200-\u9FFF\uFF00-\uFFEF])[ ]*")
  show cjkre: it => it.text.match(cjkre).captures.sum()

  body
}
