#import "utils.typ": *
#import "template.typ": uni-script-template
#show: doc => uni-script-template(
  title: [Vorlesungsskript],
  module-name: [LinA I\* WiSe 23/24],
  doc
)

= Motivation und mathematische Grundlagen

Was ist lineare Algebra bzw. analytische Geometrie?

#boxedlist([analytische Geometrie: \ Beschreibung von geometrischen Fragen mit Hilfe von Gleichungen, Geraden, Ebenen sowie die Lösungen von Gleichungen als geometrische Form], [lineare Algebra: \ die Wissenschaft der linearen Gleichungssysteme bzw der Vektorräume und der linearen Abbildungen zwischen ihnen])

Wozu braucht man das?

#boxedlist([mathematische Grundlage für viele mathematische Forschung z.B. in der algebraischen Geometrie, Numerik, Optimierung], [viele Anwendungen z.B. Page-Rank-Algorithmus, lineare Regression], [oder Optimierung: \ linear: Beschreibung zulässiger Punkte als Lösung von (Un)-Gleichungen \ nichtlinear: notwendige Optimalitätsbedingungen])

== Mengen

Der Mengenbegriff wurde von Georg Cantor (dt. Mathematiker, 1845-1918) eingeführt.

#definition("1.1", "Mengen")[
    Unter einer #bolditalic[Menge] verstehen wir jede Zusammenfassung $M$ von bestimmten, wohlunterschiedenen Objekten $x$ unsere Anschauung order unseres Denkens, welche #bolditalic[Elemente] von $M$ genannt werden, zu einem Ganzen.
]

#underline("Bemerkungen"):

Für jedes Objekt $x$ kann man eindeutig feststellen, ob es zu einer Menge $M$ gehört oder nicht.
$
x in M arrow x #[ist Element von] M \
x in.not M arrow x #[ist nicht Element von] M
$

#pagebreak()

#bolditalic[Beispiel 1.2:] Beispiel für Mengen

#boxedlist([{rot, gelb, grün}], [{1, 2, 3, 4}], [$NN = {1, 2, 3, ...}, NN_0 = {0, 1, 2, 3, ...}$], [$ZZ: {..., -1, 0, 1, ...}$], [$QQ = {x | x = a/b #[mit] a in ZZ #[und] b in NN}$], [$RR = {x | x #[ist reelle Zahl]}$], [$emptyset #[bzw.] {} corres #[leere Menge]$])

#definition("1.3", "Teilmenge")[
  Seien $M, N$ Mengen. \

  1. $M$ heißt #bolditalic[Teilmenge] von $N$, wenn jedes Element von $M$ auch Element von $N$ ist. \ Notation: $M subset.eq N$

  2. $M$ und $N$ heißen gleich, wenn $M subset.eq N$ und $N subset.eq M$ gilt. \ Notation $M = N$ \ Falls das nicht gilt, schreiben wir $M != N$

  $M$ heißt #bolditalic[echte Teilmenge] von $N$, wenn $M subset.eq N$ und $M != N$ gilt. \ Notation: $M subset N$
]

Nutzt man die Aussagenlogik, kann man diese Definitionen Umformulieren zu: 

#boxedlist([$M subset.eq N <==> ( forall x: x in M ==> x in N )$], [$M = N <==> (M subset.eq N and N subset.eq M)$], [$M subset N <==> (M subset.eq N and M != N)$])

#underline("Kommentare"):

#boxedlist([$<==>$ heißt "genau dann, wenn"], [$forall$ heißt "für alle"], [$and$ heißt "und"], [$:$ heißt "mit der Eigenschaft"])
