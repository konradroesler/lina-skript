// This template was made to write a well structured and 
// easy to work with script for a university math course. 
#let uni-script-template(
  module-name: [Course Name],
  body
) = {

  // Setup custom counter to run parallel to the page counter
  // caution: ugly code 
  let pagecounter = counter("pagecounter")
  // Page specifications
  set page(
    height: 297mm,
    width: 210mm,
    margin: 1in,
    header: locate(loc => {
      set text(10pt)

      let elems = query(
        selector(heading.where(level: 1)).after(loc),
        loc,
      )
      if elems != () {
        if counter(page).at(elems.first().location()) == counter(page).at(loc) {
          smallcaps[#module-name] + h(1fr)
          return
        }
      }
      let elems = query(
        selector(heading.where(level: 1)).before(loc),
        loc,
      )
      if elems != () {
        smallcaps[#module-name] + h(1fr)
        elems.last().body
        }
      }
    ),
    footer: locate(loc => {
      // ugliest code ever written
      if pagecounter.at(loc).at(0) == 2 {
        counter(page).update(0)
      }
      pagecounter.step()
      set text(10pt)
      set align(center)
      if pagecounter.at(loc).at(0) > 2 {
          counter(page).at(loc).at(0)
        }
      }
    ),
  ) 

  // Text specifications 
  set text(
    size: 12pt,
    font: "CMU Serif",
  )
  // Change the line spacing
  set par(
    leading: 0.65em, // 1em = font size
    justify: true,
  )

  // Heading specifications 
  set heading(numbering: "1.")
  show heading: it => {
    if it.level == 1 {
      // Heading for chapters 
      set align(center)
      text(size: 20pt)[
        #pad(top: 1em, bottom: 2em, it)
      ]
    } else if it.level == 2 {
      text(size: 16pt)[
        #pad(top: 1em, bottom: 1em, it)
      ]
    } else if it.level == 3 {
      text(size: 14pt)[
        #pad(top: 1em, bottom: 1em, it)
      ]
    } else if it.level == 4 {
      text(size: 12pt)[
        #pad(top: 1em, bottom: 1em, it)
      ]
    } else if it.level == 5 {
      text(size: 10pt)[
        #pad(top: 1em, bottom: 1em, it)
      ]
    }
  }

  // Title page 
  [
    #set align(center + horizon)
    #text(size: 26pt)[
      Vorlesungsskript
    ]
    #text(size: 16pt)[
      #pad(top: 0em, bottom: 0em, module-name)
    ]
    #v(2cm)
  ]
  pagebreak()

  // Display the documents content
  body

}

#show: doc => uni-script-template(
  module-name: [LinA I\* WiSe 23/24],
  doc
)

#rect(
  height: 100%,
  width: 100%,
  fill: aqua,
)

#outline(indent: auto)
#pagebreak()

= The Beginning
#lorem(100)
== Concept
#lorem(100)
#pagebreak()
#lorem(100)

