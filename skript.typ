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
