#import "utils.typ": *
#import "template.typ": uni-script-template
#show: doc => uni-script-template(
  title: [Vorlesungsskript],
  module-name: [LinA I\* WiSe 23/24],
  doc
)

= Motivation und mathematische Grundlagen

Was ist linearge Algebra bzw. analytische Geometrie?

- analytische Geometrie:
  Beschreibung von geometrischen Fragen mit Hilfe von Gleichungen, Geraden, Ebenen sowie die Lösungen von Gleichungen als geometrische Form
- lineare Algebra:
  die Wissenschaft der linearen Gleichungssysteme bzw der Vektorräume und der linearen Abbildungen zwischen ihnen

Wozu braucht man das?

- mathematische Grundlage für viele mathematische Forschung z.B. in der algebraischen Geometrie, Numerik, Optimierung 
- viele Anwendungen z.B. Page-Rank-Algorithmus, lineare Regression
- oder Optimierung:
  linear: Beschreibung zulässiger Punkte als Lösung von (Un)-Gleichungen
  nichtlinear: notwendige Optimalitätsbedingungen

== Mengen

#bolditalic[Definition 1.1: Mengen]

#box(width: 100%, height: 2in, fill: gray)
