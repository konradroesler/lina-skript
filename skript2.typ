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
Hier: $phi'(x) = f(phi)$ ist eine gewöhnlihce Differentialgleichung.

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

#bold[Lemma 1.6:] Es sei $f in L(V,V)$ ein Endomorphismus. Eigenvektoren zu paarweise verschiedenen Eigenwerten von $f$ sind linear unabhängig.

#italic[Beweis:] Es seien $v_1, ..., v_m$ Eigenvektoren zu den paarweise verschiedenen Eigenwerten $lambda_1, ..., lambda_m$ von $f$. Beweis durch Induktion:

Induktionsanfang: $m = 1$, $lambda_1, v_1 != 0$ $==> v_1$ lin. unabh.

Induktionsschritt: $m-1 -> m$

Induktionsvorraussetzung: Beh. gelte für $m-1$

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

#bold[Lemma 1.8:] Sei $V$ ein $K$-Vektorraum mit $dim(V) = n < oo$ und $f in L(V,V)$. Sind $lambda_1, ..., lambda_m, m <= n$, paarweise verschiedene Eigenwerte von $f$, so gilt 
$
"Eig"(f, lambda_i) sect limits(sum_(j = 1)^m)_(j != i) "Eig"(f, lambda_j) = {0} wide forall i = 1, ..., m
$

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

#bold[Korollar 1.9:] Für ein $n in NN$ und einem Körper $K$ sei $A in K^(n,n)$. Dann gilt für jedes $lambda in K$, dass 
$
dim("Eig"(A, lambda)) = n - rg(A - lambda I_n)
$
Insbesondere ist $lambda in K$ ein Eigenwert von $A$, wenn $rg(A - lambda I_n) < n$ ist.

#definition("1.10", "Geometrische Vielfachheit")[
  Ist $f in L(V,V)$ und $lambda in K$ ein Eigenwert von $f$, so heißt  $#sspace$
  $
  g(f, lambda) := dim("Eig"(f, lambda)) wide (> 0)
  $
  die geometrische Vielfachheit des Eigenwerts $lambda$.
] <def>

== Das charakteristische Polynom

Wir bestimmt man Eigenwerte?

#bold[Lemma 1.11:] Seien $A in K^(n,n)$ und $lambda in K$. Dann ist
$
det(A - lambda I_n)
$
ein Polynom $n$-ten Grades in $lambda$.

#italic[Beweis:] Mit der Leibnitz-Formel folgt,
$
det(underbrace(A - lambda I_n, tilde(a)_(i j))) = sum_(sigma in S_1) sgn(sigma) dot tilde(a)_(1 sigma(1)) dot ... dot tilde(a)_(n sigma(n)) \
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
  p_A (lambda) := det(A - lambda I_n)
  $
  das charakteristische Polynom zu $A$.
] <def>

#bold[Lemma 1.13:] Sei $A in K^(n,n)$ und $lambda in K$. Der Skalar $lambda$ ist genau dann Eigenwert von $A$, wenn
$
p_A (lambda) = 0
$
gilt.

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
p_A (lambda) = mat(3-lambda,8,16;0,7-lambda,8;0,-4,-5-lambda) \
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

Damit ist z.B.: $w_1 = (2, 1, -1)^top$ Eigenvektoren.

$lambda = 3$:
$
(A-3I_3) v = 0 <==> \
mat(0,8,16;0,4,8;0,-4,-8) vec(v_1, v_2, v_3) = 0 in RR^3 <==> v_2 + 2v_3 = 0
$
Damit sind z.B.: $w_2 = (1,2,-1)^top, w_3 = (-1,2,-1)$ Eigenvektoren.

