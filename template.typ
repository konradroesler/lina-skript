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

  {
  show outline.entry.where(level: 1): it => {
    strong(it)
  }

  // Automatically generates outline 
  outline(
    title: [Inhaltsverzeichnis],
    target: heading,
    indent: auto,
  )
  }

  pagebreak()

  [
    #v(1cm)
    #align(center, text(size: 1.75em)[Definitionen])
  ]
  
  let definitions = locate(loc => {
    let elems = query(<def>, loc)
    let definition_array = ()
    for e in elems {
      let body = repr(e.body)

      let number = body.find(regex("\d\.\d{1,2}"))
      let pos_num = body.position(number)
      let def_term = body.slice(pos_num).find(regex("([a-zA-Zäüö]{2,}[,\s]{0,2})+"))
      
      definition_array.push([
        #link(
          e.location(),
          [
            #strong[#number:]
            #v(-2pt)
          ],
        )
      ])
      definition_array.push([
        #link(
          e.location(),
          [
            #set par(justify: false)
            #def_term
            #v(-2pt)
          ],
        )
      ])
    }

    let chap_count = int(repr(definition_array.at(-2)).find(regex("\d\.\d{1,2}")).at(0))
    let partitioned_def_array = ()
    for i in range(chap_count) {
      partitioned_def_array.push(())
    }
    
    let x = 0
    while x < definition_array.len() {
      let chapter = int(repr(definition_array.at(x)).find(regex("\d\.\d{1,2}")).at(0))
      partitioned_def_array.at(chapter -1).push(definition_array.at(x))
      partitioned_def_array.at(chapter -1).push(definition_array.at(x+1))
      x += 2
    } 
    let def_index = ()
    for chapter in partitioned_def_array {
      def_index.push(
        [
          #let chapter_num = int(repr(chapter.at(0)).find(regex("\d\.\d{1,2}")).at(0))
          #align(center, strong(text(size: 1.5em)[#chapter_num .]))
          #v(-12pt)
          #line(length: 100%, stroke: 1pt)
          #v(-10pt)
          #table(
            columns: (40pt, 1fr),
            inset: 5pt,
            stroke: none,
            ..partitioned_def_array.at(chapter_num -1)
          )
        ]
      )
    }

    // Display the definition index in two column mode
    [ 
      #show: columns.with(2, gutter: 12pt)
      #for chap in def_index {
        [
          #chap

        ]
      }
    ]
  })

  definitions

  pagebreak()

  // Display the documents content
  body
}

