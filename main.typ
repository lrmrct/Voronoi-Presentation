#import "@preview/polylux:0.3.1": *
#import themes.simple: *

#let blue = color.rgb("3333b2")

#set text(font: "New Computer Modern Sans")

#show math.equation: set text(font: "New Computer Modern Math")
#show: simple-theme.with()
#show heading: set text(blue)

#title-slide[ 
  #place(dx:-53pt, dy: 0pt, [#image("figures/bg.png", height: 475pt, width: 845pt)])
  #text(fill:black.transparentize(100%))[
  #show heading: set text(blue.transparentize(100%))
  = Voronoi Diagrams
  _An introduction to Voronoi Diagrams_
  
  Elias Rodriguez
  
  #text(size: 20pt)[May 17, 2024]
  ]
]

#text(fill:black.transparentize(00%))[
  #show heading: set text(blue.transparentize(100%))
  = Introduction
]

#centered-slide[
  == 
    #alternatives[
      #image("figures/introduction/empty.svg", width: 100%)
    ][
      #image("figures/introduction/sites.svg", width: 100%)
      #place(dx: 65pt, dy: -220pt,
        math.overbrace("", math.sans("power socket"))
      )
    ][
      #image("figures/introduction/complete.svg", width: 490pt)
    ]
]

#slide[
  == Formalizing our Observations
    #v(3em)
    #list(tight: false)[
        #uncover("1-1", mode: "transparent")[Set $S$ of _sites_]
    ][
      #uncover("2-2", mode: "transparent")[_Voronoi region_ of a site $p$ in $S$ is \
      $"Vor"(p) := {x in bb(R)^2 | norm(x - p) <= norm(x − q) "for all sites" q in S}$]
    ][
      #uncover("3-3", mode: "transparent")[_Voronoi diagram_ of a set $S$ is \
      $"Vor"(S) := {x in bb(R)^2 | x "has no unique nearest site in" S}$]
    ]
    #uncover("1-1")[
      #place(dx: 496pt, dy: -389pt,
      image("figures/defintion/sites.png", width: 300pt)
      )
      #place(dx: 532pt, dy: -280pt,
        math.underbrace("",math.sans("site"))
      )
    ]
    #uncover("2-2")[
      #place(dx: 496pt, dy: -389pt,
        image("figures/defintion/region.png", width: 300pt)
      )
    ]
    #uncover("3-3")[
      #place(dx: 496pt, dy: -389pt,
        image("figures/defintion/edges.png", width: 300pt)
      )
    ]
]

#slide[
  == Refining our Definitions
  #v(4em)
  #alternatives[
    === Definition 1.1
    A _Voronoi vertex_ is a #text(fill:blue)[_point_] with at least #text(fill:blue)[_three_] nearest sites.  \
    #show heading: set text(blue.transparentize(50%))
    === Definition 1.2
    #text(fill: black.transparentize(50%))[A _Voronoi edge_  is a #text(fill:blue.transparentize(50%))[_connected set_] with exactly #text(fill:blue.transparentize(50%))[_two_] nearest sites.]
  ][
    #show heading: set text(blue.transparentize(50%))
    === Definition 1.1
    #text(fill: black.transparentize(50%))[A _Voronoi vertex_ is a #text(fill:blue.transparentize(50%))[_point_] with at least #text(fill:blue.transparentize(50%))[_three_] nearest sites.]  \
    #show heading: set text(blue.transparentize(50%))
    #show heading: set text(blue)
    === Definition 1.2
    #text(fill: black)[A _Voronoi edge_  is a #text(fill:blue)[_connected set_] with exactly #text(fill:blue)[_two_] nearest sites.]
  ]
  #uncover("1-1")[
    #place(dx: 496pt, dy: -378pt,
    image("figures/defintion/definition-vertex.png", width: 300pt)
  )
  ]
  #uncover("2-2")[
    #place(dx: 496pt, dy: -378pt,
    image("figures/defintion/definition-edges.png", width: 300pt)
  )
  ]
]

#slide[
  == History
  #grid(columns:(2fr,1fr),[
    #list(tight: false)[
      #uncover("1-2", mode: "transparent")[
        René Descartes, initial drawings, 1644
      ]
    ][
      #uncover("1, 3-3", mode: "transparent")[
        Peter Dirichlet, 2- and 3-dim case, 1850
      ]
    ][
      #uncover("1, 4-4", mode: "transparent")[
        Georgy Voronoi, n-dim generalization, 1908
      ]
    ]
  ],[
      #only(2)[
        #place(dx: 25pt, dy: -35pt, 
          image("figures/history/descartes-vortices.jpg", height: 280pt) 
        )
        #place(dx: 230pt, dy: 295pt, [
          #link("https://plato.stanford.edu/entries/descartes-physics/plate.jpg")[
            #text(size: 15pt,fill: gray.lighten(50%))[[src]]]
          ])
      ]
      #only(3)[
        #place(dx: 35pt, dy: 0pt, 
          image("figures/history/dirichlet-3d.png", width: 180pt)
        )
        #place(dx: 230pt, dy: 295pt, [
          #link("https://neper.info/imgs/neperfepx-talk-09-2022.pdf")[
            #text(size: 15pt,fill: gray.lighten(50%))[[src]]]
        ])
      ]
      #only(4)[
        #place(dx: 35pt, dy: 0pt, 
          image("figures/history/georgy-voronoi.jpg", width: 180pt)
        )
        #place(dx: 230pt, dy: 295pt, [
          #link("https://commons.wikimedia.org/wiki/File:Georgy_Voronoy.jpg#/media/File:Georgy_Voronoy.jpg")[
            #text(size: 15pt,fill: gray.lighten(50%))[[src]]]
        ])
      ]
  ])
]

#centered-slide[
  = Key Properties
]

#slide[
  == Simplest case
  #align(center + horizon)[
    #alternatives[
      #image("figures/geometric-construction/2-sites.svg", height: 100%)
      #place(dx: 167pt, dy: -130pt, [$p$])
      #place(dx: 299pt, dy: -130pt, [$q$])
    ][
      #place(dx: 137pt, dy: -40pt, [perpendicular bisector])
      #image("figures/geometric-construction/2-sites-bisector.svg", height: 100%)
      #place(dx: 167pt, dy: -130pt, [$p$])
      #place(dx: 299pt, dy: -130pt, [$q$])
    ][
      #image("figures/geometric-construction/2-sites-region.svg", height: 292pt)
      #place(dx: 167pt, dy: -130pt, [$p$])
      #place(dx: 299pt, dy: -130pt, [$q$])
      #place(dx: 70pt, dy: -320pt, [#text(20pt)[$H(p,q) := {x in bb(R)^2 | norm(x − p) ≤ norm(x − q)}$]])
    ]
  ]
]

#slide[
  == Voronoi Regions and their Convexity

    === Theorem 4.1
    The Voronoi region $"Vor"(p)$ is the intersection of all
    halfplanes $H(p,q)$, where $q$ is any other site in $S$.
  #uncover(0, mode:"transparent")[
    #show heading: set text(blue.transparentize(50%))
    === Corollary 4.3
    All Voronoi regions are convex.
  ]
]

#slide[
  === Proof Theorem 4.1
  #v(1em)
  #alternatives(position: top)[
    $"Vor"(p) &:= {x in bb(R)^2 bar.v norm(x - p) <= norm(x − q) "for all sites" q in S} \ $
  ][
  $"Vor"(p) &:= {x in bb(R)^2 bar.v norm(x - p) <= norm(x − q) "for all sites" q in S} \ 
  &= sect.big_(q in S) {x in bb(R)^2 bar.v norm(x - p) <= norm(x - q)} \ $
    
  ][
    $"Vor"(p) &:= {x in bb(R)^2 bar.v norm(x - p) <= norm(x − q) "for all sites" q in S} \ 
    &= sect.big_(q in S) {x in bb(R)^2 bar.v norm(x - p) <= norm(x - q)} \ 
    &= sect.big_(q in S) H(p,q) #h(14em) square$
  ]

  #grid(columns: (1fr,1fr,1fr), column-gutter: 1em, [
      #image("figures/geometric-construction/proof-4.1-1.png")
    ],[
      #image("figures/geometric-construction/proof-4.1-2.png")
    ], 
    [
      #image("figures/geometric-construction/proof-4.1-3.png")
    ]
  )
]

#slide[
  == Voronoi Regions and their Convexity
  
  #uncover(0, mode:"transparent")[
    #show heading: set text(blue.transparentize(50%))
    === Theorem 4.1
    The Voronoi region $"Vor"(p)$ is the intersection of all
    halfplanes $H(p,q)$, where $q$ is any other site in $S$.
  ]
  === Corollary 4.3
  All Voronoi regions are convex.
]

#slide[
  === Proof Corollary 4.3
  We show the intersection of any set of convex
    objects is convex.
    
  Assume $X_1, ... X_n$ convex and let $ X = X_1 sect... sect X_n$ \
    - By def. of intersection $a,b in X => a,b in X_i$ for all $i$ in $[n]$. \
    - By def. of convexity the entire segment $a\b$ lies in every set $X_i$. \
      $=>$ Hence $X$ is convex. #h(15em) $square$
]

#slide[
  == A closer look on perpendicular bisectors
  #only(1)[
    #align(center +horizon)[
      #image("figures/geometric-construction/bisectors-1.svg", height: 292pt)
    ]
  ] 
  #only(2)[
    #align(center +horizon)[
      #image("figures/geometric-construction/bisectors-2.svg", height: 292pt)
    ]
  ] 
  #only(3)[
    #align(center +horizon)[
      #image("figures/geometric-construction/bisectors-2.svg", height: 292pt)
    ]
  ] 
  #only(4)[
    #align(center +horizon)[
      #image("figures/geometric-construction/bisectors-3.svg", height: 292pt)
    ]
  ] 
  #only(5)[
    === Theorem 4.2
    All Voronoi vertices and edges must lie on perpendicular bisectors between sites.
  ]
]

#slide[
  == Geometric features of Voronoi Vertices
  #only(1)[
    === Theorem 4.6
    A point $v$ is a Voronoi vertex of $"Vor"(S)$ if and only if there exists a circle
    centered at $v$ with _three or more_ sites on its boundary and _none_ in
    its interior.
  ]
]

#slide[
  === Proof Theorem 4.6
  $==>$ \
  #align(center + horizon)[
    #alternatives[
      #image("figures/geometric-construction/proof-4.6-3.svg", height: 290pt)
    ][
      #image("figures/geometric-construction/proof-4.6-6.svg", height: 290pt)
      #place(dx:115pt, dy:-323pt, [
       $(x - d_x)^2 + (y - d_y)^2 = r^2$
      ])
    ][
      #image("figures/geometric-construction/proof-4.6-8.svg", height: 290pt)
    ]
  ]
]

#slide[
  === Proof Theorem 4.6
  $<==$ \
  Given a circle with three or more sites on its boundary and none in its interior thus the circle's origin $v$ must have three or more nearest sites thus $v$ is a Voronoi vertex. 
]

#slide[
  == Geometric features of Voronoi Edges
  === Theorem 4.9
  $e$ is a Voronoi edge of $"Vor"(S)$ if and only if for each point $x$ in $e$,
  the circle centered at $x$ through $p$ and $q$ contains no other sites of $S$ in
  its interior or boundary.
]

#slide[
  === Proof Theorem 4.9
  #align(center + horizon)[
    #image("figures/geometric-construction/proof-4.9-1.svg") 
  ]
]

#slide[
  == Voronoi Edge Types
  #align(center + horizon)[
    #alternatives[
      #image("figures/edge-cases/bounded-edge.svg", height: 290pt)
      #place(dx: 140pt, dy:-325pt, [finite line segment])
    ][
      #image("figures/edge-cases/half-line.svg", height: 290pt)
      #place(dx: 160pt, dy:-325pt, [half line _or_ ray])
    ][
      #image("figures/edge-cases/infinite-line.svg", height: 290pt)
      #place(dx: 180pt, dy:-325pt, [infinite line])
    ]
  ]
]

#slide[
  == Edge Cases
  === Theorem 4.10
  A Voronoi diagram $"Vor"(S)$ for a point set $S$ has infinite line edges if and only if all sites of $S$ are collinear.
  === Corollary 4.11
  For a point set $S$, the Voronoi diagram $"Vor"(S)$ is
  disconnected if and only if all sites of $S$ are collinear.
]

#slide[
  === Proof Theorem 4.10
  $<==$
  #align(center + horizon)[
    #alternatives[
      #image("figures/edge-cases/collinear-1.svg", height: 290pt)
    ][
      #image("figures/edge-cases/collinear-2.svg", height: 290pt)
    ]
  ]
]

#slide[
  === Proof Theorem 4.10
  $==>$
  #align(center + horizon)[
    #alternatives[
      #image("figures/edge-cases/non-collinear-1.svg", height: 290pt)
    ][
      #image("figures/edge-cases/non-collinear-2.svg", height: 290pt)
    ]
  ]
]
#slide[
  == Edge Cases
  #uncover(0, mode: "transparent")[
    #show heading: set text(blue.transparentize(50%))
    === Theorem 4.10
    A Voronoi diagram $"Vor"(S)$ for a point set $S$ has infinite line edges if and only if all sites of $S$ are collinear. 
  ]
  === Corollary 4.11
  For a point set $S$, the Voronoi diagram $"Vor"(S)$ is
  disconnected if and only if all sites of $S$ are collinear.
]

#slide[
  === Proof Corollary 4.11
  $==>$
   #align(center + horizon)[
    #only(1)[
      #image("figures/edge-cases/proof-4.11-1.svg", height: 290pt)
    ]
    #only(2)[
      #place(dx: 320pt, dy: -034pt, [not quite])
      #place(dx: 310pt, dy: 134pt, [$arrow.zigzag$])
      #image("figures/edge-cases/proof-4.11-2.svg", height: 290pt)
    ]
    #only(3)[
      #image("figures/edge-cases/proof-4.11-3.svg", height: 290pt)
    ]
    #only(4)[
      #place(dx: 334pt, dy: -34pt, [almost!])
      #image("figures/edge-cases/proof-4.11-3-2.svg", height: 290pt)
    ]
    #only(5)[
      #image("figures/edge-cases/proof-4.11-4.svg", height: 290pt)
    ]
    #only(6)[
      #align(left + horizon)[
      #image("figures/edge-cases/proof-4.11-5.svg", height: 250pt) 
      #place(dx: 440pt, dy: -114pt, [$=>^("Theorem 4.10")$])
      #place(dx: 580pt, dy: -134pt, [All sites of $S$\ are collinear. $square$])
      ]
    ]
  ]
]

#slide[
  == Bounds of Voronoi Edges and Vertices
  === Theorem 4.12 
  Let $S$ be a point set with $n >= 3$ sites. Then $"Vor"(S)$ has at
  most \ $2n − 5$ Voronoi vertices and $3n − 6$ Voronoi edges.
]

#slide[
  === Proof Theorem 4.12
  #align(center + horizon)[
    #only(1)[
      #image("figures/bounds/proof-4.12-1.svg", height: 270pt)
    ]
    #only(2)[
      #image("figures/bounds/proof-4.12-2.svg", height: 270pt)
      #place(dx:300pt, dy:-305pt, [planar graph $G$])
    ]
    #only("3-")[
      #grid(columns: (1fr,1fr), [
        #v(2em)
        #image("figures/bounds/proof-4.12-2.svg", height: 240pt)
        #place(dx:110pt, dy:-275pt, [planar graph $G$])
      ],[
          #line-by-line(start: 3)[
            $ V − E + F = 2 " (Euler's formula)" $  
            $ => (v + 1) − e + n = 2 $ 
            $ 3 (v + 1) <= 2 e $ 
            $ => $
            $ e <= 3n - 6 $
            $ v <= 2n - 5 $
            #only(8)[
              #place(dx: 280pt, dy: -23pt, [
                $square$
              ])
            ]
          ]
        ]
      )     
    ]
  ]
]

#centered-slide[
  = Algorithmic Construction
]

#slide[
  == Walkthrough
  #align(center + horizon)[
    #alternatives[
      #image("figures/algorithm/runthrough-1.svg", height: 292pt)
    ][
      #image("figures/algorithm/runthrough-1.1.svg", height: 292pt)
    ][
      #image("figures/algorithm/runthrough-1.1.svg", height: 292pt)
      #place(dx:513pt, dy:-56pt, [
        #image("figures/algorithm/site.svg", height: 9pt)
      ])
      #place(dx:503pt, dy:-133pt, [
        #image("figures/algorithm/site.svg", height: 9pt)
      ])
      #place(dx:488.5pt, dy:-237.3pt, [
        #image("figures/algorithm/site.svg", height: 9pt)
      ])
    ][
      #image("figures/algorithm/runthrough-2.svg", height: 292pt)
    ][
      #image("figures/algorithm/runthrough-3.svg", height: 292pt)
    ][
      #image("figures/algorithm/runthrough-4.svg", height: 292pt)
    ][
      #image("figures/algorithm/runthrough-5.svg", height: 292pt)
    ][
      #image("figures/algorithm/runthrough-6.svg", height: 292pt)
    ][
      #image("figures/algorithm/runthrough-7.svg", height: 292pt)
    ]
  ]
]

#slide[
  === Are these changes always local?
  #align(center + horizon)[
    #alternatives[][
      #image("figures/worstcase/sequence-1.svg")
    ][
      #image("figures/worstcase/sequence-2.svg")
      #place(dx:55pt, dy:-40pt, [$ underbrace(#text()[#h(11em)], #text()[$N\/2$]) $])
    ][
      #image("figures/worstcase/sequence-4.svg")
    ][
      #image("figures/worstcase/sequence-5.svg")
    ][
      #image("figures/worstcase/sequence-6.svg")
    ][
      #image("figures/worstcase/sequence-7.svg")
    ][
      #image("figures/worstcase/sequence-8.svg")
      #place(dx:55pt, dy:-40pt, [$ underbrace(#text()[#h(11em)], #text()[$N\/2$]) $])
      #place(dx:160pt, dy:-199pt, [#rotate(-90deg)[#math.underbrace(text()[#h(3.0em)], rotate(90deg)[#text()[#h(0.8em)$N\/2$]])]])
    ]
  ]
]

#slide[
  == Complexity
  Time Complexity: $O(n^2)$
  - We insert $n$ sites for each we may have $O(i)$ edits. 
  Space Complexity: $O(n)$
  - Fixed overhead: Constraints, auxiliary functions etc.
  - Data dependent: Voronoi Vertices and Edges, linear in number of sites.
]

#centered-slide[
  = Voronoi Diagrams in the Wild
]

#slide[
  == Voronoi Patterns in Nature
  
  - Voronoi patterns frequently emerge in nature due to the #text(fill:blue)[_dynamics of growth_] and #text(fill:blue)[_competition_] among organisms. \
  #align(center)[
    #alternatives[
    #image("figures/growth/growth-sequence-0.svg", height: 200pt)
    ][
    #image("figures/growth/growth-sequence-4.svg", height: 200pt)
    ][
    #image("figures/growth/growth-sequence-6.svg", height: 200pt)
    ][
    #image("figures/growth/growth-sequence-7.svg", height: 200pt)
    ][
    #image("figures/growth/growth-sequence-8.svg", height: 200pt)
    ]
  ]
]

#centered-slide[
  #grid(columns: (1fr,1fr), rows: (1fr, 1fr), row-gutter: 2em, column-gutter: -1em)[
    #image("figures/endcard/giraffe-fur.jpg", height: 180pt, width: 320pt)
  ][
    #image("figures/endcard/trees.png", height: 180pt, width: 320pt)
  ][
    #image("figures/endcard/fly-wing.png", height: 180pt, width: 320pt)
  ][
    #image("figures/endcard/cell.jpg", height: 180pt, width: 320pt)
  ]
]