#import "utils.typ": *
#import "template.typ": uni-script-template
#show: doc => uni-script-template(
  title: [Vorlesungsskript],
  author: [Konrad Rösler],
  module-name: [Num. Lin. Algebra],
  doc
)

= Einleitung

Wichtige Aufgabenklassen der linearen Algebra sind #bold[lineare Gleichungssysteme].

Gegeben: $A in RR^(m times n), b in RR^m$

Gesucht: Ein/alle $x in RR^m$ mit $A x = b$

Herkunft: 

#boxedlist[
  "direkt" aus der Anwendung, z.B. Beschreibung von Netzwerken, Tragwerk
][
  "indirekt" als Diskretisierung von stationären Prozessen, z.B. Belastung einer Membran
][
  "mittelbar" durch die Linearisierung nichtlinearer Modelle, z.B. Newton-Verfahren, Approximation von Lösungen gewöhnlicher DGL, notwendige Optimalitätsbedingungen
]

Klassifizierung:

#boxedlist[
  $m = n$: $A$ quadratisch

  Generische Situation: $A$ regulär
  
  $==> exists!$ Lösung
][
  $m < n$: "Unterbestimmtes System"

  Generische Situation:
  $
  rg(A) = m "(Vollrang)" \
  A corres [ A_1 A_2 ] quad A_1 in RR^(m times m)
  $
  Lösungsmenge:
  $
  cal(L) = { x in RR^n | A x = b } = { x = x^+ + h, h in ker(A) }
  $
  $=$ ($n-m$)-dimensionale lineare Mannigfaltigkeit

  Gesucht ist dann z.B. norm-minimale Lösung (Kap. 5)
]

#boxedlist[
  $m > n$: "Überbestimmtes System"
  $
  "lösbar" <==> b in im(A) = { y in RR^m | exists x: A x = y }
  $
  Generisch nicht lösbar!

  Sinnvoll: Bestimme $macron(x) in RR^m$, so dass 
  $
  norm(A macron(x) - b) = min_(x in RR^m) norm(A x - b)
  $
  $norm(space)$ $corres$ geeignete Norm, $macron(x)$ $corres$ Bestapproximierender für diese Norm. 

  Mögliche Ansätze:

  #boxedlist[
    $norm(space)_oo$: $norm(A x - b)_oo = max_(1 <= i <= m) abs((A x - b)_i)$

    Ein nichtglattes Optimierungsproblem auch als lineares Optimierungsproblem fomulierbar, schwierig zu lösen für $m$ bzw. $n$ groß.
  ][
    $norm(space)_1$: $norm(A x - b)_1 = sum_(i=1)^m abs(A x - b)$

    Wie bei $norm(space)_oo$ stückweise lineares Optimierungsproblem. 
    
    Aber stabil gegen Ausreißer.
  ][
    $norm(space)_2$: $norm(A x - b)_2^2 = sum_(i=1)^m ((A x - b)_i)^2$

    $corres$ lineares Quadratmittelproblem, kleinste Quadrateproblem (Kap. 5)
  ]
]

Verfahren zur Lösung von LGS:

Direkte Verfahren:

#boxedlist[
  Transformation der Daten $(A, b)$ in endlich viele in ein leichter zu lösendes LGS $tilde(A) x = tilde(b)$ $corres$ CG-Verfahren
][
  Transformationen lassen sich oftmals als Faktorisierung von $A$ interpretieren
  $
  A = L dot R quad "bzw." quad A = Q dot R
  $
][
  Dafür i.d.R. Zugriff auf Elemente von $A$ $==>$ limitiert die Größe der Matrix!
]

Kap. 2-5

Indirekte Verfahren:

#boxedlist[
  Ausgehend von einem Startvektor $x^0$ Iteration zur Berechnung von $x^k$ mit $A x^k approx b$

  Hierbei wird oftmals nur das Matrix-Vektor-Produkt $A v$ benötigt! (Kap. 6)
][
  Eigenwertprobleme

  Stabilitätsanalyse von Bauwerken. Verfahren dazu: numerische Optimierung
]

#pagebreak()

= Das Gauß-Verfahren I

Jetzt: $A in RR^(m times n), b in RR^n, quad x: A x = b$?

#theorem("2.1")[
  #bold[Existenz und Eindeutigkeit einer Lösung]

  Sei $A in RR^(m times n)$ eine Matrix mit $det(A) != 0$ und $b in RR^n$. Dann existiert genau ein $x in RR^n$ mit 
  $
  A x = b
  $
]

#startproof lineare Algebra
#endproof

$==>$ Anwendung von Algorithmen zur Berechnung von $x$ sinnvoll! Wie?

== Gaußsche Eliminationsverfahren und LR-Zerlegung

$corres$ direktes Verfahren für quadratische System

Erste Idee: Systeme spezieller Struktur, z.B.
$
R x = c, quad R = mat(r_(1 1), ..., r_(1 n);0,dots.down,dots.h;0,0,r_(n n)) in RR^(n times n), quad c = vec(c_1, dots.v, c_n) in RR^n
$
$R x = c$ 
$
&r_(n n) x_n = c_n ==> x_n = c_n / r_(n n), quad r_(n n) != 0 \
&r_(n-1 n-1) x_(n -1) + r_(n-1 n) x_n = c_(n-1) \
&x_(n-1) = (c_(n-1) - r_(n-1 n) x_n)/r_(n-1 n-1), quad r_(n-1 n-1) != 0
$

#pagebreak()

#bold[Algorithmus 2.2:] Rückwärtssubsitution 
$
x_n = c_n / r_(n n) quad "falls" r_(n n) != 0 \
dots.v \
x_i = (c_i - sum_(j = i+1)^n r_(i j) x_j) / r_(i i) quad "falls" r_(i i) != 0 \
dots.v \
x_1 = (c_1 - sum_(j = 2)^n r_(1 j) x_j) / r_(1 1) quad "falls" r_(1 1) != 0
$
Algo. 2.2 anwendbar, wenn $det(R) != 0$ (vgl. Theo. 2.1)

Wichtiger Aspekt dieser Vorlesung: Aufwandsabschätzung

Aufwand: $i$-te Zeile je $n-i$ Additionen und Multiplikationen und 1 Division

insgesamt:
$
sum_(i = 1)^n (i-1) = (n(n-1))/2 = cal(O)(n^2)
$
Addition und Multiplikationen und $n$ Divsionen.

#bold[Landau-Symbol:] $cal(O)(.)$
$
f(n) = cal(O)(g(n)) <==> exists c > 0: abs(f(n)) <= C abs(g(n))
$
Für ein lineares Gleichungssystem der Form
$
L x = z, quad L = mat(l_(1 1),,0;dots.v,dots.down,;l_(n 1), ..., l_(n n)) in RR^(n times n) quad z in vec(z_1, ..., z_n) in RR^n
$
gibt es einen analogen Algorithmus:
$
x_1 = z_1 / l_(1 1) quad l_(1 1) != 0 \
dots.v \
x_n = (z_n - sum_(i = 1)^(n-1) l_(n i) x_i )/l_(n n) quad l_(n n) != 0
$
$==>$ Vorwärtssubstitution mit gleichem Aufwand $cal(O)(n^2)$

Lösungsidee für ein allgemeines Gleichungssystem:

Faktorisiere $A = L dot R$ und berechne die Lösung $x$ von $A x = b$ durch
$
A x = L underbrace(R x, =: z) = b \
L z = b ==> z = L^(-1) b space "Vorwärtssubstitution" \
R x = z ==> x = R^(-1) z space "Rückwärtssubstitution" 
$
Mit Aufwand: $cal(O)(n^2)$

Frage: Wie berechnet man Zerlegung $A = L dot R$

Man generiert eine Folge von Matrizen:
$
A = A^((1)) --> A^((2)) --> ... --> A^(n) = R
$
von Matrizen der Gestalt 
$
A^((k)) = mat(a_(1 1)^((1)), ..., ..., ..., ...,a_(1 n)^((1));0,a_(2 2)^((2)), ..., ..., ..., a_(2 n)^((2));,0,dots.down,,,dots.v;,,0,a_(k k)^((k)),...,a_(k n)^((k));,,,dots.v,,dots.v;,,,a_(n k)^((k)), ..., a_(n n)^((k)))
$
Wie?

Sei $x = (x_1, ..., x_n)^T in RR^(n), x_k != 0 corres$ $k$-Spalte

Definiere: $l_(j k) = x_j/x_k$
$
l_k = (underbrace(0\, ...\, 0, k "mal"), l_(k+1 k), ..., l_(n k))^T
$
$e_k = k$-ter einheitsvektor
$
L_k = I_n - l_k e_k^T in RR^(n times n)
$
Dann gilt 
$
L_k x = mat(1,,,,0;,dots.down,,,;,,1,,;,,-l_(k+1 k),dots.down,;,,dots.v,,;,,-l_(n k),,1) vec(x_1, dots.v, x_n) = vec(x_1, dots.v, x_k,0, dots.v, 0)
$
Jeder Eliminationsschritt $A^((k)) --> A^((k+1))$ lässt sich damit als Multiplikation mit einer Matrix $L_k in RR^(n times n)$ von links
$
A^(k+1) = L_k A^((k)) = mat(I_k,,0;0,*,I_(n-k)) mat(A_(1 1)^((k)), A_(1 2)^((k)); A_(2 1)^((k)), A_(2 2)^((k))) = mat(A_(1 1)^((k)), A_(1 2)^((k));0,A_(2 2)^((k+1))) quad * in RR^(n-k,1)
$
Eine Matrix der Gestalt $L_k$ heißt Frobeniusmatrix $->$ weitere Eigenschaften siehe Übung .

Der Eliminationsschritt ist genau dann durchführbar wenn $a_(k k)^((k)) != 0$ gilt. Angenommen, dies gilt, dann erhält man
$
L_n dots.c L_2 L_1 A = R
$
#line(length: 1cm, stroke: 1pt)
$
A = underbrace(L_1^(-1) dots.c L_(n-2)^(-1) L_(n-1)^(-1), =: L) R
$
Induktiv beweißt man
$
L = L_1^(-1) dots.c L_(n-1)^(-1) = mat(1,,,,0;l_(2 1),dots.down,,;dots.v,l_(3 2),dots.down,,;dots.v,dots.v,,,;dots.v,dots.v,,dots.down,;l_(n 1),l_(n 2),...,l_(n n-1),1)
$
Durch diese Struktur kann der Speicherplatz für $A$ zum Speichern von $L$ und $R$ genutzt werden!

#bold[Algorithmus 2.3: $L R$-Zerlegung]

Gegeben: $A in RR^(n times n)$

#align(center, box(radius: 10pt, inset: 0.25cm, fill: rgb(210,210,210), [
#set text(size: 11pt)
$
&"for" i = 1,...,n-1 \
&quad "for" j = i, ..., n \
&quad quad "for" k=1,...,i-1 \
&quad quad quad a_(i j) = a_(i j) - a_(i k) * a_(k j) \
&quad quad "end" \
&quad "end" \
&quad "for" j = i+1, ..., n \
&quad quad "for" k = 1, ..., i-1 \
&quad quad quad a_(j i) = a_(j i) - a_(j k) * a_(k i) \
&quad quad "end" \
&quad quad a_(j i) = a_(j i) / a_(i i) \
&quad "end" \
&"end"
$
]))

Aufwand für die Dreieckszerlegung $A = L dot R$

\#Operationen =
$
sum_(i = 1)^(n-1) ((n-i)^2 + (n-i)) 1/3 n^3 - 1/2 n^2 + 1/6 + 1/2 n^3 - 1/2 n \ 
= 1/3 n^3 + cal(O)(n^2) = cal(O)(n^3)
$
$==>$ kubischer Aufwand! Nur akzeptabel für moderates $n$!

#bold[Algorithmus 2.4: Gaußsche Eliminationsverfahren]

Gegeben: $A in RR^(n times n)$, $b in RR^n$

1) Berechne $A = L dot R$ #h(1cm) #h(5mm) $cal(O)(n^3)$

2) Berechne $z$ aus $L z = b$ #h(10mm) $cal(O)(n^2)$

3) Berechne $x$ aus $R x = z$ #h(8.5mm) $cal(O)(n^2)$

$==>$ Gesamtaufwand (Operationen): $cal(O)(n^3)$, (Speicherplatz): $n^2 + n$

Vorteil der Faktorisierung:

Zerlegung (teuer) kann für mehrere rechte Seiten nachgenutzt werden.

== Pivot-Strategien

#bold[Beispiel 2.5:] Algo 2.4 kann selbst für einfache Schritte scheitern:
$
A x = b, quad x = vec(w, z), quad A = mat(0,1;1,0), quad det(A) = -1, quad b = vec(c, e)
$
$==> a_11 = 0 quad arrow.zigzag$

Bei der völlig äquivalenten Formulierung
$
tilde(A) tilde(x) = tilde(b), quad tilde(x) = vec(w, z), quad tilde(A) = mat(1,0;0,1), quad det(tilde(A)) = 1, quad tilde(b) = vec(e, c)
$
funktioniert Algo 2.4 mit 
$
tilde(A) = I_2 = L dot R \
L = I_2 quad R = I_2
$
$==>$ Zeilenvertauschung in $A$ und der rechten Seite, #bold[nicht] in $x$ bzw. $tilde(x)$!

Die $L R$-Zerlegung versagt nicht nur bei verschwindenen Diagonalelementen, sondern auch wenn diese betragsmäßig klein im Vergleich zu den restlichen Elementen sind. 

$arrow.squiggly$ Praktikum, Fehlertheorie (Kap. III)
