#let bold(content) = {
  text(font: "CMU Serif Bold", weight: "bold")[#content]
}

#let bolditalic(content) = {
  text(font: "CMU Serif BoldItalic", weight: "bold")[#content]
}

#let definition(number, name, content) = {
  box(
    width: 100%, 
    height: auto,
    fill: rgb(225, 225, 225),
    radius: 10pt,
    inset: 0.5cm,
    [
      #bolditalic[Definition #number: #name] \
      #v(5pt)
      #set text(size: 11pt)
      #box(inset: (top: -3mm), content)
    ]
  )
}

#let boxedlist(..content) = {
  box(
    inset: (
      right: 0.5cm,
      left: 0.5cm,
    ),
    list(
      ..content
    )
  )
} 