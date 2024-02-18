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

#boxedlist[analytische Geometrie: \ Beschreibung von geometrischen Fragen mit Hilfe von Gleichungen, Geraden, Ebenen sowie die Lösungen von Gleichungen als geometrische Form][lineare Algebra: \ die Wissenschaft der linearen Gleichungssysteme bzw der Vektorräume und der linearen Abbildungen zwischen ihnen]

Wozu braucht man das?

#boxedlist([mathematische Grundlage für viele mathematische Forschung z.B. in der algebraischen Geometrie, Numerik, Optimierung], [viele Anwendungen z.B. Page-Rank-Algorithmus, lineare Regression], [oder Optimierung: \ linear: Beschreibung zulässiger Punkte als Lösung von (Un)-Gleichungen \ nichtlinear: notwendige Optimalitätsbedingungen])

== Mengen

Der Mengenbegriff wurde von Georg Cantor (dt. Mathematiker, 1845-1918) eingeführt.

#definition("1.1", "Mengen")[
    Unter einer #bold[Menge] verstehen wir jede Zusammenfassung $M$ von bestimmten, wohlunterschiedenen Objekten $x$ unsere Anschauung order unseres Denkens, welche #bold[Elemente] von $M$ genannt werden, zu einem Ganzen.
] <def>

#underline("Bemerkungen"):

Für jedes Objekt $x$ kann man eindeutig feststellen, ob es zu einer Menge $M$ gehört oder nicht.
$
x in M arrow x #[ist Element von] M \
x in.not M arrow x #[ist nicht Element von] M
$

#pagebreak()

#bold[Beispiel 1.2:] Beispiel für Mengen

#boxedlist([{rot, gelb, grün}], [{1, 2, 3, 4}], [$NN = {1, 2, 3, ...}, NN_0 = {0, 1, 2, 3, ...}$], [$ZZ = {..., -1, 0, 1, ...}$], [$QQ = {x | x = a/b #[mit] a in ZZ #[und] b in NN}$], [$RR = {x | x #[ist reelle Zahl]}$], [$emptyset #[bzw.] {} corres #[leere Menge]$])

#definition("1.3", "Teilmenge")[
  Seien $M, N$ Mengen. \

  1. $M$ heißt #bold[Teilmenge] von $N$, wenn jedes Element von $M$ auch Element von $N$ ist. \ Notation: $M subset.eq N$

  2. $M$ und $N$ heißen gleich, wenn $M subset.eq N$ und $N subset.eq M$ gilt. \ Notation $M = N$ \ Falls das nicht gilt, schreiben wir $M != N$

 $M$ heißt #bold[echte Teilmenge] von $N$, wenn $M subset.eq N$ und $M != N$ gilt. \ Notation: $M subset N$
] <def>

Nutzt man die Aussagenlogik, kann man diese Definitionen Umformulieren zu: 

#align(center, [#boxedlist([$M subset.eq N <==> ( forall x: x in M ==> x in N )$], [$M = N <==> (M subset.eq N and N subset.eq M) wide$], [$M subset N <==> (M subset.eq N and M != N) wide$])])

#underline("Kommentare"):

#boxedlist([$<==>$ heißt "genau dann, wenn"], [$forall$ heißt "für alle"], [$and$ heißt "und"], [$:$ heißt "mit der Eigenschaft"])

#bold[Satz 1.4:] Für jede Menge $M$ gilt:

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

#bold[Beispiel 1.5:] Ob ein Objekt ein Element oder eine Teilmenge einer Mengen ist, ist vom Kontext abhängig. Betrachten wir folgende Menge:
$
M := {NN, ZZ ,QQ, RR}
$
D.h. die Elemente dieser Menge $M$ sind die natürlichen, ganzen, rationalen und reellen Zahlen. Damit gilt $NN in M$ aber $NN subset ZZ$ und $NN subset QQ$.

#definition("1.6", "Mengenoperationen")[
  Seien $M,N$ Mengen.

  1. Man bezeichnet die Menge der Elemente, die sowhol  in $M$ als auch in $N$ enthalten sind, als #bold[Durchschnitt] von $M$ und $N$
  $
  M sect N = {x | (x in M) and (x in N)}
  $

  2. Man bezeichnet die Menge der Elemente, die entweder in $M$ oder in $N$ enthalten sind oder in beiden enthalten sind, als #bold[Vereinigung] von $M$ und $N$
  $
  M union N = {x | (x in M) or (x in N)}
  $

  3. Man bezeichnet die Menge der Elemente, die in $M$ aber nicht in $N$ enthalten sind, als #bold[Differenz] von $M$ und $N$
  $
  M backslash N &= {x | (x in M) and (x in.not N)} \
  &= {x in M | x in.not N}
  $
] <def>

#bold[Beispiel 1.7:]

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

#bold[Satz 1.8:] Für zwei Mengen $M, N$ gelte $M subset.eq N$. Dann sind folgende Aussagen äquivalent: 

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

#bold[Satz 1.9:] Seien $M, N, L$ Mengen. Dann gelten folgende Aussagen:

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
Die Menge I heißt auch #bold[Indexmenge]. Für $I = {1, ..., n}$ verwendet man auch die Notation
$
union.big_(i = 1)^n M_i := {x | exists i in I #[mit] x in M_i} \
\
sect.big_(i = 1)^n M_i := {x | forall i in I #[mit] x in M_i}
$

#definition("1.10", "Kardinalität, Potenzmenge")[
  Sei $M$ eine endliche Menge, d.h. $M$ enthält endlich viele Elemente.

  Die #bold[Mächtigkeit] oder #bold[Kardinalität] von $M$, bezeichnet mit $|M| #[oder] \#M$ ist die Anzahl von Elementen in $M$. 

  Die #bold[Potenzmenge] von $M$, bezeichnet mit $cal(P)(M)$ ist die Menge aller Teilmengen von $M$.
  D.h. 
  $
  cal(P)(M) := {N | N subset.eq M}
  $
] <def>

#bold[Beispiel 1.11:]

Die leere Menge $emptyset$ hat die Kardinalität Null. Es gilt $cal(P)(emptyset) = {emptyset}, abs(cal(P)(emptyset)) = 1$.

Für $M = {2, 4, 6}$ gilt $abs(M) = 3$. $cal(P)(M) = {emptyset, {2}, {4}, {6}, {2, 4}, {2, 6}, {4, 6}, {2, 4, 6}}$.

Man kann zeigen: $abs(cal(P)(M)) = 2^(abs(M))$. Deswegen wird auch die Notation $2^M$ für die Potenzmenge von $M$ verwendet.

== Relationen

#definition("1.12", "Kartesisches Produkt")[
  Sind $M$ und $N$ zwei Mengen, so heißt die Menge 
  $
  M times N := {(x, y) | x in M and y in N}
  $
  das #bold[kartesische Produkt] von $M$ und $N$.

  Sind $n$ Mengen $M_1, ..., M_n$ gegeben, so ist deren kartesisches Produkt gegeben druch:
  $
  M_1 times ... times M_n := {(x_1, ..., x_n) | x_1 in M_1 and ... and x_n in M_n}
  $
  Das n-fache kartesische Produkt einer Menge von $M$ ist:
  $
  M^n := M times ... times M := {(x_1, ..., x_n) | x_i in M #[für] i = 1, ..., n}
  $

  Ein Element $(x, y) in M times N$ heißt geordnetes Paar und eine Element $(x_1, ..., x_n) in M_1 times ... times M_n$ heißt #bold[(geordnetes) n-Tupel].
] <def>
 
Ist mindestens eine der auftretenden Mengen leer, so ist auch das resultierende kartesische Produkt leer, d.h. die leere Menge. Das kartesische Produkt wurde nach Rene Decartes benannt. Rene Decartes war ein französische Mathematiker (1596-1650) und ein Begründer der analytischen Geometrie.

#bold[Beispiel 1.13:] Das kartesische Produkt zweier Intervalle.

Seien $[a, b] subset RR$ und $[c, d] subset RR$ zwei abgeschlossene Intervalle von reellen Zahlen. Dann ist das kartesische Produkt beider Intervalle gegeben durch:
$
[a,b] times [c,d] := {(x, y) | x in [a,b] and y in [c,d]}
$
Das kartesische Produkt ist nicht kommutativ. Beweis durch Gegenbeispiel.

#definition("1.14", "Relationen")[
  Seien $M$ und $N$ nichtleere Mengen. Eine Menge $R subset.eq M times N$ heißt #bold[Relation] zwischen $M$ und $N$. Ist $M = N$, so nennt man $R$ #bold[Relation auf $M$]. Für $(x, y) in R$ schreibt man $x attach(tilde, br: R) y$ oder $x tilde y$, wenn die Relation aus dem Kontext klar ist. Ist mindestens eine der beiden Mengen leer, dann ist auch jede Relation zwischen den beiden Mengen die leere Menge.
] <def>

#bold[Beispiel 1.15:] Sei $M = NN$ und $N = ZZ$. Dann ist 
$
R := {(x, y) in M times N | x + y = 1}
$
eine Relation zwischen $M$ und $N$. Es gilt 
$
R = {(1,0),(2,-1),(3,-2),...} = {(n, -n + 1) | n in NN}
$

#definition("1.16", "reflexiv, symmetrisch, antisymmetrisch, transitiv")[
  Es sei $M$ eine nicht leere Menge. Eine Relation auf $M$ heißt:

  #box(width: 100%, inset: (top:2.5mm, right: 0.5cm, left: 0.5cm), [
  #bold[1. reflexiv:] 
  #v(-2mm)
  $
  forall x in M: x tilde x
  $
  #bold[2. symmetrisch:] 
  #v(-2mm)
  $
  forall x,y in M: x tilde y ==> y tilde x
  $
  #bold[3. antisymmetrisch:] 
  #v(-2mm)
  $
  forall x,y in M: x tilde y and y tilde x ==> x = y
  $
  #bold[4. transitiv:] 
  #v(-2mm)
  $
  forall x,y,z in M: x tilde y and y tilde z ==> x tilde z
  $
  ])
] <def>

Falls die Relation $R$ reflexiv, transitiv und symmetrisch ist, so nennt man $R$ eine #bold[Äquivalenzrelation] auf $M$. Ist $R$ reflexiv, transitiv und antisymmetrisch, so nennt man $R$ eine #bold[partielle Ordnung] auf $M$. 

#bold[Beispiel 1.17:] $M = RR$

#boxedlist([Die Relation $<$ auf $M = RR$ ist transitiv, aber weder reflexiv noch symmetrisch und auch nicht antisymmetrisch.],[Die Relation $<=$ auf $M = RR$ ist reflexiv, antisymmetrisch und transitiv. Sie ist nicht symmetrisch. $<=$ ist somit eine partielle Ordnung.],[Die Relation $=$ auf $RR$ ist reflexiv, symmetrisch und transitiv. Also ist $=$ eine Äquivalenzrelation. (Äquivalenzrelationen können auch antisymmetrisch sein)])



#bold[Beispiel 1.18:] Interpretiert man "Pfeile" als Objekte mit gleicher Orientierung und Länge, erhält man die Äquivalenzrelation 
$
x tilde y :<==> #[$x$ und $y$ haben die gleiche Länge und Orientierung]
$
Auf Grund der Transitivität sind somit alle Pfeile einer vorgegebenen Orientierung und Länge äquivalent zu dem Pfeil, der im Koordinatenursprung startet und die gleiche Länge sowie Orientierung besitzt. Somit können wir Vektor $x = (x_1, x_2) in RR^2$ als Repräsentant einer ganzen Klasse von Pfeilen interpretieren. Alle zueinander äquivalente Pfeile haben gemeinsam, dass die Differenz zwischen End- und Anfangspunkt genau den Vektor $x$ ergeben.

Als Formalisierung erhält man:

#definition("1.19", "Äquivalenzklassen, Quotientenmenge")[
  Sei $tilde$ eine Äquivalenzrelation auf einer nichtleeren Menge $M$. Die Äquivalenzklasse eines Element $overline(a) in M$ ist definiert durch: 
  $
  [overline(a)] := {a in M | a tilde overline(a)}
  $
  Ist die Relation nicht aus dem Kontext klar, schreibt man $[overline(a)]_tilde$.

  Elemente einer Äquivalenzklasse werden als #bold[Vertreter] oder #bold[Repräsentanten] der Äquivalenzklasse bezeichnet. Die Menge aller Äquivalenzklassen einer Äquivalenzrelation $tilde$ in einer Menge $M$, d.h. 
  $
  M \/ tilde #h(1.5mm) := {[a]_tilde | a in M}
  $
  wird als #bold[Faktormenge] oder #bold[Quotientenmenge] bezeichnet.
] <def>

#bold[Beispiel 1.20:] #italic[(Fortsetzung von Beispiel 1.18)]

Die Menge aller Pfeile gleicher Länge und Orientierung bilden eine solche Äquivalenzklasse, welche durch den Vektor $x = (x_1, x_2) in RR^2$ repräsentiert wird. Die Menge der Vektoren $x = (x_1, x_2) in RR^2$ bilden die Quotientenklasse.

#bold[Beispiel 1.21:] Für eine gegebene Zahl $x in NN$ ist die Menge: 

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
[a] = a + n dot z := {a + n z | z in ZZ}
$

Die Äquivalenzrelation $R_n$ definiert auch eine Zerlegung der Menge $ZZ$ in disjunkte Teilmengen, nämlich 

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

#bold[Satz 1.22:] Ist $R$ eine Äquivalenzrelation auf der Menge $M$ und sind $a, b in M$, dann sind folgende Aussagen äquivalent:

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

#definition("1.23", "")[Sei $M$ eine Menge und sei für jedes Element $m in M$ eine weitere Menge $S_m$ gegeben. Für $cal(S) := {S_m | m in M}$ ist die Teilmengenrelation $subset.eq$ eine partielle Ordnung. Die Menge $cal(S)$ heißt dann #bold[partiell geordnet]. Eine Menge $hat(S) in cal(S)$ heißt #bold[maximales Element] von $cal(S)$ (bezüglich $subset.eq$), wenn aus $S in cal(S)$ und $hat(S) in cal(S)$ folgt, dass $S = hat(S)$ ist. Eine nichtleere Teilmenge $cal(K) subset.eq cal(S)$ heißt #bold[Kette] (bezüglich $subset.eq$), wenn für alle $K_1, K_2 in cal(K)$ gilt, dass $K_1 subset.eq K_2$ oder $K_2 subset.eq K_1$. Ein Element $hat(K) in cal(S)$ heißt #bold[obere Schranke] der Kette $cal(K)$, wenn $K subset.eq hat(K)$ für alle $K in cal(K)$ gilt.]

#bold[Beispiel 1.24:] Sei $cal(S) = P({2, 4, 6, 8, 10})$

Dann ist $cal(K) = {emptyset, {2}, {2, 6}, {2, 6, 10}} subset.eq cal(S)$ eine Kette.\
Die Menge $K = {2, 6, 10}$ ist die obere Schranke von $cal(K)$,\
das maximale Element von $cal(S)$ ist $hat(S) = {2, 4, 6, 8, 10}$.

#bold[Lemma 1.25: Zornsche Lemma]

Sei $M$ eine Menge und sei $cal(S) subset.eq cal(P)(M)$ eine nichtleere Menge mit der Eigenschaft, dass für jede Kette $cal(K) subset.eq cal(S)$ auch ihre Vereinigunsmenge in $cal(S)$ liegt, d.h.
$
union.big_(A in cal(K)) A in cal(S)
$
Dann besitzt $cal(S)$ ein maximales Element. 

#italic[Beweis:] Das Zornsche Lemma ist ein fundamentales Resultat aus der Mengenlehre, hier ohne Beweis
#endproof

#bold[Lemma 1.26:] Sei $M$ eine Menge und $cal(K) subset.eq cal(P)(M)$ eine Kette. Dann gibt es zu je endlich vielen $A_1, ..., A_n in cal(K)$ ein $hat(dotless.i) in {1, ..., n}$ mit $A_i subset.eq A_(hat(dotless.i))$ für alle $i in {1, ..., n}$. 

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

#definition("1.27", "Abbildungen")[Es Seien $X$ und $Y$ beliebig, nichtleere Mengen. Eine #bold[Abbildung] von $X$ nach $Y$ ist eine Vorschrift $f$, die jedem Element $x in X$ genau ein Element $f(x) in Y$ zuordnet. Man schreibt
$
f: X arrow Y, space x arrow.bar y = f(x)
$
Die Menge $X$ heißt #bold[Definitionsbereich] von $f$, die Menge $Y$ heißt #bold[Wertebereich] von $f$

#underline[Achtung:] Jede Abbildung besteht aus drei "Teilen". Angabe des Definitionsbereichs, Angabe des Wertebereichs, Angabe der Zuordnungsvorschrift.] <def>

#bold[Beispiel 1.28:] Sei $M$ eine nichtleere Menge. Dann ist 
$
f: M arrow N, space x arrow.bar x = f(x)
$
eine Abbildung $f$ #bold[Identität] von $M$ mit der Notation $I_m \/ "Id"_m$. 

Sei $X = Y = RR$, dann ist $f: RR arrow RR, space x arrow.bar f(x) := 7x + 2$ eine Abbildung.

#definition("1.29", "Bild, Urbild")[Seien $X, Y$ beliebige nichtleere Mengen und $f: X arrow Y$. Es gelte $M subset.eq X$ und $N subset.eq Y$. Dann heißen die Mengen:
$
f(M) &:= {f(x) in Y | x in M} subset.eq Y #[das #bold[Bild] von $M$ unter $f$.] \
f^(-1)(N) &:= {x in X | f(x) in N} subset.eq X #[das #bold[Urbild] von $N$ under $f$.] 
$
Ist $emptyset != M subset.eq X$, dann heißt $f_(|M): M arrow Y, space x arrow.bar f(x)$, die #bold[Einschränkung] von $f$ auf $M$.
] <def>

#bold[Beispiel 1.30:] Sei $X = Y = RR$ und $x arrow.bar f(x) = x^4$. Dann ist $RR$ Definitions- und Wertebereich von $f$.

#boxedlist([$f(RR) = RR_+ := [0, infinity[$ das Bild von $f$ #v(2mm)], [$f([0,2]) = [0, 16]$ #v(2mm)], [$f^(-1)([16, 81]) = [-3, -2] union [2, 3]$ das Urbild des Intervalls $[16, 81]$ unter $f$. #v(2mm)])

#definition("1.31", "injektiv, surjektiv, bijektiv")[Seien $X, Y$ zwei beliebige, nichtleere Mengen und $f : X arrow Y$ eine Abbildung. Dann heißt $f$:

#boxedlist([#bold[injektiv:] falls für alle $x, tilde(x) in X$ gilt: $#sspace$
#v(-1mm)
$
f(x) = f(tilde(x)) ==> x = tilde(x)
$
#v(1mm)
],[
  #bold[surjektiv:] falls für jedes $y in Y$ gilt:
#v(-1mm)
$
exists space.sixth x in X: f(x) = y
$
#v(1mm)
],[
  #bold[bijektiv:] falls $f$ injektiv und surjektiv ist
])] <def>

Man kann sich anhand der Definition leicht überlegen, dass eine Abbildung $f: X arrow Y$ genau dann bijektiv ist, wenn es für jedes $y in Y$ #underline[genau] ein $x in X$ gibt, sodass $f(x) = y$ gilt.

#bold[Beispiel 1.32:] Betrachte die Funktion $f: RR arrow RR, space x arrow.bar max(0, x)$

#boxedlist[$f: RR arrow RR$, $f$ ist weder injektiv noch surjektiv][$f: RR arrow RR_+$, $f$ ist surjektiv, aber nicht injektiv][$f: RR_+ arrow RR_+$, $f$ ist injektiv aber nicht surjektiv][$f: RR_+ arrow RR_+$, $f$ ist bijektiv]

#definition("1.33", "Komposition")[Seien $X, Y, Z$ nichtleere Mengen und die Abbildungen $f: X arrow Y, space x arrow.bar f(x)$ sowie $g: Y arrow Z, space y arrow.bar g(y)$ gegeben. Dann ist die #bold[Komposition] oder #bold[Hintereinanderausführung] von $f$ und $g$ die Abbildung 
$
g compose f: X arrow Z, space x arrow.bar g(f(x)) in Z
$
] <def>

#bold[Satz 1.34:] Seien $W, X, Y$ und $Z$ nichtleere Mengen, und die Abbildungen $f: W arrow X$, $g: X arrow Y$, $h: Y arrow Z$ gegeben. Dann gilt:

#box(width: 100%, inset: (right: 1cm, left: 1cm), [
  1. $h compose (g compose f) = (h compose g) compose f$, d.h. die Komposition von Abbildungen ist Assoziativ
  2. Sind beide Abbildungen $f$ und $g$ injektiv/surjektiv/bijektiv, dann ist auch die Komposition $g compose f$ injektiv / surjektiv / bijektiv.
  3. Ist $g compose f$ injektiv, dann ist $f$ injektiv
  4. Ist $g compose f$ surjktiv, dann ist $g$ surjektiv
])

#italic[Beweis:] (Übungsaufgabe, Blatt 4 Aufgabe 1)

1. $h compose (g compose f)(x) = h((g compose f)(x)) = h(g(f(x))) = (h compose g)(f(x)) = ((h compose g) compose f)(x)$

2. #[Für jedes $x_1, x_2 in X$ folgt aus $g$ injektiv: $g(f(x_1)) = g(f(x_2)) ==> f(x_1) = f(x_2)$. Aus $f$ injektiv folgt wiederum: $f(x_1) = f(x_2) ==> x_1 = x_2$. Also gilt $g(f(x_1)) = g(f(x_2)) ==>$ $x_1 = x_2$. Somit ist $g compose f$ injektiv.
  
Für jedes $z in Z$ folgt aus $g$ surjektiv: $exists space.sixth y in Y: f(y) = z$. Für jedes $y in Y$ folgt aus $f$ surjektiv wiederum: $exists space.sixth x in X: f(x) = y$. Also folgt $forall space.sixth z in Z space.sixth exists space.sixth x in X: g(f(x)) = z$. Somit ist $g compose f$ surjektiv. 

Sind $f$ und $g$ bijektiv, folgt aus den obigen Beweisen, dass $g compose  f$ injektiv und surjektiv ist. Somit ist $g compose f$ auch bijektiv.
]

3. Ist $f$ nicht injektiv, dann existieren $x_1, x_2 in X$ mit $f(x_1) = f(x_2)$ aber $x_1 != x_2$. Wegen $g compose f$ injektiv gilt $g(f(x_1)) = g(f(x_2)) ==> x_1 = x_2$. Damit $g(f(x_1)) = g(f(x_2))$ gilt, muss auch $f(x_1) = f(x_2)$ gelten, dann gilt aber auch $f(x_1) = f(x_2) ==> x_1 = x_2$. Dies ist ein Widerspruch $arrow.zigzag$. $f$ ist also injektiv.

4. Ist $g$ nicht surjektiv, dann existiert ein $z in Z$ für das kein $y in Y$ mit $g(y) = z$ existiert. Wegen $g compose f$ surjektiv gilt $forall space.sixth z in Z space.sixth exists space.sixth x in X: g(f(x)) = z$. Dann gilt auch $g(f(x)) = g(y) = z, space y in Y$, also existiert ein $y in Y$ mit $g(y) = z$. Dies ist ein Widerspruch $arrow.zigzag$. Also ist $g$ surjektiv. 
#endproof

#bold[Satz 1.35:] Seien $X, Y$ nichtleere Mengen und $f: X arrow Y$ eine Abbildung. Die Abbildung ist genau dann bijektiv, wenn es eine Abbildung $g: Y arrow X$ existiert, so dass $g compose f = "Id"_X$ und $f compose g = "Id"_Y$ gilt.

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

#bold[Frage:] Gibt es eine weitere Abbildung, $tilde(g): Y arrow X$ mit den gleichen Eigenschaften wie im letzten Satz? Wegen Satz 1.34, 1) gilt:
$
tilde(g) = "Id"_X compose tilde(g) = (g compose f) compose tilde(g) = g compose (f compose tilde(g)) = g compose "Id"_Y = g
$

#definition("1.36", "inverse Abbildung / Umkehrabbildung")[
  Seien $X, Y$ zwei nichtleere Mengen und $f: X arrow Y$ eine Abbildung. Ist $f$ bijektiv, dann heißt die in Satz 1.35 definierte, eindeutige Abbildung $g: Y arrow X$ #bold[inverse Abbildung] oder #bold[Umkehrabbildung] von $f$ und wird $f^(-1)$ bezeichnet.
] <def>

#bold[Beispiel 1.37:] Die Abbildung $f: RR arrow RR, space f(x) = 3x - 5$ ist bijektiv. Die zu $f$ inverse Abbildung erhält man durch Umformung.
$
y = 3x - 5 <==> y + 5 = 3x <==> x = 1/3(y+5)
$
Also $f^(-1): RR arrow RR, space y arrow.bar 1/3(y+5)$

#bold[Achtung:] $f: RR arrow RR, f(x) = x^2$ ist nicht bijektiv.
$
tilde(f): RR arrow RR_+, space tilde(f)(x) = x^2 wide wide tilde(f)^(-1)(y) = sqrt(y)
$

#bold[Achtung:] Die Notation $f^(-1)$ ist doppelt Belegt! Zum einen für die Notation der Umkehrabbildung und zum Anderen für die Notation des Urbilds.

#bold[Satz 1.38:] Seien $X, Y$ und $Z$ nichtleere Mengen und die Abbildungen $f: X arrow Y$ sowie $g: Y arrow Z$ bijektiv. 

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

#definition("2.1", "innere Verknüpfung, Halbgruppe")[Sei $M$ eine nichtleere Menge. Eine Abbildung $circ: M times M arrow M, space (a, b) arrow.bar a circ b$ heißt #bold[(innere) Verknüpfung] auf $M$. Gilt: $(a circ b) circ c =  a circ (b circ c)$, dann heißt die Verknüpfung #bold[assoziativ] und $(M, circ)$ eine #bold[Halbgruppe]. Gilt für eine Halbgruppe, dass $a circ b = b circ a$, so heißt die Halbgruppe #bold[abelsch] oder #bold[kommutativ].] <def>

Je nach Kontext kann die Notation einer Verknüpfung variieren. ($a circ b$, $a dot b$, $a b$)

#bold[Beispiel 2.2:] 

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
  so heißt $e$ #bold[neutrales Element] für die Verknüpfung $circ$. 

  Eine Halbgruppe, die ein neutrales Element besitzt heißt #bold[Monoid].
] <def>

#bold[Beispiel 2.24:] Kein Monoid

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

#bold[Bemerkung:] In der Definition eines Monoids wird nur die Existenz aber nicht die Eindeutigkeit des neutralen Elements gefordert. Ist dies sinnvoll?

#bold[Lemma 2.5:] Sei $(M, circ)$ ein Monoid und $e_1, e_2 in M$ neutrale Elemente, dann gilt
$
e_1 = e_2
$
#italic[Beweis:]
$
e_1 &= e_1 circ e_2 \
&= e_2
$
#endproof

#bold[Beispiel 2.6:]

#boxedlist[$(NN, +)$ ist kein Monoid, da kein neutrales Element existiert ($0 in.not NN$ in LinA)][$(NN, dot)$ ist ein Monoid mit dem neutralen Element $e = 1$][Für $NN_0 = NN union {0}$ ist $(NN_0, +)$ ein Monoid mit dem neutralen Element $e = 0$]

#definition("2.7", "Gruppen")[Ein Monoid $(M, circ)$ ist eine #bold[Gruppe], wenn für jedes $a in M$ ein $b in M$ existiert, so dass 
$
a circ b = b circ a = e
$
wobei $e$ das neutrale Element des Monoids ist. Wir nennen $b$ das #bold[inverse Element] zu dem gegebenen Element $a$ und bezeichnen es mit $a^(-1) = b$.
] <def>

#bold[Bemerkung:] Für $circ = +$, d.h. additiv geschriebene Gruppen schreibt man auch $-a := b$.

#bold[Beispiel 2.8:]

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

#bold[Satz 2.9:] Sei $(M, circ)$ eine Gruppe, dann gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm), [
  1. Es gibt #bold[genau ein] neutrales Element in $M$.
  2. Jedes Element der Menge $M$ besitzt #bold[genau ein] inverses Element.
  3. Jedes linksinverse Element ist gleichzeitig auch rechtsinvers.
  4. Jedes linksneutrale Element ist gleichzeitig auch rechtsneutral.
  ]
)

#italic[Beweis:]

1. Folgt aus Lemma 2.5, da $(M, circ)$ nach Definition ein Monoid ist.
2. #[
  Annahme: Seien $b in M$ und $tilde(b) in M$ inverse Elemente zu $a in M$. 

  zu zeigen: $b = tilde(b)$

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
  Es sei $b in M$ ein linksinverses Element zu $a in M$. D.h. $b circ a = e$. Sei $tilde(b) in M$ ein linksinverses Element zu $b in M$. D.h. $tilde(b) circ b = e$.
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

#bold[Lemma 2.10:] Sei $(M, circ)$ eine Gruppe. Gilt für ein $a in M$, dass $c circ a = a$ für ein $c in M$; dann ist $c$ das neutrale Element der Gruppe.

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
  Seien $(M, circ)$ und $(N, oplus)$ Gruppen. Eine Abbildung $f: M arrow N$ heißt #bold[Homomorphismus] (oder #bold[Gruppenhomomorphismus]) falls:
  $
  f(x circ y) = f(x) oplus f(y) wide forall space.sixth x, y in M
  $
  Ein Homomorphismus heißt #bold[Isomorphismus], wenn er bijektiv ist.
] <def>

#bold[Beispiel 2.12:] Die Abbildung $f: RR arrow RR_(>0)$ mit $f(x) = e^(2x)$ ist ein Homomorphismus zwischen $(RR, +)$ und $(RR_(>0), dot)$ mit $RR_(>0) = {x in RR | x > 0}$ denn 
$
f(x + y) = e^(2(x+y)) = e^(2x) dot e^(2y) = f(x) dot f(y)
$

#bold[Satz 2.13:] Sei $f: M arrow N$ für die Gruppen $(M, circ)$ und $(N, oplus)$ ein Homomorphismus sowie $e_M$ und $e_N$ jeweils die neutralen Elemente. Dann gilt $f(e_M) = e_N$.

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
  den #bold[Kern] von $f$.
] <def>

== Ringe

Ringe sind eine Erweiterung der algebraischen Strukturen von einer auf zwei Verknüpfungen. 

#definition("2.15", "Ring")[
  Seien $R$ eine Menge und "$+$" sowie "$dot$" zwei Verknüpfungen auf $R$. Das Tripel $(R, +, dot)$ heißt #bold[Ring], falls gilt:

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
    Ein Ring heißt kommutativ, wenn $dot$ kommutativ ist. D.h. $a dot b = b dot a, space forall space.sixth a, b in R$. Ein Element $1 in R$ heißt #bold[Einselement], wenn es das neutrale Element bezüglich der Multiplikation ist. Das heißt wenn für alle $a in R$ gilt: $1 dot a = a dot 1 = a$.
  ])
] <def>

#bold[Achtung:] Die Formulierung der Distributivitätsgesetze impliziert, dass die Multiplikation stärker bindet als die Addition ("Punkt vor Strich").

#bold[Beispiel 2.16:]

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

#bold[Bemerkung:] Wenn in einem Ring die Gleichung $1 = 0$ gilt, folgt
$
a = a dot 1 = a dot 0 = 0
$
Somit muss $R$ der Nullring sein, $R = {0}$.

#bold[Beispiel 2.17:] Ring der Polynome 

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
  Es sei $(R, +, dot)$ ein Ring mit Eins und $a in R$ gegeben. Ein Element $b in R$ heißt #bold[invers] (bezüglich $dot$) zu $a$, wenn gilt:
  $
  a dot b = b dot a = 1
  $
  Existiert zu $a in R$ ein inverses Element, so heißt $a$ #bold[invertierbar].
] <def>

#bold[Satz 2.19:] Es sei $(R, +, dot)$ ein Ring mit Eins. Dann gilt:

#box(width: 100%, inset: (right: 1cm, left: 1cm), [
  1. Existiert zu $a in R$ ein inverses Element bezüglich $dot$, so ist dies eindeutig bestimmt. Dies wird mit $a^(-1)$ gekennzeichnet.

  2. Wenn $a, b in R$ invertierbar sind, dann ist auch $a dot b$ invertierbar und es gilt:
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

#definition("2.20", "Körper")[
  Eine Menge $K$ mit zwei Verknüpfungen
  $
  +: K times K arrow K, space (a, b) arrow.bar a + b wide wide "Addition" \
  dot: K times K arrow K, space (a, b) arrow.bar a dot b wide space "Multiplikation"
  $
  heißt #bold[Körper], wenn gilt:

  #boxedlist[$(K, +)$ ist eine kommutative Gruppe #sspace][$(K backslash {0}, dot)$ ist auch eine kommutative Gruppe][
    Es gelten die Distributivgesetze
    $
    a dot (b + c) = a dot b + a dot c \
    (a + b) dot c = a dot c + b dot c 
    $
  ]
] <def>

#bold[Lemma 2.21:] Sei $(K, +, dot)$ ein Körper. Gilt für $a, b in K$, dass $a dot b = 0$, so ist mindestens eins davon die $0$.

#italic[Beweis:] 

Fall 1: $a = b = 0$

Fall 2: o.B.d.A: $a != 0 ==> exists space.sixth a^(-1): a dot a^(-1) = 1$
$
b = 1 dot b = (a^(-1) dot a) dot b = a^(-1) dot (a dot b) = a^(-1) dot 0 = 0 
$
#endproof
Diese Eigenschaft nennt man Nullteilerfreiheit.

#bold[Beispiel 2.22:]

#boxedlist[$(RR, +, dot)$ ist ein Körper][$(ZZ, +, dot)$ ist kein Körper, da die multiplikativ inversen Elemente in $QQ$, aber nicht immer in $ZZ$ liegen]

#bold[Beispiel 2.23:] komplexe Zahlen

Die Menge der komplexen Zahlen ist definiert als:
$
CC := {(x, y) | x, y in RR}
$
d.h. $CC = RR times RR$. Die zwei Verknüpfungen Addition und Multiplikation werden wie folgt definiert:
$
+ &: CC times CC arrow CC, space (a, b) + (c, d) = (a + c, b + d) \
dot &: CC times CC arrow CC, space (a, b) dot (c, d) = (a dot c - b dot d, a dot d + b dot c)
$

Wir verwenden implizit die Operationen auf den reellen Zahlen, $+, -, dot$. Dann sieht man:

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
identifizieren. Mit $0_RR arrow.bar (0, 0) = 0_CC$, $1_RR arrow.bar (1, 0) = 1_CC$ kann man $M$ als Teilkörper von $CC$ auffassen. Es gilt jedoch auch $RR subset.eq.not CC$ (zumindest in LinA).

Eine besondere komplexe Zahl ist die imaginäre Einheit $(0, 1)$, für die gilt:
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
Man schreibt $"Re"(z) = x$ als #bold[Realanteil] von $z$ und $"Im"(z) = y$ als #bold[Imaginäranteil] von $z$.

Man definiert zu $(x, y) in CC$ die #bold[konjugiert komplexe Zahl] durch 
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

#bold[Beispiel 2.24:] Kräfeparallelogramm 

Betrachten wir einige Gesetze aus der Mechanik:

Je zwei am selben Punkt angreifende Kräfte können durch eine einzige Kraft ersetzt werden. Diese resultierende Kraft (= Gesamtkraft) hat die gleiche Wirkung wie die Einzelkräfte.
$
F = F_1 + F_2 wide "die Kräfte können als Vektoren betrachtet werden"
$
#boxedlist[Ein Vektor hat eine Länge und eine Richtung][Vektoren kann man addieren][Vektoren können mit einer reellen Zahl multipliziert werden]

#bold[Beispiel 2.25:] Interpolationsproblem

Gegeben sind reelle Zahlen $a, b, c in RR$. Gesucht ist ein Polynom zweiten Grades $p(t) in P[t]$ mit 
$
p(1) = a wide p(2) = b wide p(3) = c
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
#bold[Beobachtung:] Die additive Verknüpfung zweier Elemente gleicher Art und Multiplikation mit einer reellen Zahl ($corres$ Skalar).

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

  Ein Element $v in V$ nennen wir #bold[Vektor], ein $mu in K$ nenn wir einen #bold[Skalar].
] <def>

#bold[Beobachtung:] Für einen Vektorraum sind die Operatinen $+$ und die skalare Multiplikation $dot$ abeschlossen.

#bold[Beispiel 2.27:] Für einen Körper $K$ ist der Standardvektorraum gegeben durch die Menge $V = K^n$ für ein $n in NN$. Die n-Tupel werden geschrieben als 
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

#bold[Beispiel 2.28:] Polynome 

Die Menge $P[t]$ aller Polynome über einen Körper $K$ mit der Unbekannten $t$ bilden einen $K$-Vektorraum, wenn die Addition von Polynomen wie in Beispiel 2.17 definiert ist und die skalare Multiplikation für ein $p(t) = a_0 + a_1 t + ... a_n t^n in P[t]$ definiert ist durch:
$
dot: K times P[t] arrow P[t] \
\
lambda dot p(t) = (lambda a_0) + (lambda a_1) t + ... + (lambda a_n) t^n 
$

#bold[Beispiel 2.29:] Abbildungen

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

#bold[Lemma 2.30:] Für den $K$-Vektorraum $(V, +, dot)$ mit dem Nullement $0_K$ des Körpers und $0_V$ des Vektorraums. Dann gilt

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
  Sei $(V, +, dot)$ ein $K$-Vektorraum und sei $U subset.eq V$. Ist $(U, +, dot)$ ein $K$-Vektorraum, so heißt $(U, +, dot)$ ein #bold[Untervektorraum], kurz #bold[Unterraum] von $(V, +, dot)$. \
  Wichtig! Die Abgeschlossenheit muss erhalten bleiben.
] <def>

#bold[Lemma 2.32:] Sei $(V, +, dot)$ ein $K$-Vektorraum und $U subset.eq V$. Dann ist $(U, +, dot)$ genau dann ein Unterraum von $V$, wenn gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $u + w in U wide forall space.sixth u, w in U$
  2. $lambda u in U wide forall space.sixth lambda in K, forall space.sixth u in U$
]

#italic[Beweis:] (Übung)

Ist $U$ nicht abgeschlossen bezüglich der Addition und der skalaren Multiplikation, dann ist $(U, +)$ keine kommutative Gruppe und $(U, dot)$ keine Halbgruppe. In beiden Fällen ist $(U, +, dot)$ dann kein Vektorraum und somit auch kein Untervektorraum von $(V, +, dot)$.
#endproof

#bold[Beispiel 2.33:] 

#boxedlist[Jeder Vektorraum $(V, +, dot)$ hat die Vektorräume $(U = V, + dot)$ und $(U = {0_V}, +, dot)$][Für jedes $u in NN_0$ ist die Menge aller Polynome mit dem Grad kleiner gleich $n$, d.h. die Menge $P[t]_(<=n) = {p(t) in P[t] | "Grad"(p) <= n}$ mit den Verknüpfungen aus Beispiel 2.28 ein Unterraum von $(P[t], +, dot)$]

#definition("2.34", "Linearkombination")[
  Seien $(V, +, dot)$ ein $K$-Vektorraum, $n in NN$ und $v_1, ..., v_n in V$. Ein Vektor der Form 
  $
  lambda_1 v_1 + lambda_2 v_2 + ... + lambda_n v_n = sum_(i = 1)^n lambda_i v_i = v in V
  $
  heißt #bold[Linearkombination] von $v_1, ..., v_n in V$ mit den Koeffizienten $lambda_1, ..., lambda_n in K$. Die #bold[lineare Hülle] / Der #bold[Spann] von $v_1, ..., v_n in V$ ist die Menge 
  $
  "Span"{v_1, ..., v_n} := {sum_(i=1)^n lambda_i v_i | lambda_1, ..., lambda_n in K}
  $
] <def>

#bold[Lemma 2.35:] Sei $(V, +, dot)$ ein $K$-Vektorraum und $v_1, ..., v_n in V$, dann ist $("Span"{v_1, ..., v_n}, +, dot)$ ein Unterraum von $(V, +, dot)$.

#italic[Beweis:] Es gilt $"Span"{v_1, ..., v_n} subset.eq V$. Wegen Lemma 2.32 reicht es zu zeigen, dass $U := "Span"{v_1, ..., v_n}$ bezüglich $+$ und $dot$ abgeschlossen ist. Dies gilt nach der Definition der linearen Hülle.
#endproof

#bold[Beispiel 2.36:] Für $V = RR^3, K = RR$. Betrachte
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
  Sei $V$ ein $K$-Vektorraum. Die Vektoren $v_1, ..., v_n in V$ heißten #bold[linear unabhängig], wenn aus 
  $
  sum_(i = 1)^n lambda_i v_i = 0 wide "mit" lambda_1, ..., lambda_n in K 
  $
  folgt, dass $lambda_1 = lambda_2 = ... = lambda_n = 0$ gilt. Folgt dies nicht, d.h. gilt 
  $
  sum_(i = 1)^n lambda_i v_i = 0 wide "mit" lambda_1, ..., lambda_n in K
  $
  die nicht alle gleich $0$ sind, so heißten $v_1, ..., v_n$ #bold[linear abhängig].

  #boxedlist[Die leere Menge ist linear unabhängig.][Ist $M != emptyset$ eine Menge und für jedes $m in M$ ein Vektor $v_m in V$ gegeben, so nennt man die Menge ${v_m}_(m in M)$ linear unabhängig, wenn endlich viele Vektoren immer linear unabhängig sind. Gilt dies nicht, so ist die Menge ${v_m}_(m in M)$ linear abhängig.]
] <def>

#bold[Bemerkung:] Nach Definition sind die Vektoren $v_1, ..., v_n$ genau dann linear unabhängig, wenn sich der Nullvektor aus ihnen nur in der Form $0 = 0 dot v_1 + ... + 0 dot v_n$ mit endlich vielen Vektoren darstellen lässt

#bold[Beispiel 3.2:] Fortsetzung von Beispiel 2.36

Die Vektoren aus $M = {(3,0,1), (9,0,3)}$ sind linear abhängig, da 
$
3 vec(3, 0, 1) - vec(9, 0, 3) = vec(0, 0, 0) wide "mit" lambda_1 = 3, lambda_2 = -1
$
Der Vektor $v_1 = (3, 0, 1)$ dagegen ist linear unabhängig, da
$
0 dot vec(3, 0, 1) = vec(0, 0, 0) wide "mit" lambda_1 = 0
$

#bold[Beispiel 3.3:] $V = RR^3, K = RR$

Betrachte $M = {(3, 0, 1), (9, 0, 3), (0, 1, 1)}$. Sind diese Vektoren linear unabhängig? Die allgemeine Vorgehensweise ist hier, ein lineares Gleichungssystem aufzustellen und zu lösen. Hat das Gleichungssystem eine Lösung $!= 0$, dann sind die Vektoren linear abhängig.

Hier: $==>$ linear abhängig

#bold[Lemma 3.4:] Sei $V$ ein $K$-Vektorraum. Dann gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. Ein einzelner Vektor ist genau dann linear unabhängig, wenn $v != 0_V$ gilt
  2. Sind $v_1, ..., v_n in V$ linear unabhängig und ist ${u_1, ..., u_m} subset.eq {v_1, ..., v_n}$, dann ist auch die Menge $u_1, ..., u_m$ linear unabhängig
  3. Sind $v_1, ..., v_n in V$ linear abhängig und $u_1, ..., u_m in V$. Dann ist auch $v_1, ..., v_n, u_1, ..., u_m$ linear abhängig 
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

#bold[Satz 3.5:] Sei $V$ ein $K$-Vektorraum. Eine Menge $M subset.eq V$ ist genau dann linear unabhängig, wenn kein Vektor $v in M$ als Linearkombination der anderen Vektoren dargestellt werden kann.

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
    abs(J) = n "mit" v in "Span"{v_j}_(j in J) 
    $
  ])}
  $
] <def>

#bold[Beispiel 3.7:] $M = NN$, $v_m := t^m$, $t in K$, $"Span"{v_m}_(m in M) = P[t]$

#bold[Satz 3.8:] Sei $K$ ein Körper, $V$ ein $K$-Vektorraum und $M$ eine Menge. Dann sind folgende Aussagen äquivalent:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. ${v_m}_(m in M)$ ist linear unabhängig
  2. jeder Vektor $v in "Span"{v_m}_(m in M)$ hat eine eindeutige Darstellung als Linearkombination
]

#italic[Beweis:]

$1 ==> 2$: Beweis per Kontraposition 

Seien $I, J subset.eq M$ endlich. Sei $lambda_K in K$, $k in I$ und $mu_k in K$, $k in J$. Betrachte den Vektor $v in V$. Für diesen gilt:
$
v_I = sum_(k in I) lambda_k v_k "und" v_J = sum_(k in J) mu_k v_k
$
Überlegung: Wähle ein $k in I union J$. Falls gilt $k in I backslash J$, setze $lambda_k = 0$. Falls gilt $k in J backslash I$, setze $mu_k = 0$. Es folgt
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
v = sum_(k in I) mu_k v_k ==> v + 0 = sum_(k in I) mu_k v_n + sum_(k in J) lambda_k v_k = sum_(k in I union J) (mu_k + lambda_k) v_k
$
Es gilt wieder $mu_k = 0$ für $k in J backslash I$ und $lambda_k = 0$ für $k in I backslash J$. Da für mindestens ein $k in J union I$, $(mu_k + lambda_k) != lambda_k$, ist dies eine zweite Darstellung von $v$.
#endproof

#definition("3.9", "Erzeugendensystem")[
  Sei $K$ ein Körper, $V$ ein $K$-Vektorraum, $M$ eine Menge und $v_m$ für $m in M$ Vektoren in $V$. Die Menge ${v_m}_(m in M)$ heißt #bold[Erzeugendensystem] von $V$, falls 
  $
  "Span"{v_m}_(m in M) = V
  $
] <def>

#bold[Beispiel 3.10:] Sei $K$ ein Körper, $V$ ein Vektorraum mit $V = K^n$, $n in NN$

Dann ist mit 
$
e_1 := vec(1, 0, dots.v, 0), space e_2 := vec(0, 1, dots.v, 0), space ..., space e_n := vec(0, 0, dots.v, 1)
$
die Menge ${e_i}_(in in {1, ..., n})$ ein Erzeugendensystem von $K^n$.

#definition("3.11", "Basis")[
  Sei $K$ ein Körper, $V$ ein $K$-Vektorraum, $M$ eine Menge und $v_m$ für $m in M$ Vektoren in von $V$. Dann heißt ${v_m}_(m in M)$ #bold[Basis] von $V$, falls sie linear unabhängig und ein Erzeugendensystem von $V$ ist.
] <def>

#bold[Beispiel 3.12:] Das Erzeugendensystem aus 3.10 ist eine Basis. Anmerkung: Basen sind nicht eindeutig. Für $K^3$ gilt etwa
$
v_1 = vec(1,1,0) space v_2 = vec(1,0,1) space v_3 = vec(0, 1, 1) 
$ 
ist ebenfalls eine Basis.

#bold[Beispiel 3.13:] Die Familie ${t^i}_(i in NN)$ ist ein Erzeugendensystem von $P[t]$, denn es gilt $"Span"{t^i}_(i in NN) = P[t]$. Um zu prüfen, ob die Familie auch Basis von $P[t]$ muss die lineare Unabhängigkeit gerpüft werden. Sei $n in NN_0$, $a_0, a_1, ..., a_n in K$ und betrachte $p(t) = a_0 + a_1 t + ... + a_n t^n$ mit $p(t) = 0$.

Falls $a_k != 0$ für ein $k in {0, ..., n}$ gilt, so hat $p(t)$ höchstens $n$ Nullstellen in $K$. $0 in P[t]$ hat aber unendlich viele Nullstellen. D.h. es existiert ein $t in K$ mit $p(t) != 0 space arrow.zigzag$. Es folgt, dass die Familie ${t^i}_(i in NN)$ linear unabhängig ist. Somit ist ${t^i}_(i in NN)$ eine Basis von $P[t]$.

#bold[Satz 3.14:] Sei $K$ ein Körper, $V$ ein Vektorraum und $B := {v_1, ..., v_n} subset.eq V$ eine Basis von $V$. Dann ist äquivalent

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
  Sei $(V, +, dot)$ ein $K$-Vektorraum für den eine endliche Menge $M = {v_1, ..., v_n} subset V$ existiert, so dass $"Span" M = V$. Dann nennt man $V$ #bold[endlich erzeugt] und sagt $V$ ist #bold[endlichdimensional]. Ist $V$ nicht von endlich vielen Vektoren erzeugt, nennt man $V$ #bold[unendlichdimensional].   
] <def>

#bold[Beispiel 3.16:]

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
  sum_(j = 1)^k lambda_j f_j (1/2(1/j + 1/(j+1))) = lambda_j "bei" f_j = 1", sonst" 0 
  $
  Damit ist:
  $
  sum_(i = 1)^k lambda_i f_i (x) = 0_v in V, space forall x in [0, 1]
  $
  nur erfüllt, wenn $lambda_i = 0$ für alle $1 <= i <= k$. Damit sind die $f_n$ linear unabhängig. Also ist $V$ unendlichdimensional.
]

#bold[Frage:] Hat jeder Vektorraum eine Basis?

Diese Frage ist relativ einfach im endlichdimensionalen Fall:

#bold[Lemma 3.17:] Basisauswahlsatz 

Ein $K$-Vektorraum $(V, +, dot)$ ist genau dann endlich, erzeugt, wenn er eine endliche Basis besitzt.

#italic[Beweis:]

"$<==$": endliche Basis $==>$ endliches Erzeugendensystem $==>$ endlich erzeugt

"$==>$": Sei $V$ endlich erzeugt $==> exists v_1, ..., v_n: "Span"{v_1, ..., v_n} = V$. Ist dieses Erzeugendensystem nicht minimial, d.h. linear abhängig, dann folgt mit Satz 3.5, dass ein $v_i, 1 <= i <= n$, als Linearkombation der anderen $v_j, i != j$ dargestellt werden kann. Entfernen des $v_i$ liefert ein kleineres Erzeugendensystem. Wiederhole $n-1$-Mal, bis die verbleibende Menge linear unabhängig ist. Somit enthält jedes endliche Erzeugendensystem ein minimales Erzeugendensystem und somit eine Basis.
#endproof

Für den unendlichdimensionalen Fall ist mehr Arbeit nötig:

#bold[Satz 3.18:] Jeder $K$-Vektorraum $(V, +, dot)$ besitzt eine Basis (ein minimales Erzeugendensystem).

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

#bold[Beispiel 3.19:] Um aus einer im Verhältnis $1:1$ in Wasser gelösten Substanz eine Lösung im Mischungsverhältnis $a:b$ zu bekommen, verdünnt man $y$ Teile der Lösung mit $x$ Teilen Wasser, so dass
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

#bold[Ziel:] Alle Basen eines endlich erzeugten Vektorraums haben gleich viele Elemente.

#align(center, [Das ist durchaus nicht offensichtlich#bold[!!!]])

#bold[Beispiel 3.20:] Es gibt eine bijektive Abbildung $f: NN -> NN times NN$. Dafür kann man z.B. das Diagonalargument von Georg Cantor verwenden.

Zum Beweis der Aussage sind noch Vorarbeiten notwendig.

#bold[Satz 3.21:] Basisergänzungssatz 

Sei $(V, +, dot)$ ein $K$-Vektorraum,

#boxedlist[${u_i}_(i in I) subset.eq V$ ein linear unabhängiges System][${v_j}_(j in J) subset.eq V$ ein Erzeugendensystem von $V$]

Dann gibt es eine Teilmenge $tilde(J) subset.eq J$ mit der Eigenschaft, dass das System
$
B := {w_k}_(k in I union tilde(J)) "mit" w_k := cases(u_i"," space &k = i in I, v_j"," space &k = j in tilde(J))
$
eine Basis von $V$ bildet.

#italic[Beweis:] Sei $tilde(J) subset.eq J$ eine bezüglich $subset.eq$ maximal gewählte Teilmenge mit der Eigenschaft, dass $B$ wie im Satz definiert, ein linear unabhängiges System ist. Für endliche Mengen $J$ ist das klar (siehe Lemma 3.17). Für Mengen mit unendlich vielen Elementen folgt dies aus dem zornschen Lemma (Satz 3.18). Damit: $B$ ist ein maximales linear unabhängiges System.

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

#bold[Beispiel 3.22:] In $V = RR^3$ bilden die Vektoren ${e_1, e_2, e_3}$ die Standardbasis. Des Weiteren sind die Vektoren $u_1= (3, 1, 0) "und" u_2 = (1, 3, 0)$ linear unabhängig. Satz 3.21 liefert, dass ${u_1, u_2, e_3}$ eine Basis ist. 

#bold[Satz 3.23:] Austauschsatz von Steinitz 

(Ernst Steinitz, deutscher Mathematiker, 1871 - 1928)

Sei $(V, +, dot)$ ein $K$-Vektorraum,

#boxedlist[$B = {v_1, ..., v_n}$ eine (endliche Basis)][$C = {u_1, ..., u_m}$ eine linear unabhängige Familie]

Dann ist $m <= n$ und nach geeigneten umnummerieren der Vektoren in $B$ ist das durch austauschen der ersten $m$-Vektoren erhaltene System 
$
tilde(B) := {u_1, ..., u_m, v_(m+1), ..., v_n} "eine Basis von" V "über" K
$

#italic[Beweis:] Aus dem Basisergänzungssatz folgt, dass man das linear unabhängig System $u_1, ..., u_m$ zu einer Basis $u_1, ..., u_m, v_j_1, ..., v_j_k_0$ für ein $k_0 >= 0$ und geeignete Indizes $j_1, ..., j_k_0 in {1, ..., n}$ erweitern kann.

Die Menge ${u_1, ..., u_(m-1), v_j_1, ..., v_j_k_0}$ ist immer noch linear unabhängig aber keine Basis. Aus dem Basisergänzungssatz folgt wieder, dass man diese Menge zu einer Basis ${u_1, ..., u_(m-1), v_j_1, ..., v_j_k_0, v_j_(k_0 + 1), ..., v_j_k_1}$ für ein $k_1 > k_0$ und weitere Indizes $j_(k_0 + 1), ..., v_k_1 in {1, ..., n}$. Setzt man dieses Verfahren induktiv $v$-mal fort, erhält man im $r$-ten Schritt eine Basis ${u_1, ..., u_(m - r), v_j_1, v_j_2, ..., v_j_k_(r - 1), v_j_(k_(r-1)+1), ...., v_j_k_r}$ für ein $k_r > k_(r-1)$ und weitere Indizes $j_(k_(r-1)+1), ..., j_k_r in {1, ..., n}$. Nach $m$ Schritten sind alle $u_i, 1 <= i <= m$ ersetzt. 

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

#bold[Lemma 3.24:] Ist $(V, +, dot)$ ein von endlich vielen Vektoren erzeugter $K$-Vektorraum, so besitzt $V$ eine Basis und je zwei Basen von $V$ haben gleich viele Elemente. 

#italic[Beweis:] Sei $V = "Span"{v_1, ..., v_n}$ mit $v_1 != 0$. Nach Satz 3.21 kann ${v_1}$ durch Hinzunahme von geeigneten Elementen aus ${v_2, ..., v_n}$ zu einer Basis von $V$ ergänzen. Also besitzt $V$ eine Basis mit endlich vielen Elementen.

Seien $U = {u_1, ..., u_l} "und" W = {w_1, ..., w_k}$ zwei solche Basen. Dann folgt aus dem Satz 3.23 aus Symmetrie, dass $k = l$. 
#endproof

#bold[Ausblick:] Man kann mit Konzepten der Mengenlehre auch zeigen, dass es für unendlich erzeugte Vektorräume $V$ gilt: Für je zwei Basen ${u_i}_(i in I)$ und ${w_j}_(i in J)$ von $V$ existiert eine bijektive Abbildung $f: I -> J$.

Folgerung aus Satz 3.8 in Zusammenhang mit Lemma 3.24: Da für eine Basis $B := {v_1, ..., v_n}$ eines $K$-Vektorraums $V$ gilt, dass $"Span" B = V$, sind für $v in V$ die Koeffizienten (= Koordinaten) $lambda_1, ..., lambda_n$ zur Darstellung von $v$ eindeutig. 

#bold[Beispiel 3.25:] für $V = RR^3$ sind 
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

#bold[Beispiel 3.26:] Für den $RR$-Vektorraum $P_(<= 2)[t]$ der reellen Polynome vom Grad $<= 2$ sind:
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
] <def>

#bold[Beispiel 3.28:] Sei $K$ ein Körper. Es gilt 

#boxedlist[$dim_K (V) = 0$ genau dann, wenn $V = {0}$][
  für $V = K^n$ folgt mit der Standardbasis, dass $dim_K (V) = n$][für die Dimension eines Vektorraums ist der jeweilige Grundkörper $K$ entscheident, z.B. $CC$ und $K = CC$ gilt $dim_CC V = 1$ für $K = RR$ aber $dim_RR V = 2$. 
][der $K$-Vektorraum $P[t]$ ist nicht endlich erzeugt, also $dim_K P[t] = infinity$]

#bold[Beispiel 3.29:] Sei $V = K^n$ für einen Körper $K$. Um zu prüfen, dass $n$ Vektoren aus $V$ eine Basis werden, muss nur deren lineare Unabhängigkeit geprüft werden. Seien z.B. $B$ in $V = RR^3$ die Vektoren
$
v_1 = vec(2, -1, 0) space v_2 = vec(-2, 3, 0) space v_3 = vec(-5, 0, 2)
$
gegeben. Sind diese linear unabhängig?
$
lambda_1 vec(2, -1, 0) + lambda_2 vec(-2, 3, 0) + lambda_3 vec(-5, 0, 2) attach(=, t: !) vec(0,0,0)
$
Dazu wird ein lienares Gleichungssystem aufgestellt 
$
vec(2a - 2b - 5c, -a + 3b + 0c, 0a + 0b + 2c) = vec(0,0,0)
$
$==> a = 0, b = 0, c = 0$.

Somit sind die Vektoren linear unabhängig.

#bold[Lemma 3.30:] Sei $(V, +, dot)$ ein $K$-Vekorraum mit $n := dim_K V < infinity$ und $B = {v_1, ..., v_n} subset V$ eine Familie von genau $n$ Vektoren. Dann sind folgende Aussagen äquivalent:

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

#bold[Lemma 3.31:] Sei $(V, +, dot)$ ein endlich erzeugter $K$-Vektorraum. Jeder Untervektorraum $W subset.eq V$ ist dann ebenfalls endlichdimensional und es gilt:
$
dim W <= dim V 
$
mit Gleichheit genau dann, wenn $W = V$.

#italic[Beweis:] jede linear unabhängige Familie in $W$ ist auch linear unabhängig in $V$. Damit besteht sie nach dem Austauschsatz von Steinitz aus höchstens $dim_K V$ Elementen. Daraus folgt, dass $W$ endlich erzeugt ist mit $dim_K W <= dim_K V$. Im Fall von $dim_K W = dim_K V$ folgt mit Lemma 3.30, dass jede Basis von $W$ auch eine Basis von $V$ ist. $==>$ $V = W$
#endproof

#bold[Achtung:] Die letzte Aussage (d.h. $V = W$) gilt nicht für unendlich erzeugte Vektorräume. Denn der $K$-Vektorraum $P[t]$ aller Polynome hat die Basis der Monome ${t^n}_(n in NN_0)$. Die Menge aller Polynome aus $P[t]$ mit $a_0 = 0$ ist ein Unterraum mit der Basis ${t^n}_(n in NN)$ und wird mit $W$ bezeichnet. Dann gilt 
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
] <def>

Für den Durchschnitt und die Summe von Untervektorräumen gelten folgende Regeln:

#bold[Lemma 3.33:] Sind $U_1, U_2, U_3$ Unterräume des $K$-Vektorraums $(V, +, dot)$, dann gilt:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $U_1 sect U_2$ und $U_1 + U_2$ sind Unterräume von $V$
  2. $U_1 + (U_2 + U_3) = (U_1 + U_2) + U_3 "und" U_1 + U_2 = U_2 + U_1$
  3. $U_1 + {0} = U_1$ und $U_1 + U_1 = U_1$
  4. $U_1 subset.eq U_1 + U_2$ mit Gleichheit, d.h. $U_1 = U_1 + U_2$, wenn $U_2 subset.eq U_1$
]

#italic[Beweis:] (Übungsaufgabe)
#endproof

#bold[Beispiel 3.34:] Sei $V := RR^3, U_1 := "Span"{(1, 0, 0), (0, 1, 0)}, U_2 := {(0, 1, 0), (0, 0, 1)}$. Dann gilt für $v in V, v = (v_1, v_2, v_3)$
$
v = v_1 vec(1,0,0) + v_2 vec(0,1,0) + v_3 vec(0,0,1)
$
Also gilt: $U_1 + U_2 = V$, insbesondere gilt auch $dim(U_1 + U_2) = 3$, $dim U_1 = 2 = dim U_2$. Weiterhin gilt
$
v_1 vec(1,0,0) in U_1 "und" v_2 vec(0, 1, 0) + v_3 vec(0, 0, 1) in U_2
$
Also ist die Darstellung von $v$ als Summe #bold[nicht] eindeutig. Insbesondere ist $dim(U_1 sect U_2) = 1$.

#bold[Lemma 3.35:] Sei $V$ ein $K$-VR und $r in NN$ und $U_1, ..., U_r$ Untervektorräume von $V$. Dann sind folgende Aussagen äquivalent.

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. Für $u in sum_(i = 1)^r U_i$ existieren eindeutige $u_i in U_i$, $i in {1, ..., r}$ mit $u = sum_(i = 1)^r u_i$
  2. #[
    Für $u_i in U_i$, $i in {1, ..., r}$ mit $0 = limits(sum_(i=1)^r) u_i$ gilt
    $
    u_i = 0 wide i in {1, ..., r}
    $
  ]
  3. #[
    Für $i in {1, ..., r}$ gilt 
    $
    U_i sect limits(sum_(j = 1)^r)_(j != i) U_j = {0_V}
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
  Sei $V$ ein $K$-VR und $r in NN, U_1, ..., U_r$ Untervektorräume von $V$. Dann heißt die Summe $sum U_i$ #bold[direkt], falls eine der Bedingungen aus Lemma 3.35 zutrifft.
  
  Wir schreiben dann 
  $
  U_1 oplus U_2 oplus ... oplus U_r
  $
] <def>

#bold[Beispiel 3.37:] Seien $V, U_1, U_2$ wie im Beispeil 3.34. Dann gilt $V = U_1 + U_2$, aber nicht $U_1 oplus U_2$. Sei weiter $U_3 := "Span"{(0, 0, 1)}$. Dann gilt $V = U_1 + U_3$ und $U_1 oplus U_3$.

#bold[Lemma] (ohne Nummer)

Sei $V$ ein $K$-VR. Seien $U_1, U_2$ UVRs von $V$. Dann gilt
$
dim(U_1 + U_2) <= dim U_1 + dim U_2 space (ast)
$
Falls $U_1 oplus U_2$, gilt sogar Gleichheit.

Dabei sei $infinity + infinity = infinity, infinity + n = infinity, n <= infinity "für" n in NN$ und es gilt $infinity <= infinity$.

#italic[Beweis:] 

#bold[Fall 1:] $dim U_1 = infinity$ oder $dim U_2 = infinity$. Dann gilt $(ast)$ nach den Rechenregeln der erweiterten Arithmetik.

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

#bold[Satz 3.38:] Sei $V$ ein $K$-VR und $U$ ein UVR von $V$. Dann existiert ein Untervektorraum $U^top subset.eq V$ mit $V = U oplus U^top$ (heißt $V = U + U^top$ und $U oplus U^top$). Insbesondere gilt dann 
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

Ein durch Satz 3.38 aus $U$ und $V$ erhaltener Untervektorraum $U^top$ heißt #bold[Komplement] von $U$ in $V$.

#bold[Beispiel 3.39:] Seien $V, U_1$ und $U_3$ wie in Beispiel 3.37. Dann gilt $V = U_1 oplus U_3$ d.h. $U_3$ ist ein Komplement von $U_1$ in $V$. Sei weiter $tilde(U_3) := "Span"{(1, 0, 1)}$. Dann gilt auch $V = U_1 oplus tilde(U_3)$.

Insbesondere sind die Komplemente aus Satz 3.38 nicht eindeutig bestimmt.

#bold[Satz 3.40:] Sei $V$ ein endlich erzeugter $K$-VR. Seien $U_1, U_2$ UVRs von $V$. Dann gilt 
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
durch Einsetzen erhält man 
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
  Seien $V$ und $W$ zwei $K$-Vektorräume. Eine Abbildung $f: V -> W$ heißt #bold[lineare Abbildung], wenn gilt 
  
  #box(width: 100%, inset: (left: 0.5cm, right: 0.5cm))[
    1. $underbrace(f(lambda dot v), "Skalarmultiplikation in" V) = underbrace(lambda dot f(v), "Skalarmultiplikation in" W) wide forall space.sixth v in V, forall space.sixth lambda in K$
    #h(5pt)
    2. $underbrace(f(v + w), "Addition in" V) = underbrace(f(v) + f(w), "Addition in" W) wide forall space.sixth v,w in V$
    #h(5pt)
  ]
  Die Menge aller linearen Abbildungen von $V$ nach $W$ bezeichnet man mit $L(V, W)$. Eine lineare Abbildung $f: V -> W$ wird auch #bold[lineare Transformation] oder #bold[(Vektorraum-) Homomorphismus] genannt.

  Eine bijektive lineare Abbildung nennt man #bold[(Vektorraum-) Isomorphismus]. Gibt es für zwei $K$-Vektorräume $V$ und $W$ einen Isomorphismus, so heißen die Räume $V$ und $W$ isomorph, geschrieben
  $
  V isomorph W
  $
  Eine lineare Abbildung $f: V -> V$ heißt #bold[Endomorphismus] und ein bijektiver Endomorphismus heißt #bold[Automorphismus].
] <def>

#bold[Bemerkung:] Als Übungsaufgabe: 
$
"Definition 4.1, 1) + 2)" <==> f(lambda v + mu w) = lambda f(v) + mu f(w) wide forall v, w in V, forall lambda, mu in K
$

#bold[Beispiel 4.2:] Für $a in RR$ ist $f: RR -> RR, f(x) = a x$ eine lineare Abbildung. Ihr Graph ist eine Gerade durch den Ursprung.

Betrachte eine Gerade $f(x) = a x + b$ und betrachte 
$
&f(x + y) = a(x + y) + b \
&f(x) + f(y) = a(x) + b + a(y) + b = a(x+y) + 2b
$
$f$ ist also nur eine lineare Abbildung, wenn $b = 0$ gilt. Streng genommen sind Geraden der Form $f(x) = m x + n$ keine linearen Abbildung. Korrekt ist, sie als affine Abbildungen zu bezeichnen.

#bold[Beispiel 4.3:] Für $a, b, c, d in RR$ ist $f: RR^2 -> RR^2$
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

#bold[Beispiel 4.4:] Sei $V = C^infinity (RR)$ der reelle Vektorraum aller unendlich oft differenzierbaren Funktionen $g: RR -> RR$ mit punktweisen Addition und skalaren Multiplikation. Dann ist 
$
d/(d x): V -> V, f arrow.bar f' = d/(d x) f
$
eine lineare Abbildung, denn für alle $f, g in V$ und $a, b in RR$ gilt:
$
(f + g)'(x) = f'(x) + g'(x) wide forall x in RR \
(a dot f)'(x) = a f'(x) wide forall x in RR 
$ 

#bold[Lemma 4.5:] Seien $V, W$ $K$-Vektorräume und $f: V -> W$ eine lineare Abbildung, $0_V$ der Nullvektor in $V$ und $0_W$ der Nullvektor in $W$. Dann gilt 

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

#bold[Lemma 4.6:] Seien $V, W$ $K$-Vektorräume. Für $f, g in L(V, W)$ und $lambda in K$ seien $f + g$ und $lambda dot f$ definiert durch
$
(f + g)(v) = f(v) + g(v) wide forall v in V \
(lambda dot f)(v) = lambda f(v) wide forall v in V, forall lambda in K
$
Dann ist $(L(V, W), +, dot)$ ein $K$-Vektorraum.

#italic[Beweis:] (Übungsaufgabe)
#endproof

#bold[Lemma 4.7:] Sei $V$ ein $K$-Vektorraum und $B := {v_1, ..., v_n} subset V$ eine endliche Familie von Vektoren. Dann ist:
$
Phi_B: K^n -> V, (a_i)_(1 <= i <= n) arrow.bar sum_(i = 1)^n a_i v_i
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

#bold[Wichtig:] $B = {v_1, ..., v_n}$ ist endlich! Für $B$ mit unendlich vielen Elementen bräuchte man eine äußere direkte Summe.

Aus abstrakter Sicht kennen wir jetzt endlichdimensionale Vektorräume, denn: Jeder endlichdimensionaler Vektorraum ist isomorph zu einer direkten Summe von Kopien des Grundkörpers.

#bold[Satz 4.8:] Struktursatz für Vektorräume 

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

#bold[Beispiel 4.9:] Sei $K^(n+1) = RR^(n+1)$ und $P_(<=n)[t]$ der Raum der Polynome von Grad kleiner gleich $n$ für $n in NN$. Eine Basis von $P_(<=n)[t]$ ist gegeben durch $B = {1, t, t^2, ..., t^n}$, vergleiche Beispiel 3.13.

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

#bold[Lemma 4.10:] Sei $V$ ein endlichdimensionaler Vektorraum über $K$ mit einer Basis $B := {v_1, .., v_n}$, $W$ ein beliebiger $K$-Vektorraum und $C = {w_1, ..., w_n}$ eine Familie von Vektoren in $W$. Dann gibt es genau eine lineare Abbildung $f$ von $V$ nach $W$ mit 
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
mu v &= sum_(i = 1)^n (mu lambda_i^v v_i) ==> f(mu v) = f(sum_(i = 1)^n (mu lambda_i^v v_i)) =^"Def" sum_(i = 1)^n (mu lambda_i w_i) \
&= mu sum_(i = 1)^n lambda_i^v w_i = mu f(v) wide "erste Eigenschaft" checkmark 
$
Sei $u = sum_(i = 1)^n lambda_i^u v_i ==>$
$
f(v + u) &= f(sum_(i = 1)^n lambda_i^v v_i + sum_(i = 1)^n lambda_i^u v_i) = f(sum_(i = 1)^n (lambda_i^v + lambda_i^u) v_i) \
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
  heißt #bold[Kern] der linearen Abbildung $f$. 

  Die Menge 
  $
  im(f) := f(V) = {w in W | exists v in V: w = f(v)}
  $
  heißt #bold[Bild] der linearen Abbildung $f$.
] <def>

#bold[Beispiel 4.12:] 

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
    ker(f) = {vec(x_1, x_2) in RR^2 | x_1 = -(d x_2) / c}, \
    im(f) = {vec(0, x) | x in RR} subset RR^2
    $
    weil $x = c x_1 + d x_2$ für jedes $x in RR$ lösbar ist $(c != 0)$.
  ]
]

#bold[Lemma 4.13:] Es seien $V$ und $W$ zwei $K$-Vektorräume und $f: V -> W$ eine lineare Abbildung. Dann gilt :

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $ker(f) subset.eq V$ ist ein Untervektorraum von $V$ 
  2. $im(f) subset.eq W$ ist ein Untervektorraum von $W$
]

#italic[Beweis:]

zu 1) $0_V in ker(f) ==> ker(f) != emptyset$. Weitherhin ist $ker(f)$ abgeschlossen bezüglich der Addition und Multiplikation, denn sei $x, tilde(x) in ker(f), lambda, mu in K$.

Zu zeigen: $lambda x + mu tilde(x) in ker(f)$
$
f(lambda x + mu tilde(x)) = lambda f(x) + mu f(tilde(x)) = 0_W \
==> "Abgeschlossenheit in" V
$
Daraus folgt auch mit $tilde(x) = 0_V$ die Abgeschlossenheit bezüglich der Multiplikation. 

$==> ker(f)$ Unterraum $checkmark$

zu 2) $f(0_V) = 0_W in im(f) != emptyset$

zu zeigen: $im(f)$ abgeschlossen bezüglich $+$ und $dot$. Seien $y, tilde(y) in im(f), lambda, mu in K$

$==> x, tilde(x) in V: f(x) = y and f(tilde(x)) = tilde(y)$. Dann gilt für $lambda x + mu tilde(x)$, dass
$
f(lambda x+ mu tilde(x)) &= lambda f(x) + mu f(tilde(x)) = lambda y + mu tilde(y) \
&==> lambda x + mu tilde(x) "ist das Urbild von" lambda y + mu tilde(y) \
&==> lambda y + mu tilde(y) in im(f)
$
#endproof

#definition("4.14", "Rang einer Abbildung")[
  Es seien $V$ und $W$ zwei $K$-Vektoräume und $f: V -> W$ eine lineare Abbildung. Der #bold[Rang] der linearen Abbildung $f$ ist definiert als
  $
  rg(f) := dim_K (im(f))
  $
] <def>

#bold[Lemma 4.15:] Es seien $V$ und $W$ zwei $K$-Vektorräume und $f in L(V, W)$, $W$ sei endlichdimensional. Dann gilt 

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. $f$ surjektiv $<==>$ $rg(f) = dim W$
  2. $f$ injektiv $<==>$ $dim(ker(f)) = 0$
]

#italic[Beweis:] 

zu 1) "$==>$": Sei $f$ surjektiv. Dann gilt $W = f(V) = im(f)$ und damit auch 
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

#bold[Satz 4.16:] Dimensionsformel

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
==> sum_(i = r+1)^n lambda_i v_i - sum_(i = 1)^n mu_i v_i = 0
$
${v_1, ..., v_n}$ sind Basis von $V$. $==>$ $mu_i = ... = mu_r = lambda_(r+1) = ... = lambda_n = 0$. $==>$ $f(v_(n+1)), ..., f(v_n)$ sind linear unabhängig $==>$ $C$ ist Basis von $im(f)$ 
$
==> dim(im(f)) = n - r 
$
#endproof

#bold[Beispiel 4.17:] Fortsetzung von Beispiel 4.12.

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
    dim(ker(f)) = dim({vec(x_1, x_2) | x_1 = (d x_2)/c}) &= 1 \
    dim(im(f)) = dim({vec(0, x) | x in RR}) &= 1 \
    dim(ker(f)) + dim(im(f)) = dim(RR^2) &= 2 
    $
]

#bold[Beispiel 4.18:] Sei $V = RR^3, W = RR^3$ und $f: V -> W$
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

#bold[Lemma 4.19:] Zwei endlichdimensionale $K$-Vektorräume $V$ und $W$ sind genau dann isomorph, wenn
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
Ist $v = lambda_1 v_1 + lambda_2 v_2 + ... + lambda_n v_n in ker(f)$. Dann gilt\
$ 0 = f(v) &= f(lambda_1 v_1 + ... + lambda_n v_n)\ 
& #h(-17pt) attach(=, t: f in L(V, W)) lambda_1 f(v_1) + ... + lambda_n f(v_n)\
&= lambda_1 w_1 + ... + lambda_n w_n 
$
$w_1, ..., w_n$ linear unabhängig\
$==>$ $lambda_1 = lambda_2 = ... = lambda_n = 0 ==> v = 0 ==> ker(f) = {0_V} attach(==>, t: "4.15") f "injektiv"$.\
Mit der Dimensionsformel folgt: 
$
dim(W) = dim(V) &= 0 + dim(im(f))
$
$
==> "mit" im(f) subset.eq W ==> im(f) = W ==> f "surjektiv"
$
#endproof

Was passiert bei Verknüpfungen von linearen Abbildungen?

#bold[Satz 4.20:] Seien $V, W$ und $X$ drei endlichdimensionale $K$-Vektorräume sowie $f in L(V, W)$ und $g in L(W, X)$. Dann gilt 
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

2) Betrachte $tilde(g) = g_(|im(f))$. Die Dimensionsformel liefert 
$
dim(im(f)) = dim(im(tilde(g))) + dim(ker(tilde(g)))
$
Des Weiteren gilt: $im(tilde(g)) := {g(v) in X | v in im(f)} = im(g circ f)$
$
ker(tilde(g)) = {v in im(f) | tilde(g)(v) = 0} = im(f) sect ker(g)
$
#endproof

#bold[Lemma 4.21:] Sei $K$ ein Körper. Die linearen Abbildungen $f: K^n -> K^m$ sind genau die Abbildungen der Form:
$
vec(x_1, x_2, dots.v, x_n) -> vec(a_(1 1) x_1 + a_(1 2) x_2 + ... + a_(1 n) x_n, a_(2 1) x_1 + a_(2 2) x_2 + ... + a_(2 n) x_n, dots.v, a_(m 1) x_1 + a_(m 2) x_2 + ... + a_(m n) x_n)
$
mit Koeffizienten $a_(i j) in K$ für $1 <= i <= m$ und $1 <= j <= n$. 

#italic[Beweis:] "$<==$": Die Dimensionen passen aufgrund der Definitionen. Die Linearität $f$ folgt aus den Rechengesetzen im Körper.

"$==>$": Sei $f in L(K^n, K^m)$. Zu zeigen: $f$ ist in angegebener Form darzustellen. 

#bold[Beobachtung:] Wenn $f$ so darstellbar ist, haben alle Bilder der Standardbasis $e_1, ..., e_n$ folgende Form:
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

James Sylvester (brit. Mathematiker, 1814 - 1897) erfand den Begriff der Matrix im Jahr 1850. Die im Folgenden definierte Matrixoperationen führte Arthur Cayley (brit. Mathematiker, 1821 - 1895) im Jahr 1858 ein.

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
  mit $a_(i j) in K$ für $1 <= i <= m$ und $1 <= j <= n$ heißt #bold[(m $times$ n) Matrix] mit den Einträgen in $R$. Die Einträge nennt man auch Koeffizienten. Die Menge aller ($m times n$) Matrizen nennt man $R^(m times n)$.
] <def>

#bold[Bemerkungen:] 

#boxedlist[
  Rein formal erlaubt diese Definition $n = 0$ oder $m = 0$. Dann erhält man Matrizen der Form $0 times n$, $m times 0$ oder $0 times 0$.

  Diese leeren Matrizen werden in manchen Beweisen aus technischen Gründen benötigt. In der Regel gilt aber $n, m >= 1$.
][
  Die Nullmatrix in $R^(m times n)$ ist die Matrix, bei der alle Einträge gleich $0$ sind. Sie wird mit $0^(m times n)$ bezeichnet
][
  Ist $m = n$, so nennt man $A in R^(m times n)$ quadratisch bzw. eine quadratische Matrix
][
  Ist $A in R^(n times n)$ heißen die Einträge $a_(j j)$ für $1 <= j <= n$ #bold[Diagonaleinträge] von 
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
  Sind $m_1, m_2, n_1, n_2 in NN_0$ und $A_(i j) in R^(m, n)$ für $i,j = 1,2$ gegeben, definieren diese eine sogenannte #bold[Blockmatrix] der Form 
  $
  A = mat(
    A_(1 1), A_(1 2);
    A_(2 1), A_(2 2);
    ) in R^(m_1 + m_2, n_1 + n_2)
  $
]

#bold[Beispiel 5.2:] Für 
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
die zweite Spalte von $B$. Keine dieser Matrizen ist quadratisch.

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
  Die Addition in $R^(m,n)$ erfolgt also komponentenweise basierend auf der Addition in $R$.
] <def>

#bold[Achtung:] Die Addition ist nur für Matrizen gleicher Größe / Dimension definiert.

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
] <def>

#definition("5.5", "Multiplikation von Matrizen")[
  Seien $A in R^(m,n)$ und $B in R^(n, l)$ zwei Matrizen. Dann ist $C = A dot B in R^(m, l)$ definiert durch
  $
  C := A dot B = mat(c_(1 1), ..., c_(1 l); dots.v, dots.down, dots.v; c_(m 1), ..., c_(m l)) space "mit" space c_(i j) = sum_(k = 1)^n a_(i k) dot b_(k j)
  $
  für $i = 1, ..., m$ und $j = 1, ..., l$
] <def>

#bold[Bemerkung:] Um das Produkt $A dot B$ berechnen zu können #bold[muss] die Anzahl der Spalten von $A$ gleich der Anzahl von Zeilen in $B$ sein.

#bold[Merkregel:] 
$
c_(i j) =  i"-te Zeile von" A "mal" j"-t Spalte von" B
$
Oder Zeile "mal" Spalte. ("mal" $corres$ Skalarprodukt)

#bold[Beispiel 5.6:] Für die Matrizen
$
A = mat(1, -2, 3; -4, 5, 6) in ZZ^(2,3), space B = mat(-1, 0; 0, 1; 1, -1) in ZZ^(3,2) space "und" space C = mat(1, 2; 3, 4; 5, 6) in ZZ^(3, 2) 
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

#bold[Lemma 5.7:] Für $A, tilde(A) in R^(m,m) space B, tilde(B) in R^(m,l), space C in R^(l,k) "sowie" lambda, mu in R$ gelten

#boxedlist[
  Assoziativgesetze, d.h. #sspace
  $
  A dot (B dot C) = (A dot B) dot C space "und" (lambda mu) dot A = lambda dot (mu dot A)
  $
][
  Distributivitätsgesetze , d.h.
  $
  (A + tilde(A)) dot B &= A dot B + tilde(A) dot B \
  A dot (B + tilde(B)) &= A dot B + A dot tilde(B)\
  (lambda + mu) dot A &= lambda dot A + mu dot A \
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
  eine Matrix. Dann ist die zu $A$ #bold[transponierte] Matrix $A^top$ definiert durch 
  $
  A^top := mat(a_(1 1), ..., a_(m 1); dots.v, dots.down, dots.v; a_(1 n), ..., a_(m n)) in R^(n times m)
  $
] <def>

#bold[Beispiel 5.9:] Die zu 
$
A = mat(1,-2,3;-4,5,6) in ZZ^(2,3)
$
transponierte Matrix ist
$
A^top = mat(1, -4; -2, 5; 3, 6) in ZZ^(3,2)
$

#bold[Lemma 5.10:] Für $A, tilde(A) in R^(m,n), space B in R^(n,l) "und" lambda in R$ gilt 

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  #show par: set block(spacing: 0.65em)
  1. $(A^top)^top = A$

  2. $(A + tilde(A))^top = A^top + tilde(A)^top$

  3. $(lambda dot A)^top = lambda dot A^top$

  4. $underbrace(underbrace((A dot B), in space R^(m,l))^top, in space R^(l,m)) = underbrace(underbrace(B^top, in space R^(l,n)) dot underbrace(A^top, in space R^(n,m)), in space R^(l,m))$
]

#italic[Beweis:] Nachrechnen.
#endproof

#bold[Zur Notation:]
$
R^n, space v in R^n, space v = vec(v_1, dots.v, v_n) in R^(n,1)
$
d.h. $v$ wird immer als Spaltenvektor interpretiert.

Für Zeilenvektor: 
$
w in R^(1,n) "gilt" w^top in R^(n,1) isomorph R^n
$
#bold[Beobachtung:] Alle Operationen, die wir für Matrizen definiert haben, sind konsistent mit den Vektoroperationen, wenn diese im obigen Sinn als Matrizen interpretiert werden.

== Matrizengruppen und -ringe

#bold[Lemma 5.11:] Mit den angegebenen Rechenregeln gilt

#box(width: 100%, inset: (right: 1cm, left: 1cm))[
  1. #[
    $(R^(m, n), +)$ ist eine kommutative Gruppe mit dem neutralen Element $0 in R^(m, n)$, d.h. der Nullmatrix und dem zu $A in R^(m, n)$ inversen Element $-A = (-a_(i j)) in R^(m, n)$. Manschreibt statt $A + (-B) = A - B$.
  ]
  2. #[
    Ist $R$ ein Körper, so ist $R^(m, n)$ ein $R$-Vektorraum der Dimension $m dot n$.
  ] 
]

#italic[Beweis:] 

1) Folgt durch nachrechnen unter Ausnutzung der Eigenschaften von $R$.

2) Aufgrund der Rechenregeln ist $R^(m,n)$ abgeschlossen bezüglich 
$
+: R^(m, n) times R^(m, n) -> R^(m,n) space "und" space dot.op: R times R^(m,n) -> R^(m,n)
$
Zur Dimension: $A in R^(m,n)$ kann dargestellt werden durch
$
a_(1 1) dot mat(1, 0, ..., 0; dots.v, dots.v, dots.v, dots.v; 0, 0, ..., 0) + a_(1 2) dot mat(0, 1, ..., 0; dots.v, dots.v, dots.v, dots.v; 0, 0, ..., 0) + ... + a_(m n) dot mat(0, 0, ..., 0; dots.v, dots.v, dots.v, dots.v; 0, 0, ..., 1) \
==> "Erzeugendensystem + linear unabhängig" ==> "Basis" 
$
#endproof

Aufgrund der Eigenschaft 2 aus Lemma 5.10 ist die Transposition von Matrizen ein Homomorphismus (vlg. Definition 2.11) der Gruppen $(R^(m,n), +)$ und $(R^(n,m), +)$ 

#bold[Lemma 5.12:] Sei $n in NN$. Die Menge der quadratischen Matrizen $R^(n, n)$, d.h. $(R^(n,n), +, dot)$, ist ein Ring mit Eins, welche durch die Einheitsmatrix $I_n$ gegeben ist. Dieser Ring ist nur für $n = 1$ kommutativ.

#italic[Beweis:] Lemma 5.11: $(R^(n,n), +)$ ist eine kommutative Gruppe mit neutralem Element $0 in R^(n,n)$. Lemma 5.7: Assoziativität, Distributivitätsgesetze, Einselement $I_n$. $==>$ Ring mit $1$ $space.thin checkmark$

$n = 1$: Kommutativität folgt aus Eigenschaften von $R$. Für $n = 2$ gilt mit 
$
A = mat(0,0;1,0) space "und" space B = mat(0,0;0,1), "dass" \
A dot B = mat(0,0;0,0) != mat(0,0;1,0) = B dot A
$
#endproof

Aus dem Beispiel im letzten Satz folgt auch, dass $A, B in R^(n,n)$ mit 

#boxedlist[$A != 0 in R^(n,n)$, $B != 0 in R^(n,n)$][$A dot B = 0$]

existiert. Damit besitzt $R^(n,n)$ sogenannte nichttriviale Nullteiler. Mit $R = RR$ gilt dies auch wenn $R$ ein Körper ist.

Weitere wichtige Eigenschaft:

Invertierbarkeit bezüglich der Multiplikation!

#bold[Frage:] Gibt es für jede Matrix $A in R^(n,n)$ eine Matrix $A^(-1)$, so dass $A dot A^(-1) = I_n = A^(-1) dot A$? Wenn dies gilt, dann müsste $A^(-1)$ existieren, so dass für 
$
A = mat(0,0;1,0) space "gilt" space A dot A^(-1) = I = A^(-1) dot A \
A dot A^(-1) = mat(0,0;1,0) dot mat(a,b;c,d) =^! mat(1,0;0,1)
$
Für das erste Element der Matrix folgt 
$
0 dot a + 0 dot c = underbrace(0 != 1, "Ring mit" 0 != 1) space arrow.zigzag
$
#bold[Folgerung:] Nicht alle quadratischen Matrizen sind invertierbar.

#bold[Beispiel 5.13:] Die Matrix 
$
A = mat(1,0;2,3) in ZZ^(2,2)
$
ist damit über $R = ZZ$ nicht invertierbar. Es gilt 
$
mat(1,0;2,3) dot underbrace(mat(1,0;-2/3, 1/3), A^(-1) space.thin in space.thin QQ^(2,2)) = mat(1,0;0,1) = I_2
$
Ist $A in QQ^(2,2)$, dann ist $A$ invertierbar. Also: Invertierbarkeit hängt vom Ring $R$ ab!

#sect_delim

#bold[Lemma 5.14:] Sind $A, B in R^(n,n)$ zwei invertierbare Matrizen. D.h. es existieren $A^(-1), B^(-1) in R^(n,n)$ mit $A dot A^(-1) = I = A^(-1) dot A$ und $B dot B^(-1) = I = B^(-1) dot B$, so gilt:

#boxedlist[
  $A dot B$ ist invertierbar und es ist $#sspace$
  $
  (A dot B)^(-1) = B^(-1) dot A^(-1)
  $
][
  $A^top$ ist invertierbar und es ist $(A^top)^(-1) = (A^(-1))^top = A^(-top)$
]

#italic[Beweis:] 

1. Aussage: Folgt aus der allgemeinen Aussage für Ringe mit Eins im Satz 2.13.

2. Aussage: Regel 4 aus Lemma 5.10:
$
(A^(-1))^top dot A^top = (A dot A^(-1))^top = (I_n)^top = I_n = (A^top)^(-1) dot A^top
$
#endproof

#bold[Lemma 5.15:] Die Menge $"GL"_n (R) := {A in R^(n,n) | A "invertierbar"}$ bilden mit der Matrixmultiplikation eine Gruppe.

#italic[Beweis:] Lemma 5.14, 1. Aussage: Abgeschlossenheit bezüglich $dot$. Lemma 5.7: Assoziativität $+$ neutrale Element $I_n$. Mit $(A^(-1))^(-1) = A$ ist auch $A^(-1)$ invertierbar $==>$ $A^(-1) in "GL"_n (R)$.
#endproof

#italic[Hinweis:] $space.thin"GL"_n (R)$ = General linear Group

Matrixmultiplikation: $A in R^(m,n), v in R^(n, 1) = R^n$
$
mat(a_(1 1), ..., a_(1, n); dots.v, dots.down, dots.v; a_(m 1), ..., a_(m n)) dot vec(v_(1 1), dots.v, v_(n 1)) = A dot v
$
definiert damit auch die Matrix-Vektor-Multiplikation.

Diese Beobachtung motiviert:

== Matrizen und lineare Abbildungen

#bold[Beispiel 5.16:] Fortsetzung von Beispiel 4.3.

Die lineare Abbildung $f: RR^2 -> RR^2$,
$
y = f(x) = f(vec(x_1, x_2)) = vec(a x_1 + b x_2, c x_1 + d x_2)
$
mit $a, b, c, d in RR$ wird beschrieben duch 
$
y = f(x) = underbrace(underbrace(mat(a, b; c, d), in space.thin R^(2,2)) dot underbrace(vec(x_1, x_2), in space.thin R^(2, 1)), in space.thin R^(2,1)) = A dot x space "mit" A = mat(a, b; c, d)
$
Die Kombination mit Lemma 4.21 liefert:

#bold[Satz 5.17:] Sei $K$ ein Körper. Zu jeder linearen Abbildung $f: K^n -> K^m, space.thin y = f(x)$, existiert eine Matrix $A in K^(m,n)$, so dass gilt
$
y = f(x) = A dot x
$

#italic[Beweis:] Nach Lemma 4.21 besitzt jede lineare Abbildung $f: K^n -> K^m$ die Form
$
y = f(x) = mat(a_(1 1) x_1 + a_(1 2) x_2 + ... + a_(1 n) x_n; a_(2 1) x_1 + a_(2 2) x_2 + ... + a_(2 n) x_n; dots.v; a_(m 1) x_1 + a_(m 2) x_2 + ... + a_(m n) x_n)
$
mit Koeffizienten $a_(i j) in K$, $i = 1, ..., m$, j = $1, ..., n$. Mit den Rechenregeln für Matrizen inklusive dem Spezialfall der Vektoren folgt
$
y = f(x) = A dot x space "mit" space A = mat(a_(1 1), a_(1 2), ..., a_(1 n); a_(2 1), a_(2 2), ..., a_(2 n); dots.v, dots.v, dots.v, dots.v; a_(m 1), a_(m 2), ..., a_(m n))
$
#endproof

Was gilt für allgemeine Basen?

#bold[Satz 5.18:] Seien $V$ und $W$ zwei $K$-Vektorräume mit den Basen $B = {v_1, ..., v_n}$ von $V$ und $C = {w_1, ..., w_m}$ von $W$ und $f: V -> W$ eine lineare Abbildung. Dann gibt es eine eindeutig bestimmte Matrix $A_f^(B, C) = (a_(i j)) in K^(m, n)$, so dass
$
W in.rev f(v_j) = sum_(i = 1)^m a_(i j) w_i wide j = 1, ..., n
$
gilt. Die Abbildung $F: L(V, W) -> K^(m, n)$ mit $F(f) = A_f^(B, C)$ ist ein Isomorphismus zwischen zwei $K$-Vektorräumen.


#italic[Beweis:] Da $C$ eine Basis von $W$ ist, besitzt jedes $w in W$ eine eindeutige Darstellung als Linearkombination der Vektoren ${w_1, ..., w_m}$. Damit besitzt auch für jedes $f in L(V, W)$ die Vektoren $f(v_1), ..., f(v_n)$ eine eindeutige Darstellung. Die Koeffizienten dieser Linearkombinationen bestimmen eindeutig die Matrix $A_f^(B, C)$.

zu zeigen: $F$ ist ein Isomorphismus.

$F$ ist linear: Seien $f, g in L(V, W)$ mit den zugehörigen Matrizen $A_f^(B, C)$ bzw. $A_g^(B, C)$ mit 
$
A_f^(B, C) = (a_(i j)), A_g^(B, C) = (b_(i j)), A_f^(B, C) in K^(m, n), A_g^(B, C) in K^(m, n)
$
Für $lambda, mu in K$ gilt 
$
(lambda f + mu g)(v_j) &= lambda f(v_j) + mu g(v_j) = lambda sum_(i = 1)^m a_(i j) w_i + mu sum_(i = 1)^m b_(i j) w_i \
&= sum_(i = 1)^m underbrace((lambda a_(i j) + mu b_(i j)), "Matrix für" lambda f + mu g) w_i
$
Also ist
$
F(lambda f + mu g) = lambda F(f) + mu F(g)
$
$==> F$ linear

noch zu zeigen: $F$ ist bijektiv

Sei $f in "ker"(F)$, dann $F(f) = 0 in K^(m,n)$. Also ist $f(v_j) = 0$ für $j = 1, ..., n$. Da ${v_1, ..., v_n}$ eine Basis von $V$ ist, folgt für alle $v in V:$
$
f(v) = f(sum_(j = 1)^n lambda_j v_j) attach(=, t: f "linear") sum_(j = 1)^n lambda_j underbrace(f(v_j), 0 in W) = 0 in W \
==> f = 0 in L(V, W) ==> "ker"(F) = {0} ==>^"Lemma 4.15" F "injektiv"
$
Sei $A in K^(m,n)$ beliebig gewählt. zu zeigen: $exists f in L(V, W): F(f) = A$. 

Lemma 4.10: Es existiert genau eine lineare Abbildung $f in L(V,W)$ mit 

#align(center, box(width: 80%, height: auto, inset: 0.5cm, radius: 10pt, fill: rgb(245, 245, 245), [
  #set align(left)
  #bold[Zwischenüberlegung]
  #v(5pt)
  ${tilde(w)_1, ..., tilde(w)_n} space exists! f: f(v_j) = tilde(w)_j space space j = 1, ..., n$
  $
  ==> tilde(w)_j = sum_(i = 1)^m a_(i j) w_i, space.quad j = 1, ..., n space "mit" space A = (a_(i j)) in K^(m,n)
  $
]))

$
f(v_j) = sum_(i = 1)^m a_j w_i space j = 1, ..., n
$
Für diese $f$ gilt dann $F(f) = A$
$
==> F "surjektiv"
$
#endproof

#bold[Bemerkungen:] 

#boxedlist[Im letzten Satz kann man #bold[nicht] $#sspace$
$
f(v_j) = w_j 
$
fordern, da $n != m$ gelten kann.][
  Wir hatten schon: $V$ $K$-Vektorraum, $"dim"(V) = n in NN$
  $
  "dann" V isomorph K^n
  $
  Mit Satz 5.18 folgt jetzt:
  $
  L(V, W) isomorph K^(n,m)
  $
  ][
    Aus Satz 4.19 und Lemma 5.11 mit dem Körper $K$ folgt
    $
    "dim"(L(V,W)) = "dim"(K^(m,n))
    $
    ]

#definition("5.19", "Matrixdarstellung")[
  Seien $V$ und $W$ zwei $K$-Vektorräume mit den Basen $B = {v_1, ..., v_n}$ von $V$ und $C = {w_1, ..., w_m}$ von $W$ sowie $f in L(V, W)$. Die durch Satz 5.18 eindeutig bestimmte Matrix $A_f^(B,C) in K^(m, n)$ heißt #bold[Matrixdarstellung] oder die #bold[darstellende Matrix] von $f in L(V, W)$ bezüglich der Basen $B$ und $C$.
] <def>

#bold[Beispiel 5.20:] Fortsetzung von Beispiel 4.3. Die lineare Abbildung $f: RR^2 -> RR^2$ einer Drehung im $RR^2$ für einen gegebenen Winkel $phi in RR$ bezüglich der Standardbasis $S = {e_1, e_2}$ ist eindeutig durch die Darstellungsmatrix
$
A_f^(S, S) = mat(cos(phi), -sin(phi); sin(phi), cos(phi))
$
bestimmt.

#bold[Beispiel 5.21:] Fortsetzung Beispiel 4.18. Die lineare Abbildung $f: RR^3 -> RR^3$ besitzt für die Standardbasis die Darstellungsmatrix 
$
A_f^(S,S) = mat(1,-1,2;1,1,2;0,3,0) space -> space "rg(A)" = 2
$
für $S = {e_1, e_2, e_3}$. Beispiel 4.18: $"rg"(f) = dim(im(f))$.

#definition("5.22", "Spaltenrang, Zeilenrang")[
  Sei $A in K^(m,n)$, $K$ ein Körper, gegeben. Die Maximalzahl linear unabhängiger Spaltenvektoren von $A$ heißt #bold[Spaltenrang] von $A$ und wird mit $"rg"_S (A)$ bezeichnet. Die Maximalzahl der linear unabhängigen Zeilenvektoren von $A$ heißt #bold[Zeilenrang] von $A$ und wird mit $rg_Z (A)$ bezeichnet. 
  $
  ==> A_f^(S,S) = mat(1, -1, 2; 1, 1, 2; 0, 3, 0) wide rg_S (A) = 2
  $
] <def>

#bold[Satz 5.23:] Seien $V, W$ zwei $K$-Vektorräume mit den Basen $B = {v_1, ..., v_n}$ von $V$ und $C = {w_1, ..., w_m}$ von $W$ sowie $f in L(V, W)$ mit der Darstellungsmatrix $A_f^(B, C) = (a_(i j))_(i=1,....,m)^(j = 1, ... n) in K^(m,n)$. Dann gilt die Gleichheit 
$
rg(f) = rg_S (A_f^(B,C))
$

#italic[Beweis:] Es gilt 
$
f(v_j) = sum_(i = 1)^m a_(i j) w_i space j = 1, ..., n 
$
Damit sind die Spaltenvektoren
$
vec(a_(1 j), a_(2 j), dots.v, a_(m j)) in K^m space j = 1, ..., n
$
die Koordinaten von $f(v_j)$ bezüglich der Basis $C$. Aufgrund der Isomorphie von $W$ und $K^m$ können damit diese Spaltenvektoren als Erzeugendensystem von $im(f)$ interpretiert werden. Damit folgt 
$
rg(f) = dim(im(f)) = dim("Span"(vec(a_(1 1), a_(2 1), dots.v, a_(m 1)), ..., vec(a_(1 n), a_(2 n), dots.v, a_(m n)))) = rg_S (A)
$
#endproof

#bold[Beispiel 5.24:] Fortsetzung von Beispiel 5.21

Für die Darstellungsmatrix 
$
A_f^(S, S) = mat(1, -1, 2;1, 1, 2;0, 3, 0)
$
gilt $rg(f) = 2 = rg_S (A_f^(S, S))$.

Graphische Darstellung der Ergebnisse: $V, W$ sind $K$-Vektorräume, $B = {v_1, ..., v_n}$ ist Basis von $V$, $C = {w_1, ..., w_m}$ ist Basis von $W$. Für $f in L(V, W)$ gilt 

Mit Satz 5.18 und dem Struktursatz 4.8 können die Ergebnisse mit folgenden #bold[kommutativen Diagramme] zusammengefasst werden:
$
space V space -->^f space W \
Phi_B arrow.t space wide space arrow.t Phi_C \
space K^n -->_(A_f^(B,C)) K^m \
$
Solche kommutativen Diagramme sind sehr wichtige Hilfsmittel! Man erhält daraus folgenden Aussagen:

#boxedlist[
  Für die gegebenen Basen $B$ und $C$ gibt es zwei Wege von $V$ nach $K^m$:
  $
  Phi_C circ f = A_f^(B,C) circ Phi_B
  $
  D.h.:
  $
  Phi_C (f(v)) = A_f^(B,C) dot Phi_B (v) space forall v in V
  $
][
  Mithilfe der inversen Abbildungen kann man auch andere Wege gehen, z.B:
  $
  f = Phi_C^(-1) circ A_f^(B,C) dot Phi_B
  $
]

Was passiert bei der Verknüpfung von linearen Abbildungen mit den Darstellungsmatrizen?

#bold[Satz 5.25:] Seien $V, W$ und $X$ drei endlichdimensionale $K$-Vektorräume mit den Basen $B, C$ und $D$. Für gegebene $f in L(V, W) "und" g in L(W, X)$ gilt
$
A_(g circ f)^(B,D) = A_g^(C, D) dot A_f^(B,C)
$

#italic[Beweis:] Satz 4.20: $g circ f in L(V, X)$. Seien $B = {v_1, ..., v_n}$, $C = {w_1, ..., w_m}$, $D = {x_1, ..., x_s}$ und die Darstellungsmatrizen gegeben durch 
$
A_f^(B, C) = (a_(i j))_(i = 1, ..., m space.thin "Zeilen")^(j = 1, ..., n space.thin "Spalten") "sowie" A_g^(C, D) = (b_(i j))_(i = 1, ..., s)^(j = 1, ..., m)
$
Dann folgt für $v_j, j = 1, ..., n$
$
(g circ f)(v_j) = g lr(size: #3em, (underbrace(sum_(k = 1)^m a_(k j) w_k, = space.thin f(v_j)) )) = sum_(k = 1)^m a_(k j) g(w_k) \
= sum_(k = 1)^m a_(k j) sum_(i = 1)^s b_(i k) x_i = sum_(i = 1)^s sum_(k = 1)^m a_(k j) b_k x_i \
= sum_(i = 1)^s (sum_(k = 1)^m b_(i k) a_(k j)) x_i
$ 
D.h. für die Darstellungsmatrix 
$
A_(g circ f)^(B, C) = (c_(i j))_(i = 1, ..., s)^(j = 1, ..., n)
$
gilt $A_(g circ f)^(B, D) = A_f^(C, D) dot A_f^(B, C)$.
#endproof

== Basiswechsel

Seien $V$ und $W$ zwei $K$-Vektorräume mit $dim(V) = n in NN$ und $dim(W) = m in NN$ mit $B = {v_1, ..., v_n}$ als Basis von $V$. Nach dem Struktursatz für Vektorräume Satz 4.8 gilt 
$
Phi_B: K^n -> V, space (x_1, ..., x_n) arrow.bar sum_(i = 1)^n x_i v_i
$
Die Kunst der linearen Algebra besteht darin, zu einem gegebenen Problem, welches durch eine lineare Abbildung beschreiben werden kann, geschickt Basen zu wählen, so dass die Darstellung möglichst einfach ist.

#bold[Beispiel 5.26:] Sei $V = RR^2$. Für die Standardbasis $C = {e_1, e_2}$ erhält man 
$
Phi_C = RR^2 -> V, space (x_1, x_2) arrow.bar sum_(i = 1)^2 x_i e_i \
= x_1 vec(1,0) + x_2 vec(0,1) = vec(x_1, x_2) = mat(1, 0; 0, 1) vec(x_1, x_2)
$
Die Basis $B = {e_1, e_1+e_2}$ liefert 
$
Phi_B: RR^2 -> V, space (x_1,x_2) arrow.bar sum_(i = 1)^2 x_i v_i \
= x_1 vec(1,0) + x_2 vec(1,1) = vec(x_1 + x_2, x_2) = mat(1,1;0,1) vec(x_1, x_2) 
$
$V$ = Ebene die durch $RR^2$ beschrieben wird.

#bold[Frage:] Darstellung von $F$ in den unterschiedlichen Basen.

#bold[Lemma 5.27:] Der Basiswechsel zwischen zwei Basen $B$ und $C$ des $K$-Vektorraums $V$ mit $dim(V) = n in NN$ ist der Isomorphismus
$
Phi_(B, C) = Phi^(-1)_C circ Phi_B
$

#italic[Beweis:] Basierend auf dem Diagramm

#align(center, figure(
  image("bilder/527.jpg", width: 80%),
))

Es fehlt noch die Isomorphieeigenschaft. Nach dem Struktursatz 4.8 gilt: $Phi_B, Phi_C$ sind Isomorphismen. Dann ist auch 

#boxedlist[$Phi^(-1)_C$ ein Isomorphismus][$Phi^(-1)_C circ Phi_B$ ein Isomorphismus]

siehe Satz 1.38.
#endproof

#bold[Beobachtung:] Sei $V$ ein $K$-Vektorraum mit Basis $B = {v_1, ..., v_n}$ und $C = {e_1, ..., e_n}$ die Standardbasis. Dann ist

#boxedlist[$Phi_C: K^n -> V$ die Identität, d.h. $A^(C,C)_(Phi_C) = I_n$ (siehe oben)][$Phi_(B,C) = Phi^(-1)_C circ Phi_B = Phi_B space ==> space Phi_(B,C) (e_i) = Phi_B (e_i) = v_i$]

Die zum Basiswechsel gehörende Matrix $A_(Phi_(B,C))^(B,C)$ von einer gegebenen Basis $B = {v_1, ..., v_n}$ zur Standardbasis ist die Matrix, deren Spalten den Basisvektoren von $B$ entsprechen, d.h.
$
A_(Phi_(B,C))^(B,C) = mat(v_1, v_2, ..., v_n) wide #italic[$v_i$ ist immer ein Spaltenvektor]
$

#bold[Beispiel 5.28:] Sei $V = RR^2$ und $B = {e_1, e_1+ e_2}$ sowie $C = {e_1,e_2}$. Damit ist 
$
A_(Phi_(B,C))^(B,C) = mat(1,1;0,1) subset.eq "Gl"_2 (RR) space "mit"
$
$
(A_(Phi_(B,C))^(B,C))^(-1) = mat(1,-1;0,1)
$
Man erhält z.B.:
$
Phi_(B,C) (vec(1/2,1/2)) = mat(1,1;0,1) vec(1/2, 1/2) = vec(1,1/2)
$

Jetzt für lineare Abbildungen:

#bold[Lemma 5.29:] Seien $V$ und $W$ $K$-Vektorräume mit $dim(V) = n, dim(W) = m$ sowie $f in L(V, W)$. Weiter seien $B, tilde(B)$ zwei Basen von $V$ und $C, tilde(C)$ zwei Basen von $W$. Dann gilt für die Darstellungsmatrizen, dass
$
A_f^(tilde(B), tilde(C)) = Phi_(C,tilde(C)) dot A_f^(B,C) dot Phi_(B, tilde(B))^(-1) 
$
bzw.
$
A_f^(B, C) = Phi_(C, tilde(C))^(-1) dot A_f^(tilde(B),tilde(C)) dot Phi_(B, tilde(B))
$
#italic[Beweis:] Dies folgt aus dem kommutativen Diagramm.

#align(center, figure(
  image("bilder/529.jpg", width: 80%)
))

#bold[Beispiel 5.30:] Sei die Darstellungsmatrix der linearen Abbildung $f: V -> W$ mit $V = RR^3$ und $W = RR^2$ bezüglich der Standardbasen gegeben durch 
$
A_f^(B,C) = mat(1,1,-2;-6,3,3)
$
Wir suchen jetzt die Darstellung bezüglich der Basen 
$
tilde(B) = {vec(0,0,-1),vec(0,1,0),vec(1,1,1)} wide tilde(C) = {vec(2,-3), vec(1,3)}
$
Mit $v_1 = -1 dot e_3, space v_2 = e_2, space v_3 = e_1 + e_2 + e_3$ folgt aus der Linearität von $f$, dass
$
f(v_1) = f(-1 dot e_3) = -f(e_3) = w_1 \
f(v_2) = f(e_2) = w_2 \
f(v_3) = f(e_1) + f(e_2) + f(e_3) = 0
$
Also wird $f$ bezüglich der Basen $tilde(B)$ und $tilde(C)$ durch
$
A_f^(tilde(B), tilde(C)) = mat(1,0,0;0,1,0)
$
beschrieben.

#bold[Fazit:] Der richtige Basiswechsel bringt die Abbildung $f$ in sehr einfache Gestalt. Man kann zeigen: Für $V, W$ endlichdimensional und $f in L(V,W)$ mit $dim(im(f)) = r in NN$, $c = dim(V)-r$, $a = dim(W)-r$ existieren Basen $B$ von $V$ und $C$ von $W$, so dass 
$
A_f^(B,C) = mat(I_r, 0_(r times b); 0_(a times r), 0_(a times b)) space "z.B. Mehrmann Satz 10.24"
$

== Elementarumformung von Matrizen

Für eine gegebene Matrix $A = (a_(i j))_(j = 1, ..., m)^(j = 1, ..., n) in K^(m, n)$ bezeichnen wir die Spaltenvektoren mit 
$
a_j = vec(a_(1 j), a_(2, j), dots.v, a_(m j)) space "mit" space j = 1, ... n space ==> space a_j in K^(m, 1) isomorph K^m
$
und die Zeilenvektoren mit 
$
a^i = (a_(i 1), a_(i 2), ..., a_(i n)) space "mit" space i = 1, ..., m space ==> space a_i in K^(1, n)
$
Die drei elementaren Spaltenumformungen sind gegeben durch 

#box(width: 100%, inset: (left: 0.5cm))[
#bold[(S1)] Vertauschen zweier verschiedener Spalten $a_j$ und $a_k$ für $j,k in {1, ..., n}$, $j != k$

#bold[(S2)] Multiplikation einer Spalte $a_j, j in {1, ..., n}$ mit Skalar $lambda in K, lambda != 0$

#bold[(S3)] Addition einer Spalte $a_j$ zu einer anderen Spalte $a_k$ für $j, k in {1, ..., n}$, $n != k$
]

Die drei elementaren Zeilenumformungen sind gegeben durch.

#box(width: 100%, inset: (left: 0.5cm))[
#bold[(Z1)] Vertauschen zweier Zeilen $a^i$ und $a^k$ für $i, k in {1, ..., m}$, $i != k$

#bold[(Z2)] Multiplikation einer Zeile $a^i$, $i in {1, ..., m}$ mit einem Skalar $lambda in K$, $lambda != 0$

#bold[(Z3)] Addition einer Zeile $a^i$ zu einer anderen Zeile $a^k$ für $i, k in {1, ..., m}$, $i != k$
]

#bold[Lemma 5.31:] Es bezeichne $A = (a_(i j))_(j = 1, ..., m)^(i = 1, ..., n) in K^(m,n)$. Dann ändern sich der Spaltenrang $rg_S (A)$ und der Zeilenrang $rg_Z (A)$ von $A$ bei elementaren Umformungen (S1) - (S3) bzw. (Z1) - (Z3) nicht.

#italic[Beweis:] Hier: Spaltenrang

Nach Definition gilt:
$
rg_S (A) = dim("Span"(a_1, ..., a_m)) 
$
Dann folgt aus 

(S1)
$
"Span"(a_1, ..., a_j, ...., a_k, ..., a_n) = "Span"(a_1, ..., a_k, ..., a_j, ..., a_n) \
j, k in {1, ..., n}, j != k, "o.B.d.A" j<k
$
(S2)
$
"Span"(a_1, ..., a_j, ..., a_n) = "Span"(a_1, ..., lambda a_j, ..., a_n) \
  j in {1, ..., n}, lambda != 0
$
(S3)
$
"Span"(a_1, ..., a_j, ..., a_k, ..., a_n) = "Span"(a_1, ..., a_j, ..., a_k + a_j, ..., a_n) \
  j,k in {1, ..., n}, j != k, "o.B.d.A." j<k
$
die Invarianz von $rg_S (A)$ für (S1) - (S3)

2. Zeilenumformungen

Wir betrachten die Koordinaten der Spaltenvektoren $a_1, ..., a_n$ bezüglich der Standardbasis $B = {e_1, ..., e_m}$ bezüglich der Abbildung in den $K^m$  welche durch $A$ gegeben ist. Durch Vertauschen der Einheitsvektoren $e_i, e_k$, $i,k in {1, ..., n}$, $i != k$ erhalten wir eine neue Basis $tilde(B) = {e_1, ..., e_k, ..., e_i, ..., e_m}$, o.B.d.A. $i<k$ für den $K^m$ und die neuen Koordinaten
$
tilde(a)_1 = vec(a_(1 1), dots.v, a_(k 1), dots.v, a_(i 1), dots.v, a_(m 1)), space ... space, tilde(a)_n = vec(a_(1 n), dots.v, a_(k n), dots.v, a_(i n), dots.v, a_(m n))
$
aus den ursprünglichen Koordinaten für $B$ 
$
a_1 = vec(a_(1 1), dots.v, a_(i 1), dots.v, a_(k 1), dots.v, a_(m 1)), space ... space, a_n = vec(a_(1 n), dots.v, a_(i n), dots.v, a_(k n), dots.v, a_(m n))
$
Dies entspricht (Z1), damit folgt 
$
rg_S (A) = dim("Span"(a_1, ..., a_n)) = dim("Span"(tilde(a)_1, ..., tilde(a)_n))
$
Jetzt (Z2). Dies entspricht der Multiplikation des $i$-ten Einheitsvektor mit $lambda^(-1)$. D.h. man erhält die neue Basis $hat(B) = {e_1, ..., lambda^(-1) e_i, ..., e_m}$ und die zugehörigen Koordinaten
$
hat(a)_1 = vec(a_(1 1), dots.v, lambda a_(i 1), dots.v, a_(m 1)), space ... space, hat(a)_n = vec(a_(1 n), dots.v, lambda a_(1 n), dots.v a_(m n))
$
Es folgt
$
rg_S (A) = dim("Span"(a_1, ..., a_n)) = dim("Span"(hat(a)_1, ... hat(a)_n))
$
(Z3)

Ersetzt man den $k$-ten Einheitsvektor durch $e_k - e_i$, $i, k in{1, ..., m}$, $i < k$ o.B.d.A. Man erhält die neue Basis $caron(B) = {e_1, ..., e_i, ..., e_k - e_i, ..., e_m}$ sowie die neuen Koordinaten
$
caron(a)_1 = vec(a_(1 1), dots.v, a_(i 1), dots.v, a_(k 1), dots.v, a_(m 1)), space ... space, caron(a)_n = vec(a_(1 n), dots.v, a_(i n), dots.v, a_(k n) + a_(i n), dots.v, a_(m n))
$
Es folgt daraus wieder, dass 
$
rg_S (A) = dim("Span"(a_1, ..., a_m)) = dim("Span"(caron(a)_1, ..., caron(a)_n))
$
#endproof

#bold[Beispiel 5.32:] $K = RR$ und
$
A = mat(1,1,1,1;1,2,3,4;2,3,4,5) --> A^((1)) = mat(1,1,1,1;0,1,2,3;0,1,2,3)
$
mit (Z1): $i = 1, lambda = -1$, (Z3): $k = 2, i = 1$, (Z1): $i = 1, lambda = -1$
$
--> A^((2)) = mat(1,1,1,1;0,1,2,3;0,0,0,0)
$
$
==> rg_S (A^((2))) = 2 space "und" space rg_Z (A^((2))) = 2
$

#pagebreak()

= Lineare Gleichungssysteme

Ein System von Gleichungen der Form 

$
a_(1 1) x_1 + a_(1 2) x_2 + ... + a_(1 n) x_n = b_1 \
a_(1 2) x_1 + a_(2 2) x_2 + ... + a_(2 n) x_n = b_2 \
dots.v \ 
a_(m 1) x_1 + a_(m 2) x_2 + ... + a_(m n) x_n = b_m
$
$
<==> A x = b
$
für eine gegebene Matrix $A in K^(m n)$, einem gegebenen Vektor $b in K^m$ und einem unbekannten Vektor $x in K^n$ heißt #bold[lineares Gleichungssystem (LGS)]. Die Lösung von linearen Gleichungssystemen ist ein zentrales Problem der linearen Algebra. Wichtige Fragen:

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  1. #[
    Existenz einer Lösung? Unter welchen Bedingungen besitzt (LGS) überhaupt Lösungen?
  ]
  2. #[
    Lösungsmannigfaltigkeiten: Wann (LGS) mindestens eine Lösung besitzt: Unter welchen Bedingungen gibt es genau eine Lösung? Wenn es mehrere Lösungen gibt: Wie ist die Struktur der Lösungsmenge?
  ]
  3. #[
    Lösungsverfahren: Wie kann man Lösungen von (LGS) praktisch berechnen? 
    ]
]
 
#bold[Hier:] Fragen 1 + 2), etwas zu 3). Beantwortung von 3): Numerische Lineare Algebra

== Existenz von Lösungen und Lösungsmengen

#definition("6.1", "Lineares Gleichungssystem")[
  Für das lineare Gleichungssystem 
  $
  A x = b space "mit" A in K^(m, n), b in K^m
  $
  nennt man $A$ die #bold[Koeffizientenmatrix] und $b$ die #bold[rechte Seite]. Die Matrix
  $
  A_("erw") = (A b) in K^(m, n+1)
  $
  nennt man #bold[erweiterte Koeffizientenmatrix].

  Ist $b = 0 in K^m$, so heißt (LGS) #bold[homogen], ansonsten #bold[inhomogen]. Gilt für $overline(x) in K^n$, dass $A overline(x) = b$, so nennt man $overline(x)$ eine #bold[Lösung] von (LGS). Die Menge aller Lösungen heißt #bold[Lösungsmenge] und wird mit 
  $
  cal(L)(A, b)
  $
  bezeichnet.
] <def>

#bold[Bemerkung:] Im normalen Fall, d.h. sei $b = 0 in K^m$ gilt offensichtlich immer $rg_S (A) = rg_S (A_"erw")$. (Später: $rg(A) = rg(A_"erw"))$. Außerdem existiert im homogenen Fall immer eine Lösung, nämlich $x^* = 0 in K^n$. Denn es gilt $A x^* = A 0_m = 0 = b$.

Beantwortung Frage 1:

#bold[Satz 6.2:] Das LGS ist genau dann lösbar, d.h. $cal(L)(A, b) != emptyset$, wenn
$
rg_S (A) = rg_S (A_"erw")
$
gilt.

#italic[Beweis:] Seien $a_i$, $1 <= i <= n$, die Spalten von $A$ und $f: K^n -> K^m$ die zu $A$ gehörende lineare Abbildung. Dann gilt 
$
"LGS lösbar" <==> exists x in K^n: A x = b <==> exists x in K^n: f(x) = b <==> b in im(f)
$
$
&<==> b in "Span"{f(e_1), ..., f(e_n)} \
&<==> b in "Span"{a_1, ..., a_n} \
&<==> "Span"{a_1, ..., a_n} = "Span"{a_1, ..., a_n, b} \
&<==> rg_S (A) = rg_S (A_"erw")
$
#endproof

#bold[Folgerung:] Ist $m<=n$ und gilt, dass $rg_S (A) = m$, so besitzt (LGS) mindestens eine Lösung. 

Denn: Wegen $m<=n$ spannen die Spaltenvektoren $a_1, ..., a_m, a_(m+1), ..., a_n$ $in K^m$ von $A$ den $K^m$ auf.
$
==> rg_S (A) = m = rg_S(A_"erw")
$

#bold[Satz 6.3:] Sei $L_0 = cal(L)(A, 0)$, d.h. die Menge aller Lösungen des homogenen linearen Gleichungssystems (LGS). Dann ist $L_0 subset.eq K^n$ ein Unterraum der Dimension
$
dim L_0 = n - underbrace(rg_S (A), <=n) >= 0
$

#italic[Beweis:] Die Matrix $A in K^(m,n)$ definiert eine lineare Abbildung $f: K^n -> K^m$, $f(x) = A x$. Also gilt 
$
L_0 = {x in K^n | A x = 0 } = {x in K^n | f(x) = 0 } = ker(f)
$
Lemma 4.13: $L_0$ ist Unterraum von $K^n$. 

Dimensionssatz Satz 4.16: Satz 5.23.
$
dim L_0 = dim(ker(f)) =^"4.16" dim(K^n) - rg(f) =^"5.23" n - rg_S (A)
$
#endproof

#bold[Folgerungen:]

#boxedlist[
  Ist $m>=n$ und gilt $rg_S (A) = n$, so besitzt (LGS) für $b = 0$ nur die triviale Lösung $x^* = 0$, denn aus dem letzen Satz folgt
  $
  dim L_0 = n - rg_S (A) = n - n = 0 ==> L_0 = {0}
  $
][
  Besitzt umgekehrt (LGS) für $b = 0$ nur $x^* = 0 in K^n$ als Lösung, d.h. 
  $
  L_0 = {0} ==> 0 = n - rg_S (A) ==> rg_S (A) = n
  $
]

#boxedlist[
  Im Fall $m = n$, dann gilt für das homogene Gleichungssystem $A x = b$
  $
  L_0 = {0} <==> A "invertierbar, d.h." A in "GL"_n (K)
  $
  Alternativer Beweis:

  $A in "GL"_n (K) <==>$ Es existiert die inverse Matrix $A^(-1) in "GL"_n (K)$
  $
  A x = 0 \
  A^(-1) A x = A^(-1) 0 \
  x = 0
  $
]

Lösungsmenge für den allgemeinen Fall:

#bold[Satz 6.4:]  Es gelte für die Lösungsmenge von (LGS), dass
$
cal(L)(A,b) != emptyset
$
D.h. die Menge aller Lösungen von (LGS) ist nicht leer. Dann gilt: Es gibt $x^* in cal(L)(A, b)$ und 
$
cal(L) (A,b) = {x in K^n | x = x^* + y , y in cal(L)(A,0) }
$
D.h. die Menge aller Lösungen von (LGS) erhält man aus einer speziellen Lösung des inhomogenen linearen Gleichungssystems und Addition sämtlicher Lösungen des zugehörigen homogenen LGS.

#italic[Beweis:] Nach Vorraussetzung gilt $A x^* = b$. Damit folgt für $y in cal(L)(A, 0)$, d.h. $A y = 0$, dass 
$
A(x^* + y) = A x^* + A y = b + 0 = b \
==> {x in K^n | x = x^* + y, y in cal(L)(A, 0)} subset.eq cal(L)(A, b)
$
Sei $x in cal(L)(A, b)$. Dann erhält man für $y = x^* - x$, dass 
$
A y = A(x^*-x) = A x^* - A x = b - b = 0 ==> y in cal(L)(A, 0) \
==> A y = 0 ==> - A y = 0 ==> A(-y) = 0 ==> -y in cal(L)(A, 0)
$
$
cal(L)(A, b) subset.eq {x in x in K^n | x = x^* + y, y in cal(L)(A, 0)}
$
#endproof

Was ist die "Größe" des Lösungsraumes?

Problem: $cal(L)(A, b)$ ist ja kein Unterraum, da für $b != 0, x = 0 in.not cal(L)(A, b)$ gilt. Deswegen: Übertragung des Dimensionsbegriffs auf Mengen dieser Struktur.

#definition("6.5", "Affiner Unterraum")[
  Sei $V$ ein $K$-Vektorraum. Eine Teilmenge $U subset V$ heißt #bold[affiner Unterraum] falls es ein $v in V$ und einen Unterrvektorraum $W$ gibt, so dass
  $
  U = v + W := {u in V | "es gibt ein" w in W "mit" u = v + w}
  $
  Die leere Menge bildet ebenfalls einen affinen Unterraum.
] <def>
Affine Unterräume kann man als "Parallelverschiebung" eines Unterraums interpretieren.

#bold[Frage:] 
$
{x in K^n | x = x^* + y, y in cal(L)(A, 0)} = {x in K^n | x = tilde(x)^* + y, y in cal(L)(A,0)} \ "für" x^*, tilde(x)^* in cal(L)(A, b)"?"
$
#bold[Satz 6.6:] Sei $V$ ein $K$-Vektorraum und $U subset V$ ein affiner Untervektorraum. Der Aufhängepunkt $v in V$ kann beliebig gewählt werden. D.h. für beliebiges $tilde(v) in U$ ist $U = tilde(v) + W$. Weiter ist zu jedem affinen Unterraum $U = v + W$ der Untervektorraum $W$ eindeutig bestimmt. D.h. ist $tilde(v) in V$ und $tilde(W) subset.eq V$ ein Unterraum mit 
$
v + W = tilde(v) + tilde(W)
$
so folgt $W = tilde(W)$ und $tilde(v) - v in W$

#italic[Beweis:] $U = v + W$, $tilde(v) in U ==>$ $exists overline(w) in W: tilde(v) = v + overline(w) ==>$ $v = tilde(v) - overline(w)$

1 $U subset.eq tilde(v) + W$

$
u in U ==> u = v + w "mit" w in W \
==> u = tilde(v) + underbrace(w - overline(w), in W)
$
$==> U subset.eq tilde(v) + W$

2) $tilde(v) + W subset.eq U$

$
U = tilde(v) + W =^"*" v + underbrace(overline(w) + w, in W) in U 
$
$==> U = tilde(v) + W$

Sei nun $U = v + W = tilde(v) + tilde(W)$. Mit $U - U = {u - tilde(u) | u, tilde(u) in U}$ als Menge der Differenzen folgt, dass $U - U =^"(1)" W$ und $U - U =^"(2)" tilde(W)$. 
$
==> W - tilde(W)
$
wir wissen: $ v + W = tilde(v) + W$
$
==> exists w in W: tilde(v) = u + w ==> tilde(v) - v = w in W
$
#endproof

#definition("6.7", "Dimension affiner Unterräume")[
  Sei $V$ ein $K$-Vektorraum und $U = v + W subset V$ ein affiner Unterraum. Dann ist
  $
  dim U = dim W
  $
  die Dimension von $U$. Dies ist wegen Satz 6.6 eine sinnvolle Definition. Satz 6.4 + Satz 6.3 liefern, dass 
  $
  dim cal(L)(A, b) = dim cal(L)(A, 0) = n - rg_S (A)
  $
] <def>

Damit folgt

#bold[Korollar 6.8:] Für $A in K^(n,n)$ und $b in K^n$ sind folgende Bedingungen äquivalent:
#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  #sspace
  1. #[
    Das LGS $A x = b$ ist eindeutig lösbar  

    Überlegung: 
    $
    cal(L)(A, b) = x^* + underbrace(cal(L)(A, 0), = {0})
    $
  ]


  2. $rg_S (A) = rg_S (A_"erw") = n$ 
]

#bold[Lemma 6.9:] Sind $A in K^(m, n)$, $b in K^m$ und $S in K^(m,m)$, so gilt 
$
cal(L)(A, b) subset.eq cal(L)(S A, S b)
$
Ist $S$ invertierbar, so gilt sogar 
$
cal(L)(A, b) = cal(L)(S A, S b)
$

#italic[Beweis:] Übungsaufgabe 
#endproof

== Der Gauß-Algorithmus

#bold[Bemerkung:]
#boxedlist[benannt nach Carl-Friedrich-Gauß (1777 - 1855)][
  Ein ähnliches Verfahren findet man in 
  #v(-6pt)
  #align(center, "'Neun Bücher zu arithmetische Technik' (ca. 200 v. Chr. in China)")
][
  siehe LR-(bzw LK) Zerlegung in der numerischen linearen Algebra
]
Wann ist ein LGS einfach lösbar?
wenn 

#figure(
  image("bilder/62_.jpeg", width: 80%)
  )

Diese Gestalt der Matrix $A$ heißt #bold[Treppennormalform] (wird auch als Echelon-Form oder normierte Zeilenstufenform bezeichnet).

Warum einfach?

Spaltenvertauschungen ändern den Rang nicht und können als Multiplikation mit einer invertierbaren Matrix interpretiert werden.

$==>$ Lösungsraum bleibt gleich

Dies liefert 
#figure(
  image("bilder/62_1.jpeg", width: 80%)
)

1. #[
  Es existiert genau eine Lösung, wenn
  $
  rg_S (A) = rg_S (A_"erw") space <==> b_(r+1) = ... = b_m = 0
  $
]
2. #[
  Mit $rg_S (A) = rg_S (A_"erw")$, dann ist eine spezielle Lösung gegeben durch 
  $
  &x^* in K^n space "mit" \
  &x^*_1 = b_1, ..., x_r^* = b_r, space x^*_(r+1) = ... = x_1^* = 0
  $
]
3. #[
  Für $b = 0 in K^m$ erhält man das zugehörige homogene Gleichungssystem
  $
  cal(L)(A, b) = x^* + cal(L)(A, 0)
  $
  Basis von $cal(L)(A, 0)$? $space dim cal(L)(A, 0) = n - r = n - rg_S (A)$

  $
  "Basisvektoren der Form:" wide vec(-a_(1 r + i), -a_(2 r + i), dots.v , -a_(r + r i), 0, 1, 0, dots.v, 0), wide i = 1, .., n-r, wide 1 "bei der" r+i"-ten Zeile"
  $
]
#bold[Deswegen:] Gegeben ist ein (LGS)

#bold[Ziel:] Umformung von (LGS), sodass die resultierende Matrix normalisierte Treppenstufen hat und sich die Lösungsmenge nicht ändert.

Dazu: Elementarmatrizen (geht auch für $R =$ kommutativer Ring mit $1$)

hier: $A in K^(m,n)$, $K$ Körper

#boxedlist[
  $m in NN$, $i,j in {1, ..., m}$, $I_m in K^(m,m)$ als Einheitsmatrix 
  #h(-2pt)
  $e_i corres$ $i$-ter Einheitsvektor
  #h(-2pt)
  $==> I_m = (e_1, e_2, ..., e_m)$
  ][
    #v(5pt)
    $E_(i j) = e_i e_j^top = mat(0_m, ..., 0_m, e_i, 0_m, ..., 0_m) in K^(m,m)$

    D.h. der Eintrag $(i, j)$ der Matrix $E_(i j)$ ist $1$, alle anderen Einträge sind $0$.
    ][
      für $m >= 2$, $i, j in {1, ..., m}$ und $i < j$ die Matrizen 
      $
P_(i j) = mat(e_1, ..., e_(i - 1), e_j, e_(i + 1), ..., e_(j -1), e_i, e_(j + 1), ..., e_m) in K^(m,m)
$
Die Matrix $P_(i j)$ ist eine Permutationsmatrix. D.h. multipliziert man $A in K^(m,n)$ mit $P_(i j)$, so werden die Zeilen $i$ und $j$ von $A$ vertauscht.

ohne Beweis, dafür ein Beispiel:
$
A = mat(1,2,3,4;5,6,7,8;9,10,11,12) space P_(1 2) = mat(0,1,0;1,0,0;0,0,1) ==> P_(1 2) dot A = mat(5,6,7,8;1,2,3,4;9,10,11,12)
$
$corres$ Zeilenumformung (Z1). $P_(i j) in "GL"_m (K)$

Analog: $tilde(e_i) in K^n$ Einheitsvektoren aus $K^n$

$tilde(P)_(i j) in K^(n,n)$ $corres$ Spaltenumformung (S1). $tilde(P)_(i j) in "GL"_n (K)$
][
  für $m>=2, i, j in {1, ..., m}$ und $i  <j$ sind die Matrizen 
  $
G_(i j) (lambda) = I_m + lambda E_(i j) = mat(e_1, ..., e_(j - 1), e_j + lambda e_i, e_(j+1), ..., e_m) in K^(m, m)
$
D.h. die $j$-te Spalte von $G_(i j) (lambda)$ ist $e_j + lambda e_i$. Multipliziert man $A in K^(m,n)$, so wird das $lambda$-fache der $i$-ten Zeile von $A$ zur $j$-ten Zeile von $A$ addiert. 

Das Produkt $space G_(i j) (lambda)^T dot A space$ bewirkt, dass das $lambda$-fache der $j$-ten Zeile zur $i$-ten Zeile von $A$ addiert wird.
]

#boxedlist[
  $lambda in K$, $i in {1, ..., m}$, $M_i (lambda) := (e_1, ..., e_(j-1), lambda e_i, e_(j + 1), ..., e_m) in K^(m,m)$
  $==>$ Multipliziert man $A$ von links mit $M_i (lambda)$, so wird die $i$-te Zeile von $A$ mit $lambda$ multipliziert $corres$ (Z2) für $lambda != 0$
]
#bold[Beobachtung:] $P_(i j), G_(i j) (lambda), M_i (lambda)$ sind für $lambda != 0$ invertierbar!

Damit: Beweis, dass $A x = b$ in einfachere Form gebracht werden kann, #bold[ohne] die Lösungsmenge zu ändern.

#bold[Satz 6.10:] Sei $K$ ein Körper und $A in K^(m,n)$. Dann existieren invertierbare Matrizen $S_1, ..., S_t$ $in K^(m,m)$ als Produkte der oben eingeführten Elementarmatrizen, so dass 
$
C := S_t dots.h.c S_2 S_1 A
$
in #bold[Treppennormalform] ist, d.h.
#figure(
  image("bilder/610_1.jpg", width: 100%)
)
Genauer: $C = (c_(i j))$ ist entweder die Nullmatrix oder es gibt eine Folge von natürlichen Zahlen $j_1, ..., j_r$ als Stufen der Treppennormalform mit $1<=j_1<j_2<...<j_r<=n$ und $1<=r<="min"{m,n}$, so dass 

#boxedlist[
  #text(fill: rgb("#82218B"))[$square.filled$] $c_(i j) = 0 space.third space "für" space 1 <= i <= r space space "und" 1<=j <j_i space space 1<=i<=r$ 
  ][
    #text(fill: rgb("#000276"))[$square.filled$] $c_(i j) = 0 space.third space "für" space 1<=i <= m space "und" 1<=j <=n$ 
    ][
      #text(fill: rgb("#7884A2"))[$square.filled$] $c_(i j_i) = 1 space "für" space 1<= i <= r$ 
      ][
        #text(fill: rgb("#7098DA"))[$square.filled$] $c_(l j_i) = 0 space "für" space 1<=l<j_i #h(12pt) 1 <=i <= r$ 
]

#bold[Bemerkungen:]

#boxedlist[
  Ist $n = m$, so ist $A in K^(n,n)$ genau dann invertierbar, wenn $C = I_n$, denn 

  "$<==$":
  $
I_n = C = underbrace(S_t dots.h.c S_1 A, =: A^(-1))
$

"$==>$": $A$ invertierbar und $S_1, ..., S_t$ invertierbar. Das Produkt von invertierbaren Matrizen ist invertierbar $==>$ $C$ invertierbar $==>$ $C$ kann keine Nullzeilen bzw. Spalten enthalten $==>$ $C = I_n$
]

#boxedlist[
  Da Spaltenvertauschungen den Spaltenrang einer Matrix nicht ändern (Lemma 5.31) ist nun folgende Definition sinnvoll:

  Der #bold[Rang einer Matrix] $rg(A)$ einer Matrix $A in K^(m,n)$ ist definiert als 
  $
  rg (A) = rg_S (A) =^"6.10" rg_Z (A) 
  $
  Außerdem folgt
  $
rg (A) = rg (A^top)
$
][
  Es gibt eine Verallgemeinerung der Treppennormalform für Matrizen über Ringen. Diese Hermit-Normalform spielt eine Rolle in der Zahlentheorie.
]

#italic[Beweis:] Ist $A = 0 in K^(m,n)$, dann folgt mit $S_1 = I_m, t=1$
$
S_1 A = 0 space checkmark
$
Für $A != 0$ sei $j_1$ der Index der ersten Spalte von 
$
A^((1)) = (a^((1))_(i j)) := A
$
die nicht aus lauter Nullen besteht. 
#v(-5mm)
#figure(
  image("bilder/610_2.jpeg", width: 40%)
)
#v(-5mm)
Sei $a^((1))_(i_1 j_1)$ das erste Element in dieser Spalte welches nicht Null ist.
#v(-5mm)
#figure(
  image("bilder/610_3.jpeg", width: 40%)
)
#v(-5mm)
Jetzt: Vertauschen der Zeilen $1$ und $i_1$ falls $i_1 > 1$ und normieren der ersten Zeile durch Multiplikation mit $(a^((1))_(i_1 j_1))^(-1)$ liefert eine $1$ an der Stelle $(1, j_1)$ 

#figure(
  image("bilder/610_4.jpg", width: 60%)
)

Anschließend werden alle Einträge unterhalb des Eintrags $(1, j_1)$ mit Wert $1$ eliminiert und man erhält  

#figure(
  image("bilder/610_56.jpeg", width: 100%)
)

mit $A^((2)) in K^(m-1, n-j_1)$. Ist $A^((2)) = ()$, d.h. $m-1 = 0, n-j_1 = 0$ oder $A^((2)) = 0$ $in K^(m-1, n -j_1)$, sind wir fertig, da $C := S_1 A$ in Treppenform ist und $t = 1$.

Ist mindestens ein Eintrag von $A_((2))$ ungleich Null, so führt man die obigen Schritte für die Matrix $A^((2))$ aus.

Für $k = 2, 3, ...$ werden die Matrizen $S_k$ rekursiv durch

#figure(
  image("bilder/610_78.jpeg", width: 40%)
)

wobei die Matrix $tilde(S)_k$ analog zu $S_1$ konstruiert wird. 

$S_k$ ist wieder ein Produkt von Elementarmatrizen. Dieses Verfahren bricht nach $r <= min{m,n}$ Schritten ab. Wenn entweder $A^((r+1)) = 0$ oder $A^((r+1)) = ()$. $==>$ Nach $r$ Schritten erhält man damit die Zeilenstufenform.

#figure(
  image("bilder/610_9.jpg", width: 60%)
)

#figure(
  image("bilder/610_10.jpg", width: 60%)
)
$
S = S_t dots.h.c S_1
$
#italic[Beweis:]

#figure(
  image("bilder/610_11.jpg", width: 40%)
)

#figure(
  image("bilder/610_12.jpg", width: 100%)
)

Nach $r$ Schritten

#figure(
  image("bilder/610_13.jpg", width: 60%)
)

Mit Einsen an Stellen $(1, j_1), (2, j_2), ..., (r, j_r)$. Gilt $r = 1$, so ist $S_1 A$ in normalisierter Treppenform. $checkmark$

Jetzt $r > 1$
$
==> "Einträge über den Einsen müssen den Wert 0 bekommen"
$
Dazu berechnet man rekursiv für $k = 2, ..., r$
$
R^((k)) = S_(r+k-1) "mit" \
S_(r+k-1) = G_(1, k) (-r^(k-1)_(1, j_k)) dot ... dot G_(k-1, k) (-r^(k-1)_(k-1, j_k)) 
$
$t = 2r-1$ ist dann die Matrix
$
C = S_t S_(t-1) dots.h.c S_1 A "in Treppennormalform"
$
#endproof

Zur Lösung von lin. Gleichungssystemen.
$
A x = b
S A x = S b
$
Auf dem Übungsblatt haben wir bewiesen
$
S in "GL"_m (K) ==> cal(L)(S A, S b) = cal(L)(A, b)
$
$==> A_"erw" = (A b)$. Dann wähle $S$, so dass $S A_"erw"$ die normalisierte Treppenform besitzt.

#figure(
  image("bilder/610_14.jpg", width: 60%)
)
$x_(j k) = tilde(b)_k wide k = 1, ..., r wide x_i = 0 "sonst"$

Eine Lösung existiert, wenn $tilde(b)_(r+1) = ... = tilde(b)_m = 0$.

#pagebreak()

= Determinanten von Matrizen

Sei $K$ ein Körper, $n in NN$. Die Determinante

#boxedlist[
  ist eine Abbildung, die jeder quadratischen Matrix $A in K^(n,n)$ ein Element aus $K$ zuorndet
  $
  det: K^(n,n) -> K 
  $
][
  liefert notwendige Bedingungen dafür, dass eine Matrix $A in K^(n,n)$ invertierbar ist.
][
  bildet die Grundlage für die Definition des charakteristischen Polynoms einer Matrix $A in K^(n,n)$ (siehe LinA II)
][
  trägt in der analytischen Geometrie zur Berechnung von Volumen einfacher Mengen bei.
][
  spielt eine wichtige Rolle in Transformationsformeln von Integralen in der Analysis mehrerer Verändlicher.
]

Gottfried Wilhelm Leibnitz (1646 - 1716) gab 1690 eine Formel zur Berechnung von Determinanten an. Karl Weierstraß (1815 - 1897) führte die Determinanten über axiomatische Eigenschaften ein. 

== Definitionen und grundlegende Eigenschaften

Zwei motivierende Beispiele: 

Lösung linearer Gleichungssysteme

#boxedlist[
  Gegeben sei ein lineares Gleichungssystem
  $
  a_(1 1) x_1 + a_(1 2) x_2 = b_1 wide &"I" \
  a_(2 1) x_1 + a_(2 2) x_2 = b_2 wide &"II"
  $
  Die Lösung für beliebige Werte der Koeffizienten?
  $
  a_(2 2) "I" - a_(1 2) "II" ==> \
  (a_(1 1) a_(2 2) - a_(1 2) a_(2 1)) x_1 = a_(2 2) b_1 - a_(1 1) b_2
  $
  Als Ausdruck für $x_1$ und 
  $
  a_(1 1) "II" - a_(2 1) "I" ==> \
  (a_(1 1) a_(2 2) - a_(1 2) a_(2 1)) x_2 = a_(1 1) b_2 - a_(2 1) b_1
  $
]

#box(width: 100%, inset: (left: 1cm, right: 1cm))[
  Mit der Abbildung $det: K^(2,2) -> K$ 
  $
  det(mat(a, b;c, d)) = a d - b c
  $
  erhält man die Lösungsformeln 

  $
  x_1 = det mat(b_1, a_(1 2); b_2, a_(1 2)) dot (det mat(a_(1 1), a_(1 2); a_(2 1), a_(2 2)))^(-1) \
  x_2 = det mat(a_(1 1), b_1; a_(2 1), b_2) dot (det mat(a_(1 1), a_(1 2); a_(2 1), a_(2 2)))^(-1)
  $
  Dies ist die sogenannte Cramersche Regel für $n = 2$. Sie kann für $n >= 2$ verallgemeinert werden.
  ACHTUNG: Man sollte die Cramersche Regel wirklich nie zur Lösung von linearen Gleichungssystem verwenden!
  $
  x_1 = det mat(b_1, a_(1 2); b_2, a_(2 2)) dot (det (A))^(-1) wide x_2 = det mat(a_(1 1), b_1; a_(2 1), b_2) dot (det (A))^(-1)
  $
  Warum ist die Cramersche Regel trotzdem interessant?

  $x_i$ berechenbar, wenn $det (A) != 0 in K$
  $
  det (A) = 0 <==> a_(1 1) a_(2 2) - a_(1 2) a_(2 1) = 0 \
    <==> a_(2 2) vec(a_(1 1), a_(1 2)) - a_(1 2) vec(a_(2 1), a_(2 2)) = vec(0 ,0)
  $
  D.h. die Spalten von $A$ sind linear abhängig $==> rg (A) < 2 ==>^"Korollar 6.8"$ es existiert keine eindeutige Lösung.
]

#boxedlist[
  Flächenberechnung für Parallelogramme: 

  Die Fläche eines Dreiecks ist gegeben durch
  $
  1/2 dot "Grundfläche" dot "Höhe"
  $
  Beweis z.B. durch das Cavalierische Prinzip, wobei 
  
  #box(width: 100%, inset: (left: 0.5cm, right: 0.5cm))[
    1. #[
      das Dreieck zu einem Parallelogramm ergänzt wird $#sspace$
      
      #figure(
        image("bilder/71_1.jpeg", width: 20%)
      )

    ]
    2. #[
      "Verschieben" des Parallelogramms zu einem Rechteck

      #figure(
        image("bilder/71_2.jpeg", width: 20%)
      )

    ]
  ]
]

#box(width: 100%, inset: (left: 1.5cm, right: 1.5cm))[
    Zur Beschreibung dieser Fläche in der Ebene nehmen wir an, dass sie durch zwei Vektoren
    $
    v = vec(a, b) wide w = vec(c, d), wide v, w in RR^2
    $
    gegeben ist.

    #figure(
      image("bilder/71_3.jpg", width: 60%) 
    )

    $
    v = rho v' = rho vec(cos beta, sin beta) wide w = sigma w' = sigma vec(cos alpha, sin alpha)
    $
    mit $rho, sigma > 0$. Bezeichnet $F$ bzw. $F'$ die Fläche des von $v$ und $w$ bzw. $v'$ und $w'$ aufgespannten Parallelogramms, so erhält man für $0 <= beta - alpha <= pi$, dass 
    $
    h' = sin(beta-alpha) = cos alpha sin beta - cos beta sin alpha \
    = det mat(cos alpha, sin alpha; cos beta, sin beta)
    $
    und damit auch 
    $
    F = rho sigma F' = rho sigma h' = rho sigma det mat(cos alpha, sin alpha; cos beta, sin beta) >= 0
    $
    Im Fall $sin(beta - alpha) >= 0$ entspricht die Fläche des Parallelogramms damit der skalierten Determinante.
]

#bold[Beobachtungen:]

#box(width: 100%, inset:(left: 1cm, right: 1cm))[
  1. #[

    $#sspace$

    #figure(
      image("bilder/71_4.jpeg", width: 100%)
    )
  ]
]

#box(width: 100%, inset:(left: 1cm, right: 1cm))[
  #box(width: 100%, inset:(left: 0.5cm, right: 0.5cm))[
    Auswirkungen auf die Fläche

    D.h. für $lambda, mu in RR$ sollte gelten
    $
    det vec(mu v, w) = mu det vec(v, w) space "sowie" space det vec(v, lambda w) = lambda det vec(v,w)
    $
    mit $v = mat(a, b)$ und $w = mat(c, d)$.
  ]
  2. #[
    Nach dem Cavalierischen Prinzip ist die Fläche unabhängig vom Scherungswinkel:

    #figure(
      image("bilder/71_5.jpg", width: 50%)
    )

    D.h. für $lambda in RR$ sollte gelten
    $
    det vec(v, w) = det vec(v, w + lambda v)
    $
    für $v = mat(a, b)$ und $w = mat(c, d)$.
  ]
  3. #[
    #v(5pt)
    #figure(
      image("bilder/71_6.jpg", width: 20%)
    )
    #v(-5pt)

    Fläche $1 ==>$
    $
    det vec(e_1^top, e_2^top) = det mat(1,0;0,1) = det I_2 = 1
    $
  ]
  4. #[
    $-->^w -->^v "oder" <--^w -->^v space ==> det vec(v,w) = 0$
  ]
]

Basierend auf diesen Beobachtungen:

#definition("7.1", "Determinante")[
  Eine Abbildung
  $
  det: K^(n,n) -> K, space A arrow.bar det (A)
  $
  heißt #bold[Determinante] falls gilt:

  #bold[D1.] $det$ ist linear in jeder Zeile, d.h. für jeden Index $i in {1, ..., n}$ gilt

  1. #[
    Ist $a_i = a_i^' + a_i^('')$ so ist $#sspace$
    $
    det vec(dots.v, a_i, dots.v) = det vec(dots.v, a_i^', dots.v) + det vec(dots.v, a_i^'', dots.v)
    $
  ]
  2. #[
    Ist $a_i = lambda a_i^'$ für $lambda in K$, so ist
    $
    det vec(dots.v, a_i, dots.v) = lambda det vec(dots.v, a_i^', dots.v)
    $
  ]

  #bold[D2.] $det$ ist #bold[alternierend], d.h. hat $A$ zwei gleiche Zeilen, so gilt $det (A) = 0$

  #bold[D3.] $det$ ist normiert, d.h. $det (I_n) = 1$
] <def>

#bold[Bemerkung:] 

#boxedlist[
  Definition ist sehr einfach, aber sehr mächtig, siehe D4 - D13
][
  Existenz und Eindeutigkeit einer solchen Abbildung sind noch zu zeigen.
]

#bold[Satz 7.2:] Eine Determinante
$
det: K^(n,n) |-> K 
$
hat die folgenden weiteren Eigenschaften:

#bold[D4.] Für jedes $lambda in K$ gilt $det (lambda A) = lambda^n det (A)$

#bold[D5.] Ist eine Zeile von $A$ gleich 0, so gilt $det (A) = 0$

#bold[D6.] Ist $B$ eine Matrix die aus $A$ durch Zeilenvertauschungen entsteht (Z1), so gilt $det (B) = - det (A)$

#bold[D7.] Ist $lambda in K$ und entsteht $B$ aus $A$ durch Addition der $lambda$-fachen $j$-ten Zeile zur $i$-ten Zeile  ($i!=j$) (Z2+Z3) so ist $det B = det A$

#bold[D8.] Ist $A$ eine obere Dreiecksmatrix
$
A = mat(lambda_1,ast,ast;0,dots.down,ast;0,0,lambda)
$
so ist $det A = lambda_1 dot ... dot lambda_n$ #text(fill: red, size:24pt)[!]

#bold[D9.] Ist $n >= 2$ und $A in K^(n,n)$ von der Gestalt 
$
A = mat(A_1, B; 0, A_2)
$
wobei $A_1$ und $A_2$ quadratisch sind, d.h. $A_1 in K^(n_1, n_1)$ und $A_2 in K^(n_2,n_2)$ mit $n_1 + n_2 = n$, so gilt $det A = det A_1 dot det A_2$

#bold[D10.] $det A = 0$ ist äquivalent zu $rg A < n$

#bold[D11.] Für Matrizen $A, B in K^(n,n)$ gilt der Determinanten-Multiplikationssatz, d.h.
$
det (A dot B) = det A dot det B
$
Insbesondere gilt damit für $A in "GL"_n (K)$, dass $det A^(-1) = (det A)^(-1)$.

#bold[D12.] $det A^top = det A$. D.h. die obigen Aussagen für Zeilen gelten analog für Spalten.

#bold[D13.] #bold[Achtung:] Für Matrizen $A, B in K^(n,n)$ ist im Allgemeinen $det (A+B) != det A + det B$

#italic[Beweis:] D4 und D5 folgen direkt aus D1.

#bold[D6.] O.B.d.A $i<j$. Dann gilt wegen D1.1 und D2
$
det A + det B = det vec(dots.v, a_i, dots.v, a_j, dots.v) + det vec(dots.v, a_j, dots.v, a_i, dots.v) \
= underbrace(det vec(dots.v, a_i, dots.v, a_i, dots.v), = 0) + det vec(dots.v, a_i, dots.v, a_j, dots.v) - det vec(dots.v, a_j, dots.v, a_i, dots.v) - underbrace(det vec(dots.v, a_j, dots.v, a_j, dots.v), = 0) \
=^"D1.1" det vec(dots.v, a_i, dots.v, a_i + a_j, dots.v) + det vec(dots.v, a_j, dots.v, a_i + a_j, dots.v) =^"D1.1" det vec(dots.v, a_i + a_j, dots.v, a_i + a_j, dots.v) =^"D2" 0
$

#bold[D7.] O.B.d.A $i<j$. Wegen D1 und D2 gilt 
$
det B = det vec(dots.v, a_i + lambda a_j, dots.v, a_j, dots.v) =^"D1.1" det vec(dots.v, a_i, dots.v, a_j, dots.v) + det vec(dots.v, lambda a_j, dots.v, a_j, dots.v) = det A + lambda underbrace(det vec(dots.v, a_j, dots.v, a_j, dots.v), = 0) =^"D2" det A
$

#bold[D8.] Sind alle $lambda_i != 0$, so folgt durch wiederholte Anwendung von D7, dass
$
det A = det mat(lambda_1, 0, 0; 0, dots.down, 0;0,0,lambda_n) =^"D1.2" lambda_1 dot ... dot lambda_n dot underbrace(det I_n, = 1 "(D3)")
$
Gibt es ein $lambda_i = 0$, so wählen wir $i$ maximal, d.h. $lambda_(i + 1) != 0, ..., lambda_n != 0$. Dann kann der Rest der $i$-ten Zeile, also $a_(i i + 1), ..., a_(i n )$ auf den Wert Null gebracht werden. Mit D7 folgt, dass dies die Determinante nicht ändert. Damit erhalten wir eine Nullzeile und aus D5 folgt dann $det A=0$

#bold[D9.] $A_1 in K^(n_1, n_1)$. Mit den Zeilenumformungen (Z1), (Z2)+(Z3) kann $A_1$ zu einer oberen Dreiecksmatrix $C_1$ umgeformt werden. Es gilt mit D6 und D7 dass $det A_1 = (-1)^k det C_1$
$
mat(A_1, B;0, A_2) --> mat(C_1, tilde(B);0, A_2) 
$
Also ist $A_2$ unverändert.

Dann erzeugt man wieder mit (Z1), (Z2)+(Z3) aus $A_2$ eine obere Dreieckmatrix $C_2$, dabei bleiben $C_1$ und $tilde(B)$ unverändert und es gilt
$
det A_2 = (-1)^l  det C_2 
$
Für 

#figure(
  image("bilder/72_1.jpg", width: 60%)
)

mit $C_1, C_2$ obere Dreieckmatrizen gilt
$
det C = det C_1 dot det C_2 \
det A = (-1)^(k + l) det C = (-1)^(k+l) det (C_1) dot det (C_2) \
= (-1)^(k+l) (-1)^k det (A_1) (-1)^l det (A_2) = (-1)^(2k+2l) det (A_1) dot det (A_2) \ 
= det (A_1) dot det (A_2)
$

#bold[D10.] Durch Zeilenumformungen (Z1), (Z2)+(Z3) bringen wir $A$ auf Zeilenstufenform
$
B = mat(lambda_1, ast, ast;0, dots.down, ast;0,0,lambda_n)
$
Wegen D6+D7 gilt $det (A) = plus.minus det (B)$. Weiter ist $rg (A) = rg (B)$ (Lemma 5.31). Aus D8
$
rg (B) = n <==> det (B) = lambda_1 dot ... dot lambda_n != 0
$

#bold[D11.] Ist $rg (A) < n$, so ist $rg (A dot B) < n$ (siehe Übungsaufgabe). Damit erhält man aus D10 
$
0 = 0
$
Ist $rg (A) = n ==> A in "GL"_n (K)$. Dann gibt es nach Satz 6.10 invertierbare Matrizen

Satz 6.10: $C = S_t dots.h.c S_1 A$ in Treppennormalform

$==> C = I_n$

$==> A = S_1^(-1) dots.h.c S_(t-1)^(-1) S_t^(-1) I_n wide (*)$

$==>^"D3" det I_n = 1$

$S_i$ $corres$ Produkt von $G_(i j) (lambda), M_i (lambda), P_(i j)$ $==>$ $S_i^(-1) corres$ Produkt von $G_(i j)^(-1) (lambda), M_i^(-1) (lambda), P_(i j)^(-1)$

Sei $D in K^(n,n)$, dann gilt 
$
det (underbrace(G_(i j)^(-1) (lambda) D, *)) = space ?
$
$*$: Subtrahieren eines Vielfachen einer Zeile von einer anderen
$
det (G_(i j)^(-1) (lambda)) =^"D7" det I_n = 1 \
tilde(D) = G_(i j)^(-1) (lambda) D ==> det (tilde(D)) =^"D7" det D \
==> det (G_(i j)^(-1) (lambda) D) = det (G_(i j)^(-1) (lambda)) dot det (D) = det (D)
$
Analog folgt:
$
det (P_(i j)^(-1) (lambda) D) = underbrace(det (P_(i j)^(-1) (lambda)), -1) dot det (D) \
det (M_i^(-1) (lambda) D) =^"D1.2" det (M_i^(-1) (lambda)) dot det (D)
$
induktiv folgt: $det (S_i^(-1) D) = det (S_i^(-1)) dot det (D) wide (star)$ 
$
==> det (A) = det (S_1^(-1)) dot dots.h.c dot det(S_t^(-1)) dot 1 \
==> det (A dot B) =^((*)) det (S_1^(-1) dot dots.h.c dot S_t^(-1) B) \  
=^((star)) det (S_1^(-1)) dot dots.h.c dot det (S_t^(-1)) dot det (B) \
= det (A) dot det (B)
$

$A in "GL"_n (K) ==> exists A^(-1): A dot A^(-1) = I_n$
$
1 =^"D3" det (I_n) = det (A dot A^(-1)) = det (A) dot det (A^(-1)) \
==> det (A^(-1)) = (det (A))^(-1)
$

#bold[D12.] $rg (A) < n$:

Mit Lemma 5.31: $rg (A^top) < n$ (Zeilenrang = Spaltenrang)

Mit D10 folgt: $det (A) = 0 = det (A^top)$

Sei $rg (A) = n$ und sei $A$ wie in D11: 
$
A = S_1^(-1) dot dots.h.c dot S_t^(-1)
$
Dann gilt 
$
det (A^top) = det (S_t^(-top) dot S_(t-1)^(-top) dot dots.h.c dot S_1^(-1)) =^"D11" det (S_t^(-top)) dot det (S_(t-1)^(-top)) dot dots.h.c dot det (S_1^(-1))
$
induktiv und analog zu oben folgt:
$
det (S_t^(-top)) = det (S_t^(-1)) \
==> det (A^t) = det (S_t^(-top)) dot dots.h.c dot det (S_1^(-1)) \
=^"D11" det (S_t^(-1) dot dots.h.c dot S_1^(-1)) = det (A) 
$

#bold[D13.] Für $K = RR, A = I_2, B = I_2$

d.h. $A, B in RR^(2,2)$. Dann gilt: 
$
det (A + B) = det (0_(2 times 2)) =^"D8" 0 \
det (A) + det (B) = 1 + 1 = 2 space.thin arrow.zigzag
$
#endproof

#bold[Beispiel 7.3:] Berechnung einer Determinante

Für $A in RR^(n,n)$ kann man eine Determinante berechnen, indem man $A$ auf obere Dreiecksgestalt bringt.
$
A = mat(1,2,0;1,4,1;1,-2,2) --> A_1 = mat(1,2,0;0,2,1;0,-4,2) = G_(3 1) (-1) G_(2 1) A
$
($->$ von Zeile 3 wird Zeile 1 mit $-1$ abgezogen)
$
==> det (A_1) = ^"D8" underbrace(det (G_(3 1) (-1)), = 1) dot underbrace(det (G_(2 1) (-1)), = 1) dot det (A) \
A_2 = mat(1,2,0;0,2,1;0,0,4) = G_(3 2) (2) dot A_1
$
$
8 = det (A_2) = det (G_(3 2) (2)) dot det (A_1) = underbrace(det (G_(3 2) (2)), = 1) dot det (A)
$

== Existens und Eindeutigkeit

#bold[Frage:] Ist die Berechung der Determinante eindeutig? Oder hängt sie von der Reihenfolge der Zeilenumformungen ab?

#definition("7.4", "Permutation")[
  Sei $n in NN$. Eine bijetkive Abbildung $#sspace$
  $
  sigma: {1, 2, ..., n} -> {1, 2, ..., n}, space j arrow.bar sigma(j)
  $
  heißt #bold[Permutation] der Zahlen ${1, ..., n}$. Die Menge aller dieser Abbildungen nennt man $S_n$ und man schreibt eine Permuatation $sigma in S_n$ in der Form 
  $
  [sigma(1) space space sigma(2) space space dots space space sigma(n)]
  $
] <def>

#bold[Frage:] Gilt für ein gegebenes $sigma in S_n$ und 
$
I_sigma = vec(e^top_(sigma(1)), dots.v, e^top_(sigma(n)))
$
$det (I_sigma) = plus.minus 1 space.thin$?

#definition("7.5", "Transposition")[
  Seien $n in NN$, $n >= 2$. Eine Permutation $cal(T) in S_n$ heißt #bold[Transposition], wenn $cal(T)$ nur zwei Elemente aus ${1,2, ..., n}$ vertauscht und alle andere unverändert bleiben. D.h. es existieren $k, l in {1, ..., n}$ so, dass 
  $
  cal(T) (K) = C,   cal(T) (C) = K, cal(T) (i) = i wide i in {1, ..., n} without {k, l}
  $
] <def>

#bold[Lemma 7.6:] Ist $n >= 2$, so existieren zu jedem $sigma in S_n$ Transpositionen $cal(T)_1, ..., cal(T)_k in S_n$ mit 
$
sigma = cal(T)_1 circ cal(T)_2 circ dots circ cal(T)_k
$

#italic[Beweis:] Ist $sigma = id$ und $cal(T)$ eine Transposition, dann gilt 
$
id = sigma = cal(T) circ cal(T)
$
Ist $sigma != id$, so existiert ein $i_1 in {1, ..., n}$ mit 
$
sigma(i) = i space "für" space i = 1, ..., i_1 - 1 space "und" space sigma(i_1) > i_1
$
Sei $cal(T)_1$ die Transposition, die $i_1$ mit $sigma(i_1)$ vertauscht und $sigma_1 := cal(T)_1 circ sigma$

Dann gilt
$
sigma_1 (i) = i space "für" space i = 1, ..., i_1
$
Ist $sigma_1 = id$ so gilt $sigma = cal(T)_1^(-1) = cal(T)_1$, sonst existiert ein $i_2$ mit $i_2 > i_1$ und 
$
sigma_1 (i) = i space "für" space i = 1, ..., i_2 - 1 space "und" space sigma_1 (i_2) > i_2
$
induktiv erhält man $k <= n$ Transpositionen
$
&cal(T)_1, ..., cal(T)_k space "mit" \
&sigma_k = cal(T)_k circ dots circ cal(T)_1 circ sigma = id \
==> &sigma = cal(T)_1^(-1) circ dots circ cal(T)_k^(-1) = T_1 circ dots circ T_k 
$
#endproof

Die Transpositionen sind nicht eindeutig bestimmt! Für die Entscheidung über das Vorzeichen 
$
det (I_sigma) = plus.minus 1
$
müssen wir zeigen, dass die Anzahl der Transpositionen immer gerade oder immer ungerade ist.

#definition("7.7", "Fehlstand")[
  Seien $n in NN$, $n >= 2$ und $sigma in S_n$. Ein Paar $(i, j) in N times N$ mit $1 <=i < j <=n$ und $sigma (i) > sigma (j)$ nennt man #bold[Fehlstand] von $sigma$. Ist $k$ die Anzahl der Fehlstände von $sigma$, so heißt $sgn (sigma)$ das #bold[Signum] oder Vorzeichen von $sigma$. Für $n = 1$ setzt man $sgn([1]) := 1 = (-1)^0$
] <def>

#bold[Beobachtung:] Für $sigma = [3 space space 2 space space 1]$ ($3 = sigma(1), 2 = sigma(2), 1 = sigma(3)$) gilt
$
product_(1 <= i < j <= n) (sigma(j) - sigma(i))/(j - i) = (2-3)/(2-1) dot (1-3)/(3-1) dot (1-2)/(3-2) = (-1)^3 = -1 = sgn (sigma)
$

Diese Eigenschaft kann man allgemein beweisen:

#bold[Lemma 7.8:] Seien $n in NN$ und $sigma in S_n$. Dann gilt 
$
sgn (sigma) = product_(1 <= i < j <= n) (sigma(j)- sigma(i))/(j -i )
$
#italic[Beweis:]

$n = 1:$ Wegen der Definition von $sgn$ und der Definition des leeren Produktes folgt $1 = 1$.

$n > 1:$ Sei $sgn (sigma) = (-1)^k$, d.h. die Anzahl der Fehlstände ist $k$. Dann gilt
$
product_(1 <= i < j <= n) (sigma(j) - sigma(i)) = (-1)^k product_(1<= i < j <=n) (sigma(j) - sigma(i)) \
= (-1)^k product_(1 <= i < j <= n) (j -1)
$
Bei diesen letzten Gleichungen verwendet man, dass die beiden Produkte bis auf die Reihenfolge die gleichen Faktoren enthalten.
#endproof

#bold[Satz 7.9:] Seien $n in NN$ und $cal(T), sigma in S_n$. Dann gilt
$
sgn (cal(T) circ sigma) = sgn (cal(T)) dot sgn (sigma)
$
#italic[Beweis:] Wegen Lemma 7.8 gilt:
$
sgn (cal(T) circ sigma) = product_(1 <= i < j <= n) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(j - i) \
= underbrace(product_(1 <= i < j <= n) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(sigma(j) - sigma(i)), = sgn (cal(T)) space ?) underbrace(product_(1 <= i < j <= n) (sigma(j) - sigma(i))/(j-i), = sgn (sigma)) \
$ 
zu zeigen: ? (s.o.)
$
product_(1 <= i < j <= n) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(sigma(j) - sigma(i)) = limits(product_(1 <= i < j <= n))_(sigma(i)<sigma(j)) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(sigma(j) - sigma(i)) limits(product_(1 <= i < j <= n))_(sigma(i) > sigma(j)) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(sigma(j)- sigma(i)) \
= limits(product_(1 <= i < j <= n))_(sigma(i)-sigma(j)) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(sigma(j) - sigma(i)) limits(product_(1 <= i < j <= n))_(sigma(i) < sigma(j)) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(sigma(j)- sigma(i)) = limits(product_(1 <= i < j <= n))_(sigma(i)<sigma(j)) (cal(T)(sigma(j)) - cal(T)(sigma(i)))/(sigma(j) - sigma(i))
$

