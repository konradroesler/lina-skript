#import "utils.typ": *
#import "template.typ": uni-script-template
#show: doc => uni-script-template(
  title: [Vorlesungsskript],
  author: [Konrad Rösler],
  module-name: [LinA II\* SoSe 24],
  doc
)

#bold[Wiederholung:]

$K$ sei ein beliebiger Körper, $V$ ein $n$-dimensionaler $K$-Vektorraum,
$
L(V, V) = { f: V -> V | f "lin. Abbildung" }
$
$f in L(V,V)$ heißt Endomorphismus. Ist $f in L(V,V)$, so läßt sich $f$ bezüglich einer Basis $B = {v_1, ..., v_n}$ von $V$ eindeutig durch eine Matrix 
$
A^(B, B)_f = (a_(i j))_(1 <= i, j <= n) in K^(n,n)
$
Es gilt 
$
f(v_j) = sum_(i = 1)^n a_(i j) v_i wide 1 <= j <= n
$
Abbildung 
$
F: L(V, V) -> K^(n,n)
$
ist ein Isomorphismus.

Basiswechsel? Basen $B, C$ von $V$
#figure(
  image("bilder/527.jpg", width: 80%)
)
(siehe Lem. 5.27, LinA I\*)

Eine zentrale Frage: Sei $f in L(V,V)$, existiert eine Basis $B = {v_1, ..., v_n}$ von $V$, so dass $A_f^(B,B)$ eine möglichst einfache Form besitzt?

z.B. Diagonalmatrix:
$
A_f^(B,B) = mat(lambda_1, ..., 0; dots.v, dots.down, dots.v; 0, ..., lambda_n)
$

Wir werden:

#boxedlist[
  Endomorphismen charakterisieren, die sich durch eine Diagonalmatrix beschreiben lassen.

  Wenn ja: Dann gilt $f(v_j) = lambda_j v_j$

  $==> f$ ist eine Streckung von $v_j$ um den Faktor $lambda_j$.
][
  Die Jordan-Normalform herleiten.
]

= Eigenwerte und Eigenvektoren

Eigenwerte charakterisieren zentrale Eigenschaften linearer Abbildungen. Z.B.

#boxedlist[
  Lösbarkeit von linearen Gleichungssystemen
][
  Eigenschaften von physikalischen Systemen 

  $->$ gewöhnliche Differentialgleichungen

  $->$ Eigenschwingungen / Resonanzkatastrophe

  Zerstörung einer Brücke über dem Fluß Maine / Milleanium-Bridge London
]

== Definition und grundlegende Eigenschaften

#definition("1.1", "Eigenwert und Eigenvektor (Endomorphismus)")[
  Sei $V$ ein $K$-Vektorraum. Ein Vektor $v in V, v != 0_V$, heißt #bold[Eigenvektor] von $f in L(V,V)$, falls $lambda in K$ mit 
  $
  f(v) = lambda v
  $
  existiert. Der Skalar $lambda in K$ heißt der #bold[Eigenwert] zum Eigenvektor $v in V$.
] <def>

#definition("1.2", "Eigenwert und Eigenvektor (Matrix)")[
  Sei $K$ ein Körper und $n in NN$. Ein Vektor $v in K^n$, $v != 0_(K^n)$, heißt Eigenvektor von $A in K^(n,n)$, falls $lambda in K$ mit 
  $
  A v = lambda v
  $
  existiert. Der Skalar $lambda in K$ heißt der Eigenwert zum Eigenvektor $v in V$.
] <def>

#bold[Bemerkungen:]

#boxedlist[
  In Def 1.1 kann $dim(V) = oo$ sein. Dies ist für viele Definitionen/Aussagen in denen wir Endomorphismen betrachten, der Fall.
][
  Für $dim(V) < oo$ kann man jedes $f in L(V,V)$ eindeutig mit einer Matrix $A$ identifizieren. Dann: Def 1.2 ist Spezialfall von Def 1.1.
]

#boxedlist[
  #bold[Achtung:] $0 in K$ kann ein Eigenwert sein:
  $
  mat(1,1;1,1) vec(1,-1) = 0 dot vec(1,-1)
  $
  Der Nullvektor $0 in V$ ist #bold[nie] ein Eigenvektor.

  Für $dim(V) = 0$ besitzt $f$ keinen Eigenvektor für $f in L(V,V)$.
][
  Ist $v$ Eigenvektor zum Eigenwert $lambda$, so ist auch $alpha v$ für jedes $alpha in K without {0}$ ein Eigenvektor
  $
  f(alpha v) = alpha f(v) = alpha lambda v = lambda (alpha v)
  $
]
Zentrale Frage dieses Kapitels:

Existens von Eigenwerten? Wenn sie existieren: Weitere Eigenschaften?

#bold[Beispiel 1.3:] Sei $I subset RR$ ein offenes Intervall und $V$ der unendlichdimensionale Vektorraum der auf $I$ beliebig oft differenzierbaren Funktionen. Ein Endomorphismus $f in L(V,V)$ ist gegeben durch
$
f(phi) = phi' wide forall phi in V
$
Die Abbildung $f$ hat jedes $lambda in RR$ als Eigenwert, da für $c in RR without {0}$ und die Funktion
$
phi(x) := c dot e^(lambda x) space != space 0_V wide forall x in I
$
gilt
$
f(phi(x)) = f(c dot e^(lambda x)) = lambda (c e^(lambda x)) = lambda phi(x)
$
Hier: $phi'(x) = f(phi)$ ist eine gewöhnliche Differentialgleichung.

#bold[Beispiel 1.4:] Wir betrachten die lineare Abbildung $f: RR^2 -> RR^2$, welche durch 
$
f(vec(x_1, x_2)) = vec(x_2, -x_1) = mat(0,1;-1,0) vec(x_1, x_2)
$
definiert ist. Sei $x$ ein Eigenvektor, dann gilt
$
f(vec(x_1, x_2)) = vec(x_2, -x_1) = lambda vec(x_1, x_2) \
<==> x_2 = lambda x_1 space "und" space -x_1 = lambda x_2
$
O.B.d.A: $x_2 != 0$
$
==> x_2 = lambda(-lambda x_2) = - lambda^2 x_2
==> - lambda^2 = 1, space lambda in RR ==> lambda^2 >= 0 ==> - lambda^2 <= 0 space arrow.zigzag
$
D.h. $f$ besitzt keinen Eigenwert/-vektor. Für $f: CC^2 -> CC^2$ ändert sich dies! $==>$ Die Wahl von $K$ entscheidet!

#bold[Beispiel 1.5:] Wieder $f: RR^2 -> RR^2$, diesmal 
$
f(vec(x_1, x_2)) = vec(2 x_2, 2 x_1) = underbrace(mat(0,2;2,0), =: A) vec(x_1, x_2)
$
Dann gilt für $v_1 = vec(1,0), v_2 = vec(1,1), v_3 = (-1, 1)$ dass $f(v_1) = vec(0,2), f(v_2) = vec(2,2) = 2 dot v_2$ und $f(v_3) = vec(2,-2) = (-2) dot v_3$.

#figure(
  image("bilder2/1_5.jpg", width: 80%)
)

Beobachtung: $dim(V) = 2$

zwei Eigenwerte: $2, -2$, es existieren keine Weiteren,

zwei Eigenvektoren: $v_2 = vec(1,1), v_3 = vec(-1,1)$, sind linear unabhängig

#lemma("1.6")[
  Es sei $f in L(V,V)$ ein Endomorphismus. Eigenvektoren zu paarweise verschiedenen Eigenwerten von $f$ sind linear unabhängig.
]

#italic[Beweis:] Es seien $v_1, ..., v_m$ Eigenvektoren zu den paarweise verschiedenen Eigenwerten $lambda_1, ..., lambda_m$ von $f$. Beweis durch Induktion:

Induktionsanfang: $m = 1$, $lambda_1, v_1 != 0$ $==> v_1$ lin. unabh.

Induktionsschritt: $m-1 -> m$

Induktionsvorraussetzung: Behauptung gelte für $m-1$

Betrachte
$
alpha_1 v_1 + alpha_2 v_2 + ... + alpha_m v_m = 0 space (*) space space alpha_m in K \
==>^("EV, f()") alpha_1 lambda_1 v_1 + alpha_2 lambda_2 v_2 + ... + alpha_m lambda_m v_m = 0 \
==>^((\*) dot lambda_m) lambda_m alpha_a v_1 + lambda_m alpha_2 v_2 + ... + lambda_m alpha_m v_m = 0
$
Wir bilden die Differenz aus Zeile 1 und 2
$
underbrace((lambda_1 - lambda_m), != 0) alpha_1 v_1 + underbrace((lambda_2 - lambda_m), != 0) alpha_2 v_2 + ... + underbrace((lambda_(m-1) - lambda_m), != 0) alpha_(m-1) v_(m-1) = 0
$
$v_1, ..., v_(m-1)$ lin. unabh. $==>$ $alpha_1 = alpha_2 = ... = alpha_(m-1) = 0$
Einsetzen in (\*) liefert 
$
alpha_m underbrace(v_m, != 0) = 0 ==> alpha_m = 0
$
$==> v_1, ..., v_m$ lin unabh. 
#endproof

#bold[Folgerung:] Es gibt höchstens $n = dim(V)$ verschiedene Eigenwerte für $n = dim(V) < oo$.

#definition("1.7", "Eigenraum")[
  Ist $f in L(V,V)$ und $lambda in K$, so heißt $#sspace$
  $
  "Eig"(f, lambda) = {v in V | f(v) = lambda v}
  $
  der #bold[Eigenraum] von $f$ bezüglich $lambda$.
] <def> 

Es gilt:

#boxedlist[
  $"Eig"(f, lambda) subset.eq V$ ist ein Untervektorraum 
][
  $lambda$ ist Eigenwert von $f$ $<==> "Eig"(f, lambda) != {0}$
][
  $"Eig"(f, lambda) without {0}$ ist die Menge der zu $lambda$ gehörenden Eigenvektoren von $f$.
][
  $"Eig"(f, lambda) = "ker"(f - lambda "Id")$
][
  $dim("Eig"(f, lambda)) = dim(V) - rg(f - lambda "Id")$
][
  Sind $lambda_1, lambda_2 in K$ verschiedene Eigenwerte, so ist $"Eig"(f, lambda_1) sect "Eig"(f, lambda_2) = {0}$
]

Die letzte Aussage kann verallgemeinert werden zu:

#lemma("1.8")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Sind $lambda_1, ..., lambda_m, m <= n$, paarweise verschiedene Eigenwerte von $f$, so gilt 
  $
  "Eig"(f, lambda_i) sect limits(sum_(j = 1)^m)_(j != i) "Eig"(f, lambda_j) = {0} wide forall i = 1, ..., m
  $
  #v(-5mm)
]

#italic[Beweis:] Summe von Vektorräumen, vgl. Def 3.32 LinA I.

Sei $i in {1, ..., m}$ fest gewählt.
$
v in "Eig"(f, lambda_i) sect limits(sum_(j = 1)^m)_(i != j) "Eig"(f, lambda_j)
$
Also ist 
$
v = limits(sum_(j = 1)^m)_(j != i) v_j space "für" v_j in "Eig"(f, lambda_j) space "für" space j != i 
$
$==> -v + limits(sum_(j = 1)^m)_(j != i) v_j = 0$ 
Aus Lemma 1.6 folgt damit $v = 0$.
#endproof

Über die Identifikation von Endomorphismen und Matrizen für $dim(V) < oo$ erhält man:

#corollary("1.9")[Für ein $n in NN$ und einem Körper $K$ sei $A in K^(n,n)$. Dann gilt für jedes $lambda in K$, dass 
$
dim("Eig"(A, lambda)) = n - rg(A - lambda I_n)
$
Insbesondere ist $lambda in K$ ein Eigenwert von $A$, wenn $rg(A - lambda I_n) < n$ ist.
]

#definition("1.10", "Geometrische Vielfachheit")[
  Ist $f in L(V,V)$ und $lambda in K$ ein Eigenwert von $f$, so heißt  $#sspace$
  $
  g(f, lambda) := dim("Eig"(f, lambda)) wide (> 0)
  $
  die geometrische Vielfachheit des Eigenwerts $lambda$.
] <def>

== Das charakteristische Polynom

Wir bestimmt man Eigenwerte?

#lemma("1.11")[
  Seien $A in K^(n,n)$ und $lambda in K$. Dann ist
  $
  det(A - lambda I_n)
  $
  ein Polynom $n$-ten Grades in $lambda$.
]

#italic[Beweis:] Mit der Leibniz-Formel folgt,
$
det lr((underbrace(A - lambda I_n, tilde(a)_(i j))), size: #25%) = sum_(sigma in S_1) sgn(sigma) dot tilde(a)_(1 sigma(1)) dot ... dot tilde(a)_(n sigma(n)) \
= underbrace(underbrace((a_(1 1) - lambda) dot (a_(2 2) - lambda) dot ... dot (a_(n n) - lambda), sigma = "Id"), in cal(P)_n space.thin "in" space.thin lambda) + underbrace(underbrace(S, sigma != "Id"), in cal(P)_(n -2) space.thin "in" space.thin lambda)
$
Weiter gilt:
$
(a_(1 1) - lambda) dot ... dot (a_(n n) - lambda) = (-1)^n lambda^n + (-1)^(n-1) lambda^(n-1) (a_(1 1) + ... + a_(n n)) + underbrace(S_1, in cal(P)_(n-2) "in" lambda)
$
Insgesamt: Es existieren Koeffizienten $a_0, ..., a_n in K$ mit 
$
det(A - lambda I_n) = a_n lambda^n + a_(n-1) lambda^(n-1) + ... + a_1 lambda + a_0 \
a_n = (-1)^n \
a_(n-1) = (-1)^(n-1) (a_(1 1) + ... + a_(n n))
$
man kann zeigen: $a_0 = det(A)$ 
#endproof

Man nennt $a_(1 1) + a_(2 2) + ... + a_(n n)$ auch die #bold[Spur] von $A$.

#definition("1.12", "Charakteristisches Polynom")[
  Sei $A in K^(n,n)$ und $lambda in K$. Dann heißt das Polynom $n$-ten Grades
  $
  P_A (lambda) := det(A - lambda I_n)
  $
  das charakteristische Polynom zu $A$.
] <def>

#lemma("1.13")[
  Sei $A in K^(n,n)$ und $lambda in K$. Der Skalar $lambda$ ist genau dann Eigenwert von $A$, wenn
  $
  P_A (lambda) = 0
  $
  gilt.
]

#italic[Beweis:] Die Gleichung 
$
A v = lambda v <==> A v - lambda v = 0 <==> (A - lambda I_n) v = 0
$
hat genau eine Lösung $v in V, v != 0$, wenn $rg(A - lambda I_n) < n$, vgl. Satz 6.3 aus LinA I. Dies ist genau dann der Fall, wenn
$
det(A - lambda I_n) = 0, "vlg. D10 aus LinA I"
$
#endproof

#bold[Beispiel 1.14:] Eigenwerte und -vektoren von 
$
A = mat(3,8,16;0,7,8;0,-4,-5)
$
Regel von Sarrus liefert 
$
P_A (lambda) = mat(3-lambda,8,16;0,7-lambda,8;0,-4,-5-lambda) \
= (3-lambda)(-35-7 lambda+5 lambda + lambda^2 +32) \
= (3-lambda)[(7-lambda)(-5-lambda)-8(-4)]-8 (0-0) + 16(0-0) \
= (3-lambda)(lambda^2 - 2 lambda -3 ) =(3-lambda)(lambda+1)(lambda-3)
$
$==>$ Eigenwerte sind $lambda = 3$ und $lambda = -1$

Zugehörige Eigenvektoren?

$lambda = -1$:
$
A v = -v <==> (A + I_3) v = 0  \
mat(4,8,26;0,8,8;0,-4,-4) vec(v_1, v_2, v_3) = vec(0,0,0)
$
LGS lösen: $==> v_2 = -v_3, v_1 = -2 v_3$

Damit ist z.B.: $w_1 = (2, 1, -1)^top$ Eigenvektor.

$lambda = 3$:
$
(A-3I_3) v = 0 <==> \
mat(0,8,16;0,4,8;0,-4,-8) vec(v_1, v_2, v_3) = 0 in RR^3 <==> v_2 + 2v_3 = 0
$
Damit sind z.B.: $w_2 = (1,2,-1)^top, w_3 = (-1,2,-1)$ Eigenvektoren.

$lambda = -1$: einfache Nullstelle und $dim("Span"(w_1)) = 1$ passt zu $rg(A - (-1) I_n) = 2$ und $ dim("Eig"(A_1 - 1)) = 3- 2 = 1$.

$lambda = -3$: doppelte Nullstelle und $dim("Span"(w_2, w_3)) = 2$ passt zu $rg(A - 3 I_n) = 1$ und $dim("Eig"(A, 3)) = 3-1 = 2$ 

#lemma("1.15")[
  Sei $A in K^(n,n)$. Dann gilt 
  $
  p_A (.) = p_(A^top) (.)
  $
  D.h. eine Matrix und ihre Transponierte haben die gleichen Eigenwerte.
]
#italic[Beweis:] 
$
p_A (lambda) = det(A- lambda I_n) =^("D12") = det((A-lambda I_n)^top) = det(A^T - lambda I_n) = p_(A^top) (lambda)
$
#endproof

#bold[Achtung:] Die Eigenwerte bleiben gleich, aber nicht die Eigenvektoren.

#bold[Beispiel 1.16:] Für die Matrix $A$ aus Bsp. 1.14 gilt
$
A^top = mat(3,0,0;8,7,-4;16,8,-5) ==> det(A^top - lambda I_n) = (3-lambda)[(7-lambda)(-5-lambda)+4 dot 8] \
= -(lambda-3)^2(lambda+1)
$
Aber
$
mat(3,0,0;8,7,-4;16,8,-5) vec(2,1,-1) = vec(6,27,45) != (-1) vec(2,1,-1)
$
Man kann ausrechnen:
$
tilde(w)_1 = vec(0,1,2) space "EV zu EW" -1, tilde(w)_2 = vec(0,1,1), tilde(w)_3 space "EV zu EW" 3
$

Übertragung auf Endomorphismen?

$p_f (lambda) space f in L(V,V)$, $B "Basis" => exists! A_f^(B,B)$, $C "Basis" ==> exists! A_f^(C,C)$
$
p_(A^(B,B)_f) (lambda) =^"?" p_(A^(C,C)_f) (lambda)
$

#definition("1.17", "ähnliche Matrizen")[
  Zwei Matrizen $A, B in K^(n,n)$ heißen #bold[ähnlich], wenn es eine Matrix $T in "GL"_n (K)$ gibt, so dass $A = T B T^(-1)$ gilt.
]

Man kann leicht beweisen, dass die Ähnlichkeit von Matrizen eine Äquivalenzrelation auf der Menge der quadratischen Matrizen ist.

Mit $det(A^(-1)) =^"D11" (det(A))^(-1)$ folgta für zwei ähnliche Matrizen $A$ und $B$, dass 
$
det(A) = det(T B T^(-1)) = det(T) det(B) det(T^(-1)) = det(B)
$

#bold[Beispiel 1.18:] Sei $f in L(RR^3, RR^3)$, d.h. $V= RR^3$, gegeben durch
$
f(vec(x_1, x_2, x_3)) = vec(x_1, -4 x_1 + 7 x_2, 3 x_1 + 5 x_2 + 3 x_3)
$
Wir betrachten für den $RR^3$ die Basen
$
E = {vec(1,0,0), vec(0,1,0), vec(0,0,1)}, \ 
B = {vec(1,0,0), vec(1,1,0), vec(1,1,1)}, \
C = {vec(0,0,-1), vec(1,0,0), vec(0,-1,0)}
$
Für darstellende Matrix von $f$ bezüglich der Standardmatrix $E$ erhalten wir aus Satz 5.18, LinA I, 
$
f(e_j) = sum_(i=1)^3 a_(i j) e_i quad forall j in {1,2,3}
$
dass
$
A_f^(E,E) = mat(1,0,0;-4,7,0;3,5,3)
$
Das zugehörige kommutative Diagramm ist gegeben durch
#figure(
  image("bilder2/1_18.jpg", width: 40%)
)

Für die Basis $B$ erhalten wir 
$
f(vec(1,0,0)) = vec(1,-4,3) = 5 vec(1,0,0) + (-7) vec(1,1,0) + 3 vec(1,1,1) \
f(vec(1,1,0)) = vec(1,3,8) = (-2) vec(1,0,0) + (-5) vec(1,1,0) + 8 vec(1,1,1) \
f(vec(1,1,1)) = vec(1,3,11) = (-2) vec(1,0,0) + (-8) vec(1,1,0) + 11 vec(1,1,1) \
==> A_f^(B,B) = mat(5,-2,-2;-7,-5,-8;3,8,11)
$
Herleitung bezüglich Matrizen?
#figure(image("bilder2/1_18_2.jpeg", width: 30%))

Koordinatenabbildung $Phi_B$?

Abbildung vom $RR^3$ + Standardbasis $E$ in den $V (= RR^3)$ + Basis $B$.
$
Phi_B = (e_i) = v_i quad "für" quad B = {v_1, v_2, v_3} \
==> A_(Phi_B)^(E, B) = mat(1,1,1;0,1,1;0,0,1)
$
Damit folgt insgesamt:
$
A_f^(B,B) = (A_(Phi_B)^(E,B))^(-1) I_n A_f^(E,E) I_n^(-1) A_(Phi_B)^(E,B) = (A_(Phi_B)^(E,B))^(-1) A_f^(E,E) underbrace(A_(Phi_B)^(E,B), in "GL"_n (RR)) \
==> A_f^(B,B) "und" A_f^(E,E) "sind ähnlich"
$
Für die Basis $C$ erhalten wir
$
f(vec(0,0,-1)) = vec(0,0,-3) = 3 vec(0,0,-1) + 0 vec(1,0,0) + 0 vec(0,-1,0) \
f(vec(1,0,0)) = vec(1,-4,3) = (-3) vec(0,0,-1) + 1 vec(1,0,0) + 4 vec(0,-1,0) \
f(vec(0,-1,0)) = vec(0,-7,-5) = 5 vec(0,0,-1) + 0 vec(1,0,0) + 7 vec(0,-1,0)
$
Als Darstellungsmatrix erhält man
$
A_f^(C,C) = mat(3,-3,5;0,1,0;0,4,7)
$
Als Matrizenmultiplikation
#figure(image("bilder2/1_18_3.jpeg", height: 30%))

Darstellung von $Phi_C$?
$Phi_C (e_i) = w_i quad "für" quad C = {w_1, w_2, w_3}$
$
A_(Phi_C)^(E,C) = mat(0,1,0;0,0,-1;-1,0,0)
$
$
A_f^(C,C) = (A_(Phi_C)^(E,C))^(-1) I_n A_f^(E,E) I_n^(-1) A_(Phi_C)^(E,C) = (A_(Phi_C)^E,C)^(-1) A_f^(E,E) A_(Phi_C)^(E,C)
$
Also auch: $A_f^(C,C)$ ist ähnlich zu $A_f^(E,E)$.

Alternativ:
$
A_f^(C,C) &= (A_(Phi_C)^(E,C))^(-1) I_n I_n^(-1) A_(Phi_B)^(E,B) A_f^(B,B) (A_(Phi_B)^(E,B))^(-1) I_n A_(Phi_C)^(E,C) \
&= underbrace((A_(Phi_C)^(E,C))^(-1) A_(Phi_B)^(E,B), in "GL"_n (RR)) A_f^(B,B) (A_(Phi_B)^(E,B))^(-1) A_(Phi_C)^(E,C)
$

Jetzt allgemein: $f in L(V,V)$, $dim(V) < oo$, $B,C$ seien Basen von $V$ $==>$ 
$
A := A_f^(B,B) wide tilde(A) := A_f^(C,C)
$
und es existiert $T in "GL"_n (K)$ als Basistransformationsmatrix, so dass
$
tilde(A) = T A T^(-1)
$
Dann gilt
$
p_(tilde(A)) (lambda) &= det(tilde(A) - lambda I_n) = det(T A T^(-1) - lambda T T^(-1)) \
&= det(T (A -lambda I_n) T^(-1)) \ 
&= det(T) det(A - lambda I_n) det(T^(-1)) \
&= p_A (lambda)
$

D.h. für einen Endomorphismus ist das charakteristische Polynom der zugehörigen Darstellungsmatrix unabhängig von der Wahl der Basis!

Damit ist es sinnvoll, für $f in L(V,V)$, $dim(V) < oo$, 
$
p_f (.) := p_A (.)
$
für $A$ als Darstellungsmatrix $A_f^(B,B)$ für eine Basis $B$.

#lemma("1.19")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Dann sind folgende Aussagen äquivalent:

  #box(width: 100%, inset: (left: 0.5cm, right: 0.5cm))[
    1. $lambda in K$ ist ein Eigenwert von $f$.
    2. $lambda in K$ ist ein Eigenwert der Darstellungsmatrix $A_f^(B,B)$ für eine gewählte $B$ von $V$.
  ]
]

Des weiteren gilt auch. Für zwei ähnliche $A$ und $B$ gilt $p_A (lambda) = p_B (lambda)$
$
A, B "ähnlich" ==> p_A (lambda) = p_B (lambda)
$
z.B.
$
A = mat(1,0;2,1) wide B = mat(1,0;0,1) \
p_A (lambda) = (1-lambda)^2 = p_B (lambda), "aber für jedes" T in "GL"_2 (RR) "gilt" \
T B T^(-1) = T T^(-1) = I != A "also" A, B "nicht ähnlich"
$

Weitere Beobachtung: Aus Lemma 1.13 und Lemma 1.19 folgt, dass die Eigenwerte von $f in L(V,V)$ die Nullstellen des charakteristischen Polynoms der Matrix $A_f^(B,B)$ für eine Basis $B$ ist. Dies gilt #bold[nicht] i.a. für Darstellungsmatrizen $A_f^(B,C)$ für $B != C$.

#definition("1.20", "Algebraische Vielfachheit")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$. Ist $f in L(V,V)$ und $tilde(lambda)$ ist Eigenwert von $f$ hat das charakteristische Polynom $p_f (lambda)$ die Form 
  $
  p_f (lambda) = (lambda - tilde(lambda))^d dot tilde(p) (lambda)
  $
  für ein $tilde(p)(.) in KK[lambda]$ mit $tilde(p)(tilde(lambda)) != 0$, so nennt man $d$ die #bold[algebraische Vielfachheit] von $tilde(lambda)$ und bezeichnet sie $a(f, tilde(lambda))$.
]

#lemma("1.21")[
  Seien $V$ ein $K$-Vektorraum, $dim(V) = n < oo$, und $f in L(V,V)$. Für Eigenwert $tilde(lambda)$ von $f$ gilt 
  $
  g(f, tilde(lambda)) <= a(f, tilde(lambda))
  $
]

#italic[Beweis:] Ist $tilde(lambda)$ EW von $f$ mit der geometrischen Vielfachheit $m := g(f, tilde(lambda))$, so gibt es nach Def. 1.10 zu $tilde(lambda)$ $m$ linear unabhängige Eigenvektoren $v_1, ..., v_m in V$.

Gilt $m = n = dim(V)$ sind ${v_1, ..., v_m}$ schon Basis von $V$.

Gilt $m < n$, so folgt aus dem Basisergänzungssatz (Satz 3.21, LinA I), dass man ${v_1, ..., v_m}$ zu einer Basis ${v_1, ..., v_m, v_(m+1), ..., v_n} =: B$ ergänzen. Wegen $f(v_j) = tilde(lambda) v_j, 1<=j<=m$, gilt 
$
A_f^(B,B) = mat(tilde(lambda) I_n, A_1; 0, A_2) in K^(n,n)
$
für zwei  Matrizen $A_1 in K^(m, n-m)$, $A_2 in K^(n-m, n-m)$.

Mit D9 aus LinA I folgt
$
p_f (lambda) = (tilde(lambda) - lambda)^m dot det(A_2 - lambda I_(n-m,n-m))
$
$==>$ EW $tilde(lambda)$ ist mindestens $m$-fache Nullstelle von $p_f (lambda)$. Für $m = n ==> A_f^(B,B) = tilde(lambda) I_n ==>$ $p_f (lambda) = (tilde(lambda) - lambda)^m$
#endproof

#pagebreak()

= Diagonalisierbarkeit und Normalform

== Diagonalisierbarkeit

#definition("2.1", "Diagonalisierbar")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$. Ein $f in L(V,V)$ heißt #bold[diagonalisierbar], wenn es eine Basis $B$ von $V$ gibt, so dass $A_f^(B,B)$ eine Diagonalmatrix ist. D.h. es existieren $lambda_1, ..., lambda_n in K$ mit 
  $
  A_f^(B,B) = mat(lambda_1, ..., 0;dots.v,dots.down,dots.v;0,dots,lambda_n) in K^(n,n)
  $
]
Entsprechend nennen wir eine Matrix $A in K^(n,n)$ #bold[diagonalisierbar], wenn es eine Matrix $T in "GL"_n (K)$ und eine Diagonalmatrix $D in K^(n,n)$ gibt mit
$
A = T D T^(-1)
$
D.h. $A$ ist ähnlich zu einer Diagonalmatrix.

#theorem("2.2")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Dann sind folgende Aussagen äquivalent:

  #box(width: 100%, inset: (left: 0.5cm, right: 0.5cm))[
    1. $f$ ist diagonalisierbar
    2. Es gbit eine Basis $B$ von $V$ bestehend aus Eigenvektoren von $f$.
    3. #[
      Das charakteristische Polynom $p_f (.)$ zerfällt in $n$ Linearfaktoren über $K$, d.h.
      $
      p_f (lambda) = (lambda - lambda_1) dot ... dot (lambda - lambda_n)
      $
      mit Eigenwerten $lambda_1, ..., lambda_n in K$ für $f$ und für jeden Eigenwert $tilde(lambda)$ gilt $a(f, tilde(lambda)) = g(f, tilde(lambda))$. 
    ]
  ]
]

#italic[Beweis:] 

"$1 ==> 2$": $f$ diagonalisierbar $==>$ $exists {v_1, ..., v_n} = B$ Basis von $V, lambda_1, .., lambda_n in K$:
$
tilde(A) := A_f^(B,B) = mat(lambda_1, ..., 0;dots.v,dots.down,dots.v;0,dots,lambda_n) wide f(v_j) = sum_(i = 1)^n a_(i j) v_i
$
$==> f(v_j) = lambda_i v_i, 1 <=i <=n, v_i != 0$. $==>$ Damit sind $lambda_1, ..., lambda_n$ Eigenwerte von $f$ mit zugehörigen Eigenvektoren $v_1, ..., v_n$. $==> 2.$

"$2 ==> 1$": Ist $B = {v_1, ..., v_n}$ eine Basis von $V$ bestehend aus Eigenvektoren, so gibt es zugehörige Eigenwerte $lambda_1, ..., lambda_n$ mit $f(v_j) = lambda_j v_j$, $1<= j <=n$ $==>$
$
A_f^(B,B) = mat(lambda_1, ..., 0;dots.v,dots.down,dots.v;0,dots,lambda_n)
$

"$2==>3$": Sei $B = {v_1, ..., v_n}$ eine Basis von Eigenvektoren, $lambda_1, ..., lambda_n$ seien die zugehörigen Eigenwerte $==>$
$
p_f (lambda) = p_(A_f^(B,B)) (lambda) = det(A_f^(B,B) - lambda I_n) \
= (lambda_1 - lambda) dot (lambda_2 - lambda) dot ... dot (lambda_n - lambda)
$
$==>$ $p_f (.)$ zerfällt in Linearfaktoren. Verschiedene Eigenwerte $tilde(lambda)_1, ..., tilde(lambda)_k, k <=n$. Der Eigenwert $tilde(lambda)_i$ besitzt die algebraische Vielfachheit $m_j := a(f, tilde(lambda)_j)$ genau dann, wenn er $m_j$-mal auf den Diagnolen von $A_f^(B,B)$ steht. Dies ist genau dann der Fall, wenn $m_j$ Eigenvektoren zu $tilde(lambda)_j$ in $B$ enthalten sind. Diese sind linear unabhängig $==>$
$
1. &dim("Eig"(f, tilde(lambda)_j)) = g(f, tilde(lambda)_j) >= m_j = a(f, tilde(lambda)_j) \
2. &"Lemma 1.21:" g(f, tilde(lambda)_j) <= a(f, tilde(lambda)_j) \
$
$
1 and 2 ==> g(f, tilde(lambda)_j) = a(f, tilde(lambda)_ j)
$

"$3==>2$": Seien $tilde(lambda)_1, ..., tilde(lambda)_k, k<=n$ die paarweise verschiedenen Eigenwerte von $f$. Wir wissen: $cal(P)_n in p_f (.)$ zerfällt in Linearfaktoren, $a(f, tilde(lambda)_j) = g(f, tilde(lambda)_j), 1<=j<=n$.
$
dim(V) = n = sum_(j = 1)^k a(f, tilde(lambda)_j) = sum_(j = 1)^k g(f, tilde(lambda)_j) = sum_(j = 1)^k dim("Eig"(f, tilde(lambda)_j))
$
Es gilt (Lemma 1.8):
$
"Eig"(f, tilde(lambda)_j) sect sum_(i = 1)^k "Eig"(f, tilde(lambda)_i) = 0 quad forall j = 1, ..., k
$
Dann folgt (Lemma 3.31, (2), Lemma 3.35, Satz 3.14) (direkte Summe, $U subset V$ UVR $==>$ $dim(U) <= dim(V)$, $U=V$ $dim(U) = dim(V)$, Basis $<==>$ eindeutige Darstelltung), dass die zu $tilde(lambda)_1, ..., tilde(lambda)_n$ linear unabhängigen Eigenvektoren, die jeweils eine Basis von $"Eig"(f, tilde(lambda)_j)$, $1 <=j<=k$, eine Basis von $V$ bilden.
#endproof

In Verbindung mit Lemma 1.6 folgt unmittelbar:

#corollary("2.3")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$ mit $n$ paarweise verschiedenen Eigenwerten, dann ist $f$ diagonalisierbar.
]

#bold[Bemerkung:] Das Kriterium der $n$ paarweise verschiedenen Eigenwerte ist nicht notwendig z.B. $V = K^n$, $B = E$ Standardbasis
$
f: "Id": K^n -> K^n, ==> A_f^(E,E) = I_n ==> 1 n"-facher Eigenwert"
$

#bold[Beispiel 2.4:] Fortsetzung von Bsp. 1.14
$
A = mat(3,8,16;0,7,8;0,-4,-5), "EW:" -1, 3 \
w_1 = vec(2,1,-1) "EV zu" -1, space w_2 = vec(1,2,-1), w_3 = vec(-1,2,-1) "EV zu" 3
$
$==>$ $exists$ Basis von Eigenvektoren
$==>^"Satz 2.2"$ $A$ ist diagonalisierbar
$
p_A (lambda) = (3-lambda)(lambda+1)(lambda-3) \
a(f, -1) = 1 = g(f, -1) \
a(f, 3) = 2 = g(f, 3)
$
$T in "GL"_n (RR)$ so, dass $T^(-1) A T = D$? 

Die zu $B = {w_1, w_2, w_3}$ gehörende Koordinatentransformation $Phi_B$ ist gegeben durch 
$
A_(Phi_B)^(E,B) = mat(2,1,-1;1,2,2,;-1,-1,-1)
$
Dann gilt: Für $f in L(RR^3, RR^3)$ mit 
$
A_f^(E,E) = A wide A_f^(B,B) = mat(-1,0,0;0,3,0;0,0,3) = D
$
Mit Basiswechsel von $A$ zu $D$
$
D = (A_(Phi_B)^(E,B))^(-1) A underbrace(A_(Phi_B)^(E,B), = T)
$

#bold[Beispiel 2.5:] Nicht jeder Endomorphismus bzw. jede Matrix ist diagonalisierbar. Bsp. 1.4:
$
f: RR^2 -> RR^2, quad f(vec(x_1, x_2)) = overbrace(mat(0,1;-1,0), A) vec(x_1, x_2), quad p_f (lambda) = lambda^1 + 1
$
D.h. über $RR$ zerfällt $p_f (.)$ nicht in Linearfaktoren.

Ein weiteres Beispiel
$
A = mat(5,10,7;0,-3,-3;0,3,3)
$
$==>$ $p_A (lambda) = (5-lambda) lambda^2$ $==>$ $p_A (.)$ zerfällt in Linearfaktoren. $a(f, lambda_i), g(f, lambda_i)$ für $lambda_1 = 5, lambda_2 = 0$.
Lemma 1.21: $g(f, lambda_i) <= a(f, lambda_i)$
$==>$ $g(f,5) = 1 = a(f,5)$, $a(f,0) = 2, g(f,0) >= 1$
Ein Eigenvektor zu $lambda = 0$ sind 
$
w_1 = vec(3,-5,5) ==> g(f, 0) = 1 < 2 = a(f,0)
$
$==>$ $f$ nicht diagonalisierbar.
#sect_delim

Mit Satz 2.2 erhält man einen Algorithmus zur Überprüfung, ob ein gegebenes $f in L(V,V)$ (bzw. $A in K^(n,n)$) diagonalisierbar ist:

#enum([
  Bestimme mit einer Basis $B$ von $V$ die Darstellungsmatrix $A = A_f^(B,B)$
],[
  Bestimme für $A$ das charakteristische Polynom $p_A (.)$ (Determinantenberechnung)
],[
  Zerfällt $p_A (.)$ in Linearfaktoren über $K$? Nein: $f$ nicht diagonalisierbar. Ja: Seien $lambda_i, 1 <= i <= k <=n = dim(V)$ die paarweise verschiedene Eigenwerte von $f$. 

  Für $i = 1, ..., k$

  #enum([
    Bestimme eine Basis von $"Eig"(f, lambda_i)$
  ],[
    Prüfe, ob $a(f, lambda_i) = g(f, lambda_i)$
  ])

  Gilt $a(f,lambda_i) = g(f, lambda_i)$ für alle $i in {1,...,k}$. Nein: $f$ ist nicht diagonalisierbar. Ja: $f$ ist diagonalisierbar.
])

#bold[Beispiel 2.6:] Fischer/Springborn

Betrachtet wird: Masse aufgehänt an einer Feder. Zur Zeit $t = 0$ in Position $y(0) = alpha$ und ausgelenkt in senkrechter Richtung mit Geschwindigkeit $beta = dot(y) (0)$

$y(t) corres$ Position der Masse zum Zeitpunkt $t$

#figure(image("bilder2/2_6.jpeg", width: 50%))

Dieses System wird durch die gewöhnliche Differentialgleichungen
$
dot.double(y) + 2 mu dot(y) + omega^2 y = 0, quad y(0) = alpha, dot(y) (0) = beta
$
Umschreiben
$
dot(y)_0 &= y_1 \
dot(y)_1 &= -omega^2 y_0 - 2 mu y_1
$
mit $y_0 = y, dot.double(y)_0 = dot.double(y), y_0 (0) = alpha, y_1 (0) = beta$.
$
dot(tilde(y)) := vec(dot(y)_0,dot(y)_1) = mat(0,1;-omega^2,-2 mu) vec(y_0, y_1)
$
$
p_A (lambda) = lambda^2 + 2 mu lambda + w^2
$
mit den potentiellen Nulstellen
$
lambda = -mu plus.minus sqrt(mu^2 - w^2)
$
Man unterscheidet drei Fälle:

#boxedlist[$0<=mu<omega$, d.h. $mu^2-omega^2<0$ $==>$ schwache Dämpfung][$mu = omega$, d.h. $mu^2 = omega^2$ $==>$ aperiodischer Fall $==>$ $a(A, -mu) = 2$, $dim("Eig"(A, -mu)) = 1$, $A$ nicht diagonalisierbar][$mu > omega$, d.h. $mu^2 >omega^2$, starke Dämpfung]

Eine solche Eigenwertanalyse kann auch nutzen, um das Langzeitverhalten von Lösungen von gewöhnlichen DGL zu bestimmen.

#figure(image("bilder2/2_6_2.jpeg", width: 70%))

#theorem("2.7")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Dann sind folgende Aussagen äquivalent:

  #enum([
    Das charakteristische Polynom $p_f (.)$ zerfällt über $K$ in Linearfaktoren.
  ],[
    Es gibt eine Basis $B$ von $V$, so dass $A_f^(B,B)$ eine obere Dreiecksmatrix ist, d.h.
    $
    A_f^(B,B) = mat(1, ..., *; dots.v, dots.down, dots.v; 0, ..., *)
    $
    und $f$ ist damit #bold[triangulierbar].
  ])
]

#italic[Beweis:] Beweis von Satz 14.18 im Liesen/Mehrmann
#endproof

Nun ist das Ziel:

Bestimmung einer Basis $B$ von $V$, so dass $A_f^(B,B)$ eine obere Dreiecksmatrix ist, die möglichst nah an einer Diagonalmatrix ist und von der geometrischen Vielfachheiten der Eigenwerte abgelesen werden können.

D.h. $p_f (.)$ zerfällt in Linearfaktoren mit den Eigenwerten $lambda_1, ..., lambda_k$ (notwendig, Satz 2.7) und wir wollen eine Basis $B$ bestimmen, so dass $A_f^(B,B)$ Diagonalblockgestalt hat mit 
$
A_f^(B,B) = mat(J_1 (lambda_1), ..., 0; dots.v, dots.down, dots.v; 0, ..., J_m (lambda_m))
$
wobei jeder Diagonalblock die Form
$
J_i (lambda_i) = mat(lambda_i, 1, ..., 0; 0, dots.down, dots.down, dots.v; dots.v, dots.down, dots.down, 1; 0, ..., 0, lambda_i) in K^(d_i, d_i) wide (*)
$

#definition("2.8", "Jordan-Block")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$, $f in L(V,V)$ und $lambda_i$ ein Eigenwert von $f$. Eine Matrix der Form $(*)$ heißt #bold[Jordan-Block] der Größe $d_i$ zum Eigenwert $lambda_i$.
]
Wegen der Bedeutung der Jordan-Normalform gibt es zahlreiche Herleitungen mit unterschiedlichen mathematischen Hilfsmitteln.

Hier: Beweis über die Dualitätstheorie basirend auf einer Arbeit von V. Pt $minus(a)$ k (1956)

== Dualräume

#definition("2.9", "Linearform, Dualraum")[
  Sei $V$ ein $K$-Vektorraum. Eine Abbildung $f in L(V, K)$ heißt #bold[Linearform]. Den $K$-Vektorraum $V^* := L(V,K)$ nennt man #bold[Dualraum].
]

Gilt $dim(V) = n < oo$ so folgt aus Satz 5.18 LinA I, dass $dim(V^\*) = n$ gilt. Ist $B = {v_1, ..., v_n}$ eine Basis von $V$ und $C = {1}$ eine Basis des $K$-Vektorraum $K$, dann gilt für
$
f(v_i) = mu_i in K space "für" space f in V^\*", d.h." f: V -> K,
$
für $i = 1, ..., n$ und damit 
$
A_f^(B,C) = (mu_1, ..., mu_n) in K^(1,n)
$

#bold[Beispiel 2.10:] Sei $V$ der $RR$-Vektorraum der auf dem Intervall $[0, 1]$ stetigen, reellwertigen Funktionen und $a in [0,1]$. Dann sind 
$
g_1: &V -> RR, quad g_1 (f) := integral_0^1 f(x) d x \
g_2: &V -> RR, quad g_2 (f) := f(a)
$
Linearformen auf $V$. 

Basis des Dualraums?
