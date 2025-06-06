#import "@preview/cjk-unbreak:0.1.0": *
#import "@preview/touying:0.6.1": utils

#let cn-char = "\p{Han}；：！？…—"
#let jp-char = "\p{Hiragana}\p{Katakana}"
#let cjk-char-regex = regex("[" + cn-char + jp-char + "]")

#let ends-with-cjk(it) = (
  it != none
    and (
      (it.has("text") and it.text.ends-with(cjk-char-regex)) or (it.has("body") and ends-with-cjk(it.body))
    )
)

#let start-with-cjk(it) = (
  it != none
    and (
      (it.has("text") and it.text.starts-with(cjk-char-regex)) or (it.has("body") and start-with-cjk(it.body))
    )
)

#let is-text(it) = (
  it != none and it.func() == text
)

#let insert-cjk-math-space(rest) = {
  rest = transform-childs(rest, insert-cjk-math-space)
  if utils.is-sequence(rest) {
    let first = none
    for mid in rest.children {
      // first, mid, third
      if mid.func() == math.equation and is-text(first) and (ends-with-cjk(first)) {
        first
        h(0.25em, weak: true)

      }
      else if (first != none and first.func() == math.equation) and is-text(mid) and (start-with-cjk(mid)) {
        first
        h(0.25em, weak: true)
      }
      else{
        first
      }
      first = mid
    }
    first
  } else {
    rest
  }
}

// --------------------------------------------------
// local functions
// --------------------------------------------------

#let change-number-half-to-full(text) = {
  text = text.replace("0", "０")
  text = text.replace("1", "１")
  text = text.replace("2", "２")
  text = text.replace("3", "３")
  text = text.replace("4", "４")
  text = text.replace("5", "５")
  text = text.replace("6", "６")
  text = text.replace("7", "７")
  text = text.replace("8", "８")
  text = text.replace("9", "９")

  return text
}

#let figure-number(it) = {
  let arr = (1, 2, 3, 4, 5, 6, 7, 8, 9)
  if arr.contains(it) {
    return change-number-half-to-full(str(it))
  }
  else{
    return str(it)
  }
}

#let tblr(
  ..body,
  columns: auto,
  rows: auto,
  gutter: auto,
  column-gutter: auto,
  row-gutter: auto,
  align: auto,
  fill: none,
  stroke: auto,
  inset: 0% + 5pt
) = {

  let output-array = body.pos()

  let frame(stroke) = (x, y) => (
    left: if x > 0 { stroke } else { none },
    right: none,
    top: if y == 0 or y == 1 { stroke } else { none },
    bottom: none,
  )

  let stroke-out = stroke
  if stroke-out == auto{
    stroke-out = frame(black + 0.5pt)
  }

  let row-gutter-out = row-gutter
  if row-gutter-out == auto{
    row-gutter-out = (2pt, auto)
  }

  output-array.insert(0, table.cell(colspan: columns, inset: 0pt)[])
  output-array.push(table.hline())

  table(..output-array, columns: columns, stroke: stroke-out, fill: fill, gutter: gutter, column-gutter: column-gutter, row-gutter: (2pt, auto), inset: inset, align: align)

}

#let nonumber = <equate:revoke>
