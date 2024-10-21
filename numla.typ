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
R x = c, quad R = mat(r_(1 1), ..., r_(1 n);0,dots.down,dots.h;0,0,r_(m n)) in RR^(n times n), quad c = vec(c_1, dots.v, c_n) in RR^n
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
