#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Analyse de données expérimentales: Incertitudes]

On devra être capable de déterminer l'incertitude à partir des données expérimentales.

= Analyse statistique d'une mesure expérimentale - Incertitude de Type A ou B

Si tout le monde dans la classe fait une mesure avec le même dispositif, on observera très probablement une variance (on pourra construire un histogramme des valeurs obtenues).

*On ne peut pas trouver _LA_ vraie valeur.*

== Définitions

#def[Mesure]: Ensemble des opérations permettant de définir la (ou les) valeur(s) d'une grandeur physique $X$ qu'on appelle *mesurande*. Une mesure parfaite n'existe pas (on observera toujours une fluctuation entre chaque mesure).

On définit l'écart de mesure $E_R$ par la différence entre la valeur mesurée $x$ et la valeur vraie $X_"vrai"$.

$ E_R = x - X_"vrai" $

On doit être capable d'estimer l'intervalle autour de notre mesure dans laquelle $X_"vrai"$ a le plus de chance de tomber.

L'idée d'incertitude, c'est se demander si, si quelqu'un refait une mesure dans les même conditions et avec les même outils, est-ce que sa mesure tombera dans notre intervalle de confiance.

== Variabilités

On caractérise deux types de variabilité:
- #def[Variabilité systématique]: Un écart de mesure toujours dans le même sens sur plusieurs mesures. La faute est souvent sur le manipulateur qui a mal réglé le 0. On ne peut pas la traiter.
- #def[Variabilité aléatoire]: Variabilité causée par la nature du système ou des instruments utilisés. On peut la traiter statistiquement.

#figure(caption: [Pas de variabilité systématique, haute variabilité aléatoire], canvas({
  import draw: *

  let points = (
    ((0, 0.1), (0.4, 0.3), (-0.2, -0.5), (0.8, -0.1), (-0.8, 0.4)),
  )

  for ps in points {
    circle((0, 0), radius: 0.2)
    circle((0, 0), radius: 0.4)
    circle((0, 0), radius: 0.6)
    circle((0, 0), radius: 0.8)
    
    for p in ps {
      point(p)
    }
  }
}))

== Notion d'incertitude

Il faut être capable de déterminer si on est dans le cas d'une incertitude de type A ou de type B.

Grossièrement: si on fait plusieurs fois la même mesure, on est dans le type A, et si on en fait qu'une seule, on est dans le type B.

== Evaluation des incertitudes de type A

Pour les incertitude de type A: on peut combattre l'incertitude en faisant la moyenne de nos mesures (étude statistique très basique).

On peut calculer l'écart-type de nos mesures, et on essaye d'estimer la loi de probabilité de nos mesures.

```py
# Importation des bibliothèques utiles
import numpy as np # pour la manipulation des tableaux
import matplotlib.pyplot as plt # pour les représentations graphiques
# Saisie des données expérimentales
x = np.array([...]] #valeurs de x
# Tracé de l’histogramme
plt.figure()
plt.hist(x, bins=’rice’) # la commande ’rice’ permet d’optimiser les intervalles de l’histogramme
plt.title("Histogramme des valeurs de x")
plt.show()
```

Généralement, on va donner un résultat avec l'incertitude correspondante: $x plus.minus u(x)$, avec:
$ u(x) = sqrt(1/N) sigma(x) $

== Evaluation des incertitudes de type B

Les incertitudes de mesures proviennent des incertitudes des instruments de mesure (exemple: règle, thermomètre, baromètre) qui ne sont pas parfaitement précis.

Il faut être capable d'estimer la précision de la mesure faite.

Exemple: la plupart des pHmètres affichent 2 chiffres après la virgule, mais presque aucun constructeur ne garantit les chiffre après le premier.

Si on se base sur le choix d'une graduation comme écart maximal autorisé, on peut écrire le résultat avec comme incertitude:
$ u(x) = "graduation"/sqrt(12) $

ou en prenant une demi-graduation:
$ u(x) = "demi-graduation"/sqrt(3) $

Exemple: Méthode d'autocollimation:
- On peut faire plein de mesures (et faire la moyenne): type A
- On fait une seule mesure, et on se réfère aux graduations pour l'incertitude

Exemple: Méthode de Bessel:
- On doit estimer l'incertitude sur $D$, ainsi que l'incertitude de $d$.
- On propage l'incertitude à travers les calculs.

= Détermination d'une grandeur à partir de mesures expérimentales - Incertitudes composées

(Voir poly.)

La majorité du temps, on utilisera une simulation de Monte Carlo:
