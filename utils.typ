#let bold(content) = {
  text(font: "CMU Serif Bold", weight: "bold")[#content]
}

#let italic(content) = {
  text(font: "CMU Serif Italic", weight: "regular")[#content]
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
    width: 100%,
    inset: (
      right: 0.5cm,
      left: 0.5cm,
    ),
    list(
      ..content
    )
  )
} 

#let corres = $op(hat(#h(1pt) = #h(1pt)))$

#let endproof = [
  #set text(size: 0.75em)
  #align(right, $ballot$)
]

#let italic(content) = [
  #text(style: "italic", weight: "medium")[#content]
]

#let humongousspace = [
  $wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide wide$
 ]

 #let circ = $op(circle.small)$
 #let oplus = $op(plus.circle)$
 #let otimes = $op(times.circle)$
 #let odot = $op(dot.circle)$
