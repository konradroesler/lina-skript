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
] <def>

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
] <def>

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
] <def>
Entsprechend nennen wir eine Matrix $A in K^(n,n)$ #bold[diagonalisierbar], wenn es eine Matrix $T in "GL"_n (K)$ und eine Diagonalmatrix $D in K^(n,n)$ gibt mit
$
A = T D T^(-1)
$
D.h. $A$ ist ähnlich zu einer Diagonalmatrix.

#theorem("2.2")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Dann sind folgende Aussagen äquivalent:

  #box(width: 100%, inset: (left: 0.5cm, right: 0.5cm))[
    1. $f$ ist diagonalisierbar
    2. Es gibt eine Basis $B$ von $V$ bestehend aus Eigenvektoren von $f$.
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
] <def>
Wegen der Bedeutung der Jordan-Normalform gibt es zahlreiche Herleitungen mit unterschiedlichen mathematischen Hilfsmitteln.

Hier: Beweis über die Dualitätstheorie basirend auf einer Arbeit von V. Pt $minus(a)$ k (1956)

== Dualräume

#definition("2.9", "Linearform, Dualraum")[
  Sei $V$ ein $K$-Vektorraum. Eine Abbildung $f in L(V, K)$ heißt #bold[Linearform]. Den $K$-Vektorraum $V^* := L(V,K)$ nennt man #bold[Dualraum].
] <def>

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

#theorem("2.11")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $B = {v_1 .., v_n}$ eine Basis von $V$. Dann gibt es genau eine Basis $B^* = {v_1^*, ..., v_n^*}$ von $V^* = L(V, K)$ für die 
  $
  v_i^* (v_j) = delta_(i j) quad i, j = 1, ..., n
  $
  gilt. Diese Basis heißt die zu $B$ duale Basis.
]

#italic[Beweis:] Lemma 4.10: LinA I. Es gibt eine lineare Abbildung $v_i^*$ für die $v_i^* (v_j) = delta_(i j)$ für $j = 1, ..., n$, für $i = 1, ..., n$. Noch zu zeigen: $v_i^*$ sind Basis von $V^*$. Wir wissen schon: $dim (V^*) = n$. Also: Es reicht zu zeigen: ${v_i^*}_(i = 1, ..., n)$ linear unabhängig. Seien $mu_i  in K$ so, dass 
$
sum_(i = 1)^n mu_i v_i^* = 0 in V^* = L(V,K)
$
Dann gilt:
$
0_K = 0_(V^*) (v_j) = sum_(i = 1)^n mu_i v_i^* (v_j) = mu_j quad j = 1, ..., n
$
#endproof

#definition("2.12", "duale Abbildung")[
  Seien $V$ und $W$ zwei $K$-Vektorräume mit den zugehörigen Dualräumen $V^*$ und $W^*$. Für $f in L(V,W)$ heißt 
  $
  f^*: W^* -> V^*, quad f^* (h) = h circ f
  $
  die zu $f$ #bold[duale Abbildung].
] <def>

#figure(image("bilder2/2_12.jpeg", width: 40%))

Seien $U subset.eq V$ und $Z subset.eq V^*$ zwei Unterräume. Dann heißt die Menge 
$
U^0 := {h in V^* | h(u) = 0 "für alle" u in U}
$
#bold[Annihilator] von  $U$ und die Menge
$
Z^0 := {v in V | z(v) = 0 "für alle" z in Z}
$
#bold[Annihilator] von $Z$.

Man kann sich überlegen: 

#boxedlist[
  Die Mengen $U^0 subset.eq V^*$ und $Z^0 subset.eq V$ sind Untervektorräume von $V^*$ bzw $V$
][
  Es gilt für $f in L(V,V)$
  $
  (f^k)^* = (f^*)^k
  $
]
Des Weiteren besitzt die duale Abbildung folgende Eigenschaften:

#lemma("2.13")[
  Sind $V, W$ und $X$ drei $K$-Vektorräume. Dann gilt 

  #enum[
    Ist $f in L(V,W)$, dann ist die duale Abbildung $f^*$ linear, d.h. $f^* in L(W^*, V^*)$
  ][
    Ist $f in L(V, W)$ und $g in L(W, X)$, dann ist $(g circ f)^* in L(X^*, V^*)$ und es gilt $(g circ f)^* = f^* circ g^*$
  ][
    Ist $f in L(V,W)$ bijektiv, dann ist $f^* in L(W^*, V^*)$ bijektiv und es gilt $(f^*)^(-1) = (f^(-1))^*$
  ]
]

#italic[Beweis:] ÜB
#endproof

#lemma("2.14")[
  Sei $V$ ein endlichdimensionaler Vektorraum, $f in L(V,V)$, $f^* in$ $L(V^*, V^*)$ und $U subset.eq V$, sowie $W subset.eq V^*$ zwei Vektorräume. Dann gilt:

  #enum[
    $dim(V) = dim(W) + dim(W^0)$
  ][
    Ist $f$ nilpotent vom Grad $m$, dann ist die duale Abbildung $f^*$ ebenfalls nitpotent vom Grad $m$.
  ][
    Ist $W subset.eq V^*$ ein $f^*$-invarianter Vektorraum, dann ist $W^0$ ein $f$-invarianter Unterraum.
  ]
]

#italic[Beweis:] ÜA
#endproof

#definition("2.15", "nilpotent vom Grad m")[
  Sei ${0} != V$ ein $K$-Vektorraum. Man nennt $f in L(V,V)$ #bold[nilpotent], wenn ein $m in NN$ existiert, so dass $f^m = 0 in L(V,V)$ gilt. Gilt für dieses $m$, dass $f^(m-1) != 0 in L(V,V)$, so heißt $f$ #bold[nilpotent vom Grad m] und $m$ is der #bold[Nilpotenzindex] von $f$.
] <def>

#definition("2.16", [$f$-invarianter Unterraum])[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$, $U subset.eq V$ ein Unterraum und $f in L(V,V)$. Gilt $f(U) subset.eq U$, d.h. ist $f(u) in U$ für alle $u in U$, so nennt man $U$ einen $f$-invarianten Unterraum von $V$.
] <def>

#definition("2.17", "Bilinearform")[
  Seien $V$ und $W$ zwei $K$-Vektorräume. Eine Abbildung $a: V times W -> K$ heißt Bilinearform, wenn

  #enum[
    $a(dot, w): V -> K$ für alle $w in W$ eine lineare Abbildung ist und
  ][
    $a(v, dot): W -> K$ für alle $v in V$ eine lineare Abbildung ist
  ]

  Eine Bilinearform $a(dot , dot )$ heißt #bold[nicht ausgeartet] in der ersten Variable, wenn aus 
  $
  a(v, w) = 0 quad "für alle" w in W
  $
  folgt, dass $v = 0$ ist. Eine Bilinearform heißt nicht ausgeartet in der zweiten Variable, wenn aus 
  $
  a(v, w) = 0 quad "für alle" v in V
  $
  folgt, dass $w = 0$ ist. Falls $a(dot , dot )$ in beiden Variablen nicht ausgeartet ist, so nennt man $a(dot, dot)$ eine #bold[nicht ausgeartete Bilinearform] und die Räume $V,W$ ein #bold[duales Paar von Räumen] oder #bold[duales Raumpaar] bezüglich $a(dot , dot)$. Ist $V = W$, so heißt $a(dot,dot)$ eine #bold[Bilinearform auf $V$]. Eine Bilinearform $a(., .)$ auf $V$ heißt #bold[symmetrisch], wenn $a(v, w) = a(w, v)$ für alle $v, w in V$, ansonsten heißt $a(dot,dot)$ unsymmetrisch.
] <def>

#bold[Bemerkung:] Damit $V, W$ ein duales Raumpaar für eine nicht ausgeartete Bilinearform bilden können, muss $dim(V) = dim(W)$ gelten.

#lemma("2.18")[
  Sei $V$ ein endlichdimensionaler $K$-Vektorraum, $f in L(V,V)$, $f^* in L(V^*, V^*)$ die duale Abbildung zu $f$, $U subset.eq V$ und $W subset.eq V^*$ zwei Untervektorräume. Ist die Bilinearform
  $
  a: U times W -> K, (v, h) arrow.bar h(v)
  $
  nicht ausgeartet ist, d.h. sind $U$ und $W$ ein duales Raumpaar bezüglich dieser Bilinearform, so ist
  $
  V = U oplus W^0 
  $
]

#italic[Beweis:] Sei $u in U sect W^0$. Dann gilt $h(u) = 0$ für alle $h in W$. Weil $U, W$ ein duales Raumpaar bzgl. $a(dot ,dot )$ bilden, folgt $u = 0$. Außerdem $dim(U) = dim(W)$ gelten. Damit folgt aus Lemam 2.14, 1., dass 
$
dim(V) &= dim(W) + dim(W^0) \
&= dim(U) + dim(W^0)
$
$==>$ $V = U oplus W^0$
#endproof

== Zyklische $f$-invariant Unterräume

Jetzr: Genauere Analyse der Struktur von Eigenräumen

#bold[Beispiel:] Ist $V$ ein $K$-Vektorraum, $f in L(V,V)$ und $lambda in K$ ein Eigenwert von $f$, so ist $"Eig"(f, lambda)$ ein $f$-invarianter Unterraum, da: Für $v in "Eig"(f, lambda)$ gilt $f(v) = lambda v in "Eig"(f, lambda)$.

Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Ist $v in V without {0}$, so existiert ein eindeutig definiertes $m = m(f, v) in NN$, sodass die Vektoren
$
v, f(v), f(f(v)), ..., f^(m-1)(v)
$
linear unabhängig, die Vektoren
$
v, f(v), ..., f^(m) (v)
$
jedoch linear abhängig sind. Wegen $dim(V) = n$, muss $m<=n$ gelten!

#definition("2.19", [Grad von $v$])[
  Die eindeutig definiert Zahl $m(f, v) in NN$ heißt Grad von $v$ bezüglich $f$.
  $
  0 != v, f(v), f^2 (v), ..., f^(m-1) (v) "lin. unabh." \
  v, f(v), ..., f^m (v) "lin. abh." 
  $
  $==>$ Grad $m$ von $v$, $m in NN$.
] <def>

#bold[Bemerkungen:]

#list[
  Der Vektor $v = 0 in V$ ist lin. abhängig.
  Deswegen muss man $v != 0$ fordern oder $m in NN union {0}$.
][
  Der Grad von $0 != v in V$ ist gleich 1, genau dann wenn $v, f(v)$ linear abhängig sind. Das ist genau dann der Fall wenn $v$ ein Eigenvektor von $f$ ist. Damit folgt auch: Ist $v in V$ kein Eigenvektor von $f$ und $v != 0$, so ist der Grad von $v$ also $m(v, f) >= 2$.
]

#definition("2.20", "Krylov-Raum")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$, $f in L(V,V)$, $v in V$ und $j in NN$. Der Unterraum 
  $
  cal(K)_j (f, v) := "Span"{v, f(v), f^2 (v), ..., f^(j-1) (v) } subset.eq V
  $
  heißt #bold[j-ter Krylov-Raum] von $f$ und $v$. 
] <def>

Alexei Krylov (russischer Schiffsbauingeneur und Mathematiker, 1863-1945). Krylov-Räume spielen auch eine wichtige Rolle für das CG-Verfahren (Conjugate Gradients).

#lemma("2.21")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Dann gilt:
  
  #enum[
    Hat $0 != v in V$ den Grad $m$ bzgl. $f$, so ist $cal(K)_m (f,v)$ ein $f$-invarianter Unterraum und es gilt:
    $
    "Span" {v} = cal(K)_1 (f, v) subset cal(K)_2 (f,v) subset ... subset cal(K)_m (f, v) = cal(K)_(m+j) (f, v)
    $
    für alle $j in NN$.
  ][
    Hat $0 != v in V$ den  Grad $m$ bzgl. $f$ und ist $U subset.eq V$ ein $f$-invarianter Unterraum, so dass $v in U$, so ist
    $
    cal(K)_m (f,v) subset.eq U
    $
    D.h. betrachtet man alle $f$-invarianten Unterräume von $V$, die $v$ enthalten, so ist $cal(K)_m (f,v)$ derjenige mit der kleinsten Dimension.
  ][
    Gilt für $v in V$, dass $f^(m-1) (v) != 0$ und $f^m (v) = 0$ für ein $m in NN$, dann ist
    $
    dim(cal(K)_j (f, v)) = j quad "für" space j = 1, ..., m
    $
  ]
]

#italic[Beweis:]

#enum[
  ÜA
][
  Sei $U subset.eq V$ ein $f$-invarianter Unterraum mit $v in U$. Dann gilt $f^j (v) in U$ für $j = 1, ..., m-1$. Da $v$ den Grad $m$ hat, sind $v, f(v), ..., f^(m-1) (v)$ linear unabhängig.
  $==>$ $cal(K)_m (f,v) subset.eq U quad "und" quad dim(cal(K)_m (f,v)) = m <= dim (U)$
][
  Seien $mu_0, ...., mu_(m-1) in K$ so gewählt, dass 
  $
  0 = mu_0 v + mu_1 f(v) + ... + mu_(m -1) f^(m-1) (v)
  $
  gilt. Anwendung $f^(m-1)$
  $
  0 = mu_0 f^(m-1) (v) + mu_1 f^m (v) = mu_0 underbrace(f^(m-1) (v), != 0) \
  ==> mu_0 = 0
  $
  Für $m > 1$ kann man dieses Argument induktiv für $f^(m-j)$, $j = 2, ..., m$, anwenden und erhält damit 
  $
  mu_1 = ... = mu_(m-1) = 0
  $
  $==>$ Beh.
]
#endproof

#bold[Beobachtungen:] Hat $v$ den Grad $m$ bzgl. $f$ gilt 

#list[
  $cal(K)_j (f, v)$ ist für $j < m$ kein $f$-invarianter Unterraum, da $0 != f(f^(j-1)(v)) = f^j (v) in.not cal(K)_j (f,v)$
][
  wie oben gezeigt, bilden die Vektoren $v, f(v), ..., f^(m-1) (v)$ eine Basis von $cal(K)_m (f,v)$. Wendet man $f$ auf ein Element dieser Basis an, d.h. $f^(k+1) (v), k = 0, ..., m-1$, so erhält man für $k = m-1$ $f^(m)(v)$ als Linearkombination von $v, f(v), ..., f^(m-1)(v) ==> f^(m) (v) in cal(K)_m (f, v)$. Deswegen wird $cal(K)_m (f,v )$ auch #bold[zyklische invarianter Unterraum] zu $v$ von $f$ genannt.
]

#lemma("2.22")[
  Sei ${0} != V$ ein $K$-Vektorraum. Ist $f in L(V,V)$ nilpotent vom Grad $m$, so gilt $m <= dim(V)$.
]

#italic[Beweis:] Nach Definition existiert ein $v in V$ mit $f^(m-1) (v) != 0$ und $f^(m)(v) = 0$. Lemma 2.21 sichert, dass $v, f(v), ..., f^(m-1)(v)$ linear unabhängig $==>$ $m <= dim(V)$.
#endproof

#bold[Beobachtung:] Sei $V$ ein $K$-Vektorraum und $f in L(V,V)$. Ist $U subset.eq V$ ein $f$-invarianter Unterraum, so gilt für die Einschränkung von $f$ auf $U, d.h.$
$
f|_U : U -> U, quad u -> f(u),
$
dass $f|_U in L(U, U)$.

#theorem("2.23")[
  #bold[Fittingzerlegung]

  Sei $V$ ein endlichdimensionaler $K$-Vektorraum und $f in L(V,V)$. Dann existieren $f$-invariante Unterräume $U subset.eq V$ und $W subset.eq V$, so dass gilt:
  
  #enum[
    $V = U oplus W$
  ][
    $f|_U in L(U, U)$ ist bijektiv 
  ][
    $f|_W in L(W,W)$ ist nilpotent
  ]
]

#italic[Beweis:] $v in ker(f)$. Dann gilt wegen der Linearität von $f$, sodass $f^2 (v) = f(f(v)) =^(f(v) = 0) 0 ==> ker(f) subset.eq ker(f^2)$

Induktiv zeigt man:
$
{0} subset.eq ker(f) subset.eq ker(f^2) subset.eq ker(f^3) subset.eq ...
$
Da $dim(V) < oo$, muss es eine kleinste Zahl $m in NN union {0}$ geben, so dass $ker(f^m) = ker(f^(m+j))$ für alle $j in NN$. Damit sehen wir 
$
U = im(f^m) quad "und" quad W = ker(f^m)
$
Zeige: $U$ und $W$ sind $f$-invariant. Sei $u in U$. Dann existiert $w in V$ mit $f^m (w) = u$ $==>$ $f(u) = f(f^m (w)) = f^m (f(w)) in U$. 

Sei $w in W$. Dann gilt
$
f^(m) (f(w)) = f (f^m (w)) = 0 ==> f(w) in W
$
Also existieren $f$-invariante Unterräume $U subset.eq V$ und $W subset.eq V$.

#enum[
  Es gilt $U + W subset.eq V$. Die Dimensionsformel für lineare Abbildungen (Satz 4.16, LinA I) liefert für $f^m$, dass
  $
  dim(V) = dim(U) + dim(W)
  $
  Ist $v in U sect W$ $==>$ $exists w in V: v = f^m (w) (v in U)$
  $
  v in W ==> 0 = f^m (v) = f^m (f^m (v)) = f^(2m) (v)
  $
  Es gilt $ker(f^m) = ker(f^(2m)) ==> v = f^m (v) = 0$ 

  $==> V = U oplus W$
][
  Sei $v in ker(f|_k) subset.eq U$. Dann existiert ein $w in V$, so dass $f^m (w) = v$ gilt. $==>$ $0 = f(v) = f(f^m (w)) = f^(m+1) (w)$. Mit $ker(f^m) = ker(f^(m+1)) ==> w in ker(f^m) ==> v = f^m (w) = 0$ $==>$ $f$ injektiv.

  Aus der Dimensionsformel folgt, dass $f$ surjektiv ist.
][
  Sei $v in W$. Dann gilt 
  $
  0 = f^m (v) = (f|_W)^m (v)
  $
  $==>$ $(f|_W)^m = 0 in L(W,W)$, d.h. $(f|_W)^m$ ist die Nullabbildung $==>$ $f|_W$ nilpotent.
]

#theorem("2.24")[
  Sei $V$ ein endlichdimensionaler $K$-Vektorraum, $f in L(V,V)$ nilpotent vom Grad $m$, $v in V$ ein beliebiger Vektor mit $f^(m-1) (v) != 0$ und $h in V^*$ mit $h(f^(m-1)(v)) != 0$. Dann sind $v$ und $h$ vom Grad $m$ bzgl. $f$ und $f^*$. Die beiden Räume $cal(K)_m (f,v)$ bzw. $cal(K)_m (f^*, h)$ sind zyklisch $f$- bzw. $f^*$-invariante Unterräume von $V$ bzw. $V^*$. Sie bilden ein duales Raumpaar bzgl. der Bilinearform
  $
  a: cal(K)_m (f, v) times cal(K)_m (f^*, h) -> K, quad (macron(v),macron(h)) arrow.bar macron(h)(macron(v))
  $
  und es gilt 
  $
  V = cal(K)_m (f, v) oplus (cal(K)_m (f^*, h))^0
  $
  Hierbei ist $cal(K)_m (f^*, h)^0$ ein $f$-invarianter Unterraum von $V$.
]

#italic[Beweis:] Für $v in V$ gilt $f^(m-1) (v) != 0$. Lemma 2.20 $==>$ $cal(K)_m (f, v)$ $m$-dimensionaler zyklischer $f$-invarianter Unterraum von $V$. Für $V^*$ gilt
$
0 != h(f^(m-1)(v)) = (f^*)^(m-1) (h) (v)
$
Dann ist $0 != (f^*)^(m-1) (h) in L(V^*, V^*)$. $f$ nilpotent von Grad $m$ $==>$ (Lemma 2.14) $f^*$ nilpotent von Grad $m$ $==>$
$
(f^*)^m (h) = 0 in L(V^*, V^*)
$
$==>$ (Lemma 2.20) $cal(K)_m (f^*, h)$ ist $m$-dimensionaler zyklischer $f^*$-invarianter Unterraum von $V^*$.

Nun zu zeigen: $cal(K)_m (f,v), cal(K)_m (f^*, h)$ sind ein duales Raumpaar. Sei
$
macron(v) = sum_(i = 0)^(m-1) mu_i f^i (v) space in cal(K)_m (f,v)
$
so gewählt, dass
$
macron(h)(macron(v)) = a(macron(v), macron(h)) = 0 quad forall macron(h) in cal(K)_m (f^*, h)
$
Zeige induktiv, dass $mu_k = 0, k = 0 , ..., m-1$. Wegen $((f^*)^(m-1)(h)) in cal(K)_m (f^*, h)$ folgt
$
0 = ((f^*)^(m-1)(h))(macron(v)) = h(f^(m-1) (macron(v))) = sum_(i = 0)^(m-1) mu_i h(f^(m-1+i)(v)) = mu_0 underbrace(h(f^(m-1)(v)), != 0) \
==> mu_0 = 0
$
Sei nun $mu_0 = ... = mu_(k - 1) = 0$ fü ein $k in {1, ..., m-2}$. Wegen $(f^*)^(m-1-k)(h) in cal(K)_m (f^*, h)$ folgt aus der Darstellung von $macron(v)$, dass
$
0^((*)) = ((f^*)^(m-1-k)) (h))(macron(v) = h(f^(m-1-k) (macron(v)))) = sum_(i = 0)^(m-1) mu_I h(f^(m-i+i-k) (v)) = mu_k underbrace(h(f^(m-1)(v)), != 0) = mu_k \
==> macron(v) = 0
$
$==> a(.,.)$ ist nicht ausgeartet in der ersten Komponente. Analog zeigt man, dass $a(., .)$ auch in der zweiten Kompontente nicht ausgeartet ist $==>$ $cal(K)_m (f, v)$ und $cal(K)_m (f^*, h)$ sind ein duales Raumpaar.

Mit Lemma 2.18: $V = cal(K)_m (f, v) oplus (cal(K)_m (f^*, h))^0$

Mit Lemma 2.14, 3: $(cal(K)_m (f^*, h))^0$ ist $f$-invarianter UR von $V$.
#endproof

(zyklisch $f$-invarianter UR: $v, f(v), f^2 (v), ...$)

== Die Jordan-Normalform

#theorem("2.25")[
  Sei $V$ ein endlichdimensionaler $K$-Vektorraum und $f in L(V,V)$. Ist $lambda in K$ ein Eigenwert von $f$, dann gibt es $f$-invariante Unterräume $U subset V$ und ${0} != W subset.eq V$, so dass
  #enum[
    $V = U oplus W$
  ][
    die Abbildung $f|_U - lambda "Id"_U$ ist bijektiv und
  ][
    die Abbildung $f|_W - lambda "Id"_W$ ist nilpotent
  ]
  Des Weiteren ist $lambda$ kein Eigenwert von $f|_U$.
]

#italic[Beweis:] Wir definieren
$
g := f - lambda "Id"_V in L(V,V)
$
Satz 2.23: $exists$ $g$-invariante UR $U subset.eq V$ und $W subset.eq V$:
$
V = U oplus W, space g|_U "bijektiv", space g|_W "nilpotent"
$
Annahme: ${0} = W ==> V = U$
$
==> g|_U = g|_V = g space "bijektiv"
$
$lambda$ ist Eigenwert von $f ==> exists 0 != v: f(v) = lambda v$
$
&==> g(v) = f(v) - lambda v = lambda v - lambda v = 0 \
&==> ker(g) supset.eq {0,v} != {0} space arrow.zigzag space g "bijektiv" \
&==> U subset V
$
Annahme: $lambda$ ist Eigenwert von $f|_U$
$
&==> exists 0!= v in U: f(v) = lambda v \
&==> g|_U (v) = f(v) - lambda v = lambda v - lambda v = 0 space arrow.zigzag space g|_U "bijektiv"
$
#endproof

#bold[Beispiel 2.26:] Wir betrachten $V = RR^5$, die Standardbasis $E$ und $f in L(V,V)$ gegeben durch
$
A = mat(-3,-1,4,-3,-1;1,1,-1,1,0;-1,0,2,0,0;4,1,-4,5,1;-2,0,2,-2,1)
$
Dann gilt
$
p_f (lambda) = p_A (lambda) = (lambda-1)^4 (lambda-2)^1 \
==> "EW:" 1,2 quad a(f, 1) = 4 quad a(f,2) = 1
$
$==>$ $p_A (.)$ zerfällt in Linearfaktoren

$lambda_1 = 1:$ Es gilt $ker(g_1^3) = ker(g_1^4)$ für $g_1 := f - lambda_1 "Id"_V$

$==> m_1 = 3$

$
U_1 = "Span"{vec(0,1,2,3,-2)} wide W_1 = "Span"{vec(1,-1,1,0,1),vec(1,1,1,0,-1),vec(0,0,1,1,0),vec(0,0,0,0,1)}
$

$lambda_2 = 2:$ Für $g_2 = f-lambda_2 "Id"_V$ gilt $ker(g_2) = ker(g_2^2)$

$==> m_2 = 1$
$
U_2 = "Span"{vec(-5,1,-1,4,-2), vec(-1,-1,0,1,0), vec(4,-1,0,-4,2), vec(-3,1,0,3,-2)}, W_2 = "Span"{vec(0,1,2,3,-2)}
$
Beobachtung: $dim(W_1) = a(f, lambda_1)$, $dim(W_2) = a(f, lambda_2)$

#theorem("2.27")[
  Sei $V$ ein endlichdimensionaler $K$-Vektorraum und $f in L(V,V)$. Ist $lambda in K$ ein Eigenwert von $f$, dann existieren für den Unterraum $W$ aus Satz 2.25 Vektoren $w_1, ..., w_k in W$ und $d_1, ..., d_k in NN$, so dass 
  $
  W = cal(K)_(d_1) (f, w_1) oplus cal(K)_(d_2) (f, w_2) oplus ... oplus cal(K)_(d_k) (f, w_k)
  $
  Des Weiteren gibt es eine Basis $B$ von $W$, so dass
  $
  A_(f|_W)^(B,B) = mat(J_(d_1) (lambda),,0;,dots.down,,;0,,J_(d_k) (lambda))
  $
]

#italic[Beweis:] Sei wie in Satz 2.25 $g := f - lambda "Id"_V$ und $g_1 := g|_W$ nilpotent vom Grad $d_1$. Dann gilt $1 <= d_1 <= dim(W)$.

Sei $w_1 in W$ ein Vektor mit $g_1^(d_1 -1) (w_1) != 0$. Wegen $g^(d_1) (w_1) = 0$

$==>$ $g_1^(d_1-1) (w_1)$ ist ein Eigenvektor von $g_1$ zum Eigenwert $0$.

Lemma 2.21, 3, liefert, dass die $d_1$ Vektoren
$
{w_1, g(w_1), ...., g_1^(d_1-1) (w)}
$
linear unabhängig sind. Außerdem ist $W_1 := cal(K)_(d_1) (g_1, w_1)$ ein $d_1$-dimensionaler zyklischer $g_1$-invarianter UR von $W$. Also ist
$
B_1 := {g_1^(d_1-1)(w_1), g_1^(d_1-2) (w_2), ..., g_1 (w_1), w_1}
$
eine Basis von $cal(K)_(d_1) (g_1, w_1) = W_1$ und 
$
A_(g_1 |_(W_1))^(B_1, B_1) = mat(0,1,,0;,dots.down,dots.down,;,,dots.down,1;0,,,0) = J_(d_1) (0) in K^(d_1, d_1)
$
Per Definition gilt $A_(g_1|_(W_1))^(B_1, B_1) = A_(g|_(W_1))^(B_1, B_1)$. Ist $d_1 = dim(W)$: siehe unten $staudihaufen$.

Sei nun $d_1 < dim(W)$. Satz 2.25 sichert, dass es für $g_1 in L(W,W)$ einen $g_1$-invarianten Unterraum $tilde(W) != {0}$ mit $W = W_1 oplus tilde(W)$ gibt.

Die Abbildung $g_2 := g_1 |_tilde(W)$ ist nilpotent vom Grad $lambda_2$ mit $1 <= d_2 <= d_1$.

Wiederholung der Konstruktion: 

$exists w_2 in tilde(W): g_2^(d_2 -1)(w_1) != 0, ..., W_2 := cal(K)_(d_2) (g_2, w_2)$ ... UR von $tilde(W) subset.eq W$,
$
B_2 := {g_2^(d_2-1) (w_2) , g_2^(d_2-2) (w_2), ..., g_2 (w_2), w_2}
$
$
A_(g|_(W_2))^(B_2, B_2) = A_(g_2 |_(W_2))^(B_2, B_2) = mat(0,1,,0;,dots.down,dots.down,;,,dots.down,1;0,,,0)
$
Nach $k <= dim(W)$ Schritten muss diese Konstruktion abbrechen und es gilt
$
W &= cal(K)_(d_1) (g_1, w_1) oplus cal(K)_(d_2) (g_2, w_2) oplus ... oplus cal(K)_(d_K) (g_k, w_k) \
&= cal(K)_(d_1) (g, w_1) oplus cal(K)_(d_2) (g,w_2) oplus ... oplus cal(K)_(d_2) (g, w_k)
$
Vereinigt man die Basen $B_1, ..., B_k$ zu einer Basis $B$ von $W$ (direkte Summe!), so erhält man
$
A_(g|_W)^(B,B) = mat(A_(g|_(W_1))^(B_1, B_1),,0;,dots.down,;0,,A_(g|_(W_k))^(B_k, B_k)) = mat(J_(d_1) (0 ),,0;,dots.down,;0,,J_(d_k) (0))
$
Jetzt: Übertragung auf $f = g + lambda "Id"_V$. Man kann sich leicht überlegen, dass jeder $g$-invariante Unterraum von $V$ auch $f$-invariant ist und damit gilt:
$
cal(K)_(d_i) (f, w_i) = cal(K)_(d_i) (g, w_i) space "für" i = 1, ..., k
$
$
==>^"ÜA" W = cal(K)_(d_1) (f, w_1) oplus ... oplus cal(K)_(d_k) (f, w_k)
$
Für $j in {1, ... k}$ und $0 <= l <= d_j -1$ ist
$
f(g^l (w_j)) &= g(g^l (w_j)) + lambda g^l (w_j) \
&= lambda g^l (w_j) + underbrace(g^(l+1) (w_j), = 0\, l = d_j -1)
$
$
==> A_(f|_W)^(B,B) = mat(A_(f|_W_1)^(B_1,B_1),,0;,dots.down,;0,,A_(f|_W_k)^(B_k, B_k)) = mat(J_d_1 (lambda),,0;,dots.down,;0,,J_d_k (lambda))
$
#endproof

#bold[Beispiel 2.28:] Fortsetzung von Bsp 2.26 
#let gorone = $#text(fill: orange)[1]$ //orange one =^ gorone
$
A = mat(-3,-1,4,-3,-1;1,1,-1,1,0;-1,0,2,0,0;4,1,-4,5,1;-2,0,2,-2,1) wide "EW:" quad #stack(spacing: 1em, [$lambda_1 = 1, a(f, lambda_1) = 4 = dim(W_1)$],[$lambda_2 = 2, a(f, lambda_2) = 1 = dim(W_2)$])
$
$lambda_gorone = 1$: $g^gorone_(|_W_1)$ nilpotent vom Grad $lambda_1^gorone = 3$ und $1<d_1^gorone<dim(W_1)$

Erinnerung: $g_1^gorone = f - lambda_gorone I_d$. Für $w_1^gorone = mat(0,0,0,0,1)^T$ ist $(g_1^gorone)^2 (w_1) = mat(1,0,1,0,0)^T != 0$ und $(g_1^gorone)^3 (w_1) = 0 in V = RR^5$.

Mit Lemma 2.21: 
$
{w_1, (g_1^gorone)^1 (w_1^gorone), (g_1^gorone)^2 (w_1^gorone)} = {vec(0,0,0,0,1), vec(-1,0,0,1,0), vec(1,0,1,0,0)}
$
$
==> "Span"{w_1, g_1^gorone (w_1^gorone), (g_1^gorone)^2 (w_1)} = cal(K)_3 (g_1^gorone, w_1^gorone)
$
$d_1^gorone < dim(W_1) ==>$  es existiert zu $W_(1 1) := cal(K) (g_1^gorone, w_1^gorone)$ ein $tilde(W)_1 != {0}$ mit $W_1 = W_(1 1) oplus tilde(W)_1$.

Zum Beispiel: $w_2^gorone = mat(1,-1,1,0,1)^T$ $==>$
$
w_2^gorone, w_1^gorone, g_1^gorone (w_1^gorone), (g_1^gorone)^2 (w_1^gorone) quad "lin. unab." \
tilde(W)_1 := "Span"{w_2^gorone} sect cal(K)_3 (g_1^gorone, w_1^gorone) = {0}
$
Es gilt $g_2^gorone := g_1^gorone|_tilde(W)_1$ nilpotent vom Grad $1$
$
==> d_2^gorone = 1 wide W_1 = cal(K)_3(g_1^gorone, w_1^gorone) oplus cal(K)_1 (g_2^gorone, w_2^gorone)
$

#let gorto = $#text(fill: orange)[2]$ 
Weitherhin kann man nachrechnen
$
cal(K)_3 (f, w_1^gorone) = "Span"{w_1, g_1^gorone (w_1^gorone), (g_1^gorone)^2 (w_1^gorone)} = cal(K)_3 (g_1^gorone, w_1^gorone) \
cal(K)_1 (f, w_2) = "Span"{w_2^gorone} = cal(K)_1 (g_2^gorone, w_2^gorone)
$
$lambda_gorto = 2$: 
$
&g_1^gorto |_W_2 "nilpotent vom Grad" lambda_1^gorto = 1 \
&lambda_1^2 = dim(W_2) \
&w_1^gorto = mat(0,1,2,3,-2)^T != 0 \
&(g_1^gorto)^1 (w_1^gorto) = 0 in V ==> W_2 = cal(K)_1 (f, w_1^gorto)
$
$
A_(f|_W_1)^(B^1, B^1) = mat(1,1,0,0;0,1,1,0;0,0,1,0;0,0,0,1), quad A_(f|_W_2)^(B^2, B^2) = (2) \
==>^"Ziel:" A_f^(B,B) = mat(1,1,0,,0;0,1,1,,;0,0,1,,;,,,1,;0,,,,2)
$

#theorem("2.29")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) < oo$ und $f in L(V,V)$. Ist $lambda in K$ ein Eigenwert von $f$, dann gilt für die $d_j, 1 <= j <= k$ aus Satz 2.27, dass
  $
  &a(f, lambda) = dim(W) = d_1 + ... + d_k \
  &g(f, lambda) = k
  $
]

#italic[Beweis:] Für den Unterraum U aus Satz 2.23/2.25 ist die Abbildung $f|_U = (f - lambda "Id")|_U$ bijektiv $==>$ $lambda$ ist kein Eigenwert von $f|_U$. Daraus erhält man
$
a(f, lambda) = dim W = d_1 + ... + d_k
$
Zur Bestimmung von $g(f, lambda)$ sei $v in W$ ein beliebiger Vektor. Dann ist
$
v = sum_(j = 1)^k sum_(l = 0)^(d_j -1) mu_(j l) g^l (w_j)
$
und es gilt
$
f(v) = sum_(j = 1)^k sum_(l = 0)^(d_j -1) mu_(j l) f(g^l (w_j)) = sum_(j = 1)^k sum_(l = 0)^(d_j -1 ) mu_(j l) g^l (w_j) + sum_(j = 1)^k sum_(l = 0)^(d_j -1) mu_(j l) g^(l+1) (w_j ) \
= lambda v + underbrace(sum_(j = 1)^k sum_(l = 0)^(d_j- 2) mu_(j l) overbrace(g^(l+1) (w_j), "lin. unab."), = 0)
$
$v in "Eig"(f, lambda) <==> mu_(j l) = 0, 1 <= j <= k, 0 <=l <= d_j -2$
$
<==> v = sum_(j = 1)^k mu_j g^(d_j -1) (w_j)
$
Für $v != 0$ muss mindestens ein Koeffizient $mu_j != 0, j = 1, ..., k$. Daraus folgt
$
"Eig"(f, lambda) = "Span" underbrace({g^(d_1 -1) (w_1)\, ...\, g^(d_k -1) (w_k)}, "lin. unab. wegen direkter Summe")
$

#bold[Beispiel 2.30:] Fortsetzung von Bsp. 2.28. Es gilt
$
"Eig"(f, 1) = "Span"{vec(1,-1,1,0,1), vec(1,1,1,0,-1)} ==> g(f, 1) = 2
$
$lambda_1 = 1$: $a(f, 1) = 4 =  3 + 1 = d_1^1 + d_2^1$, $g(f, 1) = 2 = k$

$lambda_2 = 2$: $a(f, 2) = 1 = d_1^2$, $g(f, 2) = 1$

#bold[Fazit:] Für einen Eigenwert $lambda$ zu $f in L(V,V)$ gilt:

#list[
  Die geometrische Veilfachheit des Eigenwert $lambda$ ist gleich der Anzahl der Jordanblöcke zu diesem Eigenewrt in der entsprechenden Dartsellungsmatrix 
  $
  A_f^(B,B) = mat(J_(d_1) (lambda_1),,0;,dots.down,;0,,J_(d_k) (lambda_m))
  $
][
  Die algebraische Vielfachheit des Eigenwert $lambda$ ist gleich der Summe der Dimensionen der zugehörigen Jordanblöcke
][
  In jedem Unterraum $cal(K)_(d_j) (f, w_j)$ gehört genau ein Eigenvektor und seine Vielfachheiten.
]

Was gilt für weitere Eigenwerte?

Ist $tilde(lambda) != lambda$ ein weiterer Eigenwert von $f$, dann ist $tilde(lambda)$ auch ein Eigenwert der Einschränkung $f|_U in L(U_lambda, U_lambda)$

$==>$ Man kann die Sätze 2.25-2.29 auf $f|U_lambda$ anwenden. Damit erhält man

#boxedlist[
  $U_lambda = X oplus Y$
][
  $f|_X - tilde(lambda) "Id"_X$ ist bijektiv
][
  $f|_Y - tilde(lambda) "Id"_Y$ ist nilpotent
][
  Der UVR $Y$ ist die direkte Summe von Krylovräumen
][
  Es gibt eine Darstellungsmatrix von $f|_Y$ bestehend aus Jordanblöcken
]

Da man dieses Argument für alle paarweise verschiedene Eigenewerte von $f$ anwenden kann, erhält man.

#theorem("2.31")[
  Sei $V$ ein endlichdimensionaler $K$-Vektorraum und $f in L(V,V)$. Zerfällt das charakteristische Polynom $p_f (.)$ in Linearfaktoren, so gibt es eine Basis $B$ von $V$ für welche die Darstellungsmatrix in Jordan-Normalform ist, d.h.
  $
  A_f^(B,B) = mat(J_(d_1) (lambda_1),,0;,dots.down,;0,,J_(d_k) (lambda_m))
  $
]

#italic[Beweis:] s.o. 
#endproof

Marie Ennemond Jordan (fr. Mathematiker, 1838-1922) gab diese Form 1870 an. Zwei Jahre vor Jordan bewies Karl Weierstraß (dt. Mathematiker, 1815-1897) ein Resultat, aus dem die JNF folgt.

#bold[Beispiel 2.32:]
$
A = mat(-3,-1,4,-3,-1;1,1,-1,1,0;-1,0,2,0,0;4,1,-4,5,1;-2,0,2,-2,1) arrow.squiggly J = mat(1,1,0,,0;0,1,1,,;0,0,1,,;,,,1,;0,,,,2) = A_f^(B,B)
$
$B = {(g_1^1)^2 (w_1^1),g_1^1 (w_1^1), w_1^1, w_2^1, w_1^2}$

Für 
$
S = mat(1,-1,0,1,0;
        0,0,0,-1,1;
        1,0,0,1,2;
        0,1,0,0,3;
        0,0,1,1,-2)
$
gilt $J = S^(-1) A S$. Also $J$ ähnlich zu $A$.

Für $f in L(V,V)$ hatten wir:

#boxedlist[
  $f$ ist diagonalisierbar $<==>$
  
  #boxedlist[
    $p_f (.)$ zerfällt in Linearfaktoren
  ][
    $forall "EW" lambda "von" f: a(f, lambda) = g(f, lambda)$
  ]
][
  zerfällt $p_j (.)$ in Linearfaktor $==>$ $exists$ Basis $B:A_f^(B,B)$ in JNF
]

#bold[Folgerung:] Existiert eine Darstellungsmatrix in Jordan-Normalform: $f$ ist diagonalisierbar $<==> d_i = 1  forall i in {1, ..., k}$

#bold[Frage:] Wann zerfällt $p_f (.)$ in Linearfaktoren?

#underline[Fundamendtalsatz der Algebra:]

Jedes Polynom $p in P[t]$ über $CC$ mit einem Grad größer $0$ hat mindestens eine Nullstelle.

#italic[Beweis:] Liesen, Mehrmann, Kapitel 15, braucht substantiell Hilfsmittel aus der Analysis.

Damit folgt unmittelbar:

#corollary("2.33")[
  Jedes Polynom $p in P[t]$ über $CC$ zerfällt in Linearfaktoren, d.h. es gibt $a, lambda_1, ..., lambda_n in CC$ mit $n = "grad"(p)$ und 
  $
  p(t) = a(t - lambda_1)(t - lambda_2) ... (t - lambda_n)
  $
]

Daraus folgt direkt:

#corollary("2.34")[
  Sei $V$ ein endlichdimensionaler $CC$-Vektorraum. Dann besitzt jedes $f in L(V,V)$ eine Jordan-Normalform.
]

Matrix-Version:

#corollary("2.35")[
  Sei $K$ ein Körper und $A in K^(n,n)$, so dass das charakteristische Polynom $p_A (.)$ in Linearfaktoren zerfällt. Dann ist $A$ ähnlich zu einer Matrix $J$ in Jordan-Normalform.
]

Ist die Jordan-Nomralform eindeutig bestimmt?

#theorem("2.36")[
  Sei $V$ ein $K$-Vektorraum mit $dim(V) = n< oo$. Bestizt $f in L(V,V)$ eine Jordan-Normalform, so ist diese bis auf die Reihenfolge der Jordanblöcke eindeutig bestimmt.
]

#startproof sehr technisch, z.B. Liesen, Mehrmann Satz 16.12, Fischer/Springborn, Abschnitt 5.7.
#endproof

Alternativer Beweis für die JNF über Hauptvektoren und Haupträume, vgl. Fischer/Spingborn, Abschnitt 5.5.

Damit: Für Bsp. 2.32 wären
$
mat(2,,;,J_3 (1),;,,1) quad "oder" quad mat(2,,;,1,;,,J_3 (1))
$
alternative JNF. Jordanblöcke bleiben gleich. D.h. Satz 2.36 rechtfertigt den Namen "Normalform".

#pagebreak()

= Euklidische und unitäre Vektorräume

Jetzt: $V$ Vkeotrraum über $RR$ oder $CC$ mit $dim(V) < oo$.

Damit: Definition eines Skalarproduktes und Verallgemeinerung von Begriffen aus der Geometrie für $RR^2$ bzw. $RR^3$. Dies beinhaltet auch Orthogonalität und orthonormale Basen.

== Skalarprodukt und Normen

Für $K = RR$ werden wir Bilinearformen (Def. 2.17) verwenden. Für $K =CC$ benötigen wir 

#definition("3.1", "Sesquilinearform")[
  Seien $V$ und $W$ zwei $CC$-Vektorräume. Man nennt eine Abbildung
  $
  s: V times W -> CC, (v, w) arrow.bar s(v, w)
  $
  #bold[Sesquilinearform] auf $V times W$, wenn für alle $v, v_1, v_2 in V$, $w, w_1, w_2 in W$ und $lambda in CC$ gilt

  #enum[
    $s(v_1+v_2, w) = s(v_1, w) + s(v_2, w)$ und $s(lambda v, w) = lambda s(v,w )$ 

    $corres$ $s(.,.)$ ist linear in der ersten Komponente
  ][
    $s(v, w_1 + w_2) = s(v, w_1) + s(v, w_2)$ und $s(v, lambda w) = macron(lambda) s(v, w)$
  ]
  Ist $V=W$, so heißt $s$ Sesquilinearform auf $V$. Eine Sesquilinearform auf $V$ nennt man hermitesch, wenn
  $
  s(v, w) = overline(s(w, v)) quad forall v, w in V
  $
] <def>

#definition("3.2", "Skalarprodukt")[
  Sei $V$ ein $K$-Vektorraum. Eine Abbildung
  $
  ip(., .): V times V -> K, quad (v, w) -> ip(v, w)
  $
  nennet man #bold[Skalarprodukt] oder #bold[inneres Produkt] auf $V$, wenn gilt
  
  #enum[
    Ist $K = RR$, so ist $ip(.,.)$ eine symmetrische Bilinearform
  ][
    Ist $K = CC$, so ist $ip(.,.)$ eine hermitesche Sesquilinearform
  ][
    $ip(.,.)$ ist positiv definit, d.h. es gilt 
    $
    &ip(v,v) >= 0 quad forall v in V \
    &ip(v,v) = 0 <==> v = 0 in V
    $
  ]

  Ein $RR$-Vektorraum mit einem Skalarprodukt nennt man #bold[euklidischen Vektorraum] und einen $CC$-Vektorraum mit einem Skalarprodukt #bold[unitären Vektorraum].
] <def>

#bold[Bemerkungen:] 

#boxedlist[
  Für alle $v in V$ gilt $ip(v,v) in RR^+$ unabhängig von $K = RR$ oder $K = CC$
][
  Ein Unterraum eines euklidischen (unitären) Vektorraums ist wieder ein euklidischer (unitärer) Vektorraum.
]

#definition("3.3", "hermitesche Matrix")[
  Für eine Matrix $A = (a_(i j)) in CC^(m,n)$ ist die hermitesch transponierte von $A$ definiert als 
  $
  A^H = (macron(a)_(j i)) in CC^(n, m)
  $
  Gilt $A = A^H$, so heißt $A$ #bold[hermitesche Matrix].
] <def>

Ist $A in RR^(m, n)$, so $A^H = A^T$. Für eine hermitesche Matrix $A$ gilt $a_(i i) = macron(a)_(i i) ==> a_(i i) in RR$.

#bold[Beispiel 3.4:] Man kann leicht nachrechnen:

#list[
  Für $V = RR^n$ ist 
  $
  ip(v, w) := v^T w = sum_(i = 1)^n v_i w_i
  $
  ein Skalarprodukt. Es ist das Standardskalarprodukt im $RR^n$.
][
  Für $V = CC^n$ ist 
  $
  ip(v, w) := w^H v = sum_(i = 1)^n macron(w)_i v_i
  $
  ein Skalarprodukt. Es ist das Standardskalarprodukt im $CC^n$.
][
  Für $V = K^(m,n)$ ist 
  $
  ip(A, B) := "Spur" underbrace((B^H A), in K^(n, n)) = sum_(i = 1)^n (sum_(j = 1)^m macron(b)_(i j) a_(j i))
  $
][
  Auf dem Vektorraum der auf dem Intervall $[0, 1]$ stetigen, reellwertigen Funktionen ist
  $
  ip(f, g) := integral_0^1 f(x) g(x) d x
  $
  ein Skalarprodukt.
]

#lemma("3.5")[
  #bold[Cauchy-Schwarz-Ungleichung]

  Ist $V$ ein euklidischer oder unitärer Vektorraum, so gilt 
  $
  abs(ip(v, w))^2 <= ip(v, v) dot ip(w,w) quad forall v, w in V
  $
  wobei das Gleichheitszeichen genau dann gilt,, wenn $v$ und $w$ linear abhängig sind.
]

#startproof Für $w = 0$ folgt die (Un-) gleichung. 

Für $w != 0$ definiert man
$
lambda := ip(v, w)/ip(w,w)
$
Dann folgt
$
0 &<= ip(v-lambda w, v - lambda w) = ip(v, v) - macron(lambda) ip(v, w) - lambda ip(w, v) - lambda dot (- macron(lambda)) ip(w, w) \
&= ip(v, v) - overline(ip(v, w))/ip(w, w) ip(v, w) - ip(v, w)/ip(w, w) ip(w, v) + abs(ip(v, w))^2/(ip(w, w))^2 ip(w, w) \
&= ip(v, v) - abs(ip(v, w))^2/ip(w,w) \
$
$
==> abs(ip(v, w))^2 <= ip(v,v) dot ip(w,w)
$
"$=$": 
$
0 = ip(v - lambda w, v - lambda w) \
<==> v -lambda w = 0 <==> v = lambda w <==> w = lambda^(-1) v
$
#endproof
$
ip(v, lambda w) = macron(lambda) ip(v, w)
$
Deshalb:

Die Cauchy-Schwartsche Ungleichung ist ein sehr wichtiges Instrument der Analysis, z.B. für Approximationsfehler.

Nächstes Ziel: Vektoren $v in V$ eine Länge zuzuordnen $->$ Norm als Verallgemeinerung des Betrags

Für die reellen Zahlen: $abs(.): RR -> RR^+, x arrow.bar abs(x)$ mit 

#boxedlist[
  $abs(lambda x) = abs(lambda) dot abs(x) wide forall lambda in RR, forall x in RR$
][
  $abs(x) >= 0 wide forall x in RR, abs(x) = 0 <==> x = 0$
][
  $abs(x+y) <= abs(x) + abs(y) wide forall x, y in RR$
]

#definition("3.6", "Norm")[
  Sei $V$ ein $K$-Vektorraum. Eine Abbildung
  $
  norm(.): V -> RR, quad v arrow.bar norm(v)
  $
  nennt man Norm auf $V$, wenn für alle $v, w in V$ und $lambda in K$ gilt:
  
  #boxedlist[
    sie ist homogen, d.h. #v(-1.5em) #h(100cm)
    $
    norm(lambda v) = abs(lambda) dot norm(v)
    $
  ][
    sie ist positiv definit, d.h:
    $
    norm(v) >= 0, quad norm(v) = 0 <==> v= 0 in V
    $
  ][
    sie erfüllt die Dreiecksungleichung, d.h.
    $
    norm(v + w) <= norm(v) + norm(w)
    $
  ]
  Einen $K$-Vektorraum, auf dem eine Norm definierst ist, nennt man #bold[normierten Raum].
] <def>

#bold[Beispiel 3.7:] Man kann leicht nachrechnen:

#list[
  Ist $ip(.,.)$ das Standardskalarprodukt auf $RR^m$ oder $CC^m$, dann definiert
  $
  norm(v) := ip(v,v)^(1/2) = (v^T v)^(1/2) space "bzw." space = (v^H v)^(1/2)
  $
  eine Norm auf $RR^m$ bzw. $CC^m$. Sie wird #bold[euklidische Norm] genannt
][
  Für $V = K^(m,n)$ ist 
  $
  norm(A)_F := ("Spur"(A^H A))^(1/2) = (sum_(i = 1)^n (sum_(j = 1)^m abs(a_(j i ))^2))^(1/2)
  $
  eine Norm. Sie wird Frobeniusnorm genannt. Es gilt $norm(A)_F = norm(A^H)_F$ für alle $A in K^(m,n)$. 
][
  Auf dem Vektorraum der auf dem Intervall $[0,1]$ stetigen, reellwertigen Funktionen ist
  $
  norm(f) := ip(f,f)^(1/2) = (integral_0^1 (f(x))^2 d x)^(1/2)
  $
  eine Norm. Sie wird $L_2$- oder $L^2$-Norm genannt.
][
  Sei $p in RR$, $p >= 1$ und $V = K^n$. Dann definiert 
  $
  norm(v)_p = (sum_(i = 1)^n abs(v_i)^p)^(1/p)
  $
  eine Norm im $K^n$. Sie wird $p$-Norm genannt. Für $n = 2$ erhält man die euklidische Norm. Für $p -> oo$ erhält man die sogenannte $oo$-Norm
  $
  norm(v)_oo := max_(1 <= i <= n) abs(v_i)
  $
  Je nach Situation kann es einem erheblichen Unterschied bedeuten, welche Norm betrachtet wird. Für $V = RR^2$:
  #figure(image("bilder2/3_7.jpeg", width: 100%))
][
  Die $p$-Norm auf $K^(m,n)$ ist definiert durch
  $
  norm(A)_p := sup_(0 != v in KK^n) norm(A v)_p/norm(v)_p
  $
  $norm(A)_p$ ist die durch die $p$-Norm induzierte Matrix-Norm.

  Man kann zeigen:

  #boxedlist[
    Supremum wird angenommen
  ][
    $norm(A)_p = limits(max_(v in K^n))_(norm(v)_p = 1) norm(A v)_p$
  ]
  Man kann zeigen: 
  $
  norm(A)_1 = max_(1<=j<=m) sum_(i = 1)^n abs(a_(i j)) quad "(Spaltensummennorm)" \
  norm(A)_oo = max_(1<= i<=n) sum_(j = 1)^m abs(a_(i j)) quad "(Zeilensummennorm)"
  $
]

#corollary("3.8")[
  Sei $V$ ein $K$-Vektorraum mit einem Skalarprodukt. Dann ist die Abbildung 
  $
  norm(.): V -> RR, quad v arrow.bar norm(v) := (ip(v,v))^(1/2)
  $
  eine Norm auf $V$. Man nennt sie die durch das Skalarprodukt induzierte Norm.
]

#startproof 

#enum[
  Homogenität: (Es gilt mit $"Re"(z) <= abs(z) forall z in CC$)^((\*))
  $
  norm(lambda v)^2 = ip(lambda v, lambda v) = lambda macron(lambda) ip(v,v) = abs(lambda^2) ip(v,v)
  $
][
  Positive Definitheit:
  $
  ip(v,v) >= 0 ==> norm(v) >= 0 \
  ip(v,v) = 0 <==> v = 0, \
  <==> norm(v) = 0
  $
][
  $norm(v+w) <= norm(v) + norm(w)$ $#sspace$
  $
  norm(v+w)^2 = ip(v+w,v+w) = ip(v,v) + ip(v,w) + ip(w,v) + ip(w,w) \
  $
  $
  &= ip(v,v) + ip(v,w) + overline(ip(v,w)) + ip(w,w) \
  &= ip(v,v) + 2 "Re"(ip(v,w)) + ip(w,w) \
  &<=^((\*)) ip(v,v) + 2abs(ip(v,w)) + ip(w,w) \
  &<=^("CSU") ip(v,v) + 2 ip(v,v) ip(w,w) + ip(w,w) \
  &= norm(v)^2 + 2 norm(v) norm(w) + norm(w)^2 \
  &= (norm(v) + norm(w))^2 
  $
  $
  ==>^(sqrt(space)) norm(v+w) <= norm(v) + norm(w) 
  $
]

== Winkel und Orthogonalität

In $RR^2$ bzw. $RR^3$ ist der von zwei Vektoren eingeschlossene Winkel anschaulich klar. Übertragung auf allgemeine Vektorräume?

Zunächst: $V = RR^2$, Standardskalarprodukt $ip(v,w) = w^T v$ und der damit induzierten Norm.

Aus Cauchy-Schwartz folgt:
$
-1 <= ip(v,w)/(norm(v) dot norm(w)) quad forall v, w in RR^2 without {0}
$
D.h. dieser Quotient ist gleich $cos(theta)$ für ein $theta in [0, pi]$. Diesen nennt man den zwischen $v$ und $w$ eingeschlossenen Winkel.

$
ip(v,w)/(norm(v) dot norm(w)) = cos(theta) quad -> quad angle.arc (v, w) := arccos ip(v,w)/(norm(v) dot norm(w))
$
Passt das zur "üblichen" Winkeldefinition?

Aufgrund der Eigenschaften des Skalarprodukts folgt
$
angle.arc (v, w) = angle.arc (w, v), quad angle.arc(lambda v, w) = angle.arc(v,w) = angle.arc(v, lambda w) quad forall lambda > 0
$
Für $v != 0 != w$ und
$
tilde(v) = 1/norm(v) v space (==> norm(tilde(v)) = 1) space "und" space tilde(w) = 1/(norm(w)) space (==> norm(tilde(w)) = 1) 
$
gilt $angle.arc(v, w) = angle.arc(tilde(v), tilde(w))$. Im Einheitskreis erhält man

#figure(image("bilder2/3_8_2.jpeg", width: 25%))

Also gibt es $alpha, beta in [0, 2pi$ mit 
$
tilde(v) = (cos beta, sin beta)^T quad tilde(w) = (cos alpha, sin alpha)^T
$
Gilt $alpha, beta in [0, pi$ folgt aus einem Additionstheorem für $cos$
$
cos(beta-alpha) &= cos alpha cos beta + sin alpha sin beta \
&= ip(tilde(v), tilde(w)) dot 1 dot 1 \
angle.arc(tilde(v), tilde(w)) = cos(beta-alpha)
$
Man kann den Winkel auch über die Gleichung 
$
ip(v,w) = norm(v) dot norm(w) dot cos(angle.arc(v,w))
$
definiere. Dann ist auch $v = 0$ und/oder $w= 0$ erlaubt. Stehen $v$ und $w$ senkrecht aufeinander ($v perp w$)
$
cos(angle.arc(v,w)) = cos(pi/2) = 0 quad ==> quad ip(v,w) = 0
$

#definition("3.9", "orthogonal")[
  Sei $V$ ein endlichdimensionaler euklidischer oder unitärer Vektorraum. 

  #enum[
    Zwei Vektoren $v, w in V$ heißten #bold[orthogonal] bezüglich des gegebenen Skalarproduktes $ip(.,.)$, wenn gilt $ip(v,w) = 0$.
  ][
    Für dieses Skalarprodukt heißt eine Basis ${v_1, ..., v_n}$ von $V$ #bold[Orthogonalbasis], wenn 
    $
    ip(v_i, v_j) = 0 quad i, j = 1, ..., n, space i != j
    $
    Ist zusätzlich für die induzierte Norm 
    $
    ip(v_i, v_i)^(1/2) = norm(v_i) = 1 quad i = 1, ..., n
    $
    so heißt ${v_1, ..., v_n}$ #bold[Orthonormalbasis] von $V$. ($<==> ip(v_i, v_j) = delta_(i j)$)
  ]
] <def>

#theorem("3.10")[
  Sei $V$ ein euklidischer oder unitärer Vektorraum mit $dim(V) = n < oo$. Sei ${v_1, ..., v_n}$ eine Basis von $V$. Dann existiert eine Orthonormalbasis ${w_1, ..., w_n}$ von $V$. 
]

#startproof Per Induktion über $n$.

Induktionsanfang: $n = 1$

Sei $v_1 in V$, $v_1 != 0$. Dann gilt für $w_1 = norm(v_1)^(-1) v_1, norm(w_1) = 1$ und $"Span"{v_1} = "Span"{w_1}$. $==>$ ${w_1}$ ONB

Induktionsschritt: $n -> n +1$

Die Aussage gelte für $n$. Sei $dim(V) = n+1$ und ${v_1, ..., v_(n+1)}$ eine Basis von $V$. Dann ist $U = "Span"{v_1, ..., v_n}$ ein $n$-dimensionaler Unterraum von $V$. Nach Induktionsvorraussetzung existiert eine ONB ${w_1, ..., w_n}$ von $U$. D.h,
$
"Span"{w_1,...,w_n} = "Span"{v_1, ..., v_n}
$
Für 
$
tilde(w)_(n+1) = v_(n+1) - sum_(k = 1)^n ip(v_(n+1), w_k) w_k
$
gilt wegen $v_(n+1) in.not U$, dass $tilde(w)_(n+1) != 0$. Mit dem Austauschsatz von Steinitz (Satz 2.23, LinA I) folgt für $w_(n+1) = norm(tilde(w)_(n+1))^(-1) tilde(w)_(n+1)$, dass 
$
V = "Span"{v_1, ..., v_(n+1)} = "Span"{w_1, ..., w_(n+1)}
$
Für $j = 1, ..., n$ erhält man
$
ip(w_(n+1), w_j) &= ip(norm(tilde(w)_(n+1))  tilde(w)_(n+1), w_j)) \
norm(tilde(w)_(n+1))^(-1) ip(v_(n+1) - sum_(k = 1)^n ip(v_(n+1), w_k) w_k, w_j) \
&= norm(tilde(w)_(n+1))^(-1) (ip(v_(n+1), w_j) - sum_(k = 1)^n ip(v_(n+1), w_k) ip(w_k, w_j)) 
$
$
norm(tilde(w)_(n+1))^(-1) (ip(v_(n+1), w_j)- ip(v_(n+1), w_j)) = 0
$
$==>$ ${w_1, ..., w_(n+1)}$ sind ONB.
#endproof

Diese Orthogonalisierung ist als Gram-Schmidt-Verfahren bekannt. Jorgen Gram (dänishcer Mathematiker, 1850-1916), Erhard Schmidt (deutscher Mathematiker, 1876-1959). Das Verfahren wurde bereits vor Laplace und Cauchy verwendet.

#bold[Algorithmus 3.11: Gram-Schmidt-Verfahren]

Gegeben: ${v_1, ..., v_n}$ als Basis eines euklidischen (unitären) Vektorraums $V$

#enum[
  Setze $w_1 := norm(v_1)^(-1) v_1$
][
  Für $j = 2, ..., n$ setze $#sspace$
  $
  tilde(w)_j := v_j - sum_(k = 1)^(j-1) ip(v_j, w_k) w_k \
  w_j := norm(tilde(w)_j)^(-1) tilde(w)_j
  $
]
Die ursprüngliche Basis ${v_1, ..., v_n}$ hat dann die Darstellung
$
(v_1, ..., v_n) = (w_1, ..., w_k) underbrace(mat(norm(v_1), ip(v_1, w_1),...,ip(v_n, w_1);0,norm(tilde(w)_2), dots.down, dots.v;dots.v,dots.v,dots.down, ip(v_n, w_(n-1));0,0,,norm(tilde(w)_n)), = R)
$
Da alle Diagnonaleinträge von $R$ ungleich $0$ sind, ist $R$ invertierbar. Sei nun $U$ ein $m$-dimensionaler Unterraum von $RR^n$ oder $CC^n$ mit dem Skalarprodukt. Wir definieren eine Orthonormalbasis ${w_1,.., w_m}$ die Matrix
$
Q = (w_1, ..., w_m) in K^(n, m)
$
Damit gilt im reellen Fall
$
RR^(m,m) #scale(x: -100%, $in$) Q^T Q = (w^T_i w_j)_(i, j = 1, ..., m) = (delta_(i j))_(i, j = 1, ..., m) = I_m
$
und im komplexen Fall
$
CC^(m,m) #scale(x: -100%, $in$) Q^H Q = (w_i^H w_j)_(i, j = 1, ..., m) = I_m
$
für $m = n$: $Q^T = Q^(-1)$ bzw. $Q^H = Q^(-1)$

Umgekehrt gilt: Ist für eine Matrix $Q in K^(m, n)$ $Q^T Q = I_m$ bzw. $Q^H Q = I_m$, so sind die Spalten von $Q$ eine ONB bzgl. des Standardskalarproduktes eines $m$-dimensionalen Unterraums von $RR^n$ bzw. $CC^m$. Damit gilt: 

#theorem("3.12")[
  Sind $v_1, ..., v_m in K^n$ linear unabhängig, dann gibt es eine Matrix $Q in K^(n, m)$ mit orthonormalen Spalten bezüglich des Standardskalarproduktes und eine obere Dreiecksmatrix $R in "GL"_m (K)$ mit 
  $
  K^(n, m) #scale(x: -100%)[$in$] (v_1, ..., v_m) = Q R
  $
  als sogenannte $Q R$-Zerlegung
]
$Q R$ $->$ numerische lineare Algebra $->$ kleinste Quadrate-Problem

//bild

Die Matrix $Q$ ist längenerhaltend:

#lemma("3.13")[
  Sei $Q in K^(m, n)$ eine Matrix mit orthogonalen Spalten bzgl des Standardskalarproduktes. Dann gilt $norm(v)_2 = norm(Q v)_2$ für alle $v in K^n$, wobei hier $norm(.)_2$ die euklidische Norm ist.
]

#startproof
$
norm(v)_2^2 = ip(v,v) = v^H v = v^H I v = v^H Q^H Q v = norm(Q v)_2^2
$
#endproof

#definition("3.14", "Orthogonale und unitäre Matrizen")[
  #list[
    Eine Matrix $Q in RR^(n,n)$ heißt #bold[orthogonal], wenn $Q^T Q = I_n$ gilt. Wir definieren
    $
    O_n (RR) := {Q in RR^(n,n) | Q "orthogonal"}
    $
  ][
    Eine Matrix $Q in CC^(n,n)$ heißt #bold[unitär], wenn $Q^H Q = I_n$. Wir definieren
    $
    U_n (CC) := {Q in CC^(n,n) | Q "unitär"}
    $
  ]
] <def>

Für orthogonale bzw. unitäre Matrizen gilt 
$
RR^(n,n) #scale(x: -100%)[$in$] Q^T Q = I_n ==> Q^T = Q^(-1), CC^(n,n) #scale(x: -100%)[$in$] Q^H Q = I_n ==> Q^H = Q^(-1)
$
D.h.

#lemma("3.15")[
  Die Mengen $O_n (RR)$ und $U_n (CC)$ bilden Untergruppen von $"GL"_n (RR)$ und $"GL"_n (CC)$.
]
#startproof Hier nur $"GL"_n (RR)$ 

Für $I_n in RR^(n,n)$ gilt $I_n^T I_n = I_n$ $==>$ $I_n in O_n (RR)$ $==>$ $O_n (RR) != emptyset$. 

zu zeigen: Gruppeneigenschaften

#boxedenum[
  Abgeschlossenheit bzgl. der inneren Verknüpfung

  Sind $Q_1, Q_2 in O_n (RR)$. Dann gilt: 
  $
  (Q_1 Q_2)^T Q_1 Q_2 = Q_2^T Q_1^T Q_1 Q_2 = I_n \
  ==> Q_1 Q_2 in O_n (RR)
  $
][
  Neutrales Element: $I_n$
][
  Inverses Element: $Q^(-1) = Q^T$
]

Jetzt: Übertragung auf Endomorphismen, auch der geometrische Aspekt

#definition("3.16", "orthogonale Abbildung")[
  Eine Abbildung $f in L(V,V)$ heißt #bold[orthogonal] ($V = RR$) bzw. #bold[unitär] ($V = CC$) falls gilt
  $
  ip(f(v), f(w)) = ip(v, w) quad forall v, w in V
  $
] <def>

#definition("3.17", "")[
  Wir definieren für einen euklidischen Vektorraum $V$
  $
  O(V) := {f in L(V,V) | f "orthogonal"}
  $
  bzw. für einen unitären Vektorraum $V$
  $
  U(V) := {f in L(V,V) | f "unitär"}
  $
] <def>

#lemma("3.18")[
  Sei $f in L(V,V)$ orthogonal bzw. unitär. Dann gilt:

  #enum[
    $norm(f(v)) = norm(v) quad forall v in V$ für die durch das Skalarprodukt induzierte Norm
  ][
    $v bot w$ $==>$ $f(v) bot f(w)$ 
  ][
    $f$ ist ein Isomorphismus und $f^(-1)$ ist ebenfalls orthogonal bzw. unitär.
  ][
    Ist $lambda in K$ ein Eigenwert von $f$, so gilt $abs(lambda) = 1$
  ]
]

#startproof 1 und 2 folgt direkt aus der Definition.

3: Injektivitt folgt aus 1 + pos. Definitheit der Norm. Surjektivität folgt dann aus der Dimensionsformel. Aus der Surjektivität von $f$ und $F$ orthogonal bzw. unitär folgt diese Eigenschaft auch für $f^(-1)$. 
4: Ist $lambda$ ein Eigenwert von $f$ mit dem Eigenvektor $v != 0$, so gilt 
$
norm(v) = norm(f(v)) = norm(lambda v) = abs(lambda) norm(v) \
1 = abs(lambda)
$

Aus der Definition des Skalarproduktes und orthogonal bzw. unitär folgt

#corollary("3.19")[
  Gilt für $f in L(V,V)$, dass 
  $
  norm(f(v)) = norm(v)
  $
  für die durch das Skalarprodukt induzierte Norm, so ist $f$ orthogonal bzw. unitär.
]

Aus diesen Gründen werden orthogonale bzw. unitäre Abbildungen auch Isometrien genannt.

#theorem("3.20")[
  Sei $V$ ein euklidischer (unitärer) Vektorraum mit einer Orthonormalbasis $B = {v_1, ..., v_n}$ und $f in L(V,V)$. Dann gilt:
  $
  f in O(V) "bzw." f in U(V) quad <==> quad A_f^(B,B) in O_n (RR) "bzw." A_f^(B,B) in U_n (CC)
  $
  D.h. die Abbildungen
  $
  O(V) -> O_n (RR), f arrow.bar A_f^(B,B) space "bzw." space U(V) -> U_n (CC), f arrow.bar A_f^(B,B)
  $
  sind Isomorphismen.
]

#startproof Hier nur für $K = RR$

"$==>$": $f$ orthogonal

Dann gilt wegen der Orthonormalität von $B$ für $A_f^(B,B) = (a_(i j))$, dass 
$
delta_(i j) = ip(v_i, v_j) =^("3.16") ip(f(v_i), f(v_j)) = ip(sum_(l = 1)^n a_(l i) v_l, sum_(k = 1)^n a_(k j) v_k) = sum_(l = 1)^n a_(l i) a_(l j)
$
Also:
$
I_n = (A_f^(B,B))^T A_f^(B,B) ==> A_f^(B,B) in O_n (RR)
$

"$<==$": $A_f^(B,B) in O_n (RR)$. Für die zugehörige lineare Abbildung $f$ gilt wegen
$
f(v_i) = sum_(l = 1)^n a_(l i) v_l,
$
dass
$
ip(f(v_i), f(v_j)) = ip(sum_(l = 1)^n a_(l i) v_l, sum_(k = 1)^n a_(k j) v_k) = sum_(l = 1)^n a_(l i) a_(l j) =^(A_f^(B,B) in O_n (RR)) delta_(i j) = ip(v_i, v_j) \
==> f in O(V)
$
#endproof

== Selbstadjungierte Abbildungen

Was ist ein adjungierter Endomorphismus?

#lemma("3.21")[
  Sei $V$ ein euklidischer (unitärer) Vektorraum und $f in L(V,V)$. Dann gibt es genau ein $g in L(V,V)$ mit 
  $
  ip(f(v), w) = ip(v, g(w)) quad forall v, w in V
  $
  Ist $B$ eine Orthonormalbasis von $V$, so gilt
  $
  A_g^(B,B) = (A_f^(B,B))^H
  $
]

#startproof Hier nur für $K = RR$. Da $B$ orthonormal ist gilt für $v = Phi_B (x)$ und $w = Phi_B (y)$, dass
$
ip(v, w) = ip(A_(Phi_B)^(E, B) v, A_(Phi_B)^(E, B) w)_(RR^n) = x^T underbrace((A_(Phi_B)^(E,B))^T A_(Phi_B)^(E,B), I) y = x^T y = ip(x,y)_(RR^n) quad forall v, w in V
$
Dann gilt für $A_f^(B,B)$
$
ip(A_f^(B,B) x, y)_(RR^n) = (A_f^(B,B) x)^T y = x^T (A_f^(B,B))^T y = ip(x, (A_f^(B,B))^T y)_(RR^n)
$
Damit ist wegen der Definition des Skalarproduktes eindeutig eine lineare Abbildung mit der Darstellungsmatrix $(A_f^(B,B))^T$ gegeben. Diese bestimmt eindeutig den gesuchten Endomorphismus $g$. 
#endproof

#definition("3.22", "adjungierter Endorphismus")[
  Die in Lemma 3.21 eindeutig definierte Abbildung $g in L(V,V)$ nennt man den zu $f in L(V,V)$ #bold[adjungierten Endomorphismus]. Er wird mit $f^"ad"$ bezeichnet.
] <def>

#definition("3.23", "selbstadjungiert")[
  Sei $V$ ein euklidischer (unitärer) Vektorraum und $f in L(V,V)$. Der Enomorphismus $f$ heißt #bold[selbstadjungiert], wenn 
  $
  ip(f(v), w) = ip(v, f(w)) quad forall v, w in V
  $
  gilt. D.h. $f^"ad" = f$.
] <def>

#bold[Bemerkungen:] Es folgt unmittelbar

#boxedlist[
  Ist $f in L(V,V)$ und $B$ eine ONB, so gilt
  $
  f "selbstadjungiert" <==> A_f^(B,B) "ist symmetrisch bzw. hermitesch, d.h." A = A^H
  $ 
][
  Ist $f$ orthogonal bzw. unitär, so ist $f^"ad" = f^(-1)$, denn für $u, v in V$ mit $w = f(u)$ d.h. $u = f^(-1) (w)$ gilt
  $
  ip(f(v), w) = ip(f(v), f(u)) = ip(v, u) = ip(v, f^(-1) (w))
  $
]

#lemma("3.24")[
  Sei $V$ ein euklidischer (unitärer) Vektorraum und $f in L(V,V)$ selbstadjungiert. Dann sind alle Eigenwerte von $f$ reell und das charakteristische Polynom zerfällt in Linearfaktoren.
]

#startproof Sei zunächst $K =CC$. Sei $lambda$ ein Eigenwert von $f$ mit zugehörigen Eigenvektor $v != 0$. Dann gilt
$
lambda underbrace(ip(v,v), > 0) = ip(lambda v, v) = ip(f(v), v) = ip(v, f(v)) = ip(v, lambda v) = macron(lambda) ip(v, v)
$
$==> lambda = macron(lambda) in RR$

Fundamentalsatz der Algebra $==>$ $p_f (.) = p_A (.)$ zerfällt über $CC$ in Linearfaktoren. 

Sei nun $K =RR$.
$B$ ONB $==> A:=A_f^(B,B) = (A_f^(B,B))^T$ ist eine spezielle komplexe Matrix
$==>$ wie oben folgt für $p_A (.)$ betrachtet über $CC$, dass $p_A (.)$ in Linearfaktoren zerfällt 
$
(lambda - lambda_i) wide (lambda_i "ist EW" in RR)
$
$==> p_A (.)$ zerfällt auch über $RR$ in Linearfaktoren.
#endproof

#theorem("3.25")[
  Sei $V$ ein euklidischer (unitärer) Vektorraum und $f in L(V,V)$ selbstadjungiert. Dann gibt es eine Orthonormalbasis von $V$ die aus Eigenvektoren zu den reellen Eigenwerten von $f$ besteht.
]

#startproof Sei $n = dim(V) < oo$.

Für $n = 1$: klar $checkmark$

$n-1 -> n$:

Wegen Lemma 3.24 gilt
$
p_f (lambda) = plus.minus (lambda-lambda_1) dot ... dot (lambda - lambda_n)
$
mit $lambda_1, ..., lambda_n in RR$. Zu $lambda_1$ existiert ein Eigenvektor $v_1$ mit $norm(v_1) = 1$. Dann gilt für 
$
u in U := {u in V | ip(v_1, u) = 0}, 
$
dass
$
ip(v_1, f(u)) = ip(f(v_1), u) = lambda_1 underbrace(ip(v_1, u), = 0) = 0
$
d.h. $f(U) subset.eq U$. Also ist $U$ invariant unter $f$. Die Einschränkung $f|_U : U->U$ ist selbstadjungiert mit 
$
p_(f|_U) = plus.minus (lambda - lambda_2) dot ... dot (lambda - lambda_k)
$
Nach Induktionsvorraussetzung ex. ONB für $U$. Die Vereinigung dieses ONB mit $v_1$ ist ONB für $V$.
#endproof

Für die Matrixform erhalten wir analog:

#lemma("3.26")[
  Sei $A in K^(n,n)$ symmetrisch (hermitesch). Dann gibt es ein $T in "GL"_n (K)$ und $lambda_1, ..., lambda_n in RR$ so dass gilt 
  $
  T A T^(-1) = mat(lambda_1,,0;,dots.down,;0,,lambda_n)
  $
]

#startproof Über Darstellungsmatrix eines selbstadjungierten Endomorphismus.
#endproof

#definition("3.27", "positiv definite Matrix")[
  Eine symmetrische (hermitesche) Matrix $A in K^(n,n)$ heißt #bold[positiv definit], wenn 
  $
  v^T A v > 0 "bzw." v^H A v > 0 wide forall v in V without {0}
  $
] <def>

Lemma 3.26 $==>$ $A$ symmetrisch (hermitesch) $==>$ $A$ diagonalisierbar

Des Weiteren gilt:

#theorem("3.28")[
  Sei $A in K^(n,n)$ symmetrisch (hermitesch). Dann sind folgende Aussagen äquivalent:
  
  #enum[
    $A$ ist positiv definit
  ][
    Alle Eigenwerte $lambda_1, ..., lambda_n in RR$ von $A$ sind positiv.
  ]
]

#startproof Hier nur $K = CC$, $K = RR$ folgt analog.

"$1==>2$": Sei $lambda$ Eigenwert von $A$. Lemma 3.26 $==>$ $lambda in RR$. Sei $v$ ein Eigenvektor zu $lambda$, dann gilt:
$
0 < v^H A v = v^H A^H v = (A v)^H v = (lambda v)^H v = lambda v^H v = lambda underbrace(norm(v)^2, > 0) ==> lambda > 0
$
"$2==>1$": Satz 3.25: Es exitstiert ONB ${v_1, ..., v_n}$ bestehend aus Eigenvektoren zu Eigenwerten von $A$.
$
v_i^H A v_j = lambda_i v_i^H v_j = lambda_i delta_(i j)
$
Jedes $v in V$ bestizt eine Darstellung
$
v = sum_(i = 1)^n mu_i v_i, quad mu_i in CC, 1<=i<=n 
$
$
v^H A v = ip(sum_(i = 1)^n mu_i v_i, sum_(j = 1)^n mu_j A v_j) = sum_(i = 1)^n sum_(j = 1)^n mu_i macron(mu)_j lambda_j underbrace(ip(v_i, v_j), delta_(i j)) \
= sum_(i = 1)^n mu_i macron(mu)_i underbrace(lambda_i, > 0) = sum_(i = 1)^n underbrace(abs(mu_i)^2, >= 0) lambda_i > 0 quad "für" v != 0
$

#endproof

Zur Berechnung einer solchen ONB:

#bold[Algorithmus 3.29:] Gegeben: $A in K^(n,n)$  bzw. $f in L(V,V)$ mit $A_f^(B,B) = A$.

#list[
  Bestimme 
  $
  p_A (lambda) = plus.minus (lambda - lambda_1)^(k_1) dot ... dot (lambda - lambda_m)^(k_m)
  $
  mit paarweise verschiedenen $lambda_i$, $1 <= i<= m$. Ist dies nicht möglich: STOP
][
  Für jeden Eigenwert $lambda_i$ der algebraischen Vielfachheit $k_i$ bestimme eine Basis des dazugehörigen Eigenraums $"Eig"(A, lambda_i)$. Stimmen geometrische und algebraische Vielfachheit nicht überein: STOP
][
  Orthonormalisiere die Vereinigung der jeweiligen Basen mit dem Gram-Schmidt-Verfahren.
]

#bold[Beispiel 3.30:] Fortsetzung von Beispiel 2.32

Wir betrachten wieder 
$
A = mat(3,-1,4,-3,-1;1,1,-1,1,0;-1,0,2,0,0;4,1,-4,5,1;-2,0,2,-2,1) \
p_A (lambda) = (lambda-1)^4 (lambda-2) wide lambda_1 = 1 > 0, lambda_2 = 2 > 0
$
Es gilt
$
"Eig"(A, 1) = "Span"{vec(1,-1,1,0,1), vec(1,1,1,0,-1), vec(0,0,1,1,0), vec(0,0,0,0,1)} = {v_1, v_2, v_3, v_4} \
"Eig"(A, 2) = "Span"{mat(0,1,2,3,-2)^T} = {v_5}
$
GS-Verfahren
$
w_1 = norm(v_1)^(-1) v_1 = 1/2 mat(1,-1,1,0,1)^T
$
$underline(j = 1)$
$
tilde(w)_2 = v_2 - sum_(k = 1)^1 ip(v_2, w_k) w_k = mat(1,1,1,0,-1)^T - 0, quad w_2 = 1/2 mat(1,1,1,0,-1)^T
$
$underline(j = 2):$
$
tilde(w)_3 = v_3 - sum_(k = 1)^2 ip(v_3, w_k) w_k = mat(0,0,1,1,0)^T - 1/2 dot 1/2 dot (1,-1,1,0,1)^T - 1/2 dot 1/2 dot mat(1,1,1,0,-1)^T \
= mat(-1/2,0,1/2,1,0)^T, quad w_3 = 1/sqrt(3/2) mat(-1/2,0,1/2,1,0)^T
$
$j = 3$:...
$j = 4$:...

#pagebreak()

= Affine Geometrie

Bisher als Struktur:
$
"Gruppen" ==> "Körper" ==> "Vektorraum über Körper" ==> #stack(dir: ttb, spacing: 1em)[
  Unterraum #h(12.5em)
][
  affine Unterräume als weitere Struktur
]
$
Zur Motivation/Startpunkt, $RR^3$

Gerade:
$
G := {vec(1,2,3) + a dot vec(1,1,0) | a in RR}
$
Ebene: 
$
E := {vec(1,2,3) + a dot vec(1,0,0) + b dot vec(0,1,0) | a, b in RR}
$


Def. 6.5 aus LinA: $G$ und $E$ sind affine Unterräume des $RR^3$. Damit ist $mat(1,2,3)^T$ ein Punkt im Raum zu dem ein Vektor als Repräsentant einer Äquivalenzklasse addiert wird. D.h.
$
G: P limits(+)_= ar(v)
$
Wir hatten schon: $U = v limits(+)_= W$ mit $W$ UVR

== Operation einer Gruppe auf einer Menge

#definition("4.1", "Wirkung einer Gruppe")[
  Es sei $G$ eine Gruppe mit der Verknüpfung $circ$ und dem neutralen Element $e$ sowie eine Menge $M$. Eine Abbildung der Form
  $
  G times M -> M, quad (g, m) arrow.bar g circs m
  $
  nennt man #bold[Wirkung] oder #bold[Operation] der Gruppe $G$ auf der Menge $M$, falls gilt
  
  #boxedenum[
    $(g_1 circ g_2) circs m = g_1 circs (g_2 circs m) quad forall g_1, g_2 in G, forall m in M$
  ][
    $e circs m = m quad forall m in M$
  ]
] <def>

#bold[Beispiel 4.2:]

#boxedlist[
  Passend zum obigen Beispiel der Gerade/Ebene:

  Sei $G = V$ ein $K$-Vektorraum (vgl. Def. 2.26 LinA I), $M = V$. Dann ist durch
  $
  V times V -> V, (v, x) arrow.bar v + x
  $
  eine Operation von $V$ auf sich selbst definiert.
][
  Für die Gruppe $G := (RR, +)$ und $M = S^1$ als Einheitskreis im $RR^2$, d.h.
  $
  S^1 = {x in RR^2 | x_1^2 + x_2^2 = 1}
  $
  wird durch
  $
  (a, x) arrow.bar e^(i a) dot x quad forall a in G, forall x in M
  $
  eine Operation von $(RR, +)$ auf $S^1$ gegeben.
][
  Sei $G = "GL"_n (RR)$ und $M =RR^n$. Dann definiert
  $
  (A, x) arrow.bar A dot x in M quad forall A in G, forall x in M
  $
  eine Operation von $"GL"_n (RR)$ auf $M$.
]

#definition("4.3", [Bahn von $m$])[
  Eine Gruppe $G$ wirke auf die Menge $M$. Für $m in M$ wird die Teilmenge
  $
  G circs m := { g circs m | g in G } subset.eq M
  $
  die #bold[Bahn von $m$ unter $G$] genannt.
] <def>

#bold[Beobachtung:] In Beispiel 4.2:

In 1 und 2 entspricht die Bahn eines einzigen Elements der ganzen Menge.

In 3)

#definition("4.4", "transitive Wirkung")[
  Eine Gruppe $G$ wirke auf der Menge $M$. Die Wirkung nennt man #bold[transitiv], wenn für alle Paare $m, tilde(m) in M$ ein $g in G$ existiert, so dass
  $
  m = g circs tilde(m)
  $
  Man nennt die Wirkung #bold[einfach transitiv], falls das Gruppenelement $g$ eindeutig bestimmt ist.
] <def>

#lemma("4.5")[
  Eine Gruppe $G$ wirke auf die Menge $M$. Dann gilt:

  #boxedenum[
    Ist die Wirkung transitiv, so gilt für jedes $m in M$ die Gleichheit $G circs m = M$
  ][
    Ist die Wirkung einfach transitiv, so existiert eine Bijektion zwischen $M$ und $G$.
  ]
]

#startproof

zu 1) Sei $m in M$ bel. gewählt. Dann existiert wegen der transitiven Wirkung zu $tilde(m) in M$ ein $g in G$ mit $tilde(m) = g circs m ==> M = G circs m$

zu 2) Für ein fest gewähltes $m in M$, definiert man 
$
psi_m: G -> M, quad g arrow.bar g circs m
$
Wegen der transitiven Wirkung ist $phi_m$ surjektiv. Da die Wirkung einfach transitiv ist, ist $phi_m$ auch injektiv $==>$ Bijektivität
#endproof

== Affine Räume

#definition("4.6", "affiner Raum")[
  Sei $V$ ein $K$-Vektorraum. Eine nichtleere Menge $M$ heißt #bold[affiner Raum] über dem Vektorraum $V$, wenn $V$ einfach transitiv auf $M$ wirkt. Die Elemente von $M$ werden als #bold[Punkte] bezeichnet. Ist $M = emptyset$, so wird $M$ ebenfalls als affiner Raum aufgefasst.
] <def>

Wie passt das zu 6.5 aus LinA I?

#bold[Beispiel 4.7:] Sei $cal(L)(A, b)$ die Lösungsmenge des LGS $A x = b$ mit $A in RR^(m,n), x in RR^n, b in RR^m$. Im Satz 6.3, LinA I, haben wir gezeigt, dass $cal(L)(A, 0)$ ist ein Unterraum des $RR^n$ ($==>$ Gruppe). Ist $cal(L)(A, b) != emptyset$, gilt nach Satz 6.4, LinA I, dass
$
cal(L)(A, b) = x_* + cal(L)(A, 0)
$
für ein beliebiges $x_* in cal(L)(A, b)$. Dann ist $M = cal(L)(A, b)$ ein affiner Raum über dem Vektorraum $cal(L)(A, 0)$, denn es gilt
$
plus: cal(L)(A, 0) times cal(L)(A, b) -> cal(L)(A, b), quad (y, x) arrow.bar y + x
$
dass
$forall y in G, forall x in M$:
$
A (y + x) = A y + A x = 0 + b = b
$
$==> y + x in M$

$forall y, tilde(y) in G, forall x in M$ gilt 
$
"1."& quad (y +_G tilde(y)) +_W x = y +_W (tilde(y) +_W x) = y +_(RR^n) tilde(y) +_(RR^n) x \
"2."& quad 0 +_W x = 0 +_(RR^n) x = x
$
$==>$ $+$ ist eine Wirkung der Gruppe $G$ auf die Menge $M$. Sind $x, tilde(x) in cal(L)(A, b)$ ist $A x = A tilde(x) = b$ $==>$ 
$
A (x - tilde(x)) = b - b = 0
$
$y := x - tilde(x) in cal(L)(A, 0) ==> x = (x - tilde(x)) + tilde(x) = y + tilde(x) ==>$ Wirkung ist transitiv

Sei $tilde(y) in cal(L)(A, 0) = G$ so gewählt, dass auch
$
x = tilde(y) + tilde(x)
$
gilt.
$
x = y + tilde(x) \
x = tilde(y) + tilde(x) \
==> 0 = y - tilde(y) ==> y = tilde(y) ==> "einfach transitiv"
$
#endproof

#corollary("4.8")[
  Sind $M$ und $tilde(M)$ zwei affine Räume, so existiert eine Bijektion zwischen $M$ und $tilde(M)$.
]

#startproof Folgt aus Lemma 4.5 und Komposition zweier bijektiver Abbildungen.
#endproof

#bold[Folgerung:] Ein affiner Raum ist bis auf eine Bijektion eindeutig bestimmt. Damit ist folgendes sinnvoll:

#definition("4.9", [affiner Raum von $V$ als $A(V)$])[
  Wir bezeichnen den affinen Raum über den zugehörigen $K$-Vektorraum $V$ mit $A(V)$ bzw. A, wenn der Kontext klar ist. Die einfach transitive Wirkung $circs$ von $V$ auf $A(V)$ wird mit $+$ bezeichnet, d.h. 
  $
  x circs P := P + x, quad x in V, P in A(V)
  $
] <def>

#lemma("4.10")[
  Sei $V$ ein $K$-Vektorraum und $A$ ein affiner Raum über $V$. Sei $P, Q, R, S in A$ und $v, w in V$. Dann gelten folgende Aussagen:
  
  #boxedenum[
    $
    P + v = P + w ==> v = w
    $
    D.h. für $Q = P + x in A$ ist der Vektor $x in V$ eindeutig bestimmt.
  ][
    $P + v = Q + v ==> P = Q$
  ][
    $P + v = Q ==> P = Q + (-v)$
  ][
    Für $Q = P + v in A$ wird $v$ als Verbindungsvektor von $P$ nach $Q$ bezeichnet und man schreibt 
    $
    v = smar(P Q)
    $
    Es gilt
    $
    smar(P Q) + smar(Q R) = smar(P R)
    $
  ][
    Für $n in NN$ Punkte, $n > 1$, $P_1, ..., P_n in A$ gilt
    $
    smar(P_1 P_2) + smar(P_2 P_3) + ... + smar(P_(n-1) P_n) = sum_(i = 1)^(n-1) smar(P_i P_(i+1)) = smar(P_1 P_n)
    $
  ][
    $
    smar(P Q) + smar(Q P) = 0 in V$, d.h. $smar(P Q) = - smar(Q P) in V
    $
  ][
    $smar(P Q) = smar(R S) ==> smar(P R) = smar(Q S)$
  ]
]

#startproof Hier nur der Beweis von einigen Aussagen

zu 1: Wegen der einfachen Transitivität existiert genau ein Vektor $v in V$ mit $Q = P + v = P + w$

#figure(image("bilder2/4_10.JPG", width: 40%))

Formal: $smar(P Q), smar(Q R), smar(P R)$ sind definitionsgemäß die eindeutig bestimmten Vektoren, für die gilt
$
Q = P + smar(P Q), R = Q + smar(Q R), R = P + smar(P R)
$
Damit folgt
$
R = (P + smar(P Q)) + smar(Q R) = P + (smar(P Q) + smar(Q R))
$

zu 7: Sei $smar(P Q) = smar(R S)$. Dann folgt mit 4:
$
smar(P R) = smar(P Q) + smar(Q R) = smar(R S) + smar(Q R) = smar(Q R) + smar(R S) =^("4)") smar(Q S)
$
#endproof

#definition("4.11", [Verbindungsvektor $v_O (P)$])[
  Sei $V$ ein $K$-Vektorraum und $A$ ein affiner Raum über $V$. Für einen Punkt $O in A$ definiert man:
  $
  psi_O: V -> A, quad x arrow.bar P := O + x
  $
  Aus Lemma 4.10 folgt unmittelbar, dass $psi_O$ eine Bijektion ist. D.h. für alle $P in A$ ist der Vektor $v_O (P)$ das eindeutig bestimmte Element in $V$ mit 
  $
  P = O + v_O (P)
  $
] <def>

#definition("4.12", "Dimension affiner Räume")[
  Sei $V$ ein $K$-Vektorraum und $A$ ein affiner Raum über $V$. Dann ist
  $
  dim A := dim V
  $
  die #bold[Dimension von $A$]. Ist $A = emptyset$, so definiert man $dim A = -1$.
] <def>

Als Verallgemeinerung von Def. 6.5, LinA I:

#definition("4.13", "affiner Unterraum")[
  Sei $V$ ein $K$-Vektorraum, $A$ ein affiner Raum über $V$ mit der Verknüpfung $+: V times A -> A$ und $P in A$. Ist $U subset.eq V$ ein Untervektorraum von $V$, so nennt man die Menge
  $
  B := P + U := {Q in A | exists u in U: Q = u + P}
  $
  einen #bold[affinen Unterraum] von $A$.
] <def>

#lemma("4.14")[
  Sei $B$ ein affiner Unterraum des affinen Raums $A(V)$, d.h. $B subset.eq A(V)$. Damit ist $B$ selbst ein affiner Raum über einen Vektorraum $U subset.eq V$.
]

#startproof Nach Definition existiert zu $B$ ein $P in A(V)$ und ein Unterraum $U subset.eq V$:
$
B = {Q in A | exists u in U: Q = P + u}
$
$A$ affiner Raum $==>$ $exists +: V times A -> A$

Einschränkung auf $B$ liefert:
$
+: V times B -> B
$
$
B = {Q in A | exists v in U: Q = P + v}, quad +: U times B -> B "wohldefiniert?"
$
$forall Q in A: forall v in V$ ist $Q = P + v$ definiert.

$==>$ $forall Q in B subset.eq A, forall u in U subset.eq V$ ist $Q = P + u$ wohldefiniert. Des Weiteren gilt: für $Q in B$, $u in U$ sowie $v in U$ erhält man 
$
Q + u = (P+ v) + u = P + underbrace((v + u), in U) in B
$
Auch bei der Einschränkung auf $B$ bzw. $U$ bleibt die einfache Transitivität erhalten. 
#endproof

Analago zu Satz 6.6 aus LinA I kann man zeigen:

#theorem("4.15")[
  Sei $V$ ein $K$-Vektorraum, $A$ ein affiner Raum über $V$, $P, tilde(P) in A$ und $U, tilde(U) subset.eq V$ Untervektorräume von $V$. Dann gilt:

  #boxedenum[
    Für jedes $Q in P + U$ ist $P + U = Q + U$
  ][
    Gilt $P + U = tilde(P) + tilde(U)$, so ist $U = tilde(U)$ und $smar(P tilde(P)) in U = tilde(U)$
  ]
]

#startproof siehe LinA I 
#endproof

#definition("4.16", "Aufpunkt und Richtung")[
  Sei $V$ ein $K$-Vektorraum, $A$ ein affiner Raum über $V$  und $A(W)$ ein affiner Unterraum von $A$. Gilt
  $
  A(W) = P + W
  $
  so nennt man $P$ einen #bold[Aufpunkt] von $A(W)$ und den Untervektorraum $W$ die #bold[Richtung] von $A(W)$
] <def>

== Lagebeziehungen von affinen Unterräumen

#definition("4.17", "(schwach) parallel")[
  Sei $V$ ein $K$-Vektorraum, $A(V)$ ein affiner Raum und $A(W_1), A(W_2)$ zwei affine Unterräume von $A(V)$.

  #boxedlist[
    $A(W_1)$ und $A(W_2)$ heißen #bold[parallel], wenn $W_1 = W_2$ gilt $(A(W_1) || A(W_2))$
  ][
    $A(W_1)$ und $A(W_2)$ heißen #bold[schwach parallel], falls $W_1 subset W_2$ gilt $(A(W_1) triangle.stroked.small.l A(W_2))$
  ]
] <def>

#theorem("4.18")[
  Sei $V$ ein $K$-Vektorraum, $A(V)$ ein affiner Raum über $V$ und $A(W_1), A(W_2)$ zwei parallele affine Unterräume. Dann gilt entweder $A(W_1) = A(W_2)$ oder $A(W_1) sect A(W_2) = emptyset$
]

#startproof Gilt $A(W_1) || A(W_2) ==> W_1 = W_2$

Annahme: $A(W_1) sect A(W_2) != emptyset$. Dann existiert ein $P in A(W_1) sect A(W_2)$. Satz 4.15 liefert
$
A(W_1) = P + W_1 = P + W_2 = A(W_2)
$
#endproof

Bekannt ist:

#boxedlist[
  Ein 0-dimensionaler affine Unterraum $RR^3$ heißt Punkt im $RR^3$.
][
  Ein 1-dimensionaler affine Unterraum des $RR^3$ heißt Gerade im $RR^3$.
][
  Ein 2-dimensionaler affine Unterraum des $RR^3$ heißt Ebene in $RR^3$.
]

Verallgemeinerung:

#definition("4.19", "Punkt, Gerade, Ebene")[
  Sei $V$ ein $K$-Vektorraum, $A(V)$ ein affiner Raum über $V$ und $A(W)$ ein affiner Unterraum von $A(V)$.

  #boxedlist[
    Ist $dim(A(W)) = 0$, so heißt $A(W)$ #bold[(affiner) Punkt] von $A(V)$.
  ][
    Ist $dim(A(W)) = 1$, so heißt $A(W)$ #bold[(affine) Gerade] von $A(V)$.
  ][
    Ist $dim(A(W)) = 2$, so heißt $A(W)$ #bold[(affine) Ebene] von $A(V)$.
  ]
] <def>

#bold[Bemerkung:] Geraden können maximal schwach parallel zu Ebenen sein!

Für Untervektorräume gilt: $dim(U_1 sect U_2) = dim(U_1) + dim(U_2) - dim(U_1 + U_2)$, Satz 3.40, LinA I

#lemma("4.20")[
  Es seien $U_1$ und $U_2$ zwei Untervektorräume eines $K$-Vektorraums $V$ sowie $A(U_1) =: A_1$ und $A(U_2) =: A_2$ zwei affine Unterräume des affinen Raums $A(V)$. Ist $A_1 sect A_2 != emptyset$, so ist $A_1 sect A_2$ ein affiner Unterraum von $A(V)$ mit dem zugehörigen Untervektorraum $U_1 sect U_2$ und es gilt
  $
  dim (A_1 sect A_2) = dim(U_1 sect U_2)
  $
]

#startproof Es gilt: 
$
A_1 = P_1 + U_1 quad "und" quad A_2 = P_2 + U_2
$
$A_1 sect A_2 != emptyset ==> exists Q in A_1 sect A_2$
$
A_1 sect A_2 = {P in A | exists u_1 in U_1, u_2 in U_2: P = Q + u_1 = Q + u_2}
$
Für jedes Paar $(P, Q)$ von Punkten aus $A$ genau einen Vektor $v in  V$ mit $P = Q + v$ (Lemma 4.10, 1) 
$
==> u_1 = u_2 ==> A_1 sect A_2 = {P in A | exists u in underbrace(U_1 sect U_2, "UVR"): P = Q + u}
$
$==>$ $A_1 sect A_2$ affiner Raum.

$dim(A_1 sect A_2) = dim(U_1 sect U_2)$ nach Def. 
#endproof

#lemma("4.21")[
  Es seien $U_1$ und $U_2$ zwei Untervektorräume des $K$-Vektorraums $V$, $A_1 = A(U_1)$ und $A_2 = A(U_2)$ zwei affine Unterräume eines affinen Raums $A(V)$ sowie $P_1 in A_1$ und $P_2 in A_2$ zwei beliebige Punkte
  $
  A_1 sect A_2 != emptyset <==> smar(P_1 P_2) in U_1 + U_2
  $
]

#startproof

"$==>$": $A_1 sect A_2 != emptyset ==> exists Q in A_1 sect A_2$

Dann liegen die Verbindungsvektoren $smar(P_1 Q)$ bzw. $smar(P_2 Q)$ in den jeweiligen Untervektorräume $U_1$ bzw. $U_2$. Lemma 4.10, 4):
$
smar(P_1 P_2) = underbrace(smar(P_1 Q), in U_1) + underbrace(smar(Q P_2), in U_2) in U_1 + U_2 space checkmark
$

"$<==$": Sei $smar(P_1 P_2) in U_1 + U_2$ $==>$

$exists u_1 in U_1, u_2 in U_2: smar(P_1 P_2) = u_1 + u_2$. Setzt man $Q := P_1 + u_1 in A_1$, so gilt 
$
Q &= P_1 + u_1 = P_1 + ((u_1 + u_2) - u_2) = P_1 + (smar(P_1 P_2) - u_2) \
&= (P_1 + smar(P_1 P_2)) - u_2 = underbrace(P_2, in A_2) + underbrace((-u_2), in U_2) in A_2
$
$==> A_1 sect A_2 != emptyset$
#endproof

#definition("4.22", "affine Hülle, Verbindungsraum")[
  Sei $M subset A(V)$ eine Teilmenge eines affinen Raumes $A(V)$ über einem $K$-Vektorraum $V$. Der kleinste affine Unterraum von $A$, der $M$ enthält, wird #bold[affine Hülle] von $M$ gennant und mit $angle.l M angle.r_"aff"$ bezeichnet.

  Sind $A(U_1)$ und $A(U_2)$ zwei affine Unterräume eines affines Raums $A(V)$, so bezeichnen wir die affine hülle $hull(A(U_1) union A(U_2))$ als #bold[Verbindungsraum] von $A_1$ und $A_2$.
] <def>


#lemma("4.23")[
  Seien $U_1, U_2 subset.eq V$ zwei Untervektorräume des $K$-Vektorraums $V$, $A_1 = A(U_1)$ und $A_2 = A(U_2)$ zwei offene Unterräume eines affines Raums $A(V)$, sowie $P_1 in A_1$ und $P_2 in A_2$ d.h.
  $
  A_1 = P_1 + U_1 space "und" space A_2 = P_2 + U_2
  $
  Dann ist der Verbindungsraum durch
  $
  hull(A_1 union A_2) = P_1 + ("Span"(smar(P_1 P_2)) + U_1 + U_2)
  $
  bestimmt.
]

#startproof Sei $U$ der Untervektorraum zu $hull(A_1 union A_2)$. Nach Definition gilt
$
A_1 union A_2 subset.eq hull(A_1 union A_2)
$
also auch
$
A_1 = P_1 + U_1 subset.eq hull(A_1 union A_2) "und" \
A_2 = P_2 + U_2 subset.eq hull(A_1 union A_2)
$
$==> U_1 subset.eq V, U_2 subset.eq V$. $P_1, P_2 in hull(A_1 union A_2)$ und $hull(A_1 union A_2)$ affiner Unterrraum $==>$ $smar(P_1 P_2) in V$

Damit erhalten wir
$
P_1 + "Span"(smar(P_1 P_2)) subset.eq hull(A_1 union A_2)
$
Man kann sich überlegen:

Für Teilmengen $M_1, M_2 subset.eq V$, $V$ Vektorraum, gilt 
$
&"Span"{M_1 union M_2} = "Span"{M_1} + "Span"{M_2} \
&==> "Span"{smar(P_1 P_2)} + U_1 + U_2 subset.eq U \
&==> P_1 + "Span"{smar(P_1 P_2)} + U_1 + U_2 subset.eq hull(A_1 union A_2)
$
Gleihheit gilt nach Definition der affinen Hülle.
#endproof

#theorem("4.24")[
  #bold[Dimensionssatz]

  Seien $U_1, U_2$ zwei Untervektorräume eines $K$-Vektorraums $V$ sowie $A_1 = P_1 + U_1$ und $A_2 = P_2 + U_2$ zwei affine Unterräume eines affinen Raums $A(V)$. Dann gilt 
  
  #boxedenum[
    Ist $A_1 sect A_2 != emptyset$, so ist 
    $
    dim hull(A_1 union A_2) &= dim(U_1 + U_2) \
    &= dim(A_1) + dim(A_2) - dim(U_1 sect U_2) \
    &= dim(A_1) + dim(A_2) - dim(A_1 sect A_2)
    $
  ][
    Ist $A_1 sect A_2 = emptyset$, so ist
    $
    dim hull(A_1 union A_2) &= dim(U_1 + U_2) + 1 \
    &= dim(A_1) + dim(A_2) - dim(U_1 sect U_2) + 1
    $
  ]
]

#startproof

zu 1) $A_1 sect A_2 != emptyset$ $==>$ Lemma 4.21: $smar(P_1 P_2) in U_1 + U_2$. Mit Lemma 4.23:
$
hull(A_1 union A_2) = P_1 + ("Span"{smar(P_1 P_2)} + U_1 + U_2) = P_1 + (U_1 + U_2)
$
Satz 3.40, LinA I (Dimensionssatz für UVR)
$
dim(U_1 + U_2) = dim(U_1) + dim(U_2) - dim(U_1 sect U_2)
$
Die Aussage folgt dann aus Lemma 4.20.

zu 2) Lemma 4.21: $smar(P_1 P_2) in.not U_1 + U_2$ $==>$ 
$
dim("Span"{smar(P_1 P_2)} + U_1 + U_2) = 1 + dim(U_1) + dim(U_2) - dim(U_1 sect U_2)
$
#endproof

== Affine Abbildungen

#definition("4.25", "affine Abbildung")[
  Seien $A(V)$ und $A(W)$ zwei affine Räume über dem $K$-Vektorraum $V$ und $W$. Eine Abbildung $f: A(V) -> A(W)$, d.h. zwischen den Mengen, die $A(V)$ und $A(W)$ zugrundeliegen, heißt affine Abbildung, falls ein Punkt $P in A(V)$ existiert, so dass die Abbildung
  $
  smar(f_P) : V -> W, quad smar(f_P) (smar(P Q)) := smar(f(P) f(Q)) wide forall Q in A(V)
  $
  linear ist.
] <def>

#bold[Beispiel 4.26:] Für $n, m in NN$ sei $A in RR^(m,n)$, $b in RR^m$
$
g: RR^n -> RR^m, quad g(x) := A x + b quad "für" b != 0 "nicht linear!"
$
Ist diese Abbildung affin? Dazu: $V := RR^n, W = RR^m$, $A(V) = RR^n$, $A(W) = RR^m$, $P = "?"$, $g_P = "?"$

Sei $P in A(V)$ beliebig gewählt, $v in V$ und $Q := P + v$. Dann gilt:
$
g(P) = A P + b quad g(Q) = A Q + b = A (P + v) + b = A v + g(P)
$
Damit setzen wir
$
smar(g_P) (v) = smar(g(P) g(Q)) = A v
$
D.h. die resultierende Abbildung
$
smar(g_P): V -> W, quad smar(g_P) (v) = A v
$
ist linear, also ist $g$ affin

#sect_delim

Sind die Eigenschaften von $smar(f_P)$ Abhängigkeit von der Wahl von $P$?

#lemma("4.27")[
  Die Definition einer affinen Abbildung $f: A(V) -> A(W)$ ist unabhängig von dem in der Definition angegebenen Punkt $P$.
]

#startproof Zuerst: Zeige für $v in V$ beliebig, dass das Bild $smar(f_P) in W$ unabhängig von $P$ ist. Dazu sei $Q in A(V)$ beliebig gewählt. Für $R := Q + v in A(V)$ gilt $Q, R in A(V)$, $v = smar(Q R)$. Wegen
$
smar(P R) = smar(P Q) + smar(Q R) ==> v = smar(P R) - smar(P Q)
$
$smar(f_P)$ linear $==>$ 
$
smar(f_P) (v) = smar(f_P) (smar(P R) - smar(P Q)) = smar(f_P) (smar(P R)) - smar(f_P) (smar(P Q)) = smar(f(P) f(R)) - smar(f(P) f(Q)) = op(plus.circle.arrow) \
(smar(f(P) f(R)) = smar(f(P) f(Q)) + smar(f(Q) f(R))) \
op(plus.circle.arrow) = smar(f(Q) f(R))
$
$==>$ $smar(f_P) (v)$ ist unabhängig von $P$.
#endproof

#bold[Bemerkung:] Ist $f: A(V) -> A(W)$ eine affine Abbildung, so erlaubt Lemma 4.27, die durch $f$ induzierte lineare Abbildung $smar(f_P) in L(V,W)$ mit $smar(f) in L(V, W)$ zu bezeichnen. Damit haben wir zwei Möglichkeiten $smar(f)$ zu charakterisieren: $P, Q in A(V)$
$
smar(f) (smar(P Q)) = smar(f(P) f(Q)) <==> f(Q) = f(P) + smar(f) (smar(P Q))
$

#definition("4.28", "affine Selbstabbildung, Fixpunkt")[
  Seien $A(V)$, $A(W)$ zwei affine Räume mit zugehörigen $K$-Vektorräumen $V$ und $W$. Dann definiert man
  $
  A(V, W) := {f: A(V) -> A(W) | f "affin"}
  $
  Eine affine Abbildung $f: A(V) -> A(V)$ nennt man #bold[affine Selbstabbildung]. Für ein $f in A(V, V)$ nennt man einen Punkt $P in A(V)$ mit $f(P) = P$ #bold[Fixpunkt von $f$]. Die Menge der bijektiven affinen Selbstabbildungen bezeichnet man mit 
  $
  "GA"(V) := {f: A(V) -> A(V) | f "affin und bijektiv"}
  $
] <def>

#bold[Bemerkungen:]

#boxedlist[
  Die Menge $"GA"(V)$ bildet eine Gruppe bzgl. der Komposition von Abbildungen. Sie wird deswegen auch #bold[affine Gruppe] zum $K$-Vektorraum $V$ gennant.
][
  Betrachtet man einen Vektorraum $V$, als $A(V)$ über sich selbst, so lässt sich jede lineare Abbildung $f in L(V,V)$ als affine Abbildung interpretieren
  $
  f_P : V -> V, quad x arrow.bar 0_V + smar(f)(smar(0_V x)) = f(x)
  $
  Diese Abbildung besitzt immer den Fixpunkt $0_V$, denn $f_P (0_V) = f(0_V) = 0_V$.
]

#lemma("4.29")[
  Seien $f in A(V, W)$ und $A(V')$ ein affiner Unterraum von $A(V)$. Dann ist das Bild $f(A(V'))$ ein affiner Unterraum von $A(W)$ mit der Richtung $smar(f) (V')$.
]

#startproof Nach Definition existiert ein $P in A(V')$ mit der Eigenschaft 
$
A(V') = P + V'
$
$f in A(V, W)$ induziert eine lineare Abbildung $smar(f) in L(V,W)$. Für diese gilt: 
$
f(A(V')) = f(P + V') = f(P) + smar(f) (V')
$
#endproof

Man kann sich relativ leicht überlegen: 

Ist $f in "GA"(V)$, so werden mittels $f$ (affine) Geraden und Ebenen wieder in (affine) Geraden und Ebenen überführt. Deswegen nennt man eine Abbildung $f in "GA"(V)$ auch #bold[geradentreu]. Vgl. Lemma 4.37, Satz 4.39.

Beispiele für affine Abbildungen.

#definition("4.30", "Translation")[
  Sei $V$ ein $K$-Vektorraum, $v in V$ und $A(V)$ ein affiner Raum. Dann heißt die Abbildung 
  $
  f_v: A(V) -> A(V), quad f_v (P) = P + v
  $
  #bold[Verschiebung] oder #bold[Translation] um den Vektor $v$.
] <def>

#lemma("4.31")[
  Für eine Translation $f_v$ gilt 
  $
  f_v in "GA"(V)
  $
]

#startproof 

$f_v$ bijektiv: einfach zu zeigen
$f_v$ affin: Seien $P, Q in A(V)$. Dann gilt:
$
f_v (Q) &= f_v (P) + smar(f_v (P) f_v (Q)) \
&= P + v + smar(f_v) (smar(P Q)) \
&= Q + smar(Q P) + v + smar(f_v) (smar(P Q))
$
Des Weiteren gilt
$
&f_v (Q) = Q + v quad (==> Q + v = Q + smar(Q P) + v + f_v (smar(P Q))) \
&==> v = smar(Q P) + v + smar(f_v) (smar(Q P)) \
&==> smar(f_v) (smar(P Q)) = - smar(Q P) = smar(P Q) ==> smar(f_v) = "Id" "in V" \
&==> smar(f_v) in L(V,V)
$
#endproof

#bold[Bemerkungen:] 

#boxedlist[
  Nicht jede affine Abbildung besitzt einen Fixpunkt, z.B. hat jede Translation um $v != 0_V$ keinen Fixpunkt
][
  Die Menge der Translationen werden mit 
  $
  T(V) = {f in "GA"(V) | exists v in V: f = f_v}
  $
  zusammengefasst. Diese Menge bildet eine Untergruppe von $"GA"(V)$.
]

#corollary("4.32")[
  $
  D(V) = {f in "GA"(V) | exists lambda in K: smar(f) = lambda "Id"_V}
  $
  ist eine Verallgemeinerung von $T(V)$ und bildet wieder eine Untergruppe von $"GA"(V)$, wobei $T(V)$ eine Untergruppe von $D(V)$ ist. Die Elemente von $D(V)$ nennt man #bold[Dilationen].
]

#lemma("4.33")[
  Es sei $f in D(V) without T(V)$, d.h. $smar(f) = lambda "Id"_V$ mit $lambda != 1$. Dann existiert ein eindeutig bestimmter Punkt $Z in A(V)$ mit
  $
  f(P) = Z + lambda smar(Z P) quad forall P in A(V)
  $
]

#startproof ÜA 
#endproof

#definition("4.34", "zentrische Streckung")[
  Ist $f in D(V) without T(V)$ und besitzt $f$ den Fixpunkt $Z in A(V)$, so nennt man $f$ #bold[zentrische Streckung] mit dem #bold[Zentrum] $Z$ und dem Streckungsfaktor $lambda != 1$.
] <def>

Dafür zunächst noch:

#definition("4.35", "affin unabhängig")[
  Die $(n+1)$ Punkte $P_0, ..., P_n in A(V)$ heißen #bold[affin unabhängig], falls die $n$ Verbindungsvektoren
  $
  smar(P_0 P_1), smar(P_0 P_2), ..., smar(P_0 P_n) in V
  $
  linear unabhängig sind.
] <def>

#definition("4.36", "kollinear")[
  Drei Punkte $P, Q, R in A(V)$ heißen #bold[kollinear], falls eine affine Gerade $A(W) subset.eq A(V)$ existiert, so dass $P, Q, R in A(W)$.
] <def>

#lemma("4.37")[
  Ist $f in "GA"(V)$ und sind $P, Q, R in A(V)$ kollinear, so sind auch die Bildpunkte kollinear.
]

#startproof Nach Vorraussetzung existiert eine affine Gerade $A(W)$ mit $P, Q, R in A(W)$

$f in "GA"(V)$ $==>$ (Ü A) $f$ bildet Geraden auf Geraden ab $==>$ Bildpunkte sind kollinear
#endproof

Hilfsresultat:

#lemma("4.38")[
  Es sei $sigma: RR -> RR$ eine bijektive Abbildung, welche additiv und multiplikativ ist, d.h. es gilt
  $
  sigma(x+y) = sigma(x) + sigma(y) space "und" space sigma(x dot y) = sigma(x) dot sigma(y)
  $
  Dann ist $sigma = "Id"$.
]

#startproof Aus der Additivität folgt sofort $sigma(0) = 0$. Wegen $sigma(0) = 0$ und $sigma(1) != 0$ folgt aus der Multiplikativität $sigma(1) = 1$. Mit der Additivität erhält man $sigma(n) = n, forall n in NN$. Aus der Additivität und $sigma(0) = 0$ folgt, dass $sigma(-x) = - sigma(x)$
$
==> sigma(y) = y quad forall y in ZZ
$
Jetzt: $r in QQ, "d.h." r = p/q "mit" p, q in ZZ, q != 0$
$
p = sigma(p) = sigma(r dot q) = sigma(r) dot sigma(q) = sigma(r) dot q \
==> sigma(r) = r quad forall r in QQ
$
Wenn $sigma$ stetig wäre, wären wir fertig. Das wissen wir aber nicht. Zeige zunächst, dass $sigma$ monoton wachsend ist.

Ist $x >= 0$ $==>$ $exists y in RR: x = y^2$. Dann gilt:
$
sigma(x) = sigma(y^2) = sigma(y) dot sigma(y) >= 0
$
Ist also $a >= b$, also $a-b>=0$
$
&==> sigma(a - b) >= 0 \
&==> 0 <= sigma(a- b) = sigma(a) - sigma(b) \
&==> sigma(b) <= sigma(a)
$
Sei $x in RR$, dann kann man $x$ durch zwei monotone, rationale Zahlenfolgen ${hat(r)_n}$ von unten und ${caron(r)_n}$ von oben approximieren. Damit gilt
$
... <= hat(r)_n <= hat(r)_(n+1) <= ... <= x <= ... <= caron(r)_(n+1) <= caron(r)_n <= ...
$
Anwendung von $sigma$ liefert
$
... <= hat(r)_n <= hat(r)_(n+1) <= ... <= sigma(x) <= ... <= caron(r)_(n+1) <= caron(r)_n <= ...
$
$==>$ $abs(x - sigma(x)) <= caron(r)_n - hat(r)_n quad forall n in NN$

Für $n -> oo$ folgt $sigma(x) = x$.
#endproof

#theorem("4.39")[
  #bold[Hauptsatz der affinen Geometrie]

  Sei $K = RR$ und $A(V)$ ein affiner Raum der Dimension $n >= 2$. Ist $f: A(V) -> A(V)$ eine bijektive Abbildung, die je drei kollineare Punkte $P, Q, R in A(V)$ in drei kollineare Punkte $f(P), f(Q), f(R) in A(V)$ abbildet, so gilt $f in "GA"(V)$
]

#bold[Folgerung:] Wir hatten schon, dass bijektive affine Abbildungen geradentreu sind. Damit erhalten wir das Gesamtresultat:

#theorem("")[
  Für $K = RR$ gilt:

  Eine bijektive Abbildung $f: A(V) -> A(V)$ ist genau dann geradentreu, wenn sie affin ist.
]

Damit erhält man für $O in A(V)$
#align(center, stack(
  dir: ltr,
  figure(image("bilder2/4_39.png", width: 40%)),
  align(center, [
    #v(2.5cm)
    $==> #h(1cm) smar(f) "bij."$
    #v(2.5cm)
  ])
))

#startproof Der Beweis besteht aus 5 Schritten.

#enum[
  Sind $A, B, C in A(V)$ affin unabhängig so sind auch $f(A), f(B), f(C)$ affin unabhängig.
][
  Ist $A(W)$ eine affine Gerade in $A(V)$, so ist auch $f(A(W))$ eine affine Gerade.
][
  Sind $A(W), A(tilde(W))$ parallele Geraden in $A(V)$, so sind $f(A(W))$ und $f(A(tilde(W)))$ auch parallele Geraden in $A(V)$.
]

$==>$ ÜA

#enum(start: 4)[
  $smar(f): V -> V$ ist additiv, d.h. $smar(f)(x+y) = smar(f)(x) + smar(f)(y)$
][
  $smar(f): V -> V$ ist homogen, d.h. $smar(f)(lambda x) = lambda smar(f)(x)$
]

#startproof

zu 4) 

Seien $x, y in V$ beliebig gewählt:

Fall 1: $x, y$ sind linear abhängig 

$==> y = lambda x ==> x + y = (1+lambda) x$. Z.z: $smar(f)(x) + smar(f)(y) = (1+ lambda) smar(f)(x) quad$ siehe 5 Homogenität

Fall 2: $x, y$ sind linear unabhängig

$f$ bijektiv $==>$ es gibt eindeutig bestimmte Punkte $A, B in A(V)$, so dass für $O in A(V)$ gilt:
$
x = smar(O A) quad "und" quad y = smar(O B)
$
Wir betrachten das durch die Punkte $O, A, B$ erzeugte "Parallelogramm"

#figure(image("bilder2/4_39_2.png", width: 50%))

Wegen 2) und $A(W_1) ||| A(tilde(W)_1)$ bzw. $A(W_2) || A(tilde(W)_2)$ sind $f(A(W_1)), f(A(tilde(W)_1)), f(A(W_2))$ und $f(A(tilde(W)_2))$ wieder affine Geraden. Wegen 3) gilt $f(A(W_1)) || f(A(tilde(W)_1))$ und $f(A(W_2)) || f(A(tilde(W)_2))$. Damit erhält man:

#figure(image("bilder2/4_39_3.png", width: 50%))

Wegen $x + y = smar(O A) + smar(O B) = smar(O C)$ folgt:
$
smar(f)(x + y) = smar(f)(smar(O C)) = smar(f(O) f(C)) = smar(f(O) f(A)) + smar(f(O) f(B)) = smar(f)(x) + smar(f)(y)
$

zu 5)

Es sei $x in V$, $x != 0$. Wir betrachten die affine Gerade $N subset A(V)$ mit dem Aufpunkt $O$ und der Richtung $"Span"{x}$, d.h.
$
N = O + "Span"{x}
$
Mit 2) $==>$ $f(N) subset A(V)$ ist eine affine Gerade mit dem Aufpunkt $f(O)$ und der Richtung $"Span"{smar(f)(x)}$, d.h.
$
f(N) = f(O) + "Span"{smar(f)(x)}
$
Sei $P in N$, d.h. $P = Q + lambda x$. Dann gilt für $f(P) in f(N)$, dass
$
f(P) = f(O) + smar(f)(lambda x) = f(O) + tilde(lambda) smar(f)(x)
$
Da $f$ bijektiv ist, ist $tilde(lambda)$ eindeutig durch $lambda$ bestimmt. Dies definiert eine bijektive Abbildung $sigma: RR -> RR$. Ist $sigma$ additiv und multiplikativ so folgt mit Lemma 4.38 $lambda = tilde(lambda)$ $==>$ 5)

Noch zu zeigen: $sigma$ ist additiv und multiplikativ 

Da $dim(A(V)) >= 2$ existiert $y in V$, das von $x$ linear unabhängig ist. Für $x in V, lambda, mu in RR$ gilt:
$
lambda x + mu x = (lambda + mu ) x
$
sowie

#figure(image("bilder2/4_39_4.png", width: 50%))

Mit 2) + 3) folgt analog zu Schritt 4)

#figure(image("bilder2/4_39_5.png", width: 50%))

Als Beschreibung in Formeln erhält man:
$
&smar(f)(lambda x) + smar(f)(mu x) = smar(f)((lambda+ mu) x) \
==> &tilde(lambda) smar(f)(x) + tilde(mu) smar(f)(x) = tilde((lambda + mu)) smar(f)(x) /
==> &sigma(lambda) + sigma(mu) = sigma(lambda + mu) \
==> &sigma "ist additiv"
$
Wieder mit Hilfe von $y$ und $lambda(mu x) = (lambda mu) x$, $forall lambda, mu in RR$ kann man Parallelen konstruieren:

#figure(image("bilder2/4_39_6.png", width: 100%))

Aus dem Strahlensatz folgt
$
&tilde(lambda mu) = tilde(lambda) tilde(mu) \
==> &sigma(lambda mu) = sigma(lambda) sigma(mu) \
==> &sigma "ist mutliplikativ"
$
#endproof

#pagebreak()

= Projektive Geometrie

In Kapitel IV haben wir gezeigt:

Für zwei affine Geraden $L_1 = P_1 + W_1$ und $L_2 = P_2 + W_2$ gilt in einem zweidimensionalen affinen Raum $A(V)$, d.h. $dim(V) = 2$, $dim(W_1) = dim(W_2) = 1$:

Ist $W_1 = W_2$, so sind $L_1$ und $L_2$ parallel. Satz 4.18: $L_1 = L_2$ oder $L_1 sect L_2 = emptyset$.

Ist $W_1 != W_2$, so ist $W_1 sect W_2 = {0}$ und $"Span"{W_1, w_2} = V$. Aus der Bemerkung nach Definition 4.11 folgt dann $v_(P_1) in "Span"{W_1, W_2} = V$. Also ist $v_(P_1) = w_1 + w_2$, $w_1 in W_1, w_2 in W_2$. $==>$ $P_1 + w_1 = P_2 - w_2 in L_1 sect L_2$

Satz 4.24/Dimensionssatz für affine Räume liefert:
$
0 = dim(W_1 sect W_2) = dim(A(W_1 union W_2)) - dim(W_1) - dim(W_2) \
==> L_1 sect L_2 = P_1 + w_1
$

Insgesamt: Entweder sind zwei affine Geraden parallel oder sie genau einen Schnittpunkt.

Jetzt: Projektive Räume $==>$ zwei verschiedene Geraden besitzen immer genau einen Schnittpunkt.

Als Motivation dafür:

Betrachte die affine Ebene
$
E = {vec(x_1, x_2, x_3) in RR^3 | x_1, x_2 in RR, x_3 = 1} subset RR^3
$
sowie 
$
cal(G) &:= {G subset RR^3 | G "ist eine Gerade durch" 0 in RR^3 and G subset.not {x_1, x_2}"-Ebene"} \
&= {G subset RR^3 | G "ist 1-dimensionaler Unterraum", G subset.not {x_1, x_2}"-Ebene"}
$

#figure(image("bilder2/5_1.png", width: 40%))

Damit gibt es eine Bijektion
$
E -> cal(G), quad P arrow.bar G := "Span"{smar(0 P)}
$
Die Umkehrabbildung ist gegeben durch 
$
cal(G) -> E, quad G arrow.bar P := E sect G
$
Also kann man $E$ mit $cal(G)$ identifizieren.

Haupsatz der affinen Geometrie:

Die affine Struktur von $E$ wird im wesentlichen durch die Menge der affinen Geraden in $E$ charakterisiert.

Zusammenhang mit $cal(G)$?
$
cal(E) := {tilde(E) subset RR^3 | tilde(E) corres "Ebene durch" 0 in RR^3 and tilde(E) != (x_1, x_2)"-Ebene"}
$
Dies liefer die Bijektion
$
cal(E) -> { G subset E | G "affine Gerade" }, quad tilde(E) arrow.bar G = E sect tilde(E)
$
Bedigung $tilde(E) != (x_1, x_2)$-Ebene vernachlässigen?

$==>$ liefert projektive Ebene
$
macron(cal(E)) = {macron(E) subset RR^3 | macron(E) 2"-dimesionaler? Unterraum"}
$
beziehungsweise projektive Gerade
$
macron(cal(G)) = {G subset RR^3 | G 1"-dimensionaler? Untterraum"}
$
Die Elemente von $macron(cal(G))$ welche durch eindimensionale Unterräume der $(x_1,x_2)$-Ebene gegeben sind, nennt man unendlich feine Punkte der affinen Ebene $E$.

#definition("5.1", "Projektiver Raum")[
  Sei $V$ ein endlichdimensionaler $K$-Vektorraum. Der #bold[projektive Raum] $P(V)$ zu $V$ ist gegeben durch
  $
  P(V) := { G subset V | G = "eindimensionaler Unterraum" }
  $
  Man setzt 
  $
  dim P(V) = dim V -1
  $
  als Dimension von $P(V)$. Für $V=K^n$, $n in NN$, nutzt man auch 
  $
  P^(n-1) (K) := P(K^n)
  $
] <def>

#bold[Bemerkungen:]

#boxedlist[
  Man kann auch $P(V) = { "Span"(x) | x in V without {0}}$ definieren
][
  Im Fall $V = {0}$ gilt $P(V) = emptyset$ und $dim P(V) = -1$. Ist $dim V = 1$, so besteht $P(V)$ aus einem Punkt und $dim P(V) = 0$.
][
  Die Abbildung 
  $
  p: V without {0} -> P(V), quad v arrow.bar "Span"{v}
  $
  ist surjektiv. Denn: Jede Gerade in $V$ wird von einem $v in V, v != 0$ aufgepspannt. Es gilt für $v != 0 != w, v, w in V$:
  $
  p(v) = p(w) &<==> "Span"{v} = "Span"{w} \
  &<==> v in "Span"{w} <==> v = lambda w, lambda != 0
  $
]

#definition("5.2", "Projektiver Unterraum")[
  Sei $P(V)$ ein projektiver Raum zu dem endlichdimensionalen $K$-Vektorraum $V$. Eine Teilmenge $N subset.eq P(V)$ heißt #bold[projektiver Unterraum] von $P(V)$, falls ein Unterraum $U subset.eq V$ existiert, so dass $N = P(U)$ gilt.
] <def>

#bold[Beispiel 5.3:] Es sei $V = RR^3$ und $U subset.eq V$ ein 2-dimensionaler Unterraum, d.h. eine Ebene durch $0 in V$. Dann sind $P(U) subset.eq P(V)$ Geraden in $P^2 (RR)$.

#definition("5.4", "projektiver Punkt, Gerade, Ebene")[
  Sei $V$ ein endlichdimensionaler $K$-Vektorraum, $P(V)$ ein projektiver Raum über $V$ und $P(U)$ ein projektiver Unterraum von $P(V)$.

  #boxedlist[
    Ist $dim(P(U)) = -1$, so ist $P(U) = emptyset$
  ][
    Ist $dim(P(U)) = 1$, so heißt $P(U)$ (projektive) Gerade
  ][
    Ist $dim(P(U)) = 2$, so heißt $P(U)$ (projektive) Ebene
  ][
    Ist $dim(P(U)) = dim(V) - 1$, so heißt $P(U)$ (projektive) Hyperebene
  ]
] <def>

Beziehung zur affinen Geometrie?

Wir betrachten für $K^(n+1)$, $n in NN$, den Unterraum
$
W := {(x_0, ..., x_n) | x_0 = 0}
$
Er bestimmt eine Hyperebene $H := P(W) subset P^n (K)$ mit der Form
$
H := { "Span"{x_0, ..., x_n} in P^k | x_0 = 0 }
$
Damit erhält man eine kanonische Einbettung des affinen Raums $K^n$ in dem projektiven Raum $P^n (K)$. Für $K = RR$, $n = 2$ kann man dies so skizzieren:

//bild 

Allgemein: Man kann Punkte des $K^n$ mit den nicht in $W$ enthaltenen Geraden durch 0 in $K^(n+1)$ identifizieren.

#definition("5.5", "")[
  Es seien $P(U_1)$ und $P(U_2)$ zwei projektive Unterräume eines projektiven Raums $P(V)$. Dann wird der kleinste projektive Raum, der $P(U_1)$ und $P(U_2)$ enthält mit $P(U_1, U_2)$ bezeichnet. 
]

Ziel: Dimensionssatz

Dazu:

#lemma("5.6")[
  Es seien $P(U_1)$ und $P(U_2)$ zwei projektive Unterräume eines projektiven Raums $P(V)$. Dann gilt:
  $
  P(U_1, U_2) = P(U_1 + U_2)
  $
]

#startproof  $P(U_1, U_2)$ ist der kleinste projektive Raum, so dass 
$
P(U_1) subset P(U_1, U_2), quad P(U_2) subset P(U_1, U_2)
$
Es existiert ein Unterraum $U$: $P(U_1, U_2) = P(U)$ mit $U_1, U_2 subset U$.

Annahme: $exists u in U: u != u_1+u_2$ mit $u_1 in U_1, u_2 in U_2$
$
==>& 0 != macron(u) := underbrace(u, in U) - underbrace((u_1 + u_2), in U) in U \
==>& "Span"{macron(u)} in P(U) = P(U_1, U_2) \
$
$==> arrow.zigzag$ Dann ist $P(U_1, U_2)$ nicht der kleinste Unterraum der $P(U_1)$ und $P(U_2)$ entählt.
$
==>& forall u in U: u = u_1 + u_2 ==> U = U_1 + U_2 \
==>& P(U) = P(U_1 + U_2) 
$
#endproof

#lemma("5.7")[
  Es seien $P(U_1)$ und $P(U_2)$ zwei projektive Unterräume eines projektiven Raums $P(V)$. Dann gilt:
  $
  P(U_1) sect P(U_2) = P(U_1 sect U_2)
  $
]

#startproof
$
"Span"{x} in P(U_1) sect P(U_2) <==> x in U_1 without {0} and x in U_2 without {0} \
<==> x in (U_1 sect U_2) without {0} <=> "Span"{x} in P(U_1 sect U_2)
$
#endproof

#theorem("5.8")[
  #bold[Dimensionssatz]

  Seien $P(U_1)$ und $P(U_2)$ zwei projektive Unterräume eines projektiven Raumes $P(V)$. Dann gilt 
  $
  dim(P(U_1, U_2)) = dim(P(U_1)) + dim(P(U_2)) - dim(P(U_1) sect P(U_2))
  $
]

#startproof
$
dim(P(U_1, U_2)) =^"5.6"& dim(P(U_1 + U_2)) \
=& dim(U_1 + U_2) - 1 \
=& dim(U_1) + dim(U_2) - dim(U_1 sect U_2) -1 \
=& dim(U_1) -1 + dim(U_2) - 1 -(dim(U_1 sect U_2) -1) \
=& dim(P(U_1)) + dim(P(U_2)) - dim(P(U_1 sect U_2))
$
#endproof

Damit folgt unmittelbar das Resultat für die Geraden.

#corollary("5.9")[
  Sei $V$ ein $K$-Vektorraum und $P(V)$ ein projektiver Raum über $V$ mit $dim(P(V)) = n >= 0$. Sind $P(U_1)$ und $P(U_2)$ zwei projektive Unterräume von $P(V)$ mit $dim(P(U_1)) + dim(P(U_2)) >= n$, so gilt $P(U_1) sect P(U_2) != emptyset$.
]

#startproof
$
dim(P(U_1)) + dim(P(U_2)) >= n, quad dim(P(U_1, U_2)) <= n
$
Mit dem Dimensionssatz folgt
$
dim(P(U_1) sect P(U_2)) = underbrace(dim(P(U_1)) + dim(P(U_2)), >= n) - underbrace(dim(P(U_1, U_2)), <= n) >= 0
$
$==> P(U_1) sect P(U_2) != emptyset$
#endproof

#bold[Folgerung:] Ist $P(V)$ ein zweidimensionaler projektiver Raum, so besitzen je zwei projektive Geradden in $P(V)$ einen Schnittpunkt.

Sind $P(V)$ und $P(W)$ zwei projektive Räume zu den $K$-Vektoräumen $V$ und $W$ sowie $p_V : V without {0} -> P(V)$ und $p_W : W without {0} -> P(W)$ die entsprechenden Projektionsabbildungen.
$
f: P(V) -> P(W) space ?
$
Ist $smar(f) in L(V, W)$, so könnte man durch die Zuordnung
$
"Span"{ast} -> "Span"{smar(f)(x)}
$
eine Abbildung definieren. Problem $x in ker(f)$?

Dies motiviert:

#definition("5.10", "Projektive Abbildungen")[
  Seien $P(V)$ und $P(W)$ zwei projektive Räume zu den $K$-Vektorräumen $V$ und $W$. Eine Abbildung $f: P(V) -> P(W)$ heißt #bold[projektive Abbildung], falls eine injektive lineare Abbildung $smar(f): V -> W$ existiert, so dass für alle $"Span"{x} in P(V)$ die Gleichung
  $
  f("Span"{x}) = "Span"{smar(f)(x)}
  $
  gilt. Die Abhängigkeit der projektiven Abbildung $f$ von $smar(f)$ wird mit $f = P(smar(f))$ bezeichnet.
] <def>

#theorem("5.11")[
  #bold[Hauptsatz der affinen Geometrie]

  Seien $P(V)$ und $P(W)$ projektive Räume zu den $RR$-Vektorräumen $V$ und $W$ mit $dim(P(V)) = dim(P(W)) >= 2$. Dann gilt: Bildet die projektive Abbildung $f: P(V) -> P(W)$ je drei Elemente $P, Q, R in P(V)$, die in einer projektiven Geraden liegen in drei Elemente $f(P), f(Q), f(R) in P(W)$ ab, die wieder in einer projektiven Geraden liegen, so ist $f$ bijektiv.
]
#startproof Siehe Fischer, Analytische Geometrie, Satz 33.9
#endproof

#pagebreak()

= Tensorprodukt

Sei $K$ Körper, $V, W, U$ VR über $K$
$
B(V, W; U) = {beta: V times W -> U | beta "bilinear"}
$
d.h. für alle $v in V$ ist $beta(v, dot) in L(W, U)$ und für alle $w in W$ ist $beta(dot, w) in L(V, U)$.

#bold[Beispiel 6.1:] $K$ Körper, $V := W := K[x]$, $U := K[x_1, x_2]$, $beta in B(K[x], K[x]; K[x_1, x_2])$
$
beta(p q)(x_1, x_2) := p(x_1) q(x_2) \
p(x) = x^2, q(x) = (x+1) ==> beta(p, q)(x_1, x_2) = x_1^2 (x_2 + 1)
$
Dies zeigt, dass die Multiplikation von zwei Vektoren zummindest im Fall von Polynomen ein natürlicher Vorgang ist. 

#bold[Bemerkung:] $K$ Körper, $V, W, U$ seien $K$-VR. $I$ und $J$ Indexmengen, sodass $(v_i)_(i in I)$ eine Basis von $V$ und $(w_j)_(j in J)$ eine Basis von $W$. Sei weiter $(u_(i j))_(i in I)^(j in J)$ eine beliebige Familie in $U$. Dann existiert ein $beta in B(U, W; U)$ eindeutig mit 
$
beta(v_i, w_j) = u_(i j) quad i in I, j in J
$
Bemerkenswert ist, dass $beta$ nicht auf der Basis $(v_i, 0)_(i in I), (0, w_j)_(j in J)$ von $V times W$ festgelegt wurde. Stattdessen wurde $beta$ auf $(v_i, w_j)_(i in I)^(j in J)$ fixiert, was im Allgemeinen weder erzeugend noch linear unabhängig ist. Für $v in V, w in W$ mit 
$
v = sum_(i in I) lambda_i v_i, quad w = sum_(j in J) mu_j w_j
$
wobei nur endlich viele Summanden verschieden von 0 sind, ist
$

beta(v, w) = limits(sum_(i in I))_(j in J) lambda_i mu_j u_(i j) = limits(sum_(i in I))_(j in J) lambda_i mu_j beta(v_i, w_j)
$

#theorem("6.2")[
  Sei $K$ Körper, $V$ und $W$ $K$-VR. Dann gibt es ein bis auf Isomorphie eindeutig bestimmter $K$-VR $T$ und eine Abbildung $tau in B(V, W, T)$ mit der #bold[universellen Eigenschaft]:

  Für beliebige $K$-VR $U$ und $beta in B(V, W; U)$ gibt es eindeutiges $b in L(T, U)$, sodass 
  $
  beta = b circ tau
  $
]
#figure(image("bilder2/6_1.png", width: 40%))

#startproof 

Existenz: Seien $(v_i)_(i in I)$ und $(w_j)_(j in J)$ Basen von $V$ bzw. $W$. Dann ist
$
T := {t in "Abb"(I times J, K) | t(i, j) != 0 "für nur endlich viele" (i, j) in I times J}
$
ein Untervektorraum von $"Abb"(I times J, K)$. Sei für $i in I$ und $j in J$ die Abbildung $t_(i j) in T$ gegeben durch
$
t_(i j) := delta_(i k) delta_(j l) quad "für" (k, l) in I times J
$

Dann sind die $(t_(i j))_(i in I)^(j in J)$ ein Erzeugendensystem von $T$, denn für $t in T$ gilt
$
t = limits(sum_(i in I))_(j in J) t(i, j) t_(i j)
$
Für $(alpha_(i j))_(i in I)^(j in J)$ mit $0 = sum_(i, j) alpha_(i j) t_(i j)$ folgt sofort $alpha_(i j) = 0$ für alle $(i, j) in I times J$. Also ist $(t_(i j))_(i in I)^(j in J)$ eine Basis von $T$. Wir definieren $tau in B(V, W, T)$ durch
$
tau(v_i, w_j) = t_(i j)
$
Sei $U$ ein beliebiger $K$-VR und $beta in B(V, W; U)$, dann kann $b in L(T, U)$ eindeutig durch
$
b(t_(i j)) := beta(v_i, w_j)
$
definiert werden. Dann gilt per Konstruktion $beta = b circ tau$.

Eindeutigkeit: Erfülle $T'$ zusammen mit $tau'$ auch die universelle Eigenschaft 

#figure(image("bilder2/6_2.png", width: 110%))

Wendet man die universelle Eigenschaft von $T$ auf $U = T$, $beta = tau$ an, so folgt die Existenz einer eindeutigen Abbildung $b in L(T, T)$ mit $tau = b circ tau$. Dies ist sicher durch $b = "id"_T$ erfüllt. Analog folgt, dass $"id"_(T'')$ die einzige Abbildung in $L(T', T')$ mit $tau' = "id"_T' circ tau'$. Wendet man nun die universelle Eigenschaft von $T$ auf $U = T', beta = tau'$ an, so sichert diese die eindeutige Existenz von $g' in L(T, T')$ mit $tau' = g' circ tau$. Analog $exists! g in L(T', T)$ mit $tau = g circ tau'$. Es folgt $tau' = g' circ g circ tau'$, also $g' circ g = "id"_(T')$. Analog folgt $g circ g' = id_T$. Also sind $g, g'$ invers und $T op(tilde(=)) T'$.
#endproof

#bold[Bemerkung 6.3:]

#boxedenum[
  Im Folgenden werden wir keinen Bezug zur konkreten Konstruktion von $T$ nehmen, sondern lediglich die universelle Eigenschaft verwenden. Daher ist es nicht nötig zwischen $T$ und $T'$ zu unterscheiden. Dies wird durch die Notation $V otimes W := T$ ausgedrückt.
]

#let enum_6_2 = enum(start: 2)[
  Für die zu $T$ gehörenden Abbildung $tau$ verwenden wir $otimes := tau$ zusammen mit der Infixnotation:
  $
  V otimes W = otimes(V, W) = tau(V, W)
  $
  Damit kann Satz 6.2 durch das kommutative Diagramm 
  #figure(image("bilder2/6_3.png", width: 40%))
  ergänzt werden.
][
  Die Abbildung die einem $beta in B(V, W, U)$ eindeutig ein $b in L(V otimes W, U)$ zuordnet erfüllt für $beta, beta' in B(V, W; U), lambda in K$ gilt
  $
  (beta + lambda beta')(v, w) &= beta(v, w) + lambda beta'(v, w) \
  &= b(v otimes w) + lambda b'(v otimes w) \
  &= (b + lambda b')(v otimes w)
  $
  Daher ist $beta arrow.bar b$ linear.
  $
  B(V, W; U) isomorph L(V otimes W; U)
  $
][
  Gilt $dim(V), dim(W) < oo$, so ist $dim(V otimes W) = dim(V) dim(W)$.
][
  Da für $oo > dim(V), dim(W) > 2$ gilt, dass 
  $
  dim(V times W) = dim(V) + dim(W) < dim(V) dim(W) = dim(V otimes W)
  $
  ist $otimes: V times W -> V otimes W$ im Allgemeinen nicht surjektiv.
][
  Die Elemente von $V otimes W$ nennen wir Tensoren. Die Tensoren im Bild von $otimes$ heißten #bold[einfach].
]

#box(
  width: 100%,
  inset: (
    right: 0.5cm,
    left: 0.5cm,
  ),
  enum_6_2
)


#bold[Bemerkung:] Für $v, v' in V$, $w, w' in W, lambda in K$ gilt aufgrund der Bilinearität von $otimes$, dass 

#boxedenum[
  $v otimes w + v' otimes w = (v + v') otimes w$
][
  $v otimes w + v otimes w' = v otimes (w + w')$
][
  $(lambda v) otimes w = v otimes (lambda w) = lambda (v otimes w)$
]

#corollary("6.4")[
  Seien $V, W$ Vektorräume über einen Körper mit Basen $(v_i)_(i in I)$ bzw. $(w_j)_(j in J)$, dann ist $(v_i otimes w_j)_(i in I)^(j in J)$ eine Basis von $V otimes W$.
]

#startproof Wäre die $(v_i otimes w_j)_(i in I)^(j in J)$ linear abhängig, dann gäbe es $(k, l) in (I times J)$ und $(lambda_(i j))_((i, j) in (I times J) without {(k, l)})$ mit 
$
v_k otimes w_l = sum_((i, j) in (I times J) without {(k, l)}) lambda_(i j) v_i otimes w_j
$
Sei $beta in B(V, W, K)$ mit $beta(v_i, w_i) := delta_(i k) delta_(j l)$, dann existiert ein eindeutiges $b in L(V otimes W, K)$ mit $beta = b circ otimes$.
$
1 = beta(v_k, w_j) = b(v_k otimes w_l) = sum_((i, j)) lambda_(i j) underbrace(b(v_I otimes w_j), beta(v_i, w_j)) = 0 quad arrow.zigzag
$
Also sind die $(v_i otimes w_l)_(i in I)^(j in J)$ linear unabhängig.

$T := "Span"{ v otimes w  in V otimes W | v in V, w in W }, otimes': V times W -> T, otimes' := otimes, i: T -> V otimes W$. Nach u.E. gibt es ein $f(V otimes W; T)$ mit 
$
otimes' = f circ otimes wide i circ otimes' = otimes
$
Betrachte
$
i circ f circ otimes = i circ otimes' = otimes
$
$==> i circ f = "id"_(V otimes W), i$ besitzt Rechtsinverse und surjektiv. Für $theta in V otimes W$ finden wir $t in T$
$
theta = i(t) = i(limits(sum_(i in I))_(j in J) lambda_(i j) underbrace(v_i otimes w_j, in T)) = limits(sum_(i in I))_(j in J) lambda_(i j) i(v_i otimes w_j) = limits(sum_(i in I))_(j in J) lambda_(i j) v_i otimes w_j
$
#endproof

#bold[Beispiel 6.5:] $K$ Körper. Für $K[x]$ sei die Basis $(x^i)_(i in NN union {0})$ gewählt. Dann ist nach Korollar 6.4 $(x^i otimes x^j)_(i,j in NN union {0})$ eine Basis von $K[x] otimes K[x]$. Sei $b in L(K[x] otimes K[x], K[x_1, x_2])$ gegeben durch 
$
b(x^i otimes x^j) := x_1^i x_2^j
$
Dann ist $b$ die zu $beta$ aus Bsp. 6.1 gehörige linear Abbildung. Da $b$ Isomorph folgt
$
K[x] otimes K[x] isomorph K[x_1, x_2]
$

#bold[Beispiel 6.6:] Gegben sei ein $RR$-VR $W$. Dann kann die Komplexifizieren von $W$ durch $CC otimes W$ konstruiert werden. (Dabei ist $CC$ als zweidimensionaler VR über $RR$ aufgefasst.) Sei $(w_j)_(j in J)$ eine Basis von $W$. Sei ${1, i}$ eine Basis von $CC$ über $RR$. Dann ist $(1 otimes w_j)_(j in J), (i otimes w_j)_(j in J)$ eine Basis von $CC otimes W$. D.h. für $hat(w) in CC otimes WW$ existiert $(alpha_j)_(j in J)$ als Familie in $RR$ und $(beta_j)_(j in J)$ als Familie in $RR$ mit 
$
hat(w) = sum_(j in J) alpha_j (1 otimes w_j) + sum_(j in J) beta_j (i otimes w_j)
$
wobei die Summen wieder nur endlich viele von 0 verschiedenen Summanden aufweisen.
$
= sum_(j in J) (alpha_j + i beta_j) otimes w_j
$
Dann definieren wir für $mu in CC$
$
mu hat(w)_j := sum_(j in J) (mu_j) (alpha_j + i beta_j) otimes w_j
$
die übliche Multiplikation über $CC$.

#corollary("6.7")[
  Sei $K$ Körper, $V$ ein $K$-VR. Dann gilt $V isomorph V otimes K$.
]

#corollary("6.8")[
  Seien $V, W, U$ VR über einem Körper $K$, dann gilt 
  $
  (V otimes W) otimes U isomorph V otimes (W otimes U)
  $
]

#theorem("6.9")[
  Sei $K$ ein Körper, $V, W$ seien $K$-VR mit $dim(V), dim(W) < oo$, dann gilt:

  #boxedenum[
    $L(V, K) isomorph V^* otimes K$
  ][
    $L(V, W) isomorph V^* otimes W$
  ][
    $B(V, W; K) isomorph (V otimes W)^* isomorph V^* otimes W^* isomorph V^* otimes W^* otimes K$
  ]

  Wobei der Isomorphismus in 2. gegeben ist durch
  $
  V^* otimes W #scale(x: -100%, $in$) phi otimes W arrow.bar phi(dot) w in L(V,W), quad phi in V^*, w in W
  $
  und der Isomorphismus für $(v otimes w)^* isomorph V^* otimes W^*$ gegeben ist durch
  $
  (phi otimes psi)(v otimes w) := underbrace(phi(v), in K) underbrace(psi(w), in K) in K, \
  phi in V^*, psi in W^*, v in V, w in W
  $
]

#startproof

1. Es gilt $V^* otimes K isomorph V^* := L(V, K)$ nach Korollar 6.7.

2. Sei $beta: V^* times W -> L(V, W)$ für $phi in V^*, w in W$ definiert durch 
$
beta(phi, w) := phi(dot) w
$
Dann gilt $beta in B(V^*, W; L(V, W))$, also existiert $b in L(V^* otimes W; L(V, W))$ mit $beta = b circ otimes$.

Sei nun $m := dim(V), (v_1, ..., v_n)$ Basis von $V$ und $n := dim(W), (w_1, ..., w_n)$ Basis von $W$ und $(v_1^*, ..., v_m^*)$ die zu $(v_1, ..., v_m)$ duale Basis von $V^*$. Dann ist $(v_i^* otimes w_j)_(i in {1, ..., m})^(j in {1, ..., n})$ eine Basis von $V^* otimes W$. Auf $L(V, W)$ ist 
$
F_(i j) in L(V, W) "definiert durch" F_(i j) (v_k) = delta_(i k) w_j quad i,k in {1, ..., m}, j in {1, ..., n}
$
eine Basis.
$
b(v_i^* otimes w_j)(v_k) &= beta(v_i^*, w_j)(v_k) \
&= v_i^*(v_k) w_j \
&= delta_(i k) w_j \
&= F_(i j)(v_k)
$
Also $b(v_i^* otimes w_j) = F_(i j)$ und damit ist $b$ eine Isomorphismus.

3. Es gilt 
$
B(V, W, K) &isomorph L(V otimes W, K) \
&= (V otimes W)^* "(Bemerkung nach Satz 6.2)"
$
$
V^* otimes W^* isomorph V^* otimes W^* otimes K "nach Korollar 6.7"
$
Sei für $phi in V^*, psi in W^*, beta_(phi, psi) in B(V, W; K)$ definiert durch
$
beta_(phi, psi) (v, w) = phi(v) psi(w)
$
Dazu gibt es jeweils $b_(phi, psi) in L(V otimes W, K) = (V otimes W)^*$. Die so gegebene Abbildung $V^* times W^* -> (V otimes W)^*$
$
beta(phi, psi) := b_(phi, psi)
$
ist bilinear. Also existiert $b in L(V^* otimes W^*, (V otimes W)^*)$ mit $beta = b circ otimes$. Sei nun $phi in V^*, psi in W^*, v in V, w in W$
$
b(phi otimes psi)(v otimes w) = beta(phi, psi)(v otimes w) = b_(phi, psi) (v otimes w) = beta_(phi, psi) (v, w) = phi(v) psi(w)
$
Also zusätzlich zu den Basen in 2. sei $(w_1^*, ..., w_n^*)$ die zu $(w_1, ..., w_n)$ duale Basis von $W^*$. Dann ist $(v_i^* otimes w_j^*)_(i in {1, ..., m})^(j in {1, ..., n})$ eine Basis von $V^* otimes W^*$ und $(v_i otimes w_j)^*_(#stack(dir: ttb, spacing: 0.25em, [$i in {1,...,m}$],[$j in {1,...,j}$]))$ eine Basis von $(v otimes w)^*$
$
b(v_i^* otimes w_j^*)(v_k otimes w_l) = v_i^*(v_k) w_j^*(w_l) = delta_(i k) delta_(j l) = (v_i otimes w_j)^* (v_k otimes w_l) \
==> b(v_i^* otimes w_j^*) = (v_i otimes w_j)^*
$
also $b$ Isomorphismus.
#endproof

#pagebreak()

= Nichtlineare Algebra

Die #bold[lineare] Algebra $corres$ "Wissenschaft der linearen Gleichungssysteme"

D.h. Problemstellungen, die auf Aussagen zu
$
f(x_1, ..., x_n) = a_1 x_1 + a_2 x_2 + a_n x_n - b = 0 quad (ast)
$
über einem Körper $K$.

Mögliche Erweiterungen: Polynome, dasnn wäre $(ast)$ ein Polynom ersten Gerades über $K$.

#bold[Bisher:]

Kurven und Flächen erster Ordnung, d.h. solche, die durch lineare Gleichungen in den Unbekannten beschrieben werden.

#boxedlist[
  Geraden, Ebenen, Hyperebenen  
][
  Interpretierbar als vorgegebenes Skalarprodukt mit einem Vektor
][
  Geometrisch: Intepretation als Schnittmenge verschiedener Objekte
]

== Quadriken

Jetzt: Kurven $corres$ Flächen zweiter Ordnung

linear Gleichungen $arrow.wave$ quadratische Gleichungen:

#boxedlist[
  In jedem Summanden treten Variablen insgesamt hächstens zweimal als Faktor auf, z.B.
  $
  x_1^2 + 2 x_1 x_2 + 5 = 0
  $
][
  Geometrische Interpretation:

  Schnittmengen von Kreis-Kreis, Kreis-Ebene, Zylinder-Ebene

  Hier: Quadriken als Gleichungen mit zwei Unbekannten in $RR^2$
  
  $arrow.wave$ klassische Kegelschnitte, Hyperbel, Ellipse, Parabel
]

Verallgemeinerung von quadratischen Funktionen
$
f: RR -> RR, quad x arrow.bar a x^2
$
für $K$ als Körper?

#definition("7.1", "Quadratische Form")[
  Sei $K$ ein Körper und $A in K^(n,n)$ symmetrisch. Die Abbildung 
  $
  Q_A: K^n -> K, quad x arrow.bar x^T A x
  $
  nennt man die zu $A$ gehörenden #bold[quadratische Form].
] 

#bold[Bemerkungen:]

#boxedlist[
  Eine zu $A$ gehörende quadratische Form lässt sich auch für nicht symmetrische Matrizen, d.h. $A != A^T$, definieren. Man kann zeigen, dass sich jede qudratische Form auch mit Hilfe einer symmetrischen Matrix $B$ darstellen lässt.
][
  Besonders interessant: quadratische Formen für $RR^(2,2)$.
]

#definition("7.2", "allgemeine quadratische Funktion")[
  Eine quadratische Funktion über $K$ ist für $A in K^(n,n)$, $b in K^N$ und $c in K$ definiert als 
  $
  f: K^n -> K, quad x arrow.bar x^T A x + b^T x + c
  $
]

#bold[Bemerkung:] Eine quadratische Gleichung erhält man dann durch
$
f(x) = 0 quad <==> quad x^T A x + b^T x + c = 0
$

#bold[Beispiel 7.3:] Für $K^n = RR^3$ mit symmetrischen $A in RR^(3,3)$ und $b in RR^3$ ergibt sich
$
vec(x_1, x_2, x_3) arrow.bar \ 
a_(1 1) x_1^2 + a_(2 2) x_2^2 + a_(3 3) x_3^2 + 2 a_(1 2) x_1 x_2 + 2 a_(2 3) x_2 x_3 + 2 a_(1 3) x_1 x_3 + b_1 x_2 + b_2 x_2 + b_3 x_3 + c = 0
$
Die Lösungsmengen solcher allgemeinen quadratischen Gleichungen bezeichnet man als #bold[Quadrik].
