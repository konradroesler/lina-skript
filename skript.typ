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

#boxedlist([{rot, gelb, grün}], [{1, 2, 3, 4}], [$NN = {1, 2, 3, ...}, NN_0 = {0, 1, 2, 3, ...}$], [$ZZ = {..., -1, 0, 1, ...}$], [$QQ = {x | x = a/b #[mit] a in ZZ #[und] b in NN}$], [$RR = {x | x #[ist reelle Zahl]}$], [$emptyset #[bzw.] {} corres #[leere Menge]$])

#definition("1.3", "Teilmenge")[
  Seien $M, N$ Mengen. \

  1. $M$ heißt #bolditalic[Teilmenge] von $N$, wenn jedes Element von $M$ auch Element von $N$ ist. \ Notation: $M subset.eq N$

  2. $M$ und $N$ heißen gleich, wenn $M subset.eq N$ und $N subset.eq M$ gilt. \ Notation $M = N$ \ Falls das nicht gilt, schreiben wir $M != N$

 $M$ heißt #bolditalic[echte Teilmenge] von $N$, wenn $M subset.eq N$ und $M != N$ gilt. \ Notation: $M subset N$
]

Nutzt man die Aussagenlogik, kann man diese Definitionen Umformulieren zu: 

#align(center, [#boxedlist([$M subset.eq N <==> ( forall x: x in M ==> x in N )$], [$M = N <==> (M subset.eq N and N subset.eq M) wide$], [$M subset N <==> (M subset.eq N and M != N) wide$])])

#underline("Kommentare"):

#boxedlist([$<==>$ heißt "genau dann, wenn"], [$forall$ heißt "für alle"], [$and$ heißt "und"], [$:$ heißt "mit der Eigenschaft"])

#bolditalic[Satz 1.4:] Für jede Menge $M$ gilt:

#align(center, box(width: 80%, height: auto, table(
  columns: (1fr, 1fr, 1fr), 
  align: left,
  stroke: none,
  [1) $M subset.eq M$],
  [2) $emptyset subset.eq M$],
  [3) $M subset.eq emptyset ==> M = emptyset$]
)))

#italic[Beweis:]

zu 1) Direkter Beweis (verwenden der Definitionen um Aussage zu folgern). Die Aussage:
$
x in M ==> x in M
$
folgt aus Def. 1.1. Daraus folgt aus Def 1.3, 1, dass $M subset.eq M$.

zu 2) Widerspruchsbeweis \ Beweis der Aussage durch Annahme des Gegenteils und Herleitung eines Widerspruchs. Annahme: Es existiert eine Menge $M$, sodass $emptyset subset.eq.not M$. Dann gilt: es existiert ein $x in emptyset$ mit $x in.not M$. \ Aber: Die leere Menge enthält keine Elemente $==> op(arrow.zigzag)$ $==>$ Es existiert keine Menge $M$ mit $emptyset subset.eq.not M ==>$ Behauptung

zu 3) Nach 2. $emptyset subset.eq M$, wir wissen $M subset.eq emptyset$. Nach Def. 1.3, 2 $==> M = emptyset$
#endproof

#bolditalic[Beispiel 1.5:] Ob ein Objekt ein Element oder eine Teilmenge einer Mengen ist, ist vom Kontext abhängig. Betrachten wir folgende Menge:
$
M := {NN, ZZ ,QQ, RR}
$
D.h. die Elemente dieser Menge $M$ sind die natürlichen, ganzen, rationalen und reellen Zahlen. Damit gilt $NN in M$ aber $NN subset ZZ$ und $NN subset QQ$.

#definition("1.6", "Mengenoperationen")[
  Seien $M,N$ Mengen.

  1. Man bezeichnet dei Menge der Elemente, die sowhol  in $M$ als auch in $N$ enthalten sind, als #bolditalic[Durchschnitt] von $M$ und $N$
  $
  M sect N = {x | (x in M) and (x in N)}
  $

  2. Man bezeichnet die Menge der Elemente, die entweder in $M$ oder in $N$ enthalten sind oder in beiden enthalten sind, als #bolditalic[Vereinigung] von $M$ und $N$
  $
  M union N = {x | (x in M) or (x in N)}
  $

  3. Man bezeichnet die Menge der Elemente, die in $M$ aber nicht in $N$ enthalten sind, als #bolditalic[Differenz] von $M$ und $N$
  $
  M backslash N &= {x | (x in M) and (x in.not N)} \
  &= {x in M | x in.not N}
  $
]

#bolditalic[Beispiel 1.7:]

Für $-NN := {-n | n in NN}$ gilt: 

#boxedlist([$NN union -NN =  ZZ backslash {0}$], [$NN sect -NN = emptyset$])

Wichtiges Beispiel für Mengen sind Intervalle reeller Zahlen 
$
[a,b] := {x in RR | a <= x <= b}, a,b in RR, a <= b 
$
Dies nennt man ein abgeschlossenes Intervall (die Grenzen sind enthalten). Sei jetzt $a,b in RR, a <= b$
$
[a,b[ := {x in RR | a <= x < b} #[oder] \
]a,b] := {x in RR | a < x <= b}
$
Diese Intervalle nennt man halboffene Intervalle (genau eine der Grenzen ist enthalten). Das Intervall 
$
]a, b[ := {x in RR | a < x < b}
$
heißt offenes Intervall (keine der Grenzen ist enthalten).

Für $M := {4, 6, 8}$ und $N := {8, 10}$ gilt:

#boxedlist([$M union N = {4, 6, 8, 10}$], [$M sect N = {8}$], [$M backslash N = {4, 6}$], [$N backslash M = {10}$])

#bolditalic[Satz 1.8:] Für zwei Mengen $M, N$ gelte $M subset.eq N$. Dann sind folgende Aussagen Äquivalent: 

#align(center, box(width: 80%, height: auto, table(
  columns: (1fr, 1fr), 
  align: center,
  stroke: none,
  [1) $M subset N$],
  [2) $N backslash M != emptyset$],
)))

#italic[Beweis:]

Behauptung: $1) <==> 2)$

zu zeigen: $1) ==> 2)$ und $2) ==> 1)$

$1) ==> 2)$: Es gilt: $M != N$. Dann existiert $x in N$ mit $x in.not M$. Dann gilt $x in N backslash M$. Also $N backslash M != emptyset$.

$2) ==> 1)$: Es gilt $N backslash M != emptyset$. Dann existiert ein $x in N$ mit $x in.not M$. Daher gilt $N != M$. Es gilt außerdem: $M subset.eq N$. Daraus folgt $M subset N$.

#endproof
