// Minimal template to write a script for a math course
// in university.
#let uni-script-template(
  title: [Title],
  author: [Author],
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
          smallcaps[#module-name] + h(1fr) + author
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
        h(1fr) + author
        }
      }
    ),
    footer: locate(loc => {
      // ugliest code ever written
      if pagecounter.at(loc).at(0) == 1 {
        counter(page).update(0)
      }
      pagecounter.step()
      set text(10pt)
      set align(center)
      if pagecounter.at(loc).at(0) > 1 {
          counter(page).at(loc).at(0)
        }
      }
    ),
  ) 

  // Text specifications 
  set text(
    size: 12pt,
    font: "CMU Serif Roman",
  )
  // Change the line spacing
  set par(
    leading: 0.65em, // 1em = font size
    justify: true,
  )

  // Heading specifications 
  set heading(numbering: "1.")
  show heading: it => {
    set text(font: "CMU Serif Roman", weight: "regular")
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
      #title
    ]
    #text(size: 16pt)[
      #pad(top: 0em, bottom: 0em, module-name)
    ]
    #v(2cm)
  ]

  pagebreak()

  // Automatically generates outline 
  outline(
    title: [Inhaltsverzeichnis],
    indent: auto,
  )
  
  pagebreak()

  // Display the documents content
  body
}
