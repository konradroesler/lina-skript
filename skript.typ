#import "utils.typ": *
#import "template.typ": uni-script-template
#import "@preview/tablex:0.0.7": tablex, gridx, hlinex, vlinex, colspanx, rowspanx
#show: doc => uni-script-template(
  title: [Vorlesungsskript],
  author: [Konrad Rösler],
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
[a,b[ space.sixth := {x in RR | a <= x < b} #[oder] space.quarter ]a,b] := {x in RR | a < x <= b}
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

#bolditalic[Satz 1.9:] Seien $M, N, L$ Mengen. Dann gelten Folgende Aussagen:

1. $M sect N subset.eq M #[und] M subset.eq M union N$
2. $M backslash N subset.eq M$
3. Kommutativgesetze: \
#align(center, [$M sect N = N sect M #[und] M union N = N union M$])
4. Assoziativgesetze: \
#align(center, [
$M sect (N sect L) = (M sect N) sect L$ \
$M union (N union L) = (M union N) union L$  
])
5. Distributivgesetze: \ 
#align(center, [
$M union (N sect L) = (M union N) sect (M union L)$ \
$M sect (N union L) = (M sect N) union (M sect L)$ \
$M backslash (N sect L) = (M backslash N) union (M backslash L)$ \
$M backslash (N union L) = (M backslash N) sect (M backslash L)$
])

#italic[Beweis:] Es gilt $x in M sect N$ genau dann, wenn $x in M and x in N$. Die Konjunktion zweier Aussagen ist symmetrisch bezüglich der Aussage. D.h. $A and B <==> B and A$. Es gilt also 
$
(x in M) and (x in N) <==> (x in N) and (x in M)
$
Verwenden wir die Definition der Schnittmenge (1.6) so erhalten wir
$
(x in N) and (x in M) <==> x in N sect M
$
Aus der Kette der Äquivalenzumformungen folgt $M sect N = N sect M$.
#endproof

Etwas kompakter für das erste Distributivgesetz:

$
x in M union (N sect L) &<==> (x in M) or (x in N union L) \
&<==> (x in M) or ((x in N) and (x in L)) \
&<==> (x in M or x in N) and (x in M or x in L) \
&<==> (x in M union N) and (x in M union L) \
&<==> x in (M union N) sect (M union L)
$
Damit ist $M union (N sect L) = (M union N) sect (M union L)$.
#endproof

Die übrigen Aussagen zeigt man analog. #italic[Übung]

Damit ist $M union N union L$ für die Mengen $M, N, L$ wohldefiniert. Dies kann auf "viele" Mengen verallgemeinert werden:

Ist $I != emptyset$ eine Menge und ist für jedes $i in I$ eine Menge $M_i$ gegeben, dann sind:
$
union.big_(i in I) M_i := {x | exists i in I #[mit] x in M_i} \
\
sect.big_(i in I) M_i := {x | forall i in I #[mit] x in M_i}
$
Die Menge I heißt auch #bolditalic[Indexmenge]. Für $I = {1, ..., n}$ verwendet man auch die Notation
$
union.big_(i = 1)^n M_i := {x | exists i in I #[mit] x in M_i} \
\
sect.big_(i = 1)^n M_i := {x | forall i in I #[mit] x in M_i}
$

#definition("1.10", "Kardinalität, Potenzmenge")[
  Sei $M$ eine endliche Menge, d.h. $M$ enthält endlich viele Elemente.

  Die #bolditalic[Mächtigkeit] oder #bolditalic[Kardinalität] von $M$, bezeichnet mit $|M| #[oder] \#M$ ist die Anzahl von Elementen in $M$. 

  Die #bolditalic[Potenzmenge] von $M$, bezeichnet mit $cal(P)(M)$ ist die Menge aller Teilmengen von $M$.
  D.h. 
  $
  cal(P)(M) := {N | N subset.eq M}
  $
]

#bolditalic[Beispiel 1.11:]

Die leere Menge $emptyset$ hat die Kardinalität Null. Es gilt $cal(P)(emptyset) = {emptyset}, abs(cal(P)(emptyset)) = 1$.

Für $M = {2, 4, 6}$ gilt $abs(M) = 3$. $cal(P)(M) = {emptyset, {2}, {4}, {6}, {2, 4}, {2, 6}, {4, 6}, {2, 4, 6}}$.

Man kann zeigen: $abs(cal(P)(M)) = 2^(abs(M))$. Deswegen wird auch die Notation $2^M$ für die Potenzmenge von $M$ verwendet.

== Relationen

#definition("1.12", "Kartesisches Produkt")[
  Sind $M$ und $N$ zwei Mengen, so heißt die Menge 
  $
  M times N := {(x, y) | x in M and y in N}
  $
  das #bolditalic[kartesische Produkt] von $M$ und $N$.

  Sind $n$ Mengen $M_1, ..., M_n$ gegeben, so ist deren kartesisches Produkt gegeben druch:
  $
  M_1 times ... times M_n := {(x_1, ..., x_n) | x_1 in M_1 and ... and x_n in M_n}
  $
  Das n-fache kartesische Produkt einer Menge von $M$ ist:
  $
  M^n := M times ... times M := {(x_1, ..., x_n) | x_i in M #[für] i = 1, ..., n}
  $

  Ein Element $(x, y) in M times N$ heißt geordnetes Paar und eine Element $(x_1, ..., x_n) in M_1 times ... times M_n$ heißt #bolditalic[(geordnetes) n-Tupel].
]
 
Ist mindestens eine der auftretenden Mengen leer, so ist auch das resultierende kartesische Produkt leer, d.h. die leere Menge. Das kartesische Produkt wurde nach Rene Decartes benannt. Rene Decartes war ein französische Mathematiker (1596-1650) und ein Begründer der analytischen Geometrie.

#bolditalic[Beispiel 1.13:] Das kartesische Produkt zweier Intervalle.

Seien $[a, b] subset RR$ und $[c, d] subset RR$ zwei abgeschlossene Intervalle von reellen Zahlen. Dann ist das kartesische Produkt beider Intervalle gegeben durch:
$
[a,b] times [c,d] := {(x, y) | x in [a,b] and y in [c,d]}
$
Das kartesische Produkt ist nicht kommutativ. Beweis durch Gegenbeispiel.

#definition("1.14", "Relationen", [
  Seien $M$ und $N$ nichtleere Mengen. Eine Menge $R subset.eq M times N$ heißt #bolditalic[Relation] zwischen $M$ und $N$. Ist $M = N$, so nennt man $R$ #bolditalic[Relation auf $M$]. Für $(x, y) in R$ schreibt man $x attach(tilde, br: R) y$ oder $x tilde y$, wenn die Relation aus dem Kontext klar ist. Ist mindestens eine der beiden Mengen leer, dann ist auch jede Relation zwischen den beiden Mengen die leere Menge.
])

#bolditalic[Beispiel 1.15:] Sei $M = NN$ und $N = ZZ$. Dann ist 
$
R := {(x, y) in M times N | x + y = 1}
$
eine Relation zwischen $M$ und $N$. Es gilt 
$
R = {(1,0),(2,-1),(3,-2),...} = {(n, -n + 1) | n in NN}
$

#definition("1.16", "reflexiv, symmetrisch, antisymmetrisch, transitiv", [
  Es sei $M$ eine nicht leere Menge. Eine Relation auf $M$ heißt:

  #box(width: 100%, inset: (top:2.5mm, right: 0.5cm, left: 0.5cm), [
  #bolditalic[1. reflexiv:] 
  #v(-2mm)
  $
  forall x in M: x tilde x
  $
  #bolditalic[2. symmetrisch:] 
  #v(-2mm)
  $
  forall x,y in M: x tilde y ==> y tilde x
  $
  #bolditalic[3. antisymmetrisch:] 
  #v(-2mm)
  $
  forall x,y in M: x tilde y and y tilde x ==> x = y
  $
  #bolditalic[4. transitiv:] 
  #v(-2mm)
  $
  forall x,y,z in M: x tilde y and y tilde z ==> x tilde z
  $
  ])
])

Falls die Relation $R$ reflexiv, transitiv und symmetrisch ist, so nennt man $R$ eine #bolditalic[Äquivalenzrelation] auf $M$. Ist $R$ reflexiv, transitiv und antisymmetrisch, so nennt man $R$ eine #bolditalic[partielle Ordnung] auf $M$. 

#bolditalic[Beispiel 1.17:] $M = RR$

#boxedlist([Die Relation $<$ auf $M = RR$ ist transitiv, aber weder reflexiv noch symmetrisch und auch nicht antisymmetrisch.],[Die Relation $<=$ auf $M = RR$ ist reflexiv, antisymmetrisch und transitiv. Sie ist nicht symmetrisch. $<=$ ist somit eine partielle Ordnung.],[Die Relation $=$ auf $RR$ ist reflexiv, symmetrisch und transitiv. Also ist $=$ eine Äquivalenzrelation. (Äquivalenzrelationen können auch antisymmetrisch sein)])



#bolditalic[Beispiel 1.18:] Interpretiert man "Pfeile" als Objekte mit gleicher Orientierung und Länge, erhält man die Äquivalenzrelation 
$
x tilde y :<==> #[$x$ und $y$ haben die gleiche Länge und Orientierung]
$
Auf Grund der Transitivität sind somit alle Pfeile einer vorgegebenen Orientierung und Länge äquivalent zu dem Pfeil, der im Koordinatenursprung startet und die gleiche Länge sowie Orientierung besitzt. Somit können wir Vektor $x = (x_1, x_2) in RR^2$ als Repräsentant einer ganzen Klasse von Pfeilen interpretieren. Alle zueinander äquivalente Pfeile haben gemeinsam, dass die Differenz zwischen End- und Anfangspunkt genau den Vektor $x$ ergeben.

Als Formalisierung erhält man:

#definition("1.19", "Äquivalenzklassen, Quotientenmenge", [
  Sei $tilde$ eine Äquivalenzrelation auf einer nichtleeren Menge $M$. Die Äquivalenzklasse eines Element $overline(a) in M$ ist definiert durch: 
  $
  [overline(a)] := {a in M | a tilde overline(a)}
  $
  Ist die Relation nicht aus dem Kontext klar, schreibt man $[overline(a)]_tilde$.

  Elemente einer Äquivalenzklasse werden als #bolditalic[Vertreter] oder #bolditalic[Repräsentanten] der Äquivalenzklasse bezeichnet. Die Menge aller Äquivalenzklassen einer Äquivalenzrelation $tilde$ in einer Menge $M$, d.h. 
  $
  M \/ tilde #h(1.5mm) := {[a]_tilde | a in M}
  $
  wird als #bolditalic[Faktormenge] oder #bolditalic[Quotientenmenge] bezeichnet.
  ])

#bolditalic[Beispiel 1.20:] #italic[(Fortsetzung von Beispiel 1.18)]

Die Menge aller Pfeile gleicher Länge und Orientierung bilden eine solche Äquivalenzklasse, welche durch den Vektor $x = (x_1, x_2) in RR^2$ repräsentiert wird. Die Menge der Vektoren $x = (x_1, x_2) in RR^2$ bilden die Quotientenklasse.

#bolditalic[Beispiel 1.21:] Für eine gegebene Zahl $x in NN$ ist die Menge: 

$
R_n := {(a, b) in ZZ^2 | a - b #[ist ohne Rest durch $n$ teilbar]}
$
eine Äquivalenzrelation auf $ZZ$, denn 

#boxedlist([
  reflexiv: $a tilde a, (a, a) in R_n :<==> a - a = 0 space checkmark$
  ], [
    symmetrie: \ 
      #v(0.5mm)
      $a tilde b ==> (a, b) in R_n ==> a - b #[ist ohne Rest teilbar] ==> a - b = k dot n \ ==> b - a = - k dot n ==> (b, a) in R_n ==> b tilde a space checkmark$ 
    ], [
      transitiv: zz: $a tilde b and b tilde c ==> a tilde c$
      $
      a tilde b ==> a - b = k dot n \
      b tilde c ==> b - c = l dot n
      $

      Gleichungen addieren: $a - c = n(k + l) ==> a tilde c space checkmark$ 
      ])

Für $a$ wird die Äquivalenzklasse $[a]$ auch die Restklasse von $a #italic[modulo] n$ genannt.

$
[a] = a + n dot z = {a + n z | z in ZZ}
$

Die Äquivalenzrelation $R_n$ definiert auch eine Zerlegung der Menge $ZZ$ in disjunkte Teilmengen, nähmlich 

$
[0] union [1] union ... union [n-1] = union.big_(a = 0)^(n-1) [a] = ZZ
$

Es gilt allgemein: Ist $tilde$ eine Äquivalenzrelation auf $M$, so ist $M$ die Vereinigung aller Äquivalenzklassen. 

#boxedlist([
  "$subset.eq$": $#sspace$ 
  #v(-2mm)
  $
  M = union.big_(a in M) {a} subset.eq union.big_(a in M) [a] space checkmark
  $
], [
  "$supset.eq$": 
  #v(-2mm)
  $
  [a] subset M ==> union.big_(a in M) [a] subset.eq M space checkmark
  $
])
#endproof

#bolditalic[Satz 1.22:] Ist $R$ eine Äquivalenzrelation auf der Menge $M$ und sind $a, b in M$, dann sind folgende Aussagen äquivalent:

#align(center, grid(columns: (auto, auto, auto), gutter: 2cm, [1) $[a] = [b]$], [2) $[a] sect [b] != emptyset$], [3) $a tilde b$]))

#italic[Beweis:] Durch Ringschluss

zu zeigen: $1 ==> 2, 2 ==> 3, 3 ==> 1$

$1 ==> 2$: 

#align(center, box(width: 90%, [Wegen $a tilde a ==> a in [a] = [b] ==> a in [a] sect [b] ==> [a] sect [b] != emptyset$]))

$2 ==> 3$:

#align(center, box(width: 90%, [Aus $[a] sect [b] != emptyset ==>$ es existiert $c in [a] sect [b]$. Nach Definition gilt dann $c tilde a$ wegen der Symmetrie von $a tilde c$. Nach Definition auch $c tilde b$. Wegen der Transitivät der Relation gilt dann auch $a tilde b$]))

$3 ==> 1$:

#align(center, box(width: 90%, [Es gilt $a tilde b$. Sei $c in [a] ==> c tilde a$. Wegen der Transitivät folgt \ $c tilde b ==> c in [b] ==> [a] subset.eq [b]$. Analog folgt $[b] subset.eq [a]$.]))

#endproof

Aus Satz 1.22 2) folgt, dass die Äquivalenzklassen eine disjunkte Zerlegung der Menge $M$ darstellen.

#definition("1.23", "")[Sei $M$ eine Menge und sei für jedes Element $m in M$ eine weitere Menge $S_m$ gegeben. Für $cal(S) := {S_m | m in M}$ ist die Teilmengenrelation $subset.eq$ eine partielle Ordnung. Die Menge $cal(S)$ heißt dann #bolditalic[partiell geordnet]. Eine Menge $hat(S) in cal(S)$ heißt #bolditalic[maximales Element] von $cal(S)$ (bezüglich $subset.eq$), wenn aus $S in cal(S)$ und $hat(S) in cal(S)$ folgt, dass $S = hat(S)$ ist. Eine nichtleere Teilmenge $cal(K) subset.eq cal(S)$ heißt #bolditalic[Kette] (bezüglich $subset.eq$), wenn für alle $K_1, K_2 in cal(K)$ gilt, dass $K_1 subset.eq K_2$ oder $K_2 subset.eq K_1$. Ein Element $hat(K) in cal(S)$ heißt #bolditalic[obere Schranke] der Kette $cal(K)$, wenn $K subset.eq hat(K)$ für alle $K in cal(K)$ gilt.]

#bolditalic[Beispiel 1.24:] Sei $cal(S) = P({2, 4, 6, 8, 10})$

Dann ist 
$
cal(K) = {emptyset, {2}, {2, 6}, {2, 6, 10}} subset.eq cal(S)
$
Die Menge $K = {2, 6, 10}$, das maximale Elemnt von $cal(S)$ ist $hat(S) = {2, 4, 6, 8, 10}$.

#align(center, [Gibt es immer ein maximales Element?])

#bolditalic[Lemma 1.25: Zornsche Lemma]

Sei $M$ eine Menge und sei $cal(S) subset.eq cal(P)(M)$ eine nichtleere Menge mit der Eigenschaft, dass für jede Kette $cal(K) subset.eq cal(S)$ auch ihre Vereinigunsmenge in $cal(S)$ liegt, d.h.
$
union.big_(A in cal(K)) A in cal(S)
$
Dann besitzt $cal(S)$ ein maximales Element. 

#italic[Beweis:] Das Zornsche Lemma ist ein fundamentales Resultat aus der Mengenlehre, hier ohne Beweis
#endproof

#bolditalic[Lemma 1.26:] Sei $M$ eine Menge und $cal(K) subset.eq cal(P)(M)$ eine Kette. Dann gibt es zu je endlich vielen $A_1, ..., A_n in cal(K)$ ein $hat(dotless.i) in {1, ..., n}$ mit $A_i subset.eq A_(hat(dotless.i))$ für alle $i in {1, ..., n}$. 

#italic[Beweis:] Durch vollständige Induktion über $n$.

Induktionsanfang: n = 1

D.h. wir haben $A_1 in cal(K)$ und für $hat(dotless.i) = 1$ gilt $A_1 subset.eq A_(hat(dotless.i)) = A_1 space checkmark$

Induktionsschritt: $n - 1 arrow.bar n$

Für $A_1, ..., A_(n-1) in cal(K)$ exisitert ein $hat(dotless.j) in {1, ..., n-1}$ mit $A_i subset.eq A_(hat(dotless.j))$ für alle $i in {1, ..., n-1}$. Mit 
$
hat(dotless.i) := cases(hat(dotless.j) "für" A_n subset.eq A_(hat(dotless.j)), n "für" A_(hat(dotless.j)) subset.eq A_n)
$
folgt die Behautpung.
#endproof

== Abbildungen

#definition("1.27", "Abbildungen")[Es Seien $X$ und $Y$ beliebig, nichtleere Mengen. Eine #bolditalic[Abbildung] von $X$ nach $Y$ ist eine Vorschrift $f$, die jedem Element $x in X$ genau ein Element $f(x) in Y$ zuordnet. Man schreibt
$
f: X arrow Y, space x arrow.bar y = f(x)
$
Die Menge $X$ heißt #bolditalic[Definitionsbereich] von $f$, die Menge $Y$ heißt #bolditalic[Wertebereich] von $f$

#underline[Achtung:] Jede Abbildung besteht aus drei "Teilen". Angabe des Definitionsbereichs, Angabe des Wertebereichs, Angabe der Zuordnungsvorschrift.]

#bolditalic[Beispiel 1.28:] Sei $M$ eine nichtleere Menge. Dann ist 
$
f: M arrow N, space x arrow.bar x = f(x)
$
eine Abbildung $f$ #bolditalic[Identität] von $M$ mit der Notation $I_m \/ "Id"_m$. 

Sei $X = Y = RR$, dann ist $f: RR arrow RR, space x arrow.bar f(x) := 7x + 2$ eine Abbildung.

#definition("1.29", "Bild, Urbild")[Seien $X, Y$ beliebige nichtleere Mengen und $f: X arrow Y$. Es gelte $M subset.eq X$ und $N subset.eq Y$. Dann heißen die Mengen:
$
f(M) &:= {f(x) in Y | x in M} subset.eq Y #[das #bolditalic[Bild] von $M$ unter $f$.] \
f^(-1)(N) &:= {x in X | f(x) in N} subset.eq X #[das #bolditalic[Urbild] von $N$ under $f$.] 
$
Ist $emptyset != M subset.eq X$, dann heißt $f_(|M): M arrow Y, space x arrow.bar f(x)$, die #bolditalic[Einschränkung] von $f$ auf $M$.
]

#bolditalic[Beispiel 1.30:] Sei $X = Y = RR$ und $x arrow.bar f(x) = x^4$. Dann ist $RR$ Definitions- und Wertebereich von $f$.

#boxedlist([$f(RR) = RR_+ := [0, infinity[$ das Bild von $f$ #v(2mm)], [$f([0,2]) = [0, 16]$ #v(2mm)], [$f^(-1)([16, 81]) = [-3, -2] union [2, 3]$ das Urbild des Intervalls $[16, 81]$ unter $f$. #v(2mm)])

#definition("1.31", "injektiv, surjektiv, bijektiv")[Seien $X, Y$ zwei beliebige, nichtleere Mengen und $f : X arrow Y$ eine Abbildung. Dann heißt $f$:

#boxedlist([#bolditalic[injektiv:] falls für alle $x, tilde(x) in X$ gilt: $#sspace$
#v(-1mm)
$
f(x) = f(tilde(x)) ==> x = tilde(x)
$
#v(1mm)
],[
  #bolditalic[surjektiv:] falls für jedes $y in Y$ gilt:
#v(-1mm)
$
exists space.sixth x in X: f(x) = y
$
#v(1mm)
],[
  #bolditalic[bijektiv:] falls $f$ injektiv und surjektiv ist
])]

Man kann sich anhand der Definition leicht überlegen, dass eine Abbildung $f: X arrow Y$ genau dann bijektiv ist, wenn es für jedes $y in Y$ #underline[genau] ein $x in X$ gibt, sodass $f(x) = y$ gilt.

#bolditalic[Beispiel 1.32:] Betrachte die Funktion $f: RR arrow RR, space x arrow.bar max(0, x)$

#boxedlist[$f: RR arrow RR$, $f$ ist weder injektiv noch surjektiv][$f: RR arrow RR_+$, $f$ ist surjektiv, aber nicht injektiv][$f: RR_+ arrow RR_+$, $f$ ist injektiv aber nicht surjektiv][$f: RR_+ arrow RR_+$, $f$ ist bijektiv]

#definition("1.33", "Komposition")[Seien $X, Y, Z$ nichtleere Mengen und die Abbildungen $f: X arrow Y, space x arrow.bar f(x)$ sowie $g: Y arrow Z, space y arrow.bar g(y)$ gegeben. Dann ist die #bolditalic[Komposition] oder #bolditalic[Hintereinanderausführung] von $f$ und $g$ die Abbildung 
$
g compose f: X arrow Z, space x arrow.bar g(f(x)) in Z
$
]

#bolditalic[Satz 1.34:] Seien $W, X, Y$ und $Z$ nichtleere Mengen, und die Abbildungen $f: W arrow X$, $g: X arrow Y$, $h: Y arrow Z$ gegeben. Dann gilt:

#box(width: 100%, inset: (right: 1cm, left: 1cm), [
  1. $h compose (g compose f) = (h compose g) compose f$, d.h. die Komposition von Abbildungen ist Assoziativ
  2. Sind beide Abbildungen $f$ und $g$ injektiv/surjektiv/bijektiv, dann ist auch die Komposition $g compose f$ injektiv / surjektiv / bijektiv.
  3. Ist $g compose f$ injektiv, dann ist $f$ injektiv
  4. Ist $g compose f$ surjktiv, dann ist $g$ surjektiv
])

#italic[Beweis:] (Übungsaufgabe, Blatt 4 Aufgabe 1)

1. $h compose (g compose f)(x) = h((g compose f)(x)) = h(g(f(x))) = (h compose g)(f(x)) = ((h compose g) compose f)(x)$

2. #[Für jedes $x_1, x_2 in X$ folgt aus $g$ injektiv: $g(f(x_1)) = g(f(x_2)) ==> f(x_1) = f(x_2)$. Aus $f$ injektiv folgt widerum: $f(x_1) = f(x_2) ==> x_1 = x_2$. Also gilt $g(f(x_1)) = g(f(x_2)) ==>$ $x_1 = x_2$. Somit ist $g compose f$ injektiv.
  
Für jedes $z in Z$ folgt aus $g$ surjektiv: $exists space.sixth y in Y: f(y) = z$. Für jedes $y in Y$ folgt aus $f$ surjektiv widerium: $exists space.sixth x in X: f(x) = y$. Also folgt $forall space.sixth z in Z space.sixth exists space.sixth x in X: g(f(x)) = z$. Somit ist $g compose f$ surjektiv. 

Sind $f$ und $g$ bijektiv, folgt aus den obigen Beweisen, dass $g compose  f$ injektiv und surjektiv ist. Somit ist $g compose f$ auch bijektiv.
]

3. Ist $f$ nicht injektiv, dann existieren $x_1, x_2 in X$ mit $f(x_1) = f(x_2)$ aber $x_1 != x_2$. Wegen $g compose f$ injektiv gilt $g(f(x_1)) = g(f(x_2)) ==> x_1 = x_2$. Damit $g(f(x_1)) = g(f(x_2))$ gilt, muss auch $f(x_1) = f(x_2)$ gelten, dann gilt aber auch $f(x_1) = f(x_2) ==> x_1 = x_2$. Dies ist ein Widerspruch $arrow.zigzag$. $f$ ist also injektiv.

4. Ist $g$ nicht surjektiv, dann existiert ein $z in Z$ für das kein $y in Y$ mit $g(y) = z$ existiert. Wegen $g compose f$ surjektiv gilt $forall space.sixth z in Z space.sixth exists space.sixth x in X: g(f(x)) = z$. Dann gilt auch $g(f(x)) = g(y) = z, space y in Y$, also existiert ein $y in Y$ mit $g(y) = z$. Dies ist ein Widerspruch $arrow.zigzag$. Also ist $g$ surjektiv. 
#endproof

#bolditalic[Satz 1.35:] Seien $X, Y$ nichtleere Mengen und $f: X arrow Y$ eine Abbildung. Die Abbildung ist genau dann bijektiv, wenn es eine Abbildung $g: Y arrow X$ existiert, so dass $g compose f = "Id"_X$ und $f compose g = "Id"_Y$ gilt.

#italic[Beweis:] 

"$==>$" 

Zu jedem $y in Y$ existiert genau ein $x_y in X$ mit $f(x_y) = y$. Damit kann man eine Abbildung $g$ definieren durch: 
$
g: Y arrow X, space g(y) = x_y
$
Für $y in Y$ folgt dann $(f compose g)(y) = f(g(y)) = f(x_y) = y ==> f compose g = "Id"_Y$.
Sei $x in X ==>$ $f(x) = y in Y$. Wegen der Bijektivität von $f$ folgt $x = x_y in X$ 

Dann gilt: 
$
(g compose f)(x) = g(f(x)) = g(y) = x_y = x ==> g compose f = "Id"_X
$

"$<==$": 

Es gilt: $g compose f = "Id"_X$, $"Id"_X$ ist injektiv. Wegen Satz 1.34, 3) ist dann auch $f$ injektiv. Des weiteren gilt $f compose g = "Id"_Y$ ist surjektiv. Wegen 1.34, 4) ist dann auch $f$ surjektiv $==>$ $f$ ist bijektiv

#bolditalic[Frage:] Gibt es eine weitere Abbildung, $tilde(g): Y arrow X$ mit den gleichen Eigenschaften wie im letzten Satz? Wegen Satz 1.34, 1) gilt:
$
tilde(g) = "Id"_X compose tilde(g) = (g compose f) compose tilde(g) = g compose (f compose tilde(g)) = g compose "Id"_Y = g
$

#definition("1.36", "inverse Abbildung / Umkehrabbildung")[
  Seien $X, Y$ zwei nichtleere Mengen und $f: X arrow Y$ eine Abbildung. Ist $f$ bijektiv, dann heißt die in Satz 1.35 definierte, eindeutige Abbildung $g: Y arrow X$ #bolditalic[inverse Abbildung] oder #bolditalic[Umkehrabbildung] von $f$ und wird $f^(-1)$ bezeichnet.
]

#bolditalic[Beispiel 1.37:] Die Abbildung $f: RR arrow RR, space f(x) = 3x - 5$ ist bijektiv. Die zu $f$ inverse Abbildung erhält man durch Umformung.
$
y = 3x - 5 <==> y + 5 = 3x <==> x = 1/3(y+5)
$
Also $f^(-1): RR arrow RR, space y arrow.bar 1/3(y+5)$

#bolditalic[Achtung:] $f: RR arrow RR, f(x) = x^2$ ist nicht bijektiv.
$
tilde(f): RR arrow RR_+, space tilde(f)(x) = x^2 wide wide tilde(f)^(-1)(y) = sqrt(y)
$

#bolditalic[Achtung:] Die Notation $f^(-1)$ ist doppelt Belegt! Zum einen für die Notation der Umkehrabbildung und zum Anderen für die Notation des Urbilds.

#bolditalic[Satz 1.38:] Seien $X, Y$ und $Z$ nichtleere Mengen und die Abbildungen $f: X arrow Y$ sowie $g: Y arrow Z$ bijektiv. 

Dann gilt:

#box(width:100%, inset: (left: 1cm, right: 1cm), [
  1. $f^(-1)$ ist bijektiv $wide (f^(-1))^(-1) = f$ #v(1mm) 
  2. $(g compose f)^(-1) = f^(-1) compose g^(-1)$ 
])

#italic[Beweis:] (1. Übungsaufgabe) 

1. #[
$
f &= f compose "Id"_X \ &= f compose (f^(-1) compose (f^(-1))^(-1)) \ &= (f compose f^(-1)) compose (f^(-1))^(-1) \ &= "Id"_Y compose (f^(-1))^(-1) \ &= (f^(-1))^(-1)
$
]

2. #[Aus Satz 1.34 folgt, dass $g compose f$ bijektiv ist. $==>$ $(g compose f)^(-1)$ existiert und ist eindeutig bestimmt. Es gilt 
$
(f^(-1) compose g^(-1)) compose (g compose f) \
&= f^(-1) compose ((g^(-1) compose g) compose f) \
&= f^(-1) compose ("Id"_Y compose f) \
&= f^(-1) compose f = "Id"_X
$
Analog zeigt man: $(g compose f) compose (f^(-1) compose g^(-1)) = "Id"_Y$
$
==> (g compose f)^(-1) = f^(-1) compose g^(-1)
$
]
#endproof

#pagebreak()

= Algebraische Strukturen

Algebraische Strukturen sind Mengen und Verknüpfungen, die auf den Elementen der Menge definiert sind. Ein Beispiel dafür ist die Menge aller ganzen Zahlen mit der Addition als Verknüpfung.

Algebraische Strukturen besitzen wichtige Eigenschaften:

#boxedlist[Die Summe zweier ganzer Zahlen ist wieder eine ganze Zahl $corres$ Abgeschlossenheit der Menge bezüglich der Verknüpfung][Es gibt die ganze Zahl 0, sodass für jede ganze Zahl $a in ZZ$ gilt: $0 + a = a$. Dieses Element nennt man das neutrale Element][Für jede ganze Zahl $a in Z$ gibt es ein $-a in ZZ$, sodass gilt: $(-a) + a = 0$. Dieses Element nennt man das inverse Element von $a$]

Algebraische Strukturen erlauben es uns, abstrakte Konzepte aus konkreten Beispielen zu extrahieren und später komplexe Zusammenhänge mit diesen Konzepten zu analysieren und Stück für Stück zu erweitern.

== Gruppen

#definition("2.1", "innere Verknüpfung, Halbgruppe")[Sei $M$ eine nichtleere Menge. Eine Abbildung $circ: M times M arrow M, space (a, b) arrow.bar a circ b$ heißt #bolditalic[(innere) Verknüpfung] auf $M$. Gilt: $(a circ b) circ c =  a circ (b circ c)$, dann heißt die Verknüpfung #bolditalic[assoziativ] und $(M, circ)$ eise #bolditalic[Halbgruppe]. Gilt für eine Halbgruppe, dass $a circ b = b circ a$, so heißt die Halbgruppe #bolditalic[abelsch] oder #bolditalic[kommutativ].]

Je nach Kontext kann die Notation einer Verknüpfung variieren. ($a circ b$, $a dot b$, $a b$)

#bolditalic[Beispiel 2.2:] 

#boxedlist[$(NN, +)$ und $(NN, ast)$ sind kommutative Halbgruppen][Sei $X$ eine nichtleere Menge. Dann ist $M := "Abb"(X, X)$ $= {"Abbildungen" f: X arrow X}$ eine Halbgruppe mit der Verknüpfung $compose$ als Komposition von Abbildungen (Def. 1.33). Diese Halbgruppe ist nicht abelsch.

Beweis durch Gegenbeispiel:

Sei $a, b, c in X, a != b, a != c, b != c$. Definiere $f, g in M$ mit 
]
$
f(x) := cases(b "für" x = a, a "für" x = b, x "sonst") wide wide g(x) := cases(c "für" x = a, a "für" x = c, x "sonst")
$
#h(1cm) Dann folgt:
$
(f compose g)(a) = f(g(a)) = f(c) = c \
(g compose f)(a) = g(f(a)) = g(b) = b \
checkmark
$

Die Halbgruppe ist ein relativ "schwaches" Konzept. Deswegen braucht man weitere Eigenschaften:

#definition("2.3", "neutrales Element")[
  Sei $M$ eine nichtleere Menge und $circ$ eine innere Verknüpfung auf $M$. Existiert ein Element $e in M$ mit 
  $
  a circ e = e circ a = a wide forall space.sixth a in M
  $
  so heißt $e$ #bolditalic[neutrales Element] für die Verknüpfung $circ$. 

  Eine Halbgruppe, die ein neutrales Element besitzt heißt #bolditalic[Monoid].
]

#bolditalic[Beispiel 2.24:] Kein Monoid

Gegeben sei die Menge $M = {a, b}$ und die folgende Verknüfung 

#align(center, tablex(
  columns: 3, 
  auto-lines: false,
  (), vlinex(), (), (),
  $circ$, $a$, $b$,
  hlinex(), 
  $a$, $a$, $b$,
  $b$, $a$, $b$,
))

Man kann nachrechenen, dass $(M, circ)$ eine Halbgruppe ist. Man kann auch prüfen, dass $a$ linksneutral aber nicht rechtsneutral ist, sowie dass $b$ rechtsneutral aber nicht linksneutral ist. Somit besitzt die Halbgruppe kein neutrales Element, $(M, circ)$ ist also kein Monoid.

#bolditalic[Bemerkung:] In der Definition eines Monoids wird nur die Existenz aber nicht die Eindeutigkeit des neutralen Elements gefordert. Ist dies sinnvoll?

#bolditalic[Lemma 2.5:] Sei $(M, circ)$ ein Monoid und $e_1, e_2 in M$ neutrale Elemente, dann gilt
$
e_1 = e_2
$
#italic[Beweis:]
$
e_1 &= e_1 circ e_2 \
&= e_2
$
#endproof

#bolditalic[Beispiel 2.6:]

#boxedlist[$(NN, +)$ ist kein Monoid, da kein neutrales Element existiert ($0 in.not NN$ in LinA)][$(NN, dot)$ ist ein Monoid mit dem neutralen Element $e = 1$][Für $NN_0 = NN union {0}$ ist $(NN_0, +)$ ein Monoid mit dem neutralen Element $e = 0$]

#definition("2.7", "Gruppen")[Ein Monoid $(M, circ)$ ist eine #bolditalic[Gruppe], wenn für jedes $a in M$ ein $b in M$ existiert, so dass 
$
a circ b = b circ a = e
$
wobei $e$ das neutrale Element des Monoids ist. Wir nennen $b$ das #bolditalic[inverse Element] zu dem gegebenen Element $a$ und bezeichnen es mit $a^(-1) = b$.
]

#bolditalic[Bemerkung:] Für $circ = +$, d.h. additiv geschriebene Gruppen schreibt man auch $-a := b$.

#bolditalic[Beispiel 2.8:]

#boxedlist[$(ZZ, +)$, $(QQ, +)$ und $(RR, +)$ sind kommutative Gruppen][$(NN, +)$ ist keine Gruppe, da kein neutrales Element und keine inversen Elemente existieren][Rechnen mit binären Zahlen

Betrachtet wird $FF_2 = {0, 1}$ und die Verknüpfungen

#set align(center)

#box(width: 50%, grid(columns: (1fr, 1fr),
  tablex(
    columns: 3,
    auto-lines: false,
    align: horizon + center,
    (), vlinex(), (), (),
    $+$, $0$, $1$,
    hlinex(),
    $0$, $0$, $1$,
    $1$, $1$, $0$,
    ),
  tablex(
    columns: 3,
    auto-lines: false,
    align: horizon + center,
    (), vlinex(), (), (),
    $dot$, $0$, $1$,
    hlinex(),
    $0$, $0$, $0$,
    $1$, $0$, $1$,
    ), 
))
#set align(left)

Anhand der Verknüpfungstabellen erkennt man, dass $(FF_2, +)$ mit dem neutralen Element $e = 0$ eine abelsche Gruppe ist. Jedoch ist $(FF_2, dot)$ keine Gruppe, da zwar ein neutrales Element $e = 1$, aber das Element $0$ kein inverses Element besitzt.
]

#bolditalic[Satz 2.9:] Sei $(M, circ)$ eine Gruppe, dann gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm), [
  1. Es gibt #bolditalic[genau ein] neutrales Element in $M$.
  2. Jedes Element der Menge $M$ besitzt #bolditalic[genau ein] inverses Element.
  3. Jedes linksinverse Element ist gleichzeitig auch rechtsinvers.
  4. Jedes linksneutrale Element ist gleichzeitig auch rechtsneutral.
  ]
)

#italic[Beweis:]

1. Folgt aus Lemma 2.5, da $(M, circ)$ nach Definition ein Monoid ist.
2. #[
  Annahme: Seien $b in M$ und $tilde(b) in M$ inverse Elemente zu $a in M$. 

  zu zeigen: $z = tilde(z)$

  Dann gilt: 
  $
  b &= b circ e \
  &= b circ (a circ tilde(b)) \ 
  &= (b circ a) circ tilde(b) \
  &= e circ tilde(b) \
  &= tilde(b)
  $
]  
3. #[
  Es sei $b in M$ ein linksinverses Element zu $a in M$. D.h. $b circ a = e$. Sei $tilde(b) in M$ ein linksneutrales Element zu $b in M$. D.h. $tilde(b) circ b = e$.
  $
  a circ b &= e circ (a circ b) \
  &= tilde(b) circ b circ (a circ b) \
  &= tilde(b) circ (b circ a) circ b \
  &= tilde(b) circ e circ b \
  &= tilde(b) circ b \
  &= e #hide($tilde(b)$)
  $
]
4. #[
  Es gelte $e circ a = a$ und $b circ a = a circ b = e$

  Dann gilt: $(a circ b) circ a = a circ (b circ a) = a circ e = a wide checkmark$
]

#bolditalic[Lemma 2.10:] Sei $(M, circ)$ eine Gruppe. Gilt für ein $a in M$, dass $c circ a = a$ für ein $c in M$; dann ist $c$ das neutrale Element der Gruppe.

#italic[Beweis:] Sei $e$ das neutrale Element (es gibt genau 1) der Gruppe $(M, circ)$ und für $a, c in M$ gelte: $c circ a = a$. Sei $b$ das inverse Element zu $a$.
$
c &= c circ e \
  &= c circ (a circ b) \
  &= (c circ a) circ b \
  &= a circ b \
  &= e 
$
#endproof

Besonders wichtig in der linearen Algebra sind Abbildungen zwischen Gruppen, die bezüglich der Verknüpfung "kompatibel" sind.

#definition("2.11", "Homomorphismus")[
  Seien $(M, circ)$ und $(N, oplus)$ Gruppen. Eine Abbildung $f: M arrow N$ heißt #bolditalic[Homomorphismus] (oder #bolditalic[Gruppenhomomorphismus]) falls:
  $
  f(x circ y) = f(x) oplus f(y) wide forall space.sixth x, y in M
  $
  Ein Homomorphismus heißt #bolditalic[Isomorphismus], wenn er bijektiv ist.
]

#bolditalic[Beispiel 2.12:] Die Abbildung $f: RR arrow RR_(>0)$ mit $f(x) = e^(2x)$ ist ein Homomorphismus zwischen $(RR, +)$ und $(RR_(>0), dot)$ mit $RR_(>0) = {x in RR | x > 0}$ denn 
$
f(x + y) = e^(2(x+y)) = e^(2x) dot e^(2y) = f(x) dot f(y)
$

#bolditalic[Satz 2.13:] Sei $f: M arrow N$ für die Gruppen $(M, circ)$ und $(N, oplus)$ ein Homomorphismus sowie $e_M$ und $e_N$ jeweils die neutralen Elemente. Dann gilt $f(e_M) = e_N$.

#italic[Beweis:] Sei $a in M$ beliebig gewählt, dann folgt 
$
f(a) = f(e_M circ a) = f(e_M) oplus f(a) = e_N oplus f(a) \
attach(==>, t: "2.10") f(e_M) "ist ein neutrales Element" attach(==>, t: "2.9") f(e_M) = e_N
$
#endproof

Homomorphismen bilden das neutrale Element im Definitionsbereich immer auf das neutrale Element des Wertebereichs ab. Später werden wir sehen, dass wenn der Homomorphismus nicht bijektiv ist, noch mehr Elemente auf das neutrale Element im Wertebereich $e_N$ abgebildet werden können. Dies motiviert folgende Definition:

#definition("2.14", "Kern")[
  Ist $f: (M, circ) arrow (N, oplus)$ ein Homomorphismus, so nennt man:
  $
  ker(f) := {a in M | f(a) = e_N}
  $ 
  den #bolditalic[Kern] von $f$.
]

== Ringe

Ringe sind eine Erweiterung der algebraischen Strukturen von einer auf zwei Verknüpfungen. 

#definition("2.15", "Ring")[
  Seien $R$ eine Menge und "$+$" sowie "$dot$" zwei Verknüpfungen auf $R$. Das Tripel $(R, +, dot)$ heißt #bolditalic[Ring], falls gilt:

  #box(width: 100%, inset: (left: 0.5cm, right: 0.5cm), [
    1. $(R, +)$ ist eine kommutative Gruppe, deren neutrales Element wir mit $0$ bezeichnen.
    2. $(R, dot)$ ist eine Halbgruppe, d.h. es gilt das Assoziativgesetz.
    3. #[
      Es gelten die Distributivgesetze: $forall a, b, c in R$ 
      $
      a dot (b + c) = a dot b + a dot c  \
      (a + b) dot c = a dot c + b dot c
      $
    ]
    Ein Ring heißt kommutativ, wenn $dot$ kommutativ ist. D.h. $a dot b = b dot a, space forall space.sixth a, b in R$. Ein Element $1 in R$ heißt #bolditalic[Einselement], wenn es das neutrale Element bezüglich der Multiplikation ist. Das heißt wenn für alle $a in R$ gilt: $1 dot a = a dot 1 = a$.
  ])
]

#bolditalic[Achtung:] Die Formulierung der Distributivitätsgesetze impliziert, dass die Multiplikation stärker bindet als die Addition ("Punkt vor Strich").

#bolditalic[Beispiel 2.16:]

#boxedlist[$(NN, +, dot)$ ist kein Ring][$(ZZ, +, dot)$ ist ein kommutativer Ring mit Einselement]

#boxedlist[
  $(FF_2, +, dot)$ ist ein kommutativer Ring mit Einselement, denn

  #boxedlist[das neutrale Element bezüglich der Addition ist die $0$, denn $0 + 0 = 0$, $0 + 1 = 1$, $1 + 0 = 0$][das additive inverse Element zu $0$ ist $0$ und zu $1$ die $1$, denn $1 + 1 = 0$][die Addition ist kommutativ][die Addition ist assoziativ, zeigt man durch nachrechnen für alle $8$ Möglichkeiten][das neutrale Element für die Multiplikation ist $1$, denn $0 dot 1 = 0$ und $1 dot 1 = 1$][die Multiplikation ist kommutativ][die Multiplikation ist assoziativ, zeigt man durch nachrechnen][die Distributivgesetze gelten, zeigt man durch nachrechnen]
]

In Ringen gelten die "üblichen" Rechenregeln, z.B.:
$
0 dot a = 0
$
#italic[Beweis:]
$
0 dot a &= 0 dot a + 0 dot a - 0 dot a = (0 + 0) dot a - 0 dot a \
&= 0 dot a - 0 dot a = 0
$
oder auch 
$
(-1) dot a = -a
$
#italic[Beweis:]
$
a + (-1) dot a &= 0, "denn" \
a + (-1) dot a &= 1 dot a + (-1) dot a = (1 + (-1)) dot a = 0 dot a = 0
$
analog zeigt man $a dot 0 = 0$ und $a dot (-1) = -a$

#bolditalic[Bemerkung:] Wenn in einem Ring die Gleichung $1 = 0$ gilt, folgt
$
a = a dot 1 = a dot 0 = 0
$
Somit muss $R$ der Nullring sein, $R = {0}$.

#bolditalic[Beispiel 2.17:] Ring der Polynome 

Sei $(R, +, dot)$ ein kommutativer Ring mit Eins. Ein Polynom mit Koeffizienten in $R$ und der Unbekannten $t in R$ (kurz Polynom über $R$) ist gegeben durch
$
p(t) = a_0 dot t^0 + a_1 dot t^1 + ... + a_n dot t^n, wide a_0, a_1, ..., a_n in R
$
Die Menge aller Polynome über $R$ wird mit $P[t]$ bezeichnet. 

Betrachte zwei Polynome $p, q in P[t]$ mit
$
p(t) = a_0 + a_1 t + ... + a_n t^n "und" q(t) = b_0 + b_1 t + b_m t^m
$
mit $n >= m$. Ist $n > m$, so setzen wir $b_j = 0$ für $j = m + 1, ..., n$. $p(t)$ und $q(t)$ sind gleich, wenn $a_j = b_j$ für alle $j in {1, ..., n}$ gilt.

Aufgrund der Eigenschaften von $R$ gilt
$
a_0 + a_1 t + ... + a_(n-1) t^(n-1) + a_n t^n = a_n t^n + a_(n-1) t^(n-1) + ... + a_1 t + a_0
$
Der Grad eines Polynoms $p(t) in P[t]$ ist definiert als der größte Index $j$ für den $a_j != 0$ gilt. Gibt es keinen solchen Index, ist $p(t)$ das Nullpolynom, d.h. $p(t) = 0$ für alle $t in R$ und man definiert den Grad von $p(t)$ als $- infinity$.

Sind zwei Polynome $p, q in P[t]$ wie oben definiert, und setzen wir wieder $b_j = 0$ für alle $j in {m+1, ..., n}$, dann sind die Verknüpfungen "$+$" und "$dot$" wie folgt definiert:
$
p(t) + q(t) = (a_0 + b_0) + (a_1 + b_1) t + ... +(a_n + b_n) t^n "und" \
p(t) dot q(t) = c_0 + c_1 t + ... + c_(n+m) t^(n+m), wide c_k := sum_(i+k = k) a_i dot b_j
$
Mit dem Nullpolynom definiert wie oben und dem Einspolynom definiert als $p(t) := 1$ kann man nachrechnen, dass $(P[t], +, dot)$ ein kommutativer Ring ist.

#definition("2.18", "invertierbar")[
  Es sei $(R, +, dot)$ ein Ring mit Eins und $a in R$ gegeben. Ein Element $b in R$ heißt #bolditalic[invers] (bezüglich $dot$) zu $a$, wenn gilt:
  $
  a dot b = b dot a = 1
  $
  Existiert zu $a in R$ ein inverses Element, so heißt $a$ #bolditalic[invertierbar].
]

#bolditalic[Satz 2.19:] Es sei $(R, +, dot)$ ein Ring mit Eins. Dann gilt:

#box(width: 100%, inset: (right: 1cm, left: 1cm), [
  1. Existiert zu $a in R$ ein inverses Element bezüglich $dot$, so ist dies eindeutig bestimmt. Dies wird mit $a^(-1)$ gekennzeichnet.

  2. Wenn $a b in R$ invertierbar sind, dann ist auch $a dot b$ invertierbar und es gilt:
  $
  (a dot b)^(-1) = b^(-1) dot a^(-1)
  $
])

#italic[Beweis:] Siehe oben im Abschnitt zu Abbildungen. 
#endproof

== Körper 

Eine knappe Definition eines Körpers: 

Ein kommutativer Ring mit Eins heißt Körper, falls $0 != 1$ gilt (der Nullring wird ausgeschlossen) und jedes Element $a in R backslash {0}$ invertierbar ist.

Es folgt eine äquivalente und formalere Definition:

#definition("2.20", "Körper", [
  Eine Menge $K$ mit zwei Verknüpfungen
  $
  +: K times K arrow K, space (a, b) arrow.bar a + b wide wide "Addition" \
  dot: K times K arrow K, space (a, b) arrow.bar a dot b wide space "Multiplikation"
  $
  heißt #bolditalic[Körper], wenn gilt:

  #boxedlist[$(K, +)$ ist eine kommutative Gruppe #sspace][$(K backslash {0}, dot)$ ist auch eine kommutative Gruppe][
    Es gelten die Distributivgesetze
    $
    a dot (b + c) = a dot b + a dot c \
    (a + b) dot c = a dot c + b dot c 
    $
  ]
])

#bolditalic[Lemma 2.21:] Sei $(K, +, dot)$ ein Körper. Gilt für $a, b in K$, dass $a dot b = 0$, so ist mindestens eins davon die $0$.

#italic[Beweis:] 

Fall 1: $a = b = 0$

Fall 2: o.B.d.A: $a != 0 ==> exists space.sixth a^(-1): a dot a^(-1) = 1$
$
b = 1 dot b = (a^(-1) dot a) dot b = a^(-1) dot (a dot b) = a^(-1) dot 0 = 0 
$
#endproof
Diese Eigenschaft nennt man Nullteilerfreiheit.

#bolditalic[Beispiel 2.22:]

#boxedlist[$(RR, +, dot)$ ist ein Körper][$(ZZ, +, dot)$ ist kein Körper, da die multiplikativ inversen Elemente in $QQ$, aber nicht immer in $ZZ$ liegen]

#bolditalic[Beispiel 2.23:] komplexe Zahlen

Die Menge der komplexen Zahlen ist definiert als:
$
CC := {(x, y) | x, y in RR}
$
d.h. $CC = RR times RR$. Die zwei Verknüpfungen Addition und Multiplikation werden wie folgt definiert:
$
+ &: CC times CC arrow CC, space (a, b) + (c, d) = (a + c, b + d) \
dot &: CC times CC arrow CC, space (a, b) dot (c, d) = (a dot c - b dot d, a dot d + b dot c)
$

Wir verwenden impliziet die Operationen auf den reellen Zahlen, $+, -, dot$. Dann sieht man:

#boxedlist[Das neutrale Element in $CC$ bezüglich $+$ ist die $0_CC = (0,0)$][Das neutrale Element in $CC$ bezüglich $dot$ ist die $1_CC = (1, 0)$]

Man rechnet nach, dass 

#boxedlist[
  Das inverse Element bezüglich $+$ in $CC$ definiert ist mit #sspace
  $
  -(x, y) = (-x, -y) in CC wide forall space.sixth (x, y) in CC \
  $
][
  Das inverse Element bezüglich $dot$ in $CC$ definiert ist mit 
  $
  (x, y)^(-1) = (x/(x^2 + y^2), y/(x^2 + y^2)) in CC wide forall space.sixth (x, y) in CC backslash {0_CC}
  $
]
Das Überprüfen der Rechengesetze zeigt, dass $CC$ ein Körper ist.

Für die Teilmenge 
$
M := {(x, 0) | x in RR} subset CC 
$
kann man jedes Element der reellen Zahlen mit einem Element der Menge $M$ mit der bijektiven Abbildung 
$
RR arrow M, space x arrow.bar (x, 0)
$
identifizieren. Mit $0_RR arrow.bar (0, 0) = 0_CC$, $1_RR arrow.bar (1, 0) = 1_CC$ kann man $M$ als Teilkörper von $CC$ auffassen. Es gilt jedoch auch $RR subset.eq.not CC$ (zummindest in LinA).

Eine besondere komplexe zahl ist die imaginäre Einheit $(0, 1)$, für die gilt:
$
(0, 1) dot (0, 1) = (-1, 0) corres -1
$
Dabei wird $(-1, 0) in CC$ mit $-1 in RR$ über die oben genannte bijetkive Abbildung identifiziert. Mit der Definition $i := (0, 1)$ folgt
$
i dot i = -1
$
Mit dieser Notation und Identifikation kann man eine komplexe Zahl $z in CC$ beschreiben mit 
$
z = (x, y) &= (x, 0) + (0, y) = (x, 0) + (0, 1) dot (y, 0) \
&= x + i y 
$
Man schreibt $"Re"(z) = x$ als #bolditalic[Realanteil] von $z$ und $"Im"(z) = y$ als #bolditalic[Imaginäranteil] von $z$.

Man definiert zu $(x, y) in CC$ die #bolditalic[konjugiert komplexe Zahl] durch 
$
overline(z) = (x, -y) in CC
$
Damit erhält man für ein $z = (x, y) in CC$:
$
abs(z) := sqrt(z dot overline(z)) &= sqrt((x + i y) dot (x - i y)) \
&= sqrt(x^2 - i x y + i x y - i^2 y^2) \
&= sqrt(x^2 + y^2)
$

== Vektorräume

#bolditalic[Beispiel 2.24:] Kräfeparallelogramm 

Betrachten wir einige Gesetze aus der Mechanik:

Je zwei am selben Punkt angreifende Kräfte können durch eine einzige Kraft ersetzt werden. Diese resultierende Kraft (= Gesamtkraft) hat die gleiche Wirkung wie die Einzelkräfte.
$
F = F_1 + F_2 wide "die Kräfte können als Vektoren betrachtet werden"
$
#boxedlist[Ein Vektor hat eine Länge und eine Richtung][Vektoren kann man addieren][Vektoren können mit einer reellen Zahl multipliziert werden]

#bolditalic[Beispiel 2.25:] Interpolationsproblem

Gegeben sind reelle Zahlen $a, b, c in RR$. Gesucht ist ein Polynom zweiten Grades $p(t) in P[t]$ mit 
$
p(1) = a wide p(2) = b) wide p(3) = c
$
für ein $p(t) = a_0 + a_1 t + a_2 t^2$. D.h. es muss gelten:
$
p(1) = a_0 + a_1 dot 1 + a_2 dot 1 = a \
p(2) = a_0 + a_1 dot 2 + a_2 dot 4 = b \
p(3) = a_0 + a_1 dot 3 + a_2 dot 9 = c
$
Diese Gleichung hat genau eine Lösung.
$
p(t) = (3a-3b+c) + (-5a/2 + 4b - 3c/2) t + (a/2 - b + c/2) t^2
$
Eine alternative Darstellung ist 
$
p_1(t) = 1/2(t - 2)(t - 3) wide p_2(t) = -(t - 1)(t - 3) wide p_3(t) = 1/2(t - 1)(t - 2)
$
für die gilt: 
$
p_i(k) = cases(1 "für" i = k, 0 "sonst")
$
Dann ist $p(t)$ gegeben durch:
$
p(t) = a p_1(t) + b p_2(t) + c p_3(t)
$
#bolditalic[Beobachtung:] Die additive Verknüpfung zweier Elemente gleicher Art und Multiplikation mit einer reellen Zahl ($corres$ Skalar).

Solch eine algebraische Sturktur wollen wir beschreiben:

#definition("2.26", "Vektorraum")[
  Sei $K$ ein Körper. Ein Vektorraum über $K$, kurz $K$-Vektorraum, ist eine Menge $V$ mit zwei Abbildungen:

  #boxedlist[
    Addition #sspace
    $
    +: V times V arrow V, space (v, w) arrow.bar v + w
    $
  ][
    skalare Multipliktation
    $
    dot: K times V arrow V, space (lambda, v) arrow.bar lambda v
    $
  ]
  für die folgendes gilt:

  #boxedlist[
    $(V, +)$ ist eine kommutative Gruppe #sspace
  ][
    Für alle $v, w in V$ und $lambda, mu in K$ gilt:
    
    #box(width: 100%, inset: (left: 4.5cm), [
      1. $lambda dot (mu dot v) = (lambda dot mu) dot v$
      2. $1 dot v = v$ 
      3. $lambda dot (v + w) = lambda dot v + lambda dot w$
      4. $(lambda + mu) dot v = lambda dot v  + mu dot v$ 
    ])
  ]

  Ein Element $v in V$ nennen wir #bolditalic[Vektor], ein $mu in K$ nenn wir einen #bolditalic[Skalar].
]

#bolditalic[Beobachtung:] Für einen Vektorraum sind die Operatinen $+$ und die skalare Multiplikation $dot$ abeschlossen.

#bolditalic[Beispiel 2.27:] Für einen Körper $K$ ist der Standartvektorraum gegeben durch die Menge $V = K^n$ für ein $n in NN$. Die n-Tupel werden geschrieben als 
$
v = vec(v_1, v_2, dots.v, v_n) "mit" v_1, v_2, ..., v_n in K
$
Die Addition und die skalare Multiplikation ist komponentenweise definiert.
$
v + w = vec(v_1, v_2, dots.v, v_n) + vec(w_1, w_2, dots.v, w_n) = vec(v_1 + w_1, v_2 + w_2, dots.v, v_n + w_n) \
lambda dot w = lambda dot vec(w_1, w_2, dots.v, w_n) = vec(lambda dot w_1, lambda dot w_2, dots.v, lambda dot w_n)
$
Damit ist der Vektorraum $V = K^n$ ein $K$-Vektorraum. Der Nullvektor $arrow(v_0)$ ist definiert durch
$
arrow(0) = vec(0, 0, dots.v, 0)
$
Das additiv inverse Element ist gegeben durch 
$
-v = - vec(v_1, v_2, dots.v, v_n) = vec(-v_1, -v_2, dots.v, -v_n) "für" v_1, v_2, ..., v_n in K 
$
Da $K$ ein Körper ist, ist die so definierte skalare Multiplikation assoziativ, distributiv und mit $1 in K$ kompatibel ($1 dot v = v$).

#bolditalic[Beispiel 2.28:] Polynome 

Die Menge $P[t]$ aller Polynome über einen Körper $K$ mit der Unbekannten $t$ bilden einen $K$-Vektorraum, wenn die Addition von Polynomen wie in Beispiel 2.17 definiert ist nd die skalare Multiplikation für ein $p(t) = a_0 + a_1 t + ... a_n t^n in P[t]$ definiert ist durch:
$
dot: K times P[t] arrow P[t] \
\
lambda dot p(t) = (lambda a_0) + (lambda a_1) t + ... + (lambda a_n) t^n 
$

#bolditalic[Beispiel 2.29:] Abbildungen

Die Menge $V = "Abb"(RR, RR)$ der Abbildungen $f: RR arrow RR$ bilden einen Vektorraum über den Körper $RR$ mit den Verknüpfungen
$
+: V times V arrow V, space (f, g) arrow.bar f + g wide (f + g)(x) := f(x) + g(x)
$
und 
$
dot: RR times V arrow V, space (lambda, g) arrow.bar lambda dot g 
$
Das Gleiche gilt für 
$
V &:= {"stetige Abbildungen" f: RR arrow RR} \
V &:= {"differenzierbare Abbildungen" f: RR arrow RR}
$

#bolditalic[Lemma 2.30:] Für den $K$-Vektorraum $(V, +, dot)$ mit dem Nullement $0_K$ des Körpers und $0_V$ des Vektorraums. Dann gilt

#box(width: 100%, inset: (right: 1cm, left: 1cm))[
  1. $0_K dot v = 0_V$
  2. $lambda dot 0_V = 0_V$
  3. $-(lambda dot v) = (-lambda) dot v = lambda dot (-v) wide forall space.sixth lambda in K, forall space.sixth v in V$
]

#italic[Beweis:]

zu 1) $forall space.sixth v in V$ gilt

$
0_K dot v &= (0_K + 0_K) dot v = 0_K dot v + 0_K dot v wide bar.v -(0_K dot v) \
0_V &= 0_K dot v + 0_V = 0_K dot v \
0_V &= 0_K dot v 
$

zu 2) $forall space.sixth lambda in K$ gilt

$
lambda dot 0_V &= lambda dot (0_V + 0_V) = lambda dot 0_V + lambda dot 0_V wide bar.v -(lambda dot 0_V) \
0_V &= lambda dot 0_V
$

zu 3) $forall space.sixth lambda in K, forall space.sixth v in V$ gilt 

$
lambda dot v + ((-lambda) dot v ) = (lambda - lambda) dot v = 0_K dot v = 0_V space checkmark \
lambda dot v + (lambda dot (-v)) = (lambda dot (v - v)) = lambda dot 0_V = 0_V space checkmark 
$
#endproof

#definition("2.31", "Untervektorraum")[
  Sei $(V, +, dot)$ ein $K$-Vektorraum und sei $U subset.eq V$. Dann ist $(U, + dot)$ ein #bolditalic[Untervektorraum], kurz #bolditalic[Unterraum] von $(V, +, dot)$.
]

#bolditalic[Lemma 2.32:] Sei $(V, +, dot)$ ein $K$-Vektorraum und $U subset.eq V$. Dann ist $(U, +, dot)$ genau dann ein Unterraum von $V$, wenn gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $u + w in U wide forall space.sixth u, w in U$
  2. $lambda u in U wide forall space.sixth lambda in U, forall space.sixth u in U$
]

#italic[Beweis:] (Übung)

Ist $U$ nicht abgeschlossen bezüglich der Addition und der skalaren Multiplikation, dann ist $(U, +)$ keine kommutative Gruppe und $(U, dot)$ keine Halbgruppe. In beiden Fällen ist $(U, +, dot)$ dann kein Vektorraum und somit auch kein Untervektorraum von $(V, +, dot)$.
#endproof

#bolditalic[Beispiel 2.33:] 

#boxedlist[Jeder Vektorraum $(V, +, dot)$ hat die Vektorräume $(U = V, + dot)$ und $(U = {0_V}, +, dot)$][Für jedes $u in NN_0$ ist die Menge aller Polynome mit dem Grad kleiner gleich $n$, d.h. die Menge $P[t]_(<=n) = {p(t) in P[t] | "Grad"(p) <= n}$ ist mit den Verknüpfungen aus Beispiel 2.28 ein Unterraum von $(P[t], +, dot)$]

#definition("2.34", "Linearkombination")[
  Seien $(V, +, dot)$ ein $K$-Vektorraum, $n in NN$ und $v_1, ..., v_n in V$. Ein Vektor der Form 
  $
  lambda_1 v_1 + lambda_2 v_2 + ... + lambda_n v_n = sum_(i = 1)^n lambda_i v_i = v in V
  $
  heißt #bolditalic[Linearkombination] von $v_1, ..., v_n in V$ mit den Koeffizienten $lambda_1, ..., lambda_n in K$. Die #bolditalic[lineare Hülle] / Der #bolditalic[Spann] von $v_1, ..., v_n in V$ ist die Menge 
  $
  "Span"{v_1, ..., v_n} := {sum_(i=1)^n lambda_i v_i | lambda_1, ..., lambda_n in K}
  $
]

#bolditalic[Lemma 2.35:] Sei $(V, +, dot)$ ein $K$-Vektorraum und $v_1, ..., v_n in V$, dann ist $("Span"{v_1, ..., v_n}, +, dot)$ ein Unterraum von $(V, +, dot)$.

#italic[Beweis:] Es gilt $"Span"{v_1, ..., v_n} subset.eq V$. Wegen Lemma 2.32 reicht es zu zeigen, dass $U := "Span"{v_1, ..., v_n}$ bezüglich $+$ und $dot$ abgeschlossen ist. Dies gilt nach der Definition der linearen Hülle.
#endproof

#bolditalic[Beispiel 2.36:] Für $V = RR^3, K = RR$. Betrachte
$
M = {vec(3, 0, 1), vec(9, 0, 3)}, "ist" vec(12, 0, 4) in "Span"(M) "?"
$
Ja, denn es gilt:
$
1 dot v_1 + 1 dot v_2 = vec(3+9, 0+0, 1+3) = vec(12, 0, 4)
$
Des weiteren gilt:
$
"Span"(M) = {lambda dot vec(3, 0, 1) | lambda in RR} = A
$
#italic[Beweis:] 

"$subset.eq$": 

$A = {vec(3, 0, 1) dot lambda | lambda in RR} subset.eq {lambda dot vec(3, 0, 1) + 0 dot vec(9, 0, 3) | lambda in RR} subset.eq "Span"(M)$

"$supset.eq$": 

$
x = vec(x_1, x_2, x_3) in "Span"(M) <==> vec(x_1, x_2, x_3) &= lambda_1 vec(3, 0, 1) + lambda_2 vec(9, 0, 3) \ 
&= lambda_1 vec(3,0,1) + 3 lambda_2 vec(3, 0, 1) \ 
&= (lambda_1 + 3 lambda_2) vec(3, 0, 1) \ 
==> x = (lambda_1 + 3 lambda_2) vec(3, 0, 1) in A
$
#endproof

#pagebreak()

= Basen und Dimensionen von Vektorräumen

Dieses Kapitel motiviert unter anderem die Frage, wie man Vektorräume effizient beschreiben kann.

== Lineare Unabhängigkeit

#definition("3.1", "lineare Unabhängigkeit")[
  Sei $V$ ein $K$-Vektorraum. Die Vektoren $v_1, ..., v_n in V$ heißten #bolditalic[linear unabhängig], wenn aus 
  $
  sum_(i = 1)^n lambda_i v_i = 0 wide "mit" lambda_1, ..., lambda_n in K 
  $
  folgt, dass $lambda_1 = lambda_2 = ... = lambda_n = 0$ gilt. Folgt dies nicht, d.h. gilt 
  $
  sum_(i = 1)^n lambda_i v_i = 0 wide "mit" lambda_1, ..., lambda_n in K
  $
  die nicht alle gleich $0$ sind, so heißten $v_1, ..., v_n$ #bolditalic[linear abhängig].

  #boxedlist[Die leere Menge ist linear unabhängig.][Ist $M != emptyset$ eine Menge und für jedes $m in M$ ein Vektor $v_m in V$ gegeben, so nennt man die Menge ${v_m}_(m in M)$ linear unabhängig, wenn endlich viele Vektoren immer linear unabhängig sind. Gilt dies nicht, so ist die Menge ${v_m}_(m in M)$ linear abhängig.]
]

#bolditalic[Bemerkung:] Nach Definition sind die Vektoren $v_1, ..., v_n$ genau dann linear unabhängig, wenn sich der Nullvektor aus ihnen nur in der Form $0 = 0 dot v_1 + ... + 0 dot v_n$ mit endlich vielen Vektoren darstellen lässt

#bolditalic[Beispiel 3.2:] Fortsetzung von Beispiel 2.36

Die Vektoren aus $M = {(3,0,1), (9,0,3)}$ sind linear abhängig, da 
$
3 vec(3, 0, 1) - vec(9, 0, 3) = vec(0, 0, 0) wide "mit" lambda_1 = 3, lambda_2 = -1
$
Der Vektor $v_1 = (3, 0, 1)$ dagegen ist linear unabhängig, da
$
0 dot vec(3, 0, 1) = vec(0, 0, 0) wide "mit" lambda_1 = 0
$

#bolditalic[Beispiel 3.3:] $V = RR^3, K = RR$

Betrachte $M = {(3, 0, 1), (9, 0, 3), (0, 1, 1)}$. Sind diese Vektoren linear unabhängig? Die allgemeine Vorgehensweise ist hier, ein lineares Gleichungssystem aufzustellen und zu lösen. Hat das Gleichungssystem eine Lösung $!= 0$, dann sind die Vektoren linear abhängig.

Hier: $==>$ linear abhängig

#bolditalic[Lemma 3.4:] Sei $V$ ein $K$-Vektorraum. Dann gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. Ein einzelner Vektor ist genau dann linear unabhängig, wenn $v != 0_V$ gilt
  2. Sind $v_1, ..., v_n in V$ linear unabhängig und ist ${u_1, ..., u_m} subset.eq {v_1, ..., v_n}$, dann ist auch die Menge $u_1, ..., u_m$ linear unabhängig
  3. Sind $v_1, ..., v_n in V$ linear abhängig und $u_1, ..., u_m in V$. Dann ist auch $v_1, ..., v_n, u_, ..., u_m$ linear abhängig 
]

#italic[Beweis:]

zu 1: Sei $v in V, v != 0_V$. Es soll gelten: $lambda v = 0 ==> lambda = 0, "da" v != 0_V$

zu 2: $v_1, ..., v_n$ sind linear unabhängig und es gilt ${u_1, ..., u_m} subset.eq$ ${v_1, ..., v_n}$.

Damit die Vektoren ${u_1, ..., u_m}$ linear unabhängig sind, muss gelten
$
lambda_1 u_1 + ... + lambda_m u_m = 0
$
Wegen der linearen Unabhängigkeit von ${v_1, ..., v_n}$ gilt nach Umbennenung der Vektoren ${u_1, ..., u_m}$:
$
lambda_i_1 v_i_1 + ... + lambda_i_m + v_i_m + limits(sum_(j = 1)^n)_(j in.not {i_1, ..., i_m}) ==> lambda_i_1 = ... = lambda_i_m = 0
$

zu 3: $v_1, ..., v_n$ sind linear abhängig $==> exists space.sixth lambda_i in K$, so dass nicht alle $lambda_i$ gleich Null sind und $lambda_1 v_1 + lambda_2 v_2 + ... + lambda_n v_n = 0$ gilt.

$==> lambda_1 v_1 + ... + lambda_n v_n + mu_1 u_1 + ... + mu_m u_m = 0$ $==> mu_1, ..., mu_m = 0$ $==>$ Mit Koeffizienten $lambda_1, ..., lambda_n, mu_1, mu_m$ lassen sich $v_1, ..., v_n, u_1, ..., u_m$ linear zu Null kombinieren ohne, dass alle Koeffizienten Null sind $==> v_1, ..., v_n, u_1, ..., u_m$ sind linear abhängig
#endproof

Eine alternative Definition der linearen Unabhängigkeit motiviert Satz 3.5:

#bolditalic[Satz 3.5:] Sei $V$ ein $K$-Vektorraum. Eine Menge $M subset.eq V$ ist genau dann linear unabhängig, wenn kein Vektor $v in V$ als Linearkombination dargestellt werden kann.

#italic[Beweis:] 

"$==>$": Annahme: $M subset.eq V$ sind linear unabhängig und es existiert ein Vektor $v in M$, der als Linearkombination von endlichen Vektoren aus $M backslash {v}$ dargestellt werden kann. D.h. es existieren $lambda_1, ..., lambda_n in K backslash {0}, n >= 1$ und $v_1, ..., v_n in M backslash {v}$ mit 
$
sum_(i = 1)^n lambda_i v_i = v ==> -v + sum_(i = 1)^n lambda_i v_i = 0 space arrow.zigzag
$
Dies ist ein Widerspruch zur Annahme, dass die Vektoren linear unabhängig sind. Es existiert also kein Vektor, welcher als Linearkombination ausgedrückt werden kann.

"$<==$": Angenommen $M$ wäre linear abhängig. D.h. es existieren $n in NN$ und $v_1, ..., v_n in M, lambda_1, ..., lambda_n in K$ mit $lambda_1 != 0 "und" sum_(k = 1)^n lambda_k v_k = 0$ $==>$ 
$
sum_(k = 1)^n lambda_k/lambda_1 v_k = 0 ==> v_1 + sum_(k = 2)^n lambda_k/lambda_1 v_k = 0 \
==> v_1 = -sum_(k = 2)^n lambda_k/lambda_1 v_k space arrow.zigzag
$
Dies ist ein Widerspruch dazu, dass man $v$ nicht als Linearkombination darstellen kann. Die Vektoren sind also linear unabhängig.
#endproof

#definition("3.6", "Span für unendliche Mengen")[
  Sei $K$ ein Körper, $V$ ein $K$-Vektorraum, $M$ eine Menge und $v_m in M space forall space.sixth m in M$ gegeben. Dann ist der Spann der Familie ${v_m}_(m in M)$ gegeben durch
  $
  "Span"{v_m}_(m in M) := {#box(width: auto, height: 0.7cm, [
    $ 
    v in V | exists space.sixth n in NN "und endliche Teilmenge" J subset M, \
    abs(j) = n "mit" v in "Span"{v_j}_(j in J) 
    $
  ])}
  $
]

#bolditalic[Beispiel 3.7:] $M = NN$, $v_m := t^m$, $t in K$, $"Span"{v_m}_(m in M) = P[t]$

#bolditalic[Satz 3.8:] Sei $K$ ein Körper, $V$ ein $K$-Vektorraum und $M$ eine Menge. Dann sind folgende Aussagen äquivalent:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. ${v_m}_(m in M)$ ist linear unabhängig
  2. jeder Vektor $v in "Span"{v_m}_(m in M)$ hat eine eindeutige Darsetllung als Linearkombination
]

#italic[Beweis:]

$1 ==> 2$: Beweis per Kontraposition 

Seien $I, J subset.eq M$ endlich. Sei $lambda_K in K$, $k in I$ und $mu_k in K$, $k in J$. Betrachte den Vektor $v in V$. Für diesen gilt:
$
v_I = sum_(k in I) lambda_k v_k "und" v_J = sum_(k in J) mu_k v_k
$
Überlegung: Wähle ein $k in I union J$. Falls gilt $k in I backslash J$, setze $lambda_k = =$. Falls gilt $k in J backslash I$, setze $mu_k = 0$. Es folgt
$
==> 0 = sum_(k in I union J) (lambda_k - mu_k) v_k
$
Da die Darstellung $v_I$ und $v_J$ von $v$ unterschiedlich sind, existiert ein $k in I union J$ mit $lambda_k - mu_k != 0$.
$
==> {v_m}_(m in M) "ist linear unabhängig"
$

$2 ==> 1$: Beweis per Kontraposition

Angenommen ${v_m}_(m in M)$ wäre linear unabhängig. Dann existiert ein endliches $J subset.eq M$ und $lambda_k in K$ für $k in J$ mit $0 = sum_(k in J) lambda_k v_k$ und mindestens ein $lambda_k != 0$.

Sei $v in "Span"{v_m}_(m in M)$, d.h. es existiert ein endliches $I subset.eq M$ mit $mu_k in K$ für alle $k in I$ mit 
$
v = sum_(k in I) mu_k v_k ==> v + 0 = lambda_(k in I) mu_k v_n + sum_(k in J) lambda_k v_k = sum_(k in I union J) (mu_k + lambda_k) v_k
$
Es gilt wieder $mu_k = 0$ für $k in J backslash I$ und $lambda_k = 0$ für $k in I backslash J$. Da für mindestens ein $k in J union I$, $(mu_k + lambda_k) != lambda_k$, ist dies eine zweite Darstellung von $v$.
#endproof

#definition("3.9", "Erzeugendensystem")[
  Sei $K$ ein Körper, $V$ ein $K$-Vektorraum, $M$ eine Menge und $v_m$ für $m in M$ Vektoren in $V$. Die Menge ${v_m}_(m in M)$ heißt #bolditalic[Erzeugendensystem] von $V$, falls 
  $
  "Span"{v_m}_(m in M) = V
  $
]

#bolditalic[Beispiel 3.10:] Sei $K$ ein Körper, $V$ ein Vektorraum mit $V = K^n$, $n in NN$

Dann ist mit 
$
e_1 := vec(1, 0, dots.v, 0), space e_2 := vec(0, 1, dots.v, 0), space ..., space e_n := vec(0, 0, dots.v, 1)
$
die Menge ${e_i}_(in in {1, ..., n})$ ein Erzeugendensystem von $K^n$.

#definition("3.11", "Basis")[
  Sei $K$ ein Körper, $V$ ein Vektorraum, $M$ eine Menge und $v_m$ für $m in M$ Vektoren in von $V$. Dann heißt ${v_m}_(m in M)$ #bolditalic[Basis] von $V$, falls sie linear unabhängig und ein Erzeugendensystem von $V$ ist.
]

#bolditalic[Beispiel 3.12:] Das Erzeugendensystem aus 3.10 ist eine Basis. Anmerkung: Basen sind nicht eindeutig. Für $K^3$ gilt etwa
$
v_1 = vec(1,1,0) space v_2 = vec(1,0,1) space v_3 = vec(0, 1, 1) 
$ 
ist ebenfalls eine Basis.

#bolditalic[Beispiel 3.13:] Die Familie ${t^i}_(i in NN)$ ist ein Erzeugendensystem von $P[t]$, denn es gilt $"Span"{t^i}_(i in NN) = P[t]$. Um zu prüfen, ob die Familie auch Basis von $P[t]$ muss die lineare Unabhängigkeit gerpüft werden. Sei $n in NN_0$, $a_0, a_1, ..., a_n in K$ und betrachte $p(t) = a_0 + a_1 t + ... + a_n t^n$ mit $p(t) = 0$.

Falls $a_k != 0$ für ein $k in {0, ..., n}$ gilt, so hat $p(t)$ höchstens $n$ Nullstellen in $K$. $0 in P[t]$ hat aber unendlich viele Nullstellen. D.h. es existiert ein $t in K$ mit $p(t) != 0 space arrow.zigzag$. Es folgt, dass die Familie ${t^i}_(i in NN)$ linear unabhängig ist. Somit ist ${t^i}_(i in NN)$ eine Basis von $P[t]$.

#bolditalic[Satz 3.14:] Sei $K$ ein Körper, $V$ ein Vektorraum und $B := {v_1, ..., v_n} subset.eq V$ eine Basis von $V$. Dann ist äquivalent

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $B$ ist eine Basis #h(1fr)
  2. $B$ ist ein unverkürzbares Erzeugendensystem, d.h. $forall r in {1, ..., n}$ ist die Menge $B backslash {v_r}$ kein Erzeugendensystem von $V$
  3. Für alle $v in V$ existieren eindeutige $lambda_1, ..., lambda_n$ mit 
  $
  v = sum_(k = 1)^n lambda_k v_k
  $
  4. $B$ ist unverlängerbar linear unabhängig. D.h. für alle $v in V$ ist $B union {v}$ linear abhängig
]

#italic[Beweis:] Beweis durch Kontraposition

$1 ==> 2$: Angenommen $B$ ist ein verkürzbares Erzeugendensystem. D.h. o.B.d.A $r = 1$, $B backslash {v_1}$ ist auch ein Erzeugendensystem von $V$. Also existieren $lambda_2, ..., lambda_n in K$ mit 
$
v_1 = sum_(k = 2)^n lambda_k v_k
$
Mit Satz 3.5 folgt, dass $B$ linear abhängig ist. Also ist $B$ keine Basis.

$2 ==> 3$: Beweis durch Kontraposition

Angenommen, es existiert $v in V$, $lambda_k, mu_k in K$ mit 
$
v = sum_(k = 1)^n lambda_K v_k "und" v = sum_(k = 1)^n mu_k v_k 
$
o.B.d.A gilt $mu_1 != lambda_1$. Dann folgt $0 = sum_(k = 1)^n (lambda_k - mu_k) v_k$.

Weiterhin gilt 
$
0 = sum_(k = 1)^n (lambda_k -mu_k)/(lambda_1 - mu_1) v_k ==> v_1 = sum_(k = 2)^n -(lambda_k - mu_k)/(lambda_1 - mu_1) v_k
$
Sei nun $w in V$, dann existiert ein $alpha_k in K$ mit 
$
w = sum_(k = 1)^n alpha_k v_k = alpha_1 v_1 + sum_(k = 2) alpha_k v_k = star
$
Wir defnieren
$
beta_k = -(lambda_k - mu_k)/(lambda_1 - mu_1)
$
Dann gilt 
$
star = sum_(k = 2)^n (alpha_1 beta_k + alpha_k) v_k
$
Also war $B$ kürzbar.

$3 ==> 4$:

Satz 3.8 liefert, dass $B$ linear unabhängig ist. Sei $v in V backslash B$. Dann existieren $lambda_1, ..., lambda_k in K$ mit 
$
v = sum_(k = 1)^n lambda_k v_k
$
Das heißt $B union {v}$ ist linear abhängig nach Satz 3.8.

$4 ==> 1$:

Sei $B$ unverlängerbar linear abhängig. Sei $v in V$. Dann ist $B union {u}$ linear abhängig. Also existiert $lambda_1, ..., lambda_n, lambda in K$ mit 
$
0 = sum_(k = 1)^n lambda_k v_k + lambda v "wobei nicht alle" lambda_k, lambda = 0
$
Da $B$ linear unabhängig ist folgt $lambda != 0$. Daraus folgt
$
v = sum_(k = 1)^n -lambda_k/lambda v_k
$ 
Also ist $B$ ein Erzeugendensystem und somit eine Basis.
#endproof

#definition("3.15", "endlichdimensional, unendlichdimensional")[
  Sei $(V, +, dot)$ ein $K$-Vektorraum für dein eine endliche Menge $M = {v_1, ..., v_n} subset V$ existiert, so dass $"Span" M = V$. Dann nennt man $V$ #bolditalic[endlich erzeugt] und sagt $V$ ist #bolditalic[endlichdimensional]. Ist $V$ nicht von endlich vielen Vektoren erzeugt, nennt man $V$ #bolditalic[unendlichdimensional].   
]

#bolditalic[Beispiel 3.16:]

#boxedlist[
  Die Einheitsvektoren aus Beispiel 3.10 sind eine Basis des $K^n$ für einen Körper $K$. Damit ist $K^n$ endlich erzeugt.
][
  Der Vektorraum $P[t]$ der Polynome aus Beispiel 3.13 ist über dem Körper $K$ mit der Basis ${t^i}_(i in NN_0)$ ist nicht endlich erzeugt.
][
  Sei $V$ der Vektorraum der stetigen reellwertigen Funktionen auf dem Intervall $[0, 1]$. Dann ist $V$ unendlichdimensional, denn:

  Sei für $n in NN$ die Funktion $f_n in V$ definiert durch
  $
  f_n: [0, 1] -> RR, space x arrow.bar cases(0"," &0 <= x <= 1/(n+1), 2n(n+1)x-2n"," &1/(n+1)<=x<=1/2(1/n + 1/(n+1)), -2(n+1)x+2n+2"," wide&1/2(1/n + 1/(n+1)), 0"," &1/n <=x<=1)
  $
  Es gilt für jede Linearkombination der $f_n$ und $j, k in NN$ mit $j <= k$, dass
  $
  sum_(j = 1)^k lambda_j f_j(1/2(1/j + 1/(j+1))) = lambda_j "bei" f_j = 1", sonst" 0 
  $
  Damit ist:
  $
  sum_(i = 1)^k lambda_i f_i(x) = 0_v in V, space forall x in [0, 1]
  $
  nur erfüllt, wenn $lambda_i = 0$ für alle $1 <= i <= k$. Damit sind die $f_n$ linear unabhängig. Also ist $V$ unendlichdimensional.
]

#bolditalic[Frage:] Hat jeder Vektorraum eine Basis?

Diese Frage ist relativ einfach im endlichdimensionalen Fall:

#bolditalic[Lemma 3.17:] Basisauswahlsatz 

Ein $K$-Vektorraum $(V, +, dot)$ ist genau dann endlich, erzeugt, wenn er eine endliche Basis besitzt.

#italic[Beweis:]

"$<==$": endliche Basis $==>$ endliches Erzeugendensystem $==>$ endlich erzeugt

"$==>$": Sei $V$ endlich erzeugt $==> exists v_1, ..., v_n: "Span"{v_1, ..., v_n} = V$. Ist dieses Erzuegendensystem nicht minimial, d.h. linear abhängig, dann folgt mit Satz 3.5, dass ein $v_i, 1 <= i <= n$, als Linearkombation der anderen $v_j, i != j$ dargestellt werden kann. Entfernen des $v_i$ liefert ein kleineres Erzeugendensystem. Wiederhole $n-1$-Mal, bis die verbleibende Menge linear unabhängig ist. Soimt enthält jedes endliche Erzeugendensystem ein minimales Erzeugendensystem und somit eine Basis.
#endproof

Für den unendlichdimensionalen Fall ist mehr Arbeit nötig:

#bolditalic[Satz 3.18:] Jeder $K$-Vektorraum $(V, +, dot)$ besitzt eine Basis (ein minimales Erzeugendensystem).

#italic[Beweis:] 

Idee: Wir wenden das zornsche Lemma auf $M = V$ und \ $cal(S) = {A subset.eq V | "die Familie" {v}_(v in A) "ist linear unabhängig"} subset.eq cal(P)(M)$

Dazu treffen wir die Annahme, dass die Vorraussetzungen für das Zornsche Lemma gelten. Dann hat $cal(S)$ ein maximales Element bezüglich der Relation $<=$. 

Da maximal linear unabhängige Familien von Vektoren aus $V$ Basen von $V$ sind (Satz 3.14), ist damit die Behauptung gezeigt. 

Jetzt müssen wir die Verwednung des Zornschen Lemmas rechtfertigen.

Für $cal(K) subset.eq cal(S)$, $cal(K)$ ist eine Kette, gilt $union.big_(A in cal(K)) A in cal(S)$. Sei $cal(K) subset.eq cal(S)$ seine Kette. zu zeigen:
$
B := union.big_(A in cal(K)) A in cal(S)
$
D.h. die Vektoren aus $B$ sind eine Menge von linear unabhängigen Vektoren. Seien dazu endlich viele Vektoren $v_1, ..., v_n in B$ beliebig vorgegeben. Per Definition von $B$ existiert in der gegebenen Kette $cal(K)$ für jeden Index $i in {1, ..., n}$ eine Menge $A_i in cal(K)$ mit $v_i in A_i$. 

Nach Lemma 1.26 über endliche Teilmengen von Ketten gibt es einen Index $tilde(dotless.i) "mit" A_i subset.eq A_tilde(dotless.i)$ für alle $i$. $==>$ alle Vektoren $v_1, ..., v_n in A_tilde(dotless.i) in cal(S)$. Daraus folgt, dass ${v_1, ..., v_n}$ linear unabhängig ist.
#endproof 

== Basen

Man kann eine Basis als Koordinatensystem in einem Vektorraum auffassen. Wichtig ist, dass Basen nicht eindeutig sind (vergleiche Beispiel 3.12). Eine sehr wichtige Frage der linearen Algebra ist: Welche Basis wählt man?

#bolditalic[Beispiel 3.19:] Um aus einer im Verhältnis $1:1$ in Wasser gelösten System eine Lösung im Mischungsverhältnis $a:b$ zu bekommen, verdünnt man $y$ Teile der Lösung mit $x$ Teilen Wasser, so dass
$
x dot vec(1,1) + y dot vec(1,0) = vec(a, b) wide x"-Koordinate ist Wasser," y"-Koordinate ist Substanz"
$
Eine andere Darstellung der Basis ist 
$
vec(1, 1/2) &= 1 dot e_1 + 1/2 dot e_2 = 1 dot vec(1,0) + 1/2 dot vec(0,1) \
&= 1/2 v_1 + 1/2 v_2 = 1/2 vec(1,1) + 1/2 vec(1,0)
$
Man sieht:

#boxedlist[$1$ Parameter in $RR^1$][$2$ Parameter in $RR^2$][$3$ Parameter in $RR^3$]

#bolditalic[Ziel:] Alle Basen eines endlich erzeugten Vektorraums haben gleich viele Elemente.

#align(center, [Das ist durchaus nicht offensichtlich#bolditalic[!!!]])

#bolditalic[Beispiel 3.20:] Es gibt eine bijektive Abbildung $f: NN -> NN times NN$. Dafür kann man z.B. das Diagonalargument von Georg Cantor verwenden.

Zum Beweis der Aussage sind noch Vorarbeiten notwendig.

#bolditalic[Satz 3.21:] Basisergänzungssatz 

Sei $(V, +, dot)$ eine $K$-Vektorraum,

#boxedlist[${u_i}_(i in I) subset.eq V$ ein linear unabhängiges System][${v_j}_(j in J) subset.eq V$ ein Erzeugendensystem von $V$]

Dann gibt es eine Teilmenge $tilde(J) subset.eq J$ mit der Eigenschaft, dass das System
$
B := {w_k}_(k in I union tilde(J)) "mit" w_k := cases(u_i &k = i in I, v_j &k = j in tilde(J))
$
eine Basis von $V$ bildet.

#italic[Beweis:] Sei $tilde(J) subset.eq J$ eine bezüglich $subset.eq$ maximal gewählte Teilmenge mit der Eigenschaft, dass $B$ wie im Satz definiert, ein linear unabhängiges System ist. Für endliche Mengen $J$ ist das klar (siehe Lemma 3.17). Für Mengen mit unendlich vielen Elementen folgt aus dem zornschen Lemma (Satz 3.18). Damit: $B$ ist ein maximales linear unabhängiges System.

Wegen der Maximalität ist für jeden Index $j in J backslash tilde(J)$ das System $B union {v_j}$ linear abhängig
$==> exists lambda, lambda_i in K, i in I union tilde(J):$
$
lambda dot v_j + sum_(i in I union tilde(J)) lambda_i dot v_i = 0
$
wegen der linearen Unabhängigkeit der ${v_i}_(i in I union tilde(J))$ muss $lambda != 0$ gelten
$
==> v_j = - sum_(i in I union tilde(J)) lambda_i / lambda dot w_i in "Span" B
$
Dies gilt für alle $j in J backslash tilde(J) ==> v_j in "Span" B space forall j in J ==> B "Basis"$
#endproof

#bolditalic[Beispiel 3.22:] In $V = RR^3$ bilden die Vektoren ${e_1, e_2, e_3}$ die Standardbasis. Des Weiteren sind die Vektoren $u_1= (3, 1, 0) "und" u_2 = (1, 3, 0)$ linear unabhängig. Satz 3.21 liefert, dass ${u_1, u_2, e_3}$ eine Basis ist. 

#bolditalic[Satz 3.23:] Austauschsatz von Steinitz 

(Ernst Steinitz, deutscher Mathematiker, 1871 - 1928)

Sei $(V, +, dot)$ ein $K$-Vektorraum,

#boxedlist[$B = {v_1, ..., v_n}$ eine (endliche Basis)][$C = {u_1, ..., u_m}$ eine linear unabhängige Familie]

Dann ist $m <= n$ und nach geeigneten umnummerieren der Vektoren in $B$ ist das durch austauschen der ersten $m$-Vektoren erhaltene System 
$
tilde(B) := {u_1, ..., u_m, v_(m+1), ..., v_n} "eine Basis von" V "über" K
$

#italic[Beweis:] Aus dem Basisergänzungssatz folgt, dass man das linear unabhängig System $u_1, ..., u_m$ zu einer Basis $u_1, ..., u_m, v_j_1, ..., v_j_k_0$ für ein $k_0 >= 0$ und geeignete Indizes $j_1, ..., j_k_0 in {1, ..., n}$ erweitern kann.

Die Menge ${u_1, ..., u_(m-1), v_j_1, ..., v_j_k_0}$ ist immer noch linear unabhängig aber kein Basis. Aus dem Basisergänzungssatz folgt wieder, dass man diese Menge zu einer Basis ${u_1, ..., u_(m-1), v_j_1, ..., v_j_k_0, v_j_(k_0 + 1), ..., v_j_k_1}$ für ein $k_1 > k_0$ und weitere Indizes $j_(k_0 + 1), ..., v_k_1 in {1, ..., n}$. Setzt man dieses Verfahren induktiv $v$-mal fort, erhält man im $r$-ten Schritt eine Basis ${u_1, ..., u_(m - r), v_j_1, v_j_2, ..., v_j_k_(r - 1), v_j_(k_(r-1)+1), ...., v_j_k_r}$ für ein $k_r > k_(r-1)$ und weitere Indizes $j_(k_(r-1)+1), ..., j_k_r in {1, ..., n}$. Nach $m$ Schritten sind alle $u_i, 1 <= i <= m$ ersetzt. 

Als neue Basis erhält man
$
hat(B) := {v_j_1, ..., v_j_m}
$
welche ausschließlich Vektoren aus $B$ enthält. $B$ war ein minimales Erzeugendensystem. Also muss die neue Menge $hat(B)$ bis auf die Umordnung mit der Menge $B$ übereinstimmen. Für die Menge der Indizes gilt also:
$
hat(B) = {v_j_1, ..., v_j_k_m} = {v_1, ..., v_n} = B 
$
Also folgt: $k_m = n$

Wir haben jeweils mindestens einen Vektor ergänzt, d.h. 
$
k_m > k_(m-1) > ... > k_1 > 0 ==> k_m >= m ==> n = k_m >= m ==> n >=m ==> "erste Aussage"
$
Dann folgt die zweite Aussage aus dem Basisergänzungssatz.
#endproof

#bolditalic[Lemma 3.24:] Ist $(V, +, dot)$ ein von endlich vielen Vektoren erzeugter $K$-Vektorraum, so besitzt $V$ eine Basis und je zwei Basen von $V$ haben gleich viele Elemente. 

#italic[Beweis:] Sei $V = "Span"{v_1, ..., v_n}$ mit $v_1 != 0$. Nach Satz 3.21 kann ${v_1}$ durch Hinzunahme von geeigneten Elementen aus ${v_2, ..., v_n}$ zu einer Basis von $V$ ergänzen. Also besitzt $V$ eine Basis mit endlich vielen Elementen.

Seien $U = {u_1, ..., u_l} "und" W = {w_1, ..., w_k}$ zwei solche Basen. Dann folgt aus dem Satz 3.23 aus Symmetrie, dass $k = l$. 
#endproof

#bolditalic[Ausblick:] Man kann mit Konzepten der Mengenlehre auch zeigen, dass es für unendlich erzeugte Vektorräume $V$ gilt: Für je zwei Basen ${u_i}_(i in I)$ und ${w_j}_(i in J)$ von $V$ existiert eine bijektive Abbildung $f: I -> J$.

Folgerung aus Satz 3.8 in Zusammenhang mit Lemma 3.24: Da für eine Basis $B := {v_1, ..., v_n}$ eines $K$-Vektorraums $V$ gilt, dass $"Span" B = V$, sind für $v in V$ die Koeffizienten (= Koordinaten) $lambda_1, ..., lambda_n$ zur Darstellung von $v$ eindeutig. 

#bolditalic[Beispiel 3.25:] für $V = RR^3$ sind 
$
B_1 := {vec(1, 0, 0), vec(0, 1, 0), vec(0, 0, 1)} "und" B_2 := {vec(-2, -1, 0), vec(-2, 3, 0), vec(-5, 0, 2)}
$
zwei Basen. Der Vektor $v = (-5, 11, 2)$ besitzt bezüglich $B_1$ die Koordinaten $lambda_1 = -5, lambda_2 = 11, lambda_3 = 2$. Was sind die Koordinaten bezüglich $B_2$? Es muss gelten:
$
a vec(2, -1, 0) + b vec(-2, 3, 0) + c vec(-5, 0, 2) = vec(-15, 11, 2)
$
anders kann man dies notieren als
$
vec(2a - 2b - 5c, -a + 3b + 0c, 0a + 0b + 2c) = vec(-15, 11, 2)
$
Berechnung der $a, b, c$ über ein lineares Gleichungssystem ergibt $a = 2, b = 3, c = 1$.

#bolditalic[Beispiel 3.26:] Für den $RR$-Vektorraum $P_(<= 2)[t]$ der reellen Polynome vom Grad $<= 2$ sind:
$
B_1 := {1, t, t^2} "und" B_2 := {-t, t^2 - 2, t^2 + 2}
$
zwei Basen. Sei $p(t) = a + b t + c t^2$ ein beliebiges Polynom aus $P_(<= 2)[t]$. Dann sind die Koeffizienten für $B_1: lambda_1 = a, lambda_2 = b, lambda_3 = c$. Für $B_2$ gilt:
$
"Basiswechsel, siehe Kapitel" 4 space space cases(1 = -1/4(t^2-2)+1/4(t^2+2), t = (-1)(-t), t^2 = 1/2(t^2+2)+1/2(t^2-2))
$
Es gilt 
$
a 1 + b t + c t^2 &= a(-1/4(t^2-2)+1/4(t^2+2)) + b(-1)(-t) + c(1/2(t^2+2)+1/2(t^2-2)) \
&= -b(-t) + (-a/4 + c/2)(t^2-2) + (a/4 + c/2)(t^2+2)
$

== Dimensionen

#definition("3.27", "Dimension eines Vektorraums")[
  Die Dimension eines Vektorraum $(V, +, dot)$ über $K$ ist definiert als:
  $
  dim_K (V) := cases(n &"falls" V "eine Basis der Länge" n "hat", infinity &"sonst")
  $
  Wenn der Kontext klar ist schreibt man $dim V$.
]

#bolditalic[Beispiel 3.28:] Sei $K$ ein Körper. Es gilt 

#boxedlist[$dim_K (V) = n$ genau dann, wenn $V = {0}$][
  für $V = K^n$ folgt mit der Standardbasis, dass $dim_K (V) = n$][für die Dimension eines Vektorraums ist der jeweilige Grundkörper $K$ entscheident, z.B. $CC$ und $K = CC$ gilt $dim_CC V = 1$ für $K = RR$ aber $dim_RR V = 2$. 
][der $K$-Vektorraum $P[t]$ ist nicht endlich erzeugt, also $dim_K P[t] = infinity$]

#bolditalic[Beispiel 3.29:] Sei $V = K^n$ für einen Körper $K$. Um zu prüfen, dass $n$ Vektoren aus $V$ eine Basis werden, muss nur deren lineare Unabhängigkeit geprüft werden. Seien z.B. $B$ in $V = RR^3$ die Vektoren
$
v_1 = vec(2, -1, 0) space v_2 = vec(-2, 3, 0) space v_3 = vec(-5, 0, 2)
$
gegeben. Sind diese liear unabhängig?
$
lambda_1 vec(2, -1, 0) + lambda_2 vec(-2, 3, 0) + lambda_3 vec(-5, 0, 2) attach(=, t: !) vec(0,0,0)
$
Dazu wird ein lienares Gleichungssystem aufgestellt 
$
vec(2a - 2b - 5c, -a + 3b + 0c, 0a + 0b + 2c) = vec(0,0,0)
$
$==> a = 0, b = 0, c = 0$.

Somit sind die Vektoren linear unabhängig.

#bolditalic[Lemma 3.30:] Sei $(V, +, dot)$ ein $K$-Vekorraum mit $n := dim_K V < infinity$ und $B = {v_1, ..., v_n} subset V$ eine Familie von genau $n$ Vektoren. Dann sind folgende Aussagen äquivalent:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $B$ ist eine Basis
  2. $B$ ist linear unabhängig 
  3. $B$ ist ein Erzeugendensystem
]

#italic[Beweis:] (Übungsaufgabe, Blatt 8, Aufgabe 1)

$1 ==> 2 "und" 1 ==> 3$: Folgt direkt aus der Definition einer Basis.

$2 ==> 1$: Angenommen $B$ ist keine Basis von $V$. Da $B$ linear unabhängig ist, kann $B$ kein Erzeugendensystem von $V$ sein. Mit dem Basisergänzungssatz (Satz 3.21) lässt sich das linear unabhängige System $B$ mit Vektoren eines Erzeugendensystems von $V$, wir wählen $V$ selbst, zu einer Basis $B'$ ergänzen. Definiere die $B'$ wie folgt:
$
B' = B union {v_(n+1), ..., v_(n + k)}, wide v_(n+1), ..., v_(n + k) in V backslash B
$
Dann hat $B$ mit Sicherheit mehr als $n$ Elemente. Dies ist ein Widerspruch dazu, dass die Dimension des Vektorraums $n$ ist (Definition 3.27 und Lemma 3.24). Die Annahme muss also falschs sein. $==>$ $B$ ist eine Basis von $V$.

$3 ==> 1$: Angenommen $B$ ist keine Basis von $V$. Da $B$ ein Erzeugendensystem ist, kann $B$ nicht linear unabhängig sein. Daraus folgt, dass $B$ zu einem minimalen Erzeugendensystem, also einer Basis $B'$ verkürzbar ist. Definiere $B'$ wie folgt:
$
B' = B backslash {v_n_0, ..., v_n_k}, wide v_n_0, ..., v_n_k in B 
$
Dann hat $B'$ mit Sicherheit weniger als $n$ Elemente. Dies ist ein Widerspruch dazu, dass die Dimension des Vektorraums $n$ ist. Die Annahme muss also falsch sein. $==>$ $B$ ist eine Basis von $V$.
#endproof

#bolditalic[Lemma 3.31:] Sei $(V, +, dot)$ ein endlich erzeugter $K$-Vektorraum. Jeder Untervektorraum $W subset.eq V$ ist dann ebenfalls endlichdimensional und es gilt:
$
dim W <= dim V 
$
mit Gleichheit genau dann, wenn $W = V$.

#italic[Beweis:] jede linear unabhängige Familie in $W$ ist auch linear unabhängig in $V$. Damit besteht sie nach dem Austauschsatz von Steinitz aus höchstens $dim_K V$ Elementen. Daraus folgt, dass $W$ endlich erzeugt ist mit $dim_K W <= dim_K V$. Im Fall von $dim_K W = dim_K V$ folgt mit Lemma 3.30, dass jede Basis von $W$ auch eine Basis von $V$ ist. $==>$ $V = W$
#endproof

#bolditalic[Achtung:] Die letzte Aussage (d.h. $V = W$) gilt nicht für unendlich erzeugte Vektorräume. Denn der $K$-Vektorraum $P[t]$ aller Polynome hat die Basis der Monome ${t^n}_(n in NN_0)$. Die Menge aller Polynome aus $P[t]$ mit $a_0 = 0$ ist ein Unterraum mit der Basis ${t^n}_(n in NN)$ und wird mit $W$ bezeichnet. Dann gilt 
$
dim_K P[t] = infinity = dim_K W, "aber" P[t] != W
$

== Direkte Summen

Aus der Definition von Mengenoperationen aus dem ersten Kapitel folgt: sind $U_1 "und" U_2$ zwei Unterräume des $K$-Vektorraums $(V, +, dot)$, so gilt für ihren Durchschnitt:
$
U_1 sect U_2 = {u in V | u in U_1 and u in U_2}
$

#definition("3.32", "Summe von Mengen")[
  Sei $(V, +, dot)$ ein $K$-Vektorraum für die Unterräume $U_1, ..., U_r subset.eq V$ definiert man ihre Summe als die Teilmenge
  $
  U_1 + U_2 + ... + U_r := {u_1 + u_2 + ... + u_r | u_i in U_i "für" 1 <= i <= r} subset.eq V
  $
]

Für den Durchschnitt und die Summe von Untervektorräumen gelten folgende Regeln:

#bolditalic[Lemma 3.33:] Sind $U_1, U_2, U_3$ Unterräume des $K$-Vektorraums $(V, +, dot)$, dann gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $U_1 sect U_2$ und $U_1 + U_2$ sind Unterräume von $V$
  2. $U_1 + (U_2 + U_3) = (U_1 + U_2) + U_3 "und" U_1 + U_2 = U_2 + U_1$
  3. $U_1 + {0} = U_1$ und $U_1 + U_1 = U_1$
  4. $U_1 subset.eq U_1 + U_2$ mit Gleichheit, d.h. $U_1 = U_1 + U_2$, wenn $U_2 subset.eq U_1$
]

#italic[Beweis:] (Übungsaufgabe)
#endproof

#bolditalic[Beispiel 3.34:] Sei $V := RR^3, U_1 := "Span"{(1, 0, 0), (0, 1, 0)}, U_2 := {(0, 1, 0), (0, 0, 1)}$. Dann gilt für $v in V, v = (v_1, v_2, v_3)$
$
v = v_1 vec(1,0,0) + v_2 vec(0,1,0) + v_3 vec(0,0,1)
$
Also gilt: $U_1 + U_2 = V$, insbesondere gilt auch $dim(U_1 + U_2) = 3$, $dim U_1 = 2 = dim U_2$. Weiterhin gilt
$
v_1 vec(1,0,0) in U_1 "und" v_2 vec(0, 1, 0) + v_3 vec(0, 0, 1) in U_2
$
Aslo ist die Darstellung von $v$ als Summe #bolditalic[nicht] eindeutig. Insbesondere ist $dim(U_1 sect U_2) = 1$.

#bolditalic[Lemma 3.35:] Sei $V$ ein $K$-VR und $r in NN$ und $U_1, ..., U_r$ Untervektorräume von $V$. Dann sind folgende Aussagen äquivalent.

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. Für $u in sum_(i = 1)^r U_i$ existieren eindeutige $u_i in U_i$, $i in {1, ..., r}$ mit $u = sum_(i = 1)^r u_i$
  2. #[
    Für $u_i in U_i$, $i in {1, ..., r}$ mit $0 = sum u_i$ gilt
    $
    u_i = 0 wide i in {1, ..., r}
    $
  ]
  3. #[
    Für $i in {1, ..., r}$ gilt 
    $
    U_i sect limits(sum_(j = 1)^r)_(j != i) u_i = {0_V}
    $
  ]
]

#italic[Beweis:] (Übungsaufgabe, Blatt 9, Aufgabe 1)

$1 ==> 2$: 

Eine Darstellung des Nullvektors ist $0 = 0_1 + ... 0_r$ mit $0_i in U_i$. Da jeder Vektor eine eindeutige Darstellung bestizt, folgt 2).

$2 ==> 3$: Beweis durch Kontraposition  

Angenommen es gilt $U_i sect limits(sum_(j = 1)^r)_(j != i) u_i != {0_V}$. Dann existiert ein Vektor $v$ mit $v in U_i$ und $v in U_1 + ... + U_(i-1) + U_(i+1) + ... + U_r$. Da $U_i$ und $U_1 + ... + U_(i-1) + U_(i+1) + ... + U_r$ Untervektorräume von $V$ bilden, gilt auch $-v in U_i$ und $-v in U_1 + ... + U_(i-1) + U_(i+1) + ... + U_r$. Daraus folgt
$
sum_(j = 1)^r u_j = v + limits(sum_(j = 1)^r)_(j != i) u_i = v + (-v) = 0 
$
Somit gilt 
$
sum u_i = 0 "aber" u_j != 0, j in {1, ..., r}
$

$3 ==> 1$: Beweis durch Kontraposition

Angenommen ein Vektor $v in V$ besitzt keine eindeutige Darstellung. Dann gilt für ein $u in U_i$:
$
u = sum_(j = 1)^r u_j "mit" u_j = 0, j != i "und" u_j = u, j = i 
$
Dann gilt $u in U_i$ und insbesondere $u in U_1 + ... + U_(i-1) + U_(i+1) + ... U_r$. Somit ist die Schnittmenge $U_i sect U_1 + ... + U_(i-1) + U_(i+1) + ... + U_r != {0_V}$. 
#endproof

#definition("3.36", "Direkte Summe")[
  Sei $V$ ein $K$-VR und $r in NN, U_1, ..., U_r$ Untervektorräume von $V$. Dann heißt die Summe $sum U_i$ #bolditalic[direkt], falls eine der Bedingungen aus Lemma 3.35 zutrifft.
  
  Wir schreiben dann 
  $
  U_1 oplus U_2 oplus ... oplus U_r
  $
]

#bolditalic[Beispiel:] Seien $V, U_1, U_2$ wie im Beispeil 3.34. Dann gilt $V = U_1 + U_2$, aber nicht $U_1 oplus U_2$. Sei weiter $U_3 := "Span"{(0, 0, 1)}$. Dann gilt $V = U_1 + U_3$ und $U_1 oplus U_3$.

#bolditalic[Lemma] (ohne Nummer)

Sei $V$ ein $K$-VR. Seien $U_1, U_2$ UVRs von $V$. Dann gilt
$
dim(U_1 + U_2) <= dim U_1 + dim U_2 space (ast)
$
Falls $U_1 oplus U_2$ gilt sogar Gleichheit.

Dabei sei $infinity + infinity = infinity, infinity + n = infinity, n <= infinity "für" n in NN$ und es gilt $infinity <= infinity$.

#italic[Beweis:] 

#bolditalic[Fall 1:] $dim U_1 = infinity$ oder $dim U_2 = infinity$. Dann gilt $(ast)$ nach den Rechenregeln der erweiterten Arithmetik.

Andernfalls existieren $m, l in NN$ mit $dim U_1 = m "und" dim U_2 = l$.

Sei $u_1, ..., u_m$ eine Basis von $U_1$ und $u_(m+1), ..., u_(m+l)$ eine Basis von $U_2$. Sei weiter $u in U_1 + U_2$, dann existieren $v in U_1$ und $w in U_2$, sodass $u = v + w$. Zu $v$ und $w$ existieren $lambda_1, ..., lambda_m in K$ bzw. $lambda_(m+1), ..., lambda_(m+l) in K$ mit 
$
v = sum_(i = 1)^m lambda_i u_i "und" w = sum_(i = m + 1)^(m+l) lambda_i u_i
$
Also $u = v + w$
$
u = sum_(i = 1)^m lambda_i u_i + sum_(i = m +1)^(m+l) lambda_i u_i = sum_(i = 1)^(m+l) lambda_i u_i
$
Also ist $u_1, ..., u_(m+l)$ ein Erzeugendensystem von $U_1 + U_2$. Es folgt $dim(U_1 + U_2) <= m+l = dim U_1 + dim U_2$. 

Sei nun $U_1 oplus U_2$. Falls $dim(U_1 + U_2) = infinity$ gilt $(ast)$ mit Gleichheit. Andernfalls existieren $n in NN$ mit $dim(U_1 + U_2) = n$. Da $U_1$ und $U_2$ Untervektorräume von $U_1 + U_2$ sind, existieren $m, l in NN$ mit $dim U_1 = m <= n$ und $dim U_2 = l <= n$. Sei wieder $u_1, ..., u_m$ eine Basis von $U_1$ und $u_(m+1), ..., u_(m+l)$ eine Basis von $U_2$. Seien $lambda_1, ..., lambda_(m+l) in K$ mit 
$
0 = sum_(i = 1)^(m+l) lambda_i u_i = underbrace(sum_(i = 1)^m lambda_i u_i, = space.sixth v space.sixth in space.sixth U_1) + underbrace(sum_(i = m+1)^(m+l) lambda_i u_i, = space.sixth w space.sixth in space.sixth U_2)
$
Da $U_1 oplus U_2$ folgt $v = 0 = w$. Da $u_i, i in {1, ..., m}$ eine Basis von $U_1$ ist, folgt $0 = lambda_i i in {1, ..., m}$. Analog folgt dies für $lambda_(m+1), ..., lambda_(m+l)$. Also ist $u_1, ..., u_(m+l)$ linear unabhängig.

$==>$ $dim U_1 + dim U_2 = m + l <= dim(U_1 + U_2)$
#endproof

#bolditalic[Satz 3.38:] Sei $V$ ein $K$-VR und $U$ ein UVR von $V$. Dann existiert ein Untervektorraum $U^top subset.eq V$ mit $V = U oplus U^top$ (heißt $V = U + U^top$ und $U oplus U oplus U^top$). Insbesondere gilt dann 
$
dim V = dim U + dim U^top
$

#italic[Beweis:] Sei $(u_i)_(i in I)$ eine Basis von $U$. Nach Satz 3.21 existiert eine Menge $J$ und Vektoren $w_j, j in J$ mit
$
I sect J = emptyset "und" v_k := cases(u_k &k in I, w_k &k in J) wide k in I union J
$
ist eine Basis von $V$.

Mit $U^top = "Span"{w_j}_(j in J)$ gilt dann $V = U + U^top$. Sei $v in V$, dann existieren eindeutige ${lambda_i}_(i in I) subset.eq K$ mit 
$
v = sum_(k in I union J) lambda_k v_k = underbrace(sum_(k in I) lambda_k v_k, in space.sixth U) + underbrace(sum_(k in J) lambda_k v_k, in space.sixth U^top)
$
die Eindeutigkeit der $lambda_k, k in I union J$ garantiert die Eindeutigkeit von $u$ und $w$. Also $U oplus U^top$.
#endproof

Ein durch Satz 3.38 aus $U$ und $V$ erhaltener Untervektorraum $U^top$ heißt #bolditalic[Komplement] von $U$ in $V$.

#bolditalic[Beispiel 3.39:] Seien $V, U_1$ und $U_3$ wie in Beispiel 3.37. Dann gilt $V = U_1 oplus U_3$ d.h. $U_3$ ist ein Komplement von $U_1$ in $V$. Sei weiter $tilde(U_3) := "Span"{(1, 0, 0)}$. Dann gilt auch $V = U_1 oplus tilde(U_3)$.

Insbesondere sind die Komplemente aus Satz 3.38 nicht eindeutig bestimmt.

#bolditalic[Satz 3.40:] Sei $V$ ein endlich erzeugter $K$-VR. Seien $U_1, U_2$ UVRs von $V$. Dann gilt 
$
dim(U_1 sect U_2) + dim(U_1 + U_2) = dim U_1 + dim U_2
$

#italic[Beweis:] Sei $U := U_1 sect U_2$ und für $i in {1, 2}$ sei $W_i$ das Komplement von $U$ in $U_i$. Es gilt 
$
U_i = U oplus W_i, space i in{1, 2}
$
Dann gilt $U_1 + U_2 = U + W_1 + U + W_2 = U + W_1 + W_2$
$
W_1 sect (U + W_2) &= W_1 sect W_2 \
&= W_1 sect U_1 sect U_2 ("da" W_1 subset.eq U_1) \
&= W_1 sect U \
&= {0_V}
$
Analog folgt $W_2 sect (U + W_1) = {0_V}$. Sei $u in U_1, w_1 in W_1, w_2 in W_2$ mit $0 = u + w_1 + w_2$, dann gilt 
$
w_1 = - (u + w_2) \
w_2 = - (u + w_1)
$
Also $w_1 = 0$ und $w_2 = 0$ und damit auch $u = 0$. Also $U oplus W_1 oplus W_2$. Es folgt
$
dim(U_1 + U_2) &= dim(U + W_1) + dim W_2 \
&= dim U + dim W_1 + dim W_2
$
Aus der Wahl von $W_i$ folgt
$
dim U_1 = dim U + dim W_1 \
dim U_2 = dim U + dim W_2
$
durch einsetzen erhält man 
$
dim U + dim(U_1 + U_2) = dim U_1 + dim U_2
$
oder (nur für endliche wegen $- infinity$)
$
dim(U_1 + U_2) = dim U_1 + dim U_2 - dim U
$
#endproof

#pagebreak()

= Lineare Abbildungen

Nun behandeln wir Abbildungen, die zur Vektorstruktur "passen". Diese heißen lineare Abbildungen. Unser Ziel ist es, die Eigenschaften von linearen Abbildungen zu analysieren.

== Definitionen und grundlegende Eigenschaften

#definition("4.1", "Lineare Abbildung")[
  Seien $V$ und $W$ zwei $K$-Vektorräume. Eine Abbildung $f: V -> W$ heißt #bolditalic[lineare Abbildung], wenn gilt 
  
  #box(width: 100%, inset: (left: 0.5cm, right: 0.5cm))[
    1. $underbrace(f(lambda dot v), "Skalarmultiplikation in" V) = underbrace(lambda dot f(v), "Skalarmultiplikation in" W) wide forall space.sixth v in V, forall space.sixth lambda in K$
    #h(5pt)
    2. $underbrace(f(v + w), "Addition in" V) = underbrace(f(v) + f(w), "Addition in" W)$
    #h(5pt)
  ]
  Die Menge aller linearen Abbildungen von $V$ nach $W$ bezeichnet man mit $L(V, W)$. Eine lineare Abbildung $f: V -> W$ wird auch #bolditalic[lineare Transformation] oder #bolditalic[(Vektorraum-) Homomorphismus] genannt.

  Eine bijektive lineare Abbildung nennt man #bolditalic[(Vektorraum-) Isomorphismus]. Gibt es für zwei $K$-Vektorräume $V$ und $W$ einen Isomorphismus, so heißen die Räume $V$ und $W$ isomorph, geschrieben
  $
  V isomorph W
  $
  Eine lineare Abbildung $f: V -> V$ heißt #bolditalic[Endomorphismus] und ein bijektiver Endomorphismus heißt #bolditalic[Automorhpismus].
]

#bolditalic[Bemerkung:] Als Übungsaufgabe: 
$
"Definition 4.1, 1) + 2)" <==> f(lambda v + mu w) = lambda f(v) + mu f(w) wide forall v, w in V, forall lambda, mu in K
$

#bolditalic[Beispiel 4.2:] Für $a in RR$ ist $f: RR -> RR, f(x) = a x$ eine lineare Abbildung. Ihr Graph ist eine Gerade durch den Ursprung.

Betrachte eine Gerade $f(x) = a x + b$ und betrachte 
$
&f(x + y) = a(x + y) + b \
&f(x) + f(y) = a(x) + b + a(y) + b = a(x+y) + 2b
$
$f$ ist also nur eine lineare Abbildung, wenn $b = 0$ gilt. Streng genommen sind geraden der Form $f(x) = m x + n$ keine linearen Abbildung. Korrekt ist, sie als affine Abbildungen zu bezeichnen.

#bolditalic[Beispiel 4.3:] Für $a, b, c, d in RR$ ist $f: RR^2 -> RR^2$
$
f(vec(x_1, x_2)) = vec(a x_1 + b x_2, c x_1 + d x_2) in RR^2
$
eine lineare Abbildung, denn

1)
$
f(lambda vec(x_1, x_2)) &= vec(a lambda x_1 + b lambda x_2, c lambda x_1 + d lambda x_2) = vec(lambda(a x_1 + b x_2), lambda (b x_1 + c x_2)) \
&= lambda vec(a x_1 + b x_2, c x_1 + d x_2) = lambda f(vec(x_1, x_2)) space checkmark
$

2)
$
f(vec(x_1, x_2) + vec(y_1, y_2)) &= f(vec(x_1 + y_1, x_2 + y_2)) = vec(a(x_1 + y_1) + b(x_2 + y_2), c(x_1 + y_1) + d(x_2 + y_2)) \
&= vec(a x_1 + b x_2, c x_1 + d x_2) + vec(a y_1 + b y_2, c y_1 + d y_2) = f(vec(x_1, x_2)) + f(vec(y_1, y_2))
$
Damit haben wir auch bewiesen, dass für $phi in RR$ die Abbildung 
$
f(vec(x_1, x_2)) = vec(cos(phi) x_1 - sin(phi) x_2, sin(phi) x_1 + cos(phi) x_2)
$
linear ist. Dies ist eine Drehung um den Ursprung mit dem Drehwinkel $phi$. Für $phi = 45°$
$
f(vec(1,0)) = (cos(45°), sin(45°)) = vec(1/sqrt(2), 1/sqrt(2))
$

#bolditalic[Beispiel 4.4:] Sei $V = C^infinity(RR)$ der reelle Vektorraum aller unendlichen oft differenzierbaren Funktionen $g: RR -> RR$ mit punktweisen Addition und skalaren Multiplikation. Dann ist 
$
d/(d x): V -> V, f arrow.bar f' = d/(d x) f
$
eine lineare Abbildung, denn für alle $f, g in V$ und $a, b in RR$ gilt:
$
(f + g)'(x) = f'(x) + g'(x) wide forall x in RR \
(a dot f)'(x) = a f'(x) wide forall x in RR 
$ 

#bolditalic[Lemma 4.5:] Seien $V, W$ $K$-Vektorräume und $f: V -> W$ eine lineare Abbildung, $0_V$ der Nullvektor in $V$ und $0_W$ der Nullvektor in $W$. Dann gilt 

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $f(0_V) = 0_W$
  2. $f(-x) = -f(x) wide forall x in V$
]

#italic[Beweis:] Es folgt aus Definition 4.1, 1), dass 
$
f(0_V) = f(0_K dot 0_V) = 0_K dot f(0_V) = 0_W \
f(-x) = f((-1) dot x) = (-1) dot f(x) = -f(x)
$
#endproof

#bolditalic[Lemma 4.6:] Seien $V, W$ $K$-Vektorräume. Für $f, g in L(V, W)$ und $lambda in K$ seien $f + g$ und $lambda dot f$ definiert durch
$
(f + g)(v) = f(v) + g(v) wide forall v in V \
(lambda dot f)(v) = lambda f(v) wide forall v in V, forall lambda in K
$
Dann ist $(L(V, W), +, dot)$ ein $K$-Vektorraum.

#italic[Beweis:] (Übungsaufgabe)
#endproof

#bolditalic[Lemma 4.7:] Sei $V$ ein $K$-Vektorraum und $B := {v_1, ..., v_n} subset V$ eine endliche Familie von Vektoren. Dann ist:
$
Phi_B: K^n -> V, (a_i)_(i <= i <= n) arrow.bar sum_(i = 1)^n a_i v_i
$
ein Homomorphimus von $K$-Vekroräumen.

#italic[Beweis:] Seien $lambda in K$ und zwei Tupel $a = (a_1, ..., a_n) in K^n$, $b = (b_1, ..., b_n) in K^n$ gegeben. Mit der Definition der direkten Summe ist.
$
a + lambda b = (a_i + lambda b_i)_(1<=i<=n) in K^n
$ 
und deswegen gilt
$
Phi_B (a + lambda b) &= Phi_B (a_i + lambda b_i)_(1 <= i <= n) = sum_(i = 1)^n underbrace((a_i + lambda b_i), in space.sixth K) underbrace(v_i, in space.sixth V) \
&= sum_(i = 1)^n a_i v_i + lambda sum_(i = 1)^n b_i v_i = Phi_B (a) + lambda Phi_B (b) = "Def 4.1"
$
#endproof

#bolditalic[Wichtig:] $B = {v_1, ..., v_n}$ ist endlich! Für $B$ mit unendlich vielen Elementen bräuchte man eine äußere direkte Summe.

Aus abstrakter Sicht kennen wir jetzt endlichdimensionale Vektorräume, denn: Jeder endlichdimensionaler Vektorraum ist isomorph zu einer direkten Summe von Kopien des Grundkörpers.

#bolditalic[Satz 4.8:] Struktursatz für Vektorräume 

Sei $V$ ein $K$-Vektorraum und $B = {v_1, ..., v_n} subset V$ eine Basis von $V$. Dann ist die Abbildung 
$
Phi_B: K^n -> V, (lambda_i)_(1 <=i <= n) arrow.bar sum_(i = 1)^n lambda_i v_i
$
ein Isomorphismus, d.h. $K^n isomorph V$.

#italic[Beweis:] Nach Lemma 4.7 ist $Phi_B$ eine lineare Abbildung. Zu zeigen: $Phi_B$ ist bijektiv
$
B "Basis" ==> "Span" B = V ==> Phi_B "surjektiv" \
B "Basis" ==> "jedes" v in V "besitzt eine eindeutige Darstellung" v = sum_(i = 1)^n lambda_i v_i
$
#endproof

Für eine gegebene Basis $B$ nenn man $Phi_B$ auch Koordinatenabbildung.
$
Phi "bijektiv" ==> exists Phi^(-1)_B "als inverse Abbildung"
$

#bolditalic[Beispiel 4.9:] Sei $K^(n+1) = RR^(n+1)$ und $P_(<=n)[t]$ der Raum der Polynome von Grad kleiner gleich $n$ für $n in NN$. Eine Basis von $P_(<=n)[t]$ ist gegeben durch $B = {1, t, t^2, ..., t^n}$, vergleiche Beispiel 3.13.

Dann ist: 
$
Phi_B: K^(n+1) -> P_(<=n)[t], space (a_i)_(0 <= i <= n) arrow.bar sum_(i = 0)^n a_i t^i
$
ein Isomorphismus. Weitherhin ist
$
Phi_B^(-1) = P_(<=n)[t] -> K^(n+1), space p(t) = sum_(i = 0)^n a_i t^i arrow.bar (a_i)_(0 <=i <= n) in K^(n+1) 
$
die inverse Koordinatenabbildung. 

Um eine lineare Abbildung zu definieren, reicht es ihre Werte auf einer beliebigen Basis anzugeben.

#bolditalic[Lemma 4.10:] Sei $V$ ein endlichdimensionaler Vektorraum über $K$ mit einer Basis $B := {v_1, .., v_n}$, $W$ ein beliebiger $K$-Vektorraum und $C = {w_1, ..., w_n}$ einer Familie von Vektoren in $W$. Dann gibt es genau eine lineare Abbildung von $f$ von $V$ nach $W$ mit 
$
f(v_i) = w_i "für" 1 <= i <=n
$

#italic[Beweis:] zu zeigen: Existenz und Eindeutigkeit 

Eindeutigkeit: Seien $f, g in L(V, W)$ mit $f(v_i) = g(v_i) = w_i$, $forall i in {1, ..., n}$. Sei $v in sum lambda_i v_i$: Dann gilt
$
f(v) &= f(sum lambda_i v_i) = sum_(i = 1)^n lambda_i f(v_i) \
&= sum_(i = 1)^n lambda_i w_i = sum_(i = 1)^n lambda_i g(v_i) = g(v) \
&==> f(x) = g(x) space forall v in V \
&==> f "ist eindeutig bestimmt"
$
Existenz: $B$ Basis $==> "Span" B = V ==> "zu" v in V$ existieren nach Satz 3.8 eindeutige Koordinaten 
$
lambda_i^v, 1<=i<=n  "mit"
v = sum_(i = 1)^n lambda_i^v v_i
$
Definiere $f: V -> W, space f(v) = sum_(i = 1)^n lambda_i^v w_i in W ==> f(v_i) = w_i$

Ist $f$ linear?

Für jedes $mu in K$ gilt:
$
mu_v &= sum_(i = 1)^n (mu lambda_i^v v_i) ==> f(mu_v) = f(sum_(i = 1)^n (mu lambda_i^v w_i)) \
&= mu sum lambda_i^v w_i = mu f(v) wide "erste Eigenschaft" checkmark 
$
Sei $u = sum_(i = 1)^n lambda_i^u v_i ==>$
$
f(v + u) &= f(sum_(i = 1)^n lambda_i^v v_i + sum_(i = 1) lambda_i^u v_i) = f(sum_(i = 1) (lambda_i^v + lambda_i^u) v_i) \
&= sum_(i = 1)^n (lambda_i^v + lambda_i^u) w_i = sum_(i = 1)^n lambda_i^v w_i + sum_(i = 1)^n lambda_i^u w_i \
&= f(v) + f(w) wide "zweite Eigenschaft" checkmark
$
$
==> f "linear"
$
#endproof

== Kern, Bild und Rang von linearen Abbildungen

Kern und Bild wurden bereits im Kapitel 2 behandelt. Hier behandeln wir die Konzepte im Kontext linearer Abbildungen.

#definition("4.11", "Kern, Bild")[
  Es seien $V$ und $W$ $K$-Vektorräume sowie $f: V -> W$ eine lineare Abbildung. Die Menge 
  $
  ker(f) := {v in V | f(v) = 0}
  $
  heißt #bolditalic[Kern] der linearen Abbildung $f$. 

  Die Menge 
  $
  im(f) := f(V) = {w in W | exists v in V: w = f(v)}
  $
  heißt #bolditalic[Bild] der linearen Abbildung $f$.
]

#bolditalic[Beispiel 4.12:] 

#box(width: 100%, inset: (right: 1cm, left: 1cm))[
  1. #[Für den Isomorphismus aus Beispiel 4.9 gilt:
    $
    Phi_B: K^(n+1) -> P_(<=n)[t]
    $
    mit
    $
    ker(Phi_B) = {0_(K^(n+1))}
    $
    denn nur $0 in K^(n+1)$ wird auf das Nullpolynom abgebildet.
  ]
  2. #[
    Fortsetzung von Beispiel 4.3 (Drehungsmatrizen)

    Für $a = 0 = b$, $c, d in RR, c != 0$ und damit 
    $
    f: RR^2 -> RR^2, space f(vec(x_1, x_2)) = vec(a x_1 + b x_2, c x_1 + d x_2) = vec(0, c x_1 + d x_2)
    $ 
    gilt: 
    $
    ker(f) = {vec(x_1, x_2) in RR^2 | x_1 = -(d x^2) / c}, \
    im(f) = {vec(0, x) | x in RR} subset RR^2
    $
    weil $x = c x_1 + d x_2$ für jedes $x in RR$ lösbar ist $(c != 0)$.
  ]
]

#bolditalic[Lemma 4.13:] Es seien $V$ und $W$ zwei $K$-Vektorräume und $f: V -> W$ eine lineare Abbildung. Dann gilt :

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $ker(f) subset.eq V$ ist ein Untervektorraum von $V$ 
  2. $im(f) subset.eq W$ ist ein Untervektorraum von $W$
]

#italic[Beweis:]

zu 1) $0_V in ker(f) ==> ker(f) != emptyset$. Weitherhin ist $ker(f)$ abgeschlossen bezüglich Addition und Multiplikation, denn sei $x, tilde(x) in ker(f), lambda, mu in K$.

Zu zeigen: $lambda x + mu tilde(x) in ker(f)$
$
f(lambda x + mu tilde(x)) = lambda f(x) + lambda f(tilde(x)) = 0_W \
==> "Abgeschlossenheit in" V
$
Daraus folgt auch mit $tilde(x) = 0_V$ die Abgeschlossenheit bezüglich der Multiplikation. 

$==> ker(f)$ Unterraum $checkmark$

zu 2) $f(0_V) = 0_W in im(f) != emptyset$

zu zeigen: $im(f)$ abgeschlossen bezüglich $+$ und $dot$. Seien $y, tilde(y) in im(f), lambda, mu in K$

$==> x, tilde(x) in V: f(x) = y and f(tilde(x) = tilde(y))$. Dann gilt für $lambda x + mu tilde(x)$, dass
$
f(lambda x+ mu tilde(x)) &= lambda f(x) + mu f(tilde(x)) = lambda y + mu tilde(y) \
&==> lambda x + mu tilde(x) "ist das Urbild von" lambda y + mu tilde(y) \
&==> lambda y + mu tilde(y) in im(f)
$
#endproof

#definition("4.14", "Rang einer Abbildung")[
  Es seien $V$ und $W$ zwei $K$-Vektoräume und $f: V -> W$ eine lineare Abbildung. Der #bolditalic[Rang] der linearen Abbildung $f$ ist definiert als
  $
  rg(f) := dim_K (im(f))
  $
]

#bolditalic[Lemma 4.15:] Es seien $V$ und $W$ zwei $K$-Vektorräume und $f in L(V, W)$, $W$ sei endlichdimensional. Dann gilt 

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $f$ surjektiv $<==>$ $rg(f) = dim W$
  2. $f$ injektiv $<==>$ $dim(ker(f)) = 0$
]

#italic[Beweis:] 

zu 1) "$==>$": Sei $f$ surjektiv. Dann gilt $W = f(v) = im(f)$ und damit auch 
$
rg(f) = dim(im(f)) = dim W 
$
"$<==$": Es gilt $rg(f) = dim(im(f)) = W$. Nach Lemma 4.13 ist $im(f)$ ein Vektorraum. Da $W$ endlichdimensional ist, folgt mit Lemma 3.31
$
==> im(f) = W, space f "surjektiv"
$

zu 2) "$==>$": Sei $f$ injektiv. Wir wissen $f(0_V) = 0_W$.
$
==> ker(f) = {v in V | f(v) = 0} = {0_V} ==> dim(ker(f)) = 0
$

"$<==$": Es gilt $dim(ker(f)) = 0 ==> ker(f) = {0_V}$. Damit erhält man für $x, tilde(x) in V$ wegen der Linearität in $f$:
$
f(x) = f(tilde(x)) <==> f(x) - f(tilde(x)) = 0 <==> f(x - tilde(x)) = 0 in ker(f) \
<==> x - tilde(x) in ker(f) <==> x - tilde(x) = 0 <==> x = tilde(x) space f "injektiv"
$
#endproof

#bolditalic[Satz 4.16:] Dimensionsformel

Seien $V$ und $W$ zwei endlichdimensionale $K$-Vektorräume und $f in L(V, W)$. Dann gilt 
$
dim(ker(f)) + dim(im(f)) = dim V
$

#italic[Bewei:] Mit $r := dim(ker(f)), n := dim V$ gilt 
$
v < infinity "und" r < infinity "sowie" r <= n
$
Sei $tilde(B) := {v_1, ..., v_r}$ eine Basis von $ker(f)$. Mithilfe des Austauschsatzes von Steinitz (3.23) kann $tilde(B)$ zu einer Basis $B = {v_1, ..., v_r, v_(r+1), ..., v_n}$ von $V$ ergänzt werden.

zu zeigen: $C = {f(v_(r +1 )), ..., f(v_n)}$ ist eine Basis von $im(f)$.

1) Erzeugendensystem

$f$ linear $==>$ $"Span" C subset im(f)$. Sei $y in im(f) ==> exists x in V: f(x) = y$.

$B$ ist eine Basis von $V$ $==>$ es existiert eine eindeutige Darstellung 
$
x = sum_(i = 1)^n lambda_i v_i
$
Mit der Linearität von $f$ folgt:
$
f(x) = f(sum_(i = 1)^n lambda_i v_i) = sum_(i = 1)^n lambda_i f(v_i) = \
v_1, ..., v_r in ker(f) ==> y = f(x) = sum_(i = 1)^n lambda_i f(v_i) \
==> im(f) subset.eq "Span" C \
==> im(f) = "Span" C \
checkmark
$

lineare Unabhängigkeit: Sei 
$
sum_(i = r+1)^n lambda_i f(v_i) = 0
$
zu zeigen: $x_i = 0 "für" r + 1 <= i <= n$
$
f "linear" ==> 0 = sum_(i = r +1)^n lambda_i f(v_i) = f(sum_(i = r+1)^n lambda_i v_i) \
==> sum_(i = r+1)^n lambda_i v_i in ker(f)
$
$==>$ es existieren eindeutige Koeffizienten $mu_i in K, 1 <= i <= r$
$
sum_(i = r+1)^n lambda_i v_i = sum_(i = 1)^n mu_i v_i
==> sum_(i = r+1)1n lambda_i v_i - sum_(i = 1)^n mu_i v_i = 0
$
${v_1, ..., v_n}$ sind Basis von $V$. $==>$ $mu_i = ... = mu_r = lambda_(r+1) = ... = lambda_n = 0$. $==>$ $f(v_(n+1)), ..., f(v_n)$ sind linear unabhängig $==>$ $C$ ist Basis von $im(f)$ 
$
==> dim(im(f)) = n - r 
$
#endproof

#bolditalic[Beispiel 4.17:] Fortsetzung von Beispiel 4.12.

zu 1) 

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
    $Phi_B: K^(n+1) -> P_(<=n)[t]$

    Es gilt $ker(Phi_B) = {0} ==> dim(ker(f)) = 0$

    $==> dim(P_(<=n)[t]) = n + 1$
]

zu 2) 

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
    $f: RR^2 -> RR^2, space a = b = 0, c != 0, c, d in RR$

    Es gilt 
    $
    dim(ker(f)) = dim({vec(x_1, x_2) | s_1 = (d x_2)/c}) &= 1 \
    dim(im(f)) = dim({vec(0, x) | x in RR}) &= 1 \
    dim(ker(f)) + dim(im(f)) = dim(RR^2) &= 2 
    $
]

#bolditalic[Beispiel 4.18:] Sei $V = RR^3, W = RR^3$ und $f: V -> W$
$
f(vec(x_1, x_2, x_3)) = vec(x_1 - x_2 + 2 x_3, x_1 + x_2 + x_3, 0x_1 + 3x_2 + 0x_3)
$
gegeben. Damit ist $f$ linear. Nach Lemma 4.10 wird das Bild $im(f)$ durch die Bilder $f(e_1), f(e_2)$ und $f(e_3)$ erzeugt.
$
==> im(f) = "Span"{vec(1,1,0), vec(-1, 1, 3), vec(2,2,0)} \
==> rg(f) = dim(im(f)) = 2 
$
Aus der Dimensionsformel folgt 
$
dim(ker(f)) = dim(V) - dim(im(f)) = 3 - 2 = 1 \
==> {0_(RR^3)} subset ker(f)
$

#bolditalic[Lemma 4.19:] Zwei endlichdimensionale $K$-Vektorräume $V$ und $W$ sind genau dann isomorph, wenn
$
dim(V) = dim(W)
$

#italic[Beweis:] 

"$==>$": Gilt $V isomorph W$, so existiert ein Isomorphismus $f in L(V, W)$. 

Lemma 4.15: 
$
ker(f) = {0} wide (f "injektiv") \
im(f) = W  wide (f "surjektiv")
$
Satz 4.16:
$
dim(V) &= dim(ker(f)) + dim(im(f)) \
&= 0 + dim(W) \
&= dim(W) space checkmark
$

"$<==$": $dim(V) = dim(W) < infinity$

Seien ${v_1, ..., v_n}$ und ${w_1, ..., w_n}$ Basen von $V$ bzw. $W$. Nach Lemma 4.10 gibt es genau eine Abbildung $f in L(V, W)$ mit 
$
f(v_i) = w_i, wide 1 <= i <= n
$
Ist $v = lambda_1 v_1 + lambda_2 v_2 + ... + lambda_n v_n in ker(f)$. Dann gilt $0 = f(v) = f(lambda_1 v_1 + ... + lambda_n v_n)$ $attach(=, t: f in L(V, W)) lambda_1 f(v_1) + ... + lambda_n f(v_n) =$ $lambda_1 w_1 + ... + lambda_n w_n$
$w_1, ..., w_n$ linear unabhängig
$==>$ $lambda_1 = lambda_2 = ... = lambda_n = 0 ==> v = 0 ==> ker(f) = {0_V} attach(==>, t: "4.15") f "injektiv"$
Mit der Dimensionsformel folgt 
$
dim(V) &= 0 + dim(im(f)) \
dim(W) &
$
$
==> "mit" im(f) <= W ==> im(f) = W ==> f "surjektiv"
$
#endproof

Was passiert bei Verknüpfungen von linearen Abbildungen?

#bolditalic[Satz 4.20:] Seien $V, W$ und $X$ drei endlichdimensionale $K$-Vektorräume sowie $f in L(V, W)$ und $g in L(W, X)$. Dann gilt 
$
g circ f in L(V, X) "und" \
dim(im(g circ f)) = dim(im(f)) - dim(im(f) sect ker(g))
$

#italic[Beweis:] 1) $g circ f in L(V, X)$: Für $u, v in V$ und $lambda, mu in K$ erhält man:
$
(g circ f)(lambda u + mu v) &= g(f(lambda u + mu v)) \
&= g(lambda f(u) + mu f(u)) = lambda g(f(u)) + lambda g(f(v)) \
&= lambda (g circ f)(u) + mu (g circ f)(v) space checkmark
$

2) Betrachte $tilde(g) := g_(|im(f))$. Die Dimensionsformel liefert 
$
dim(im(f)) = dim(im(tilde(g))) + dim(ker(tilde(g)))
$
Des weiteren gilt: $im(tilde(g)) := {g(v) in X | v in im(f)} = im(g circ f)$
$
ker(tilde(g)) = {v in im(f) | tilde(g)(v) = 0} = im(f) sect ker(g)
$
#endproof

#bolditalic[Lemma 4.21:] Sei $K$ ein Körper. Die linearen Abbildungen $f: K^n -> K^m$ sind genau die Abbildungen der Form:
$
vec(x_1, x_2, dots.v, x_n) -> vec(a_(1 1) x_1 + a_(1 2) x_2 + ... + a_(1 n) x_n, a_(2 1) x_1 + a_(2 2) x_2 + ... + a_(2 n) x_n, dots.v, a_(n 1) x_1 + a_(n 2) x_2 + ... + a_(m n) x_n)
$
mit Koeffizienten $a_(i j) in K$ für $1 <= i <= m$ und $1 <= j <= n$. 

#italic[Beweis:] "$<==$": Die Dimensionen passen aufgrund der Definitionen. Die Linearität $f$ folgt aus den Rechengesetzen im Körper.

"$==>$": Sei $f in L(K^n, K^m)$. Zu zeigen: $f$ ist in angegebener Form darzustellen. 

#bolditalic[Beobachtung:] Wenn $f$ so darstellbar ist, haben alle Bilder der Standardbasis $e_1, ..., e_n$:
$
f(e_i) = vec(a_(1 i), dots.v, a_(m i)) in K^m
$
Deswegen definieren wir
$
vec(a_(1 i), dots.v, a_(m i)) := f(e_i) in K^m
$
Jetzt definieren wir $g in L(K^n, K^m)$ durch
$
g(vec(x_1, dots.v, x_n)) = vec(a_(1 1) x_1 + ... + a_(1 n) x_n, dots.v, a_(m 1) x_1 + ... + a_(m n) x_n)
$
Per Konstruktion gilt $f(e_i) = g(e_i)$. 

Mit Lemma 4.10 folgt $f = g$.
#endproof

Dieses Resultat motiviert das nächste Kapitel:

#pagebreak()

= Matrizen

James Sylvester (brit. Mathematiker, 1814 - 1897) erfand den Begriff der Matrix im Jahr 1850. Die im folgenden definierte Matrixoperationen führte Arthur Cayley (brit. Mathematiker, 1821 - 1895) im Jahr 1858 ein.

== Definitionen und Basisoperationen

Wir nehmen für dieses Kapitel an: $R$ ist ein Ring mit $1 != 0$.

#definition("5.1", "Matrix")[
  Sei $(R, +, dot)$ ein kommutativer Ring mit Eins und seien $n, m in NN_0$. Ein rechteckiges Schema der Form
  $
  mat(
    a_(1 1), a_(1 2), ..., a_(1 n);
    dots.v, dots.v, dots.down, dots.v;
    a_(m 1), a_(m 2), ..., a_(m n);;
  )
  $
  mit $a_(i j) in K$ für $1 <= i <= m$ und $1 <= j <= n$ heißt #bolditalic[(m $times$ n) Matrix] mit den Einträgen in $R$. Die Einträge nennt man auch Koeffizienten. Die Menge aller ($m times n$) Matrizen nennt man $R^(m times n)$.
]

#bolditalic[Bemerkungen:] 

#boxedlist[
  Rein formal erlaubt diese Definition $n = 0$ oder $m = 0$. Dann erhält man Matrizen der Form $0 times n$, $m times 0$ oder $0 times 0$.

  Diese leeren Matrizen werden in manchen Beweisen aus technischen Gründen benötigt. In der Regel gilt aber $n, m >= 1$.
][
  Die Nullmatrix in $R^(m times n)$ ist die Matrix, bei der alle Einträge gleich $0$ sind. Sie wird mit $0^(m times n)$ bezeichnet
][
  Ist $m = n$, so nennt man $A in R^(m times n)$ quadratisch bzw. eine quadratische Matrix
][
  Ist $A in R^(n times n)$ heißen die Einträge $a_(j j)$ für $1 <= j <= n$ #bolditalic[Diagonaleinträge] von 
  $
  A = mat(
      a_(1 1), ..., ...;
      dots.v, dots.down, dots.v;
      ..., ..., a_(n  n); 
    )
  $
]

#boxedlist[
  Die Kronecker-Delta Funktion $delta_(i j)$ für $i in I$ und $j in J$, $I$ und $J$ sind Indexmengen, ist benannt nach Leopold Kronecker (1823 - 1891) und gegeben durch 
  $
  delta_(i j) = cases(1 &i = j, 0 "sonst")
  $
  Damit definiert man die Einheitsmatrix $I_n in R^(n times n)$ durch
  $
  I_n := [delta_(i j)] = mat(
      1, ..., 0;
      dots.v, dots.down, dots.v;
      0 ,..., 1;
    )
  $
  Man verwendet $I$, wenn $n$ aus dem Kontext klar ist.
][
  Die $i$-te Zeile von $A in R^(m times n)$ ist 
  $
  (a_(i 1), ..., a_(i n)) in R^(1 times n) "für" i = 1, ..., m "ist ein Zeilenvektor" 
  $
  Die $j$-te Spalte von $A in R^(m times n)$ ist 
  $
  vec(a_(1 j), dots.v, a_(m j)) in R^(m times 1) "für" i = 1, ..., n "ist ein Spaltenvektor"
  $
  Diese sind selbst wieder Matrizen.
][
  Sind $m_1, m_2, n_1, n_2 in NN_0$ und $A_(i j) in R^(m, n)$ für $i j = 1 2$ gegeben, definieren diese eine sogenannte #bolditalic[Blockmatrix] der Form 
  $
  A = mat(
    A_(1 1), A_(1 2);
    A_(2 1), A_(2 2);
    ) in R^(m_1 + m_2, n_1 + n_2)
  $
]

#bolditalic[Beispiel 5.2:] Für 
$
A = mat(
  1, -2, 3;
  -4, 5, 6;
  ) in ZZ^(2, 3)
space "und" space
B = mat(
    -1, 0;
    0, 1;
    1, -1;
  ) in ZZ^(3,2)
$ 
ist $a_(2 3) = 6$, $(1, -2, 3) in ZZ^(1,3)$ die erste Zeile von $A$ und $b_(2 2) = 1$ und 
$
vec(0,1,-1) in ZZ^(3,1)
$
die zweite Spalte von $B$. Keine dieser Matrizen inst quadratisch.

#definition("5.3", "Addition von Matrizen")[
  Seien $A, B in R^(m, n)$ zwei Matrizen. Dann ist $C = A + B in R^(m,n)$ definiert durch
  $
  C := A + B = mat(
    a_(1 1), ..., a_(1 n);
    dots.v, dots.down, dots.v;
    a_(m 1), ..., a_(m n);
    ) + mat(
        b_(1 1), ..., b_(1 n);
        dots.v, dots.down, dots.v;
        b_(m 1), ..., b_(m n);
      ) = mat(
          a_(1 1) + b_(1 1), ..., a_(1 n) + b_(1 n);
          dots.v, dots.down, dots.v;
          a_(m 1) + b_(m 1), ..., a_(m n) + b_(m n);
        )
  $
  Die Addition in $R^(m,n)$ erfolgt also komponentenweise basieren auf der Addition auf $R$.
]

#bolditalic[Achtung:] Die Addition ist nur für Matrizen gleicher Größe / Dimension definiert.

#definition("5.4", "Multiplikation einer Matrix mit einem Skalar")[
  Sei $A in R^(m,n)$ eine Matrix und $lambda in R$. Dann ist $C = lambda dot A in R^(m,n)$ definiert durch
  $
  C = lambda A = lambda mat(
    a_(1 1), ..., a_(1 n);
    dots.v, dots.down, dots.v;
    a_(m 1), ..., a_(m n);
    ) = mat(
      lambda a_(1 1), ..., lambda a_(1 n);
      dots.v, dots.down, dots.v;
      lambda a_(m 1), ..., lambda a_(m n);
      )
  $
  Die Multiplikation einer Matrix mit einem Skalar aus $R$ erfolgt komponentenweise basierend auf der Multiplikation in $R$. 
]

#definition("5.5", "Multiplikation von Matrizen")[
  Seien $A in R^(m,n)$ und $B in R^(n, l)$ zwei Matrizen. Dann ist $C = A dot B in R^(m, l)$ definiert durch
  $
  C := A dot B = mat(c_(1 1), ..., c_(1 l); dots.v, dots.down, dots.v; c_(m 1), ..., c_(m l)) space "mit" space c_(i j) = sum_(k = 1)^n a_(i k) dot b_(k j)
  $
  für $i = 1, ..., m$ und $j = 1, ..., l$
]

#bolditalic[Bemerkung:] Um das Produkt $A dot B$ berechnen zu können #bold[muss] die Anzahl der Spalten von $A$ gleich der Anzahl von Zeilen in $B$ sein.

#bolditalic[Merkregel:] 
$
c_(i j) =  i"-te Zeile von" A "mal" j"-t Spalte von" B
$
Oder Zeile "mal" Spalte. ("mal" $corres$ Skalarprodukt)

#bolditalic[Beispiel 5.6:] Für die Matrizen
$
A = mat(1, -2, 3; -4, 5, 6) in ZZ^(2,3), space B = mat(-1, 0; 0, 1; 1, -1) in ZZ^(3,2) space "und" space C = mat(1, 3, 5; 2, 4, 6) in ZZ^(3, 2) 
$
gilt:

$A + B$ geht nicht

$
B + C = mat(0, 2; 3, 5; 6, 5) in ZZ^(3,2) wide 3 dot A = mat(3, -6, 9; -12, 15, 18) in ZZ^(2,3)
$

$
A dot B = mat(2, -5; 10, -1) in ZZ^(2,2) wide B dot A = mat(-1, 2, -3; -4, 5, 6; 5, -7, -3) in ZZ^(3,3)
$
Also $A dot B$ und $B dot A$ sind für dieses Beispiele definiert, aber $A dot B != B dot A$. Damit ist die Multiplikation von Matrizen nicht kommutativ. Dies gilt auch für gleichgroße Matrizen:
$
D = mat(1, -2; -4, 5) in ZZ^(2,2) space, space E =  mat(-1, 0; 0, 1) in ZZ^(2,2) ==> 
$
$
D dot E = mat(-1, -2; 4, 5) space != space mat(-1, 2; -4, 5) = E dot D
$

#bolditalic[Lemma 5.7:] Für $A, tilde(A) in R^(m,m) space B, tilde(B) in R^(m,l), space C in R^(l,k) "sowie" lambda, mu in R$ gelten

#boxedlist[
  Assoziativgesetze, d.h. #sspace
  $
  A dot (B dot C) = (A dot B) dot C space "und" (lambda mu) dot A = lambda dot (mu dot A)
  $
][
  Distributivitätsgesetze , d.h.
  $
  (A + tilde(A)) dot B &= A dot B + A dot B \
  A dot (B + tilde(B)) &= A dot B + A dot tilde(B)\
  (lambda dot mu) dot A &= lambda dot A + mu dot A \
  lambda dot (A + tilde(A)) &= lambda dot A + lambda dot tilde(A)\
  lambda dot (A dot B) &= A dot (lambda dot B)
  $
][
  und mit 
  $
  I_n = mat(1, ..., 0; dots.v, dots.down, dots.v; 0, ..., 1) in R^(n,n) "bzw." I_m in R^(m,m)
  $
  gilt 
  $
  I_n dot A = A = A dot I_m
  $
]

#italic[Beweis:] Nachrechnen
#endproof

#definition("5.8", "Transposition von Matrizen")[
  Sei
  $
  A = mat(a_(1 1), ..., a_(1 n); dots.v, dots.down, dots.v; a_(m 1), ..., a_(m n)) in R^(m times n)
  $
  eine Matrix. Dann ist die zu $A$ #bolditalic[Transponierte] Matrix $A^top$ definert durch 
  $
  A^top := mat(a_(1 1), ..., a_(m 1); dots.v, dots.down, dots.v; a_(1 n), ..., a_(m n)) in R^(n times m)
  $
]

#bolditalic[Beispiel 5.9:] Die zu 
$
A = mat(1,-2,3;-4,5,6) in ZZ^(2,3)
$
tranponierte Matrix ist
$
A^top = mat(1, -4; -2, 5; 3, 6) in ZZ^(3,2)
$

#bolditalic[Lemma 5.10:] Für $A, tilde(A) in R^(m,n), space B in R^(n,l) "und" lambda in R$ gilt 

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  #show par: set block(spacing: 0.65em)
  1. $(A^top)^top = A$

  2. $(A + tilde(A))^top = A^top + tilde(A)^top$

  3. $(lambda dot A)^top = lambda dot A^top$

  4. $underbrace(underbrace(A dot B, in space R^(m,l))^top, in space R^(l,m)) = underbrace(underbrace(B^top, in space R^(m,l)) dot underbrace(A^top, in space R^(n,m)), in space R^(l,m)))$
]

#italic[Beweis:] Nachrechnen.
#endproof

#bolditalic[Zur Notation:]
$
R^n, space v in R^n, space v = vec(v_1, dots.v, v_n) in R^(n,1)
$
d.h. $v$ wird immer als Spaltenvektor interpretiert.

Für Zeilenvektor: 
$
w in R^(1,n) "gilt" w^top in R^(n,1) isomorph R^n
$
#bolditalic[Beobachtung:] Alle Operationen, die wir für Matrizen definiert haben, sind konsistent mit den Vektoroperationen, wenn diese im obigen Sinn als Matrizen interpretiert werden.

== Matrizengruppen und -ringe

#bolditalic[Lemma 5.11:] Mit den angegebenen Rechenregeln ist $R^(m,n)$ ein $R$-Vektorraum der Dimension $m dot n$. 

#italic[Beweis:] Aufgrund der Rechenregeln ist $R^(m,n)$ abgeschlossen bezüglich der 
$
+: R^(m, n) times R^(m, n) -> R^(m,n) space "und" space dot space.thin: R times R^(m,n) -> R^(m,n)
$
Zur Dimension: $A in R^(m,n)$ kann dargestellt werden durch
$
a_(1 1) dot mat(1, 0, ..., 0; dots.v, dots.v, dots.down, dots.v; 0, 0, ..., 0) + a_(1 2) mat(0, 1, ..., 0; dots.v, dots.v, dots.down, dots.v; 0, 0, ..., 0) ==> "Erzeugendensystem + lin. unabhägnig" ==> "Basis" 
$
#endproof
