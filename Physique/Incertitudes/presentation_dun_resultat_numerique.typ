= Présentation d'un résultat numérique

Il faut TOUJOURS une unité (à moins d'avoir un résultat sans unité).
La base.

Poser les chiffres significatifs.
- $1$ kg -> 1 chiffres significatif
- $1.0$ kg -> 2 chiffres significatifs
- $23$ kg -> 2 chiffres significatifs

Les chiffres significatifs *doivent* être cohérents avec les incertitudes:
- $15 plus.minus 1$ cm: OK
- $15.0 plus.minus 1$ cm: Faux, le $.0$ implique une précision de $plus.minus 0.1$, donc problème de cohérence.
- $15.450 <=> 15.45 plus.minus 0.001$

Si la valeur obtenue est dans une borne d'incertitude, on arrondi:
- On trouve la valeur $15.5$, mais on sait que notre précision est de 1 cm, on arrondi: 
$16 plus.minus 1$ cm

Donc: connaître la précision des instruments

#box(stroke: blue, inset: 10pt, [
  #text(fill: blue, [$Phi$ Note:])
=== Méthode pratique
1. Vérifier la vraisemblance des résultats obtenus
2. Arrondir le résultat au bon nombre de chiffres significatifs
3. Choisir la notation (scientifique ou ingénieur)
4. Préciser l'unité
])

== Règle d'or pour les résultats

=== Systématiquement un calcul littéral

On pose la formule, puis on remplace les valeures dedans.

#figure(box(stroke: black, inset: 10pt,
$ arrow(f) = 1 / (4 pi epsilon_0) (q_1 q_2) / (M_1 M_2^3) arrow(M_1 M_2) $
))
