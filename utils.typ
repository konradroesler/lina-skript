#let bold(content) = {
  text(font: "CMU Serif Bold", weight: "bold")[#content]
}

#let bolditalic(content) = {
  text(font: "CMU Serif BoldItalic", weight: "bold")[#content]
}

#let definition(content) = {
  box(
    width: 100%, 
    height: auto,
    fill: rgb(225, 225, 225),
    radius: 10pt,
    inset: 0.5cm,
    content
  )
}
