#import "utils.typ": *
#import "template.typ": uni-script-template
#import "@preview/tablex:0.0.7": tablex, gridx, hlinex, vlinex, colspanx, rowspanx
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

#bolditalic[Beispiel 1.20:] #italic[(Vortsetzung von Beispiel 1.18)]

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
  "$subset.eq$": $#humongousspace$ 
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

#bolditalic[Lemma 1.26:] Sei $M$ eine Menge und $cal(K) subset.eq cal(P)(M)$ eine Kette. Dann gibt es zu je endlich vielen $A_1, ..., A_n in cal(K)$ ein $hat(i) in {1, ..., n}$ mit $A_i subset.eq A_(hat(i))$ für alle $i in {1, ..., n}$. 

#italic[Beweis:] Durch vollständige Induktion über $n$.

Induktionsanfang: n = 1

D.h. wir haben $A_1 in cal(K)$ und für $hat(i) = 1$ gilt $A_1 subset.eq A_(hat(i)) = A_1 space checkmark$

Induktionsschritt: $n - 1 arrow.bar n$

Für $A_1, ..., A_(n-1) in cal(K)$ exisitert ein $hat(j) in {1, ..., n-1}$ mit $A_i subset.eq A_(hat(j))$ für alle $i in {1, ..., n-1}$. Mit 
$
hat(i) := cases(hat(j) "für" A_n subset.eq A_(hat(j)), n "für" A_(hat(j)) subset.eq A_n)
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

#boxedlist([#bolditalic[injektiv:] falls für alle $x, tilde(x) in X$ gilt: $humongousspace$
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

#italic[Beweis:] (Übungsaufgabe)

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
  1. f^(-1) ist bijektiv $wide (f^(-1)^(-1)) = f$ #v(1mm) 
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
Analgog ziegt man: $(g compose f) compose (f^(-1) compose g^(-1)) = "Id"_Y$
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

Mann kann nachrechenen, dass $(M, circ)$ eine Halbgruppe ist. Mann kann auch prüfen, dass $a$ linksneutral aber nicht rechtsneutral ist, sowie dass $b$ rechtsneutral aber nicht linksneutral ist. Somit besitzt die Halbgruppe kein neutrales Element, $(M, circ)$ ist also kein Monoid.

#bolditalic[Bemerkung:] In der Definition eines Monoids wird nur die Existens aber nicht die Eindeutigkeit des neutralen Elements gefordert. Ist dies sinnvoll?

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
  $(FF_2, +, dot)$ ist ein kommutativer Körper mit Einselement, denn

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
