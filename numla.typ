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
$e_k = k$-ter Einheitsvektor
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
&"for" i = 1,...,n \
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
sum_(i = 1)^(n-1) ((n-i)^2 + (n-i)) = 1/3 n^3 - 1/2 n^2 + 1/6 n + 1/2 n^2 - 1/2 n \ 
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

#bold[Algorithmus 2.6: $L R$-Zerlegung mit Spaltenpivotisierung]

1. $k = 1, A^((1)) = A$
2. #[
Spaltenpivotisierung

Bestimme $p in {k, ..., n}$ so, dass
$
abs(a_(p k)^((k))) >= abs(a_(j k)^((k))) "für" j = k, ..., n
$
]
3. #[
Vertausche die Zeilen $p$ und $k$ durch
$
A^((k)) --> tilde(A)^((k)) space "mit" space tilde(a)_(i j)^((k)) = cases(a_(k j)^((k)) quad "falls" i = p, a_(p j)^((k)) quad "falls" i = k, a_(i j)^((k)) quad "sonst")
$
]
4. #[
Führen der Eliminationsschritte
$
tilde(A)^((k)) --> A^((k+1)) quad "setzte" k = k+1
$
]
5. #[
Falls $k = n$ STOP

Sonst gehe zu 2.
]

Alternative Pivotisierungsstrategien:

#boxedlist[
  Zeilenpivotisierung und Spaltentausch
][
  vollständige Pivotisierung, d.h. Suche des betragsmäßig größten Elements in der Restmatrix 
]

#bold[Aufwand:]

#boxedlist[
  Sowohl Spalten- als auch Zeilenpivotisierung: Im schlimmsten Fall $cal(O)(n^2)$ zusätzliche Operationen
][
  vollständige Pivotisierung: Im schlimmsten Fall $cal(O)(n^3)$ zusätzliche Operationen
]

Formale Beschreibung von Algo 2.6? Dazu: Permutationsmatrizen $P_pi in RR^(n times n)$

Jede Permutation $pi: {1, ..., n} --> {1, ..., n}$ der Zahlen $1, ..., n$ bestimmt eine Matrix
$
P_pi = mat(e_(pi(1)), ..., e_(pi(n)))
$
Eine Zeilenvertauschung in $A$ kann dann durch das Produkt $P_pi A$ beschrieben werden, Spaltenvertauschung durch $A P_pi$. Des Weiteren gilt $P_pi^(-1) = P_pi^T$, $det(P_pi) = {-1,1}$.

Man kann beweisen, dass die $L R$-Zerlegung mit Spaltenpivotisierung #underline[theoretisch] nur versagen kann, wenn $det(A) = 0$

#theorem("2.7")[
  #bold[Durchführbarkeit der $L R$-Zerlegung]

  Für jede invertierbare Matrix $A$ existiert eine Permutationsmatrix $P$ derart, dass für $P A$ die $L R$-Zerlegung mit Spaltenpivotisierung durchgeführt werden kann. D.h., man erhält $P A = L R$. Dabei kann man $P$ so wählen, dass alle Elemente von $L$ betragsmäßig kleiner gleich 1 sind, also $abs(L) <= 1$
]

#startproof Da $A$ invertierbar ist, gilt $det(A) != 0$. Damit existiert eine Permutationsmatrix $P_pi_1$, so dass das erste Diagonalelement $tilde(a)_(1 1)^((1))$ der Matrix
$
tilde(A)^((1)) = P_pi_1 A^((1))
$
von Null verschieden ist und das betragsmäßig größte Element in der ersten Spalte ist:
$
0 != abs(tilde(a)_(1 1)^((1))) >= abs(tilde(a)_(i 1)^((1))) space "für" i = 1, ..., n
$
Nach dem ersten Eliminationsschritt erhalten wir
$
A^((2)) = L_1 tilde(A)^((1)) = L_1 P_pi_1 A = mat(tilde(a)_(1 1)^((1)), *;0,caron(A)_2^((2)))
$
Wegen (\*) gilt für $L_1$:
$
abs(l_(i 1)) = abs(tilde(a)_(i 1)^((1))/tilde(a)_(1 1)^((1))) <= 1 quad i = 2, ..., n
$
$==> abs(L_1) <= 1, quad det(L_1) = 1$
$
det(A^((2))) &= underbrace(det(L_1), = 1) underbrace(det(P_pi_1), in {-1, 1}) underbrace(det(A), != 0) \ 
&!= 0
$
$
det(caron(A)^((2))) = overbrace(det(A^((2))), != 0)/tilde(a)_(1 1)^((1)) != 0
$
Induktiv erhält man
$
R = A^((n)) = L_(n-1) R_pi_(n-1) L_(n-2) P_pi_(n-2) dots.c L_1 P_pi_1 A
$
mit $abs(L_k) <= 1$ und $P_pi_k$ entweder die Identität oder zwei Zeilen $j_1, j_2 >= k$ vertauschen. Deswegen gilt für die Frobeniusmatrix
$
L_k = mat(1,,,,,0;,dots.down,,,,;,,1,,,;,,-l_(k+1 k),,,;,,dots.v,,dots.down,;,,-l_(n k),,,1), "dass"
$
$
tilde(L)_k = P_pi_j L_k P_pi_j^(-1) = mat(1,,,,,0;,dots.down,,,,;,,1,,,;,,-l_(pi_j (k+1) k),,,;,,dots.v,,dots.down,;,,-l_(pi_j (n) k),,,1) quad "für" j>k
$
Durch geschicktes Einfügen von $I = P^(-1)_pi_(k+1) P_pi_(k+1)$
/*
$
R = A^((n)) = L_(n-1) P_pi_(n-1) L_(n-2) underbrace(P^(-1)_pi_(k+1) P_pi_(k+1), = I) P_pi_(n-2) L_(n-2) P^(-1)_pi_(n-2) underbrace(P^(-1)_pi_(k+1) P_pi_(k+1), = I) P_pi_(n-2) dots.c L_1 P_pi_1 dots.c P^(-1)_(n-1) P_pi_(n-1) dots.c P_pi_1 A
$
*/
$
R = A^((n)) = &L_(k-1) (P_(pi_(n-1)) L_(n-2) P^(-1)_pi_(n-1))(P_pi_(n-1) P_pi_(n-2) L_(k-3) P^(-1)_pi_(n-2) P^(-1)_pi_(n-1)) \ &P_pi_(n-1) P_pi_(n-2) dot ... dot ( ... L_1 P_pi_1 ... P^(-1)_pi_(n-1) (P_pi_(n-1) ... P_pi_1 A)
$
$==> P A = underbrace(tilde(L)_1^(-1) dots.c tilde(L)_(n-1)^(-1), =: L) R$ mit
$
L = mat(1,,,0;l_(tilde(pi)_1 (l) 1),dots.down,,,,;,dots.down,dots.down,,,;dots.v;l_(tilde(pi)_1 (n) 1), ..., l_(tilde(pi)_(n-1) (n) (n-1)),1)
$
und $abs(L) <= 1$

#bold[Bemerkungen:]

#boxedlist[
  Gilt $P A = L R$, dann berechnet man 
  $
  A x &= b \
  P A x &= P b \
  L R x &= P b \
  x &= R^(-1) L^(-1) P b
  $
  #h(100cm)
][
  Theoretisch sind die Formulierungen 
  $
  A x = b wide D A x = D b
  $
  für eine invertierbare Diagonalmatrix $D$ äquivalent. Bei der praktischen Lösung auf dem Rechner haben solche Skalierungen aber u.U. einen #bold[dramatischen] Einfluß, vgl. Kap. III.
][
  Auf dem Rechner: Verbesserung der unexakten Lösung durch sogenannte Nachiteration möglich, vgl. Kap. IV.
]

== Cholesky-Verfahren für symm. pos. definite $A$

Gesucht: $A$ spd eine $L in RR^(n times n)$ ($det(L) > 0$) s.d. $A = L L^T$

siehe Übungen

#pagebreak()

= Fehleranalyse

#bold[Situation]

ideal: Eingabe $x$ $-->$ Algorithmus/Problemstellung $f$ $-->$ Ausgabe $y = f(x)$ 

real: $tilde(x) = x + epsilon --> tilde(f) --> tilde(y) = tilde(f)(tilde(x))$

Frage: $y <--> tilde(y)$?

Ursachen für den Gesamtfehler $tilde(y) - y$

#boxedlist[
  #bold[Modellfehler]

  #boxedlist[
    Idealisierungsfehler, z.B. in der Modellbildung
  ][
    Datenfehler
  ]
  Modellfehler lassen in der Regel nicht vermeiden!

  Frage: Wie wirken sich solche Fehler #bold[unabhängig] vom gewählten Algorithmus aus?
  $
  f(x) <--> f(tilde(x))
  $
  #bold[Kondition] eines Problems
][
  #bold[numerische Fehler]

  #boxedlist[
    Diskretisierungsfehler, kontinuierliches Problem versus diskretisierte Formulierung
  ][
    Abbruchfehler, eigentlich unendliche Algorithmen werden nach endlichen Schritten abgebrochen
  ][
    Approximationsfehler
    $
    sin(x) = sum_(n = 0)^oo (-1)^n x^(2n+1)/(2n+1)! \
    ==> tilde(sin)(x) = sum_(n=0)^k (-1) x^(2n+1)/(2n+1)!
    $
  ][
    Rechengenauigkeit, reelle Zahlen versus Gleitkommazahlen
  ]
]

Rundungsfehler und Approximationsfehler $==>$ #bold[Stabilität] eines Alogrithmus
$
f(x) <--> tilde(f)(x)
$

Vernachlässigung von Fehlerbetrachtungen kann dramatische Auswrikungen haben:

#boxedlist[
  1991: Untergang der Bohrinsel Sleipner, Fehler in den Kräften von 47%
][
  1. Golfkrieg: Eine Patriotrakete verpasst angreifende Rakete. Im Steuerprogramm der Patriotrakete durch Multiplikation mit 0.1. Nach 100 Betriebsstunden: Differenz der berechneten Zeit und tatsächlich vergangener Zeit von 0.34 Sekunden
][
  Absturz der ersten Ariane 5 Rakete (1996), Umwandlung einer 64 bit Gleitkommazahl in 16 bit integer Zahl in Software der Arian 4
][
  London Millenium Bridge (2000), flasche Abschätzung der Fußgängerkräfte
]

== Zahlendarstellung und Rundungsfehler

$-->$ Einführung in das wissenschaftliche Rechnen

== Kondition eines Problems

Erwartungshaltung: kleiner Fehler in der Aufgabenstellung ($x -> tilde(x)$ verursacht einen kleinen Fehler in der Lösung $tilde(y)$

#bold[Beispiel 3.1:] Störung eines LGS

Gegeben ist das lineare Gleichungssystem
$
underbrace(mat(1.2969, 0.8648; 0.2161, 0.1441), =: A) vec(x_1, x_2) = underbrace(vec(0.8642, 0.1440), =: b)
$
mit $det(A) != 0$ und der eindeutig bestimmten Lösung $x = mat(2,2)^T$. 

Jetzt: Störung der rechten Seite
$
b arrow.squiggly tilde(b) = vec(0.86419999, 0.14400001)
$
liefert die Lösung $tilde(x) = mat(0.9911, -0.4870)^T$. Ursache?

Dazu: Formalisierung Eigenschaften der Problemstellung

Wichtig: Notation: $x$ - Eingabe, $f$ - Problemstellung, $y$ - Ausgabe

#definition("3.2", "Numerisches Problem")[
  Ein numerisches Problem ist ein Paar $(f, x)$ wobei $f: D subset RR^n -> RR^m$ eine Abbildung, $x in D$ die Eingabe und $y = f(x)$ die Ausgabe ist.
]

#bold[Beispiel 3.3:]

#boxedlist[
  Auswertung von $sin(x)$: $x = 1.7, y = f(x) = sin(x) = sin(1.7)$
][
  Bestimmung von Nullstelle von $g(t) = a t^2 + b t + c$

  Eingabe: $x = (a, b, c), y = f(x)$ definiert durch $g(f(a, b, c)) =^! 0$
]

Zur Lösung eines numerischen Problems können verschiedene Algorithmen genutzt werden

(Algorithmus: endliche Folge von Elementaroperationen, deterministisch bestimmt)

Hier: Die Kondition ist #bold[unabhängig] vom gewählten Algorithmus!

#definition("3.4", "wohl gestelltes Problem, schlecht gestelltes Problem")[
  Das numerische Problem $(f, x)$ heißt wohlgestellt, falls es eine konstante $L_"abs" in RR^+$ gibt, so dass 
  $
  norm(f(tilde(x)) - f(x)) <= L_"abs" norm(x - tilde(x))
  $
  für alle $tilde(x) -> x$. Existiert keine solche Konstante $L_"abs"$, dann heißt $(f, x)$ schlecht gestellt. Zur weiteren Analyse setzt man im wohldefinierten Fall
  $
  kappa_"abs" := inf{L_"abs" | L_"abs" >= 0 "und" (*) "gilt"}
  $
  Gilt $x != 0 != f(x)$, definiert man analog $kappa_"rel"$ als die kleinste Konstante mit 
  $
  norm(f(tilde(x)) - f(x))/norm(f(x)) <= kappa_"rel" norm(tilde(x) - x)/norm(x)
  $
  für alle $tilde(x)$ nahe $x$.
]

#bold[Bemerkungen:]

#boxedlist[
  Die #bold[absolute Kondition] $kappa_"abs"$ beschreibt die Verstärkung des absoluten Fehlers, die #bold[relative Kondition] $kappa_"rel"$ die Verstärkung des relativen Fehlers
][
  Bei nichtlinearen Problemen hängen $kappa_"abs"$ und $kappa_"rel"$ meist stark von der Umgebung ab $==>$ linearisierte Fehlertheorie!
][
  $kappa_"abs"$ und $kappa_"rel"$ hängen stark von den verwendeten Normen ab! $norm(dot)_2, norm(dot)_oo, norm(dot)_p, norm(dot)_1$
]

#definition("3.5", "absolute und relative Kondition")[
  Die Konstante $kappa_"abs"$ gibt die absolute Kondition eines numerischen Problems $(f, x)$ und $kappa_"rel"$ die relative Kondition.
]

Das numerische Problem $(f, x)$ ist #bold[schlecht konditioniert], wenn $kappa_"abs"$ bzw. $kappa_"rel"$ "groß" sind und gut konditioniert, wenn $kappa_"abs"$ bzw. $kappa_"rel"$ "klein" sind.

Wie berechnet man $kappa_"abs"$/$kappa_"rel"$? Dafür: Mittelwertsatz der Differentialrechnung

Es sei $f: [a, b] -> RR$ stetig auf $[a, b]$ und diffbar auf $(a, b)$. Dann existiert $macron(x) in (a, b)$, so dass
$
f'(macron(x)) = (f(b)-f(a))/(b-a)
$
Anwendung in der Fehlertheorie: Für differenzierbare $f: RR^n -> RR$ existiert wegen der Taylorentwicklung für $x$ und $Delta x$ ein $macron(x) in x+t Delta x, t in (0, 1)$ mit 
$
Delta y := tilde(y) - y = f(x+ Delta x) - f(x) = nabla f(macron(x)) Delta x
$
$==> norm(nabla f(macron(x)))$ ist ein Fehlermaß $tilde -> x$.

Deswegen verwendet man den Term $norm(nabla f(x))$ als Maß für die Fehlerverstärkung des absoluten Eingabefehlers $norm( Delta x) = norm(tilde(x) - x)$.

Der relative Fehler ist meist von größerer Bedeutung. Für $n = 1$ und $x dot y != 0$
$
(Delta y)/y approx nabla f(x) (Delta x)/y = underbrace((nabla f(x) x/f(x)), =kappa_"rel") (Delta x)/x
$
Verallgemeinerung auf $n>1$: $kappa_"rel" = abs(nabla f(x)^T x dot 1/f(x))$o
#bold[Beispiel 3.6:] Kondition der Addition

Problem: $f: RR^2 -> RR, f(x_1, x_2) = x_1 + x_2$ mit der $l_1$-Norm

$nabla f(x) = (1, 1)^T ==>$
$
kappa_"abs" = norm(nabla f(x))_1 = norm(mat(1,1)^T)_1 = 2 \
kappa_"rel" = norm(nabla f(x)^T x 1/f(x))_1 = (abs(x_1) + abs(x_2))/(abs(x_1 + x_2))
$
Für die Addition zweier Zahlen mit gleichen Vorzeichen ergibt sich $kappa_"rel" = 2$ $==>$ gut konditioniert!

Gleikommazahlen: Hämmerlin, Hoffmann: Numerische Mathematik, Springer (1994)

#bold[Beispiel 3.6:]  $f: RR^2 -> RR, space f(x) = x_1 + x_2$
$
kappa_"rel" = norm(nabla f(x)^Y x dot 1/(f(x)))_1 = (abs(x_1) + abs(x_2))/abs(x_1 + x_2) = star
$
$x_1, x_2$ #bold[gleiche] Vorzeichen, z.B. $x_1, x_2 > 0$
$
star = (x_1 + x_2)/(x_1+x_2) = 1
$
$==>$ sehr gut konditioniert!

#bold[Beispiel 3.7:] Subtraktion zweier Zahlen

Problem: $f: RR^2 -> RR, space f(x_1, x_2) = x_1 - x_2$

Wähle die $l_1$-Norm
$
f'(x) = vec(1, -1) space ==> space kappa_"abs" = norm(D f(x))_1 = norm(mat(1, -1)^T)_1 = 2 \
kappa_"rel" = norm(nabla f(x)^T x 1/(f(x)))_1 = (abs(x_1) + abs(x_2))/abs(x_1 - x_2)
$
Subtraktion zwei fast gleicher Zahlen ist schlecht konditioniert da
$
abs(x_1 - x_2) << abs(x_1) + abs(x_2)
$
Für die Rechengenauigkeit $"eps" = 10^(-7)$ (einfache Genauigkeit)
$
x_1 = 1.23467* wide "Störung in der 7. Stelle" \
x_2 = 1.23456* wide "Störung in der 7. Stelle" \
x_1 - x_2 = 0.00011* = 0.11 dot 10^(-3) "Störung in der 3. Stelle" \
$
$==>$ Man verliert 4 Stellen an Genauigkeit
$
==> kappa_"rel" approx 10^4
$
$
"Problemstellung, Kondition" <--> "Algorithmus"
$
Wichtiges Beispiel: Sekantenverfahren zur Lösung nichtlinearer Gleichungen

theoretisch: serh schöne Konvergenzeigenschaften

praktisch: Erhebliche Probleme durch schlechte Kondition der Subtraktion

== Stabilität von Algorithmen 

Jetzt: Wie wirken sich Eingabefehler und Fehler während der Rechnung auf das Endergebnis aus?

#bold[Vorwärtsanalyse]

#definition("3.8", "Vorwärtsstabilität (komponentenweise)")[
  Die Implementierung $tilde(f)$ heißt #bold[vorwärtsstabil] wenn für alle $x$ aus dem Definitionsbereich von $f$ mit $f(x) !=0$ ein moderates, von $x$ unabhängiges $C_V > 0$, so dass 
  $
  abs((tilde(f)(x) - f(x))/f(x)) <= C_V dot kappa_"rel" dot "eps"
  $
  mit eps als Rechengenauigkeit gilt.
]

Hier betrachtet man die Fehlerfortpflanzung, d.h. die Auswirkung bereits gemachter Fehler.

Dazu: $x_1, x_2$ sind die exakten Daten, $Delta x_1, Delta x_2$ sind die bisher gemachten Fehler mit $abs((Delta x_1)/x_1), abs((Delta x_2)/x_2) << 1$

Was passiert bei exakter Durchführung einer arithmetischen Operation?

#lemma("3.9")[
  Gegeben seien $x_1, x_2, Delta x_1, Delta x_2 in RR$. Dann gelten mit $compose in {+, -, dot, div }$ für den forgepflanzten Fehler
  $
  Delta (x_1 compose x_2) = (x_1 + Delta x_1) compose (x_2 + Delta x_2) - x_1 compose x_2
  $
  die Abschätzung:
  $
  &Delta(x_1 plus.minus x_2)/(x_1 plus.minus x_2) = x_1/(x_1 plus.minus x_2) dot (Delta x_1)/x_1 plus.minus x_2/(x_1 plus.minus x_2) dot (Delta x_2)/x_2 \
  &Delta(x_1 dot x_2)/(x_1 dot x_2) approx (Delta x_1)/x_1 + (Delta x_2)/x_2 \
  &Delta(x_1/x_2)/(x_1/x_2) approx (Delta x_1)/x_1 - (Delta x_2)/x_2
  $
  Dabei bedeutet $approx$ ein Vernachlässigen von Termen höherer Ordnung, z.B. $x_1^2, x_2^2$
]
#startproof Nachrechnen
#endproof

Fazit: $plus.minus$ können u.U. zu einer erheblichen Fehlerverstärkung führen!

$dot, div$: Im wesentlichen unkritische Fehlerforpflanzung

Die Fehlerverstärkung tritt besonders dann auf, wenn $abs(x_1) approx abs(x_2), x_1 plus.minus x_2$ nahe Null. Dieser Effekt heißt #bold[Auslöschung]

#bold[Rückwärtsanalyse]
$
tilde(f)(x) =^? f(tilde(x)) = f(x + Delta x)
$
Erwartungshaltung: $Delta x$ nicht zu groß

#definition("3.10", "Rückwärtsstabilität (komponentenweise)")[
  Die Implementierung $tilde(f)$ heißt #bold[rückwärtsstabil], wenn für alle $x!=0$ aus dem Definitionsbereich von $f$ und $Delta x$ mit $tilde(f)(x) = f(x+Delta x)$ die Abschätzung
  $
  abs((Delta x)/x) <= C_R dot "eps"
  $
  für eps als Rechengenauigkeit und ein moderates von $x$ unabhängiges $C_R > 0$ gilt.
]

D.h. kann $tilde(f)(x)$ als exaktes Ergebnis einer gestörten Eingabe $tilde(x) = x+Delta x$ interpretieren?

#bold[Bemerkungen:]

#boxedlist[
  $Delta x$ muss nicht existieren, z.B. außerhalb des Definitionsbereichs
][
  $f$ nicht injektiv $==>$ u.U. existieren mehrere Kondidaten, dann wählt man $tilde(x)$ so, dass $norm(x - tilde(x))$ minimal ist
]
$
f(x) quad <--> quad tilde(f)(tilde(x)) quad ?
$

Es gilt:
$
abs((tilde(f)(x) - f(x))/f(x)) = abs((f(x+Delta x) - f(x))/f(x)) \
approx kappa_"rel" abs((x+Delta x - x)/x) <= kappa_"rel" dot C_R dot "eps"
$
Also: Für ein wohl gestelltes Problem ist eine rückwärtsstabile Implementierung auch immer vorwärtsstabil mit $C_V = C_R$

Fazit für den Gesamtfehler:
$
norm(f(x) - tilde(f)(tilde(x))) = norm(f(x) - f(tilde(x)) + f(tilde(x)) - tilde(f)(tilde(x))) \
<= underbrace(norm(f(x) - f(tilde(x))), "Kondition") + underbrace(norm(f(tilde(x)) - tilde(f)(tilde(x))), "Stabilität")
$
Ein gut konditioniertes Problem und ein stabiler Algorithmus sichern gute numerische Ergebnisse!

#bold[Beispiel 3.11:] Auslöschung

Betrachtet wird
$
f(x) = x^3 (x/(x^2 - 1) - 1/x)
$
Funktionsauswertung?

Matlab, $x=2$
$
y_1 = x/(x^2 -1) = 2/3, quad y_2 = 1/x = 1/2, quad y_3 = x^3 = 8, quad y_4 = y_3 dot (y-1 - y_2) = 4/3
$
$x=1.2 dot 10^7$
$
y_1 = 8.33333333333339 dot 10^(-8), y_2 = 8.33333333333334 dot 10^(-8), y_3 = x^3 = 1.728^(21) \
==> y_4 = y_1 - y_2 = 5.691 dot 10^(-22), quad y_5 = y_3 dot y_4 = 0.983
$
Wir können $f$ umschreiben zu
$
f(x) = x^3 (x/(x^2-1) -1/x) = 1/(1-x^(-2)) =: g(x) > 1
$
Stabilität beider Formulierung?
$
f'(x) = ... = - (2 x)/(x^2 - 1)^2 \
kappa_"rel" = 2/(x^2 - 1) <= 1 quad "für" x>=4
$ \
$==>$ Eingabefehler werden gedämpft!
$
abs((tilde(f)(x) - f(x))/f(x)) approx 0.02 = C_V dot kappa_"rel" dot "eps" \
==> C_V > 10^13
$
$==>$ diese Implementierung ist nicht vorwärtsstabil!
#line(length: 1cm)

Für $x = 1.2 dot 10^7$:
$
x^(-2) &approx 6.9macron(4) dot 10^(-15) \ 
1-x^(-2) &approx 1.0 \
1/(1-x^(-2)) &approx 1.0
$
Stabilität? Exakte Rechnung:
$
g(x) &= 1/(1-x^(-2)) \
&= 1/(1-(12 dot 10^7)^(-2)) \ 
&= 1/(1-(1.44 dot 10^14)^(-1)) \
&= 1/(0.99999999999999macron(5)) \
&approx 1.00000000000000711 \
$
$
==> abs((tilde(g)(x) - g(x))/g(x)) approx 7.11 dot 10^(-15)
$
$
kappa_"rel" (g) = abs(g'(x) dot x/g(x)) = abs(-(2 x)/(1-x^(-2))^2 dot x/(1/(1-x^(-2)))) = abs(2/(x^(-2) - 1)) <= 1
$
$==> C_V approx 10$, vorwärtsstabil

#pagebreak()

= Das Gauß-Verfahren II

Wieder die Frage: Wann ist eine lineares Gleichungssystem lösbar? Jetzt mit Fehlertheorie!

#bold[Beispiel 4.1: Interpolationspolynome]

siehe PDF-Datei

== Lösung von linearen Gleichungssystemen: Kondition

Zwei Möglichkeiten:

#boxedenum[
  Störung $Delta b$ in $b$. Löse $A(x + Delta x) = b + Delta b$. Größe von $Delta x$?
][
  Störung $Delta A$ in $A$. Existiert eine Lösung $x + Delta x = tilde(x)$ von $(A + Delta A)(x+ Delta x) = b$. Größe von $Delta x$?
]

zu 1.: 

Absolute Kondition:
$
norm(Delta x) = norm(A^(-1) Delta b) <= norm(A^(-1)) dot norm(Delta b) \
==> kappa_"abs" = norm(A^(-1))
$
Relative Kondition:
$
norm(Delta x)/norm(x) <= "cond"(A) norm(Delta b)/norm(b) \
kappa_"rel" = "cond"(A) := norm(A) dot norm(A^(-1))
$

zu Bsp. 3.1: Hier gilt für $norm(space) = norm(space)_2$
$
kappa_"abs" approx 1.5803 dot 10^8 \
kappa_"rel" approx 1.5803 dot 10^8
$

Desweiteren gilt: (siehe ÜA)
$
"cond"(A) = (max_(norm(x) = 1) norm(A x))/(min_(norm(x) = 1)) in [1, oo[
$

#boxedlist[
  Damit erhält man $A != 0$ ist genau dann singulär, wenn $"cond"(A) = oo$
][
  Außerdem gilt $"cond"(alpha A) = "cond"(A)$ für $0 != alpha in RR$

  $==>$ die Kondition einer Matrix ist skalierungsinvariant!
]

zu 2.: Warum existiert $(A + Delta A)^(-1)$ zu der gestörten Matrix $A + Delta A$?
$
A + Delta A = A (I + A^(-1) Delta A), quad det(A) != 0
$

#lemma("4.2")[
  #bold[Neumannsche Reihe]

  Sei $C in RR^(n times n)$ mit $norm(C) < 1$ mit einer submultiplikativen Norm. Dann ist $I - C$ invertierbar und man schreibt 
  $
  (I - C)^(-1) = sum_(k = 0)^oo C^k
  $
  Weiterhin gilt 
  $
  norm((I - C)^(-1)) <= 1/(1-norm(C))
  $
]

#startproof ÜA
#endproof

nach Carl Gottfried Neumann (1832 - 1925), deutsche Mathematiker

#theorem("4.3")[
  #bold[Störungssatz]

  Es sei $"cond"(A) dot norm(Delta A)/norm(A) <1$ und $x + Delta x$ die Lösung von $(A + Delta A)(x+ Delta x) = b + Delta b$. Dann gilt (\*)
  $
  norm(Delta x)/norm(x) <= "cond"(A) (1-"cond"(A) norm(Delta A)/norm(A)) (norm(Delta A)/norm(A) + norm(Delta b)/norm(b)) 
  $
  für $x!=0$ und $b!=0$.
]

#startproof ÜA
#endproof

Wenn $"cond"(A) norm(Delta A)/norm(A) << 1$ und (\*) gilt
$
norm(Delta x)/norm(x) <= "cond"(A) dot "eps"
$
wenn der relative Fehler in $A$ und $b$ auf dem Niveau der Maschinengenauigkeit sind.
Der Störungssatz liefert dann, dass man wegen der Kondition des numerischen Problems $(A, b) arrow.bar x = A^(-1) b$ einen unvermeidbaren Fehler der Größenordnung $"cond"(A) dot "eps"$ erwarten kann.

#bold[Beispiel 4.4:] Fortsetzung von Bsp. 3.1
$
A = mat(1.2969, 0.8648; 0.2161, 0.1441), quad "cond"(A) = 2.469 dot 10^8 space "für" norm(space)_2, quad b = vec(0.8642, 0.1440) \
==> x = vec(2, -2)
$

Lösung mit Matlab $quad x = A\\b$
$
x = vec(2.000000001802645,-2.000000007450581) \ 
==> norm(Delta x)_2/norm(x)_2 = 2.715 dot 10^(-9) <= 2.469 dot 10^8 dot 10^(-16)
$
Dann: $norm(Delta b)_2 = 1.614 dot 10^(-8)$
$
norm(Delta x)_2/norm(x)_2 &= 1.64679 <= "cond"(A) dot 1 dot norm(Delta b)_2/norm(b)_2 \
&= 2.469 dot 10^8 dot 1 dot 7.6799 dot 10^7 \
&approx 1.9177
$

#bold[Beispiel 4.5:]
$
&A = mat(2, 0.999; 4, 2.003), quad b = vec(1.001, 1.997) quad ==> quad x = vec(1,-1) \
&==> A^(-1) = mat(200.2macron(9), -99.9macron(9); -399.macron(9), 199.9macron(9)) \
&==> norm(A)_oo = 6.003 \
&==> norm(A^(-1))_oo = 5.99macron(9) \
$
$
"cond"_oo (A) = 3607.7macron(9)
$

Jetzt: 
$
&tilde(A) = mat(2, 1; 4, 2.003), quad tilde(b) = vec(1.001, 2) \
&A = mat(0, 0.001; 0, 0), quad Delta b = vec(0, 0.003) \
&==> norm(Delta A)_oo = 0.001, norm(Delta b)_oo = 0.003 \
&==> norm(Delta x)_oo/norm(x)_oo <= 14.4072
$
$
tilde(x) = vec(0.8macron(3), -0.macron(6)) ==> norm(Delta x)/norm(x) = 1.49
$

gap

== Stabilität der Gaußelimination

Stabilität der $L R$- bzw. Cholesky-Zerlegung.

Rückwärtsanalyse: Interpretation des Ergebnisses als Ergebnis exakter Rechnung mit gestörten Eingangsdaten.

Abschätzung von $Delta A$: Störungssatz 4.3 und Kondition von $A$.

#bold[1. Fall:] $A$ spd Matrix 

$==>$ Cholesky-Verfahren $cal(O)(n^2)$

Für die berechnete Lösung $tilde(x)$ als exakte Lösung des gestörten Systems:
$
(A + Delta A) underbrace(tilde(x), = x + Delta x) = b
$
mit $norm(Delta A)_oo/norm(A)_oo <= C_n "eps"$ gilt, dass $c_n$ "klein" ist und nur von der Dimension von $A$ abhängt, d.h. $A$ ist im Rahmen der Maschinenungenauigkeit.

Des Weiteren erhält man
$
norm(Delta x)_oo/norm(x)_oo = norm(tilde(x) - x)_oo/norm(x)_oo <= ("cond"_oo (A) (norm(Delta A)_oo/norm(A)_oo))/(1-"cond"_oo (A) (norm(Delta A)_oo/norm(A)_oo)) lt.tilde ("cond"_oo (A) c_n "eps")/(1-"cond"_oo (A) c_n "eps") approx "cond"_oo (A) c_n "eps"
$
falls $"cond"_oo (A) norm(Delta A)_oo/norm(A)_oo << 1$. D.h. der Fehler in $tilde(x)$ bleibt bzgl. der Größenordnung im Rahmen der unvermeidbaren Fehler. 

$==>$ Cholesky-Verfahren ist stabil

Eine genauere Analyse findet man bei Deuflhard/Hohmann und auch Stoer/Bulirsch.

#bold[2. Fall:] $A$ nicht spd

$==>$ $L R$-Zerlegung mit Spaltenpivotisierung

Dann gilt auch
$
(A + Delta A) tilde(x) = b quad "mit" quad norm(Delta A)_oo/norm(A)_oo <= tilde(c)_n "eps"
$
Allerdings ist $tilde(c)_n$ sehr viel größer als $c_n$. Trotzdem kann die $L R$-Zerlegung mit Spaltenpivotisierung noch als stabil angesehen werden.

== Nachiteration

Gauß-Elimination liefert $tilde(x)$ als Approximation der Lösung $x$ von $A x = b$. Wie gut ist $tilde(x)$? Für die exakte Lösung $x$ verschwindet das Residuum $r(x) = A x - b = 0$. 

Ist $r(tilde(x)) = A tilde(x) - b$ "klein" ein sinnvolles Kriterium?

Problem: Die Norm

$norm(r(tilde(x)))$ kann durch Zeilenskalierung beliebig verändert werden
$
A x = b <==> D A x = D b
$
Deswegen: Beurteilung anhand der Rückwärtsanalyse, basiert auf einem Resultat von Rigal und Gaches (1967)

#theorem("4.6")[
  Gegeben sei das numerische Problem $A x = b$, d.h. $x = A^(-1) b$. Dann ist der normweise relative Rückwärtsfehler einer Näherungslösung $tilde(x)$ gegeben durch:
  $
  norm(Delta x) = norm(A tilde(x) - b)/(norm(A) dot norm(tilde(x)) + norm(b))
  $
]

Praktischer Nutzen? Nachiteration> D.h.:

Ausgehend von einer Fehlerhaften $L R$-Zerlegung, d.h.
$
tilde(L) tilde(R) != P A
$
und daher nur einer Näherungslösung $tilde(x) =: x_0$ mit exakten Defekt
$
d_0 := r(x_0) = b - A x_0,
$
kann man die Zerlegung $tilde(L) tilde(R) approx P A$ zur Lösung der sogenannten Defektgleichung
$
A w = d_0 ==> tilde(L) tilde(R) w = d_0.
$
$==>$ Korrektur $w_1$ für $x_0$, d.h.
$
x_1 = x_0 + w_1
$
liefert dann
$
A x_1 = A x_0 + A w_1 =  A x_0 - b + b + d_0 = b
$
$==>$ $x_1$ wäre exakte Lösung, aber: $w_1$ ist auch fehlerbehaftet

Frage: Ist $x_1$ eine bessere Lösung als $x_0$?

Dazu: Fehleranalyse basierend auf dem Störungssatz, Satz 4.3.
$
norm(x_0 - x)/norm(x) <= "cond"(A)/(1-"cond"(A) norm(P A - tilde(L) tilde(R))/norm(A)) dot underbrace(norm(P A - tilde(L) tilde(R))/norm(A), approx "eps")
$
$==>$ Stellenverlust entspricht der Kondition von $A$. Die zusätzlich auftretenden Rechenfehler werden vernachlässigt. Ersetzt man den exakten Defekt $d_0$ durch den Ausdruck
$
hat(d)_0 = b - hat(A) x_0
$
mit einer genaueren Darstellung von $A$,
$
norm(A - hat(A))/norm(A) <= tilde(epsilon) << epsilon
$
erhält man 
$
x_1 = x_0 + w_1 = x_0 + (tilde(L) tilde(R))^(-1) (b - hat(A) x_0) = x_0 + (tilde(L) tilde(R))^(-1) (A x - A x_0 + (A - hat(A)) x_0) \
==> x_1 - x = x_0 - x + (tilde(L) tilde(R))^(-1) A (x - x_0) + (tilde(L) tilde(R))^(-1) (A - hat(A)) x_0 = (star)
$
Es gilt:
$
tilde(L) tilde(R) &= A - A + tilde(L) tilde(R) \
&= A ( I - A^(-1) (A - tilde(L) tilde(R)))
$
Dann liefert die Neumannsche Reihe (Lemma 4.2)
$
norm((tilde(L) tilde(R))^(-1)) &<= norm(A^(-1)) dot norm(I - A^(-1)(A - tilde(L) tilde(R))^(-1)) \
&<= norm(A^(-1))/(1 - norm(A^(-1) (A - tilde(L) tilde(R)))) \
&<= norm(A^(-1))/(1 - norm(A^(-1)) norm(A - tilde(L) tilde(R))) \
&= norm(A^(-1))/(1 - "cond"(A) norm(A - tilde(L) tilde(R))/norm(A))
$
Damit erhält man mit 
$
(star) = (tilde(L) tilde(R))^(-1) (tilde(L) tilde(R) - A) (x_0 - x) + (tilde(L) tilde(R))^(-1) (A - hat(A)) x_0
$
dass
$
norm(x_1 - x)/norm(x) approx "cond"(A) (underbrace(norm(A - tilde(L) tilde(R))/norm(A), epsilon) underbrace(norm(x_0 - x)/norm(x), "cond"(A) dot epsilon) + underbrace(norm(A - hat(A))/norm(A), <= tilde(epsilon) << epsilon) norm(x_0)/norm(x))
$
wenn $"cond"(A) norm(P A - tilde(L) tilde(R))/norm(A) << 1$
$
("cond"(A))^2 dot (epsilon^2 + tilde(epsilon) dot norm(x_0)/norm(x))
$
$x_1$ ist nicht die exakte Lösung, deswegen wendet man die Nachiteration iterativ an. In der Praxis wird der Faktor in $x$ nach wenigen Korrekturschritten (2-3) auf die Größenordnung der Defektgleichung reduziert, d.h. oft hat man
$
norm(x_3 -x)/norm(x) op(tilde) tilde(epsilon)
$

#bold[Beispiel 4.7:] Betrachtet wird das Gleichungssystem
$
mat(1.05, 1.02; 1.04, 1.02) vec(x_1, x_2) = vec(1 2)
$
Exakte Lösung
$
x = (-100, 103.9216)
$
$L R$-Zerlegung mit 3-stelliger Genauigkeit: 
$
tilde(L) = mat(1, 0; 0.99, 1) wide tilde(R) = mat(1.05, 1.02; 0, 0.01) \
tilde(L) tilde(R) - A = mat(0,0;,-5 dot 10^(-4), -2 dot 10^(-4)) space checkmark \
==> norm(tilde(L) tilde(R) - A) <= "eps"
$
Näherungslösung $x_0 = (-97.2, 101)$ zugehöriges Residuum.
$
d_0 = b - A x_0 = cases((0\, 0)^T quad &3"-stellige Rechnung", (-0.17\, -0.14)^T quad &6"-stellige Rechnung")
$
Bei 3-stelliger Rechnung hat die Korrekturgleichung
$
mat(1,0;0.99,1) mat(1.05,1.02;0,0.01) vec(w_0^1, w_0^2) = vec(-0.17, -0.14)
$
die Lösung $w_1 = (-2.90, 2.83)$ $==>$ $x_1 = x_0 + w_1 = vec(-99.9, 104)$ ist eine deutlich bessere Lösung!

#bold[Vorsicht:] Selbst, wenn die $L R$-Zerlegung mit Spaltenpivotisierung stabil ist, d.h. $norm(P A - tilde(L) tilde(R))$ klein, kann die numerische Lösung $tilde(x)$ sehr ungenau sein, wenn $"cond"(A)$ sehr groß ist. Dann können kleine Störungen zu $A$ zu großen Störungen in $x$ führen.

Abhilfe: Vorkonditionierung
$
A x = b quad ==>^tilde(P) quad tilde(P) A x = tilde(b)
$
Vorkonditionierung, so dass $"cond"(tilde(P) A) << "cond"(A)$

#bold[Beispiel 4.8: Hilbertmatrix]

Die Hilbertmatrix ist definiert durch $A = (1/(i + j -1)) in RR^(n times n)$. Man kann zeigen: $"cond"(A)$ wächst exponentiell in $n$.

#pagebreak()

= Die $Q R$-Zerlegung

Jetzt: $A in RR^(m times n)$, $m>=n$, $"rang"(A) = n$

$A in CC^(m times n)$ genauso möglich, dann symmetrisch $arrow.squiggly$ hermitesch

Ziel: Faktorisierung $A = Q R$ mit $R=$ rechte obere Dreiecksmatrix, $R in RR^(m times n)$, $Q in RR^(m times m)$ unitär, d.h. $Q^T Q = I_n$.

== Householder-Transformationen

Alston Householder (1904-1993, 1958)

Eigenschaften unitärer Matrizen: Sei $Q in RR^(m times m)$ unitär, dann gilt 

#boxedenum[
  $
  norm(Q x)_2^2 = (Q x)^T Q x = x^T Q^T Q x = x^T x = norm(x)_2^2
  $
  $==>$ $Q$ normerhaltend #h(10cm)
  $
  norm(Q x)_2 = norm(x)_2 wide forall x in RR^m
  $
][
  $
  norm(Q)_2 = max_(norm(x)_2 = 1) norm(Q x)_2 &= 1 \
  norm(Q^(-1))_2 = norm(Q^T)_2 = norm(Q)_2 &= 1 \
  "cond"_2 (Q) <= norm(Q)_2 norm(Q^(-1))_2 &= 1
  $
][
  $P, Q in RR^(m times m)$ unitär $==>$ $P dot Q$ unitär
]

#definition("5.1", "Householder-Transformation")[
  Sei $v in RR^m without {0}$. Dei Matrix $P_v = I_m - 2/norm(v)_2^2 v v^T in RR^(m times m)$ heißt #bold[Householder-Transformation].
]

#lemma("5.2")[
  Sei $v in RR^m without {0}$. Dann ist $P_v$ eine symmetrische unitäre mit $P_v v = - v$ und für alle $w in RR^m$ mit $w bot v$, d.h. $w^T v = 0$, gilt $P_v w = w$.
]

#startproof 

Symmetrie: klar

$P_v^T P_v =^? I_m$
$
P_v^T P_v &= (I_m - 2/norm(v)_2^2 v v^T)^T (I-2/norm(v)_2^2 v v^T) \
&= I_m - 4/norm(v)^2_2 v v^T + 4/norm(v)_2^2 (v v^T v v^T)/norm(v)_2^2 \
&= I_m
$
Für $v$ erhält man:
$
P_v v = (I_m - 2/norm(v)_2^2 v v^T) v = v - 2/norm(v)_2^2 v overbrace(v^T v, norm(v)_2^2) = - v
$
sowie für $w in RR^m$ mit $w bot v$
$
P_v w = (I_m - 2/norm(v)_2^2 v v^T) w = w-2/norm(v)_2^2 v underbrace(v^T w, 0) = w
$
#endproof

Damit kann $P_v$ als Spiegelung interpretiert werden.

Nun Einsatz von Householder-Transformationen um $A$ auf die Dreiecksgestalt zu bringen. Dazu:

#lemma("5.3")[
  Gegeben sei $x in RR^n without {0}$. Für $v = x + tau e_1$ mit 
  $
  tau = cases(plus.minus x_1/abs(x_1) norm(x)_2 quad &"falls" x_1 != 0, - norm(x)_2 quad &"falls" x_1 = 0)
  $
  gelte $v != 0$. Dann ist
  $
  P_v x = (I_m - 2/norm(v)_2^2 v v^T) x = - tau e_1
  $
]

#startproof
$
norm(x + tau e_1)^2_2 &= norm(x)_2^2 + 2 tau e_1^T x + tau^2 \
&= 2 underbrace((x+tau e_1)^T, v) x
$
Dann gilt: $2 v^T x = 2 (x+tau e_1)^T = norm(x+ 2e_1)^2 = norm(v)_2^2$

Mit der Defintion von $v$ folgt weiterhin
$
2/norm(v)^2_2 v (v^T x) = v = x + tau e_1 quad ==> quad "Behauptung"
$
#endproof

Bemerkung: Damit im Fall $x_1 != 0$ ($x_1 in CC$) bei der Berechnung von $v$ keine Auslöschung auftritt, kann man das Vorzeichen von $tau$ entsprechend wählen.

== Berechnung der $Q R$-Zerlegung

#theorem("5.4")[
  #bold[Existenz einer $Q R$-Zerlegung]

  Sei $A in RR^(m times n)$ mit $m>=n$ mit $"rang"(A) = n$. Dann existiert eine unitäre Matrix $Q in RR^(m times m)$ und eine obere Dreiecksmatrix $R in RR^(m times n)$ mit 
  $
  A = Q dot R
  $
  so dass $v_(i i) != 0$, $i = 1, ..., n$.
]

#startproof

Idee: Nutze Householder-Transformationen, um die Spalten von $R$ zu erhalten. D.h. $Q_n dot ... dot A = R$ mit $Q_i corres$ Householder-Transformationen, dann $Q := Q_1^T Q_2^T ... Q_n^T = Q_1 ... Q_n$.

#boxedenum[
  Schritt: $A_1 = A$, $0 != x = a_1$ $corres$ 1 Spalte von $A$. $Q_1 in RR^(m times n)$ Householder-Transformation mit $v$ gemäß Lemma 5.3.
  $
  ==> Q_1 x = Q a_1 = v_(1 1) e_1 
  $
  mit $abs(v_(1 1)) = norm(a_1) != 0$ da 1 Vollrang besitzt.

  Also
  $
  Q_1 A = mat(v_(1 1), v_(1 2), ..., v_(1 m);0,,,;dots.v,,A_2,;0,,,), wide A_2 in RR^((m-1) times (n-1))
  $
][
  Schritt: $x = a_2 = 1$ Spalte von $A_2$, $x in RR^(m-1)$ und $tilde(Q)_2 in RR^((m-1) times (n-1))$ als Householder-Transformation gemäß Lemma 5.3. Dann folgt mit $Q_2 := mat(1, 0;0,tilde(Q_2))$ unitär, dass 
  $
  Q_2 Q_1 A = mat(v_(1 1), v_(1 2), ..., ..., v_(1 m);0, v_(2 2), v_(2 3), ..., v_(2 m); dots.v, 0,,,;dots.v,dots.v,,A_3,;0,0,,,)
  $
  mit $v_(2 2) != 0$, da $A$ Vollrang hat. 
]

Nach $n$ Schritten erhält man die gewünschte Zerlegung

#endproof

Bemerkungen:

#boxedlist[
  "Naive" Householder-Transformation, d.h. Aufstellen der Matrix und Anwenden, erfordert $cal(O)(m^2 n)$ Multiplikationen.
][
  Besser $P_1 A = A - 2/norm(v)_2^2 v v^T A = A - 2/norm(v)_2^2 v w^T$

  $==>$ $cal(O)(m n)$ Multiplikationen
]
