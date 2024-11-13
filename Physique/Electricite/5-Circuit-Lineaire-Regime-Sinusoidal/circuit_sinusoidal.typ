#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[Circuit linéaire en régime sinusoïdal forcé]

= Caractéristique d'un signal sinusoïdal

== Définition

On définit un signal sinusoïdal $x$ par:
$ x(t) = X sin(omega t + phi) "ou" x(t) = X cos(omega t + phi) $
On peut très facilement passer du sinus au cosinus.

On a $3$ caractéristiques du signal sinusoïdal.

== Pulsation, fréquence, période

On peut qualifier la "vitesse" du signal par trois valeures:
- $omega$, la pulsation
- $f$, la fréquence
- $T$, la période

Avec:
$ omega = 2 pi f = (2pi)/T $
$ f = 1/T $

=== Mesure

#let plotnot = plot.with(x-tick: none, y-tick: none)

On peut mesurer la période $T$ d'un signal en regardant un graphique:
#plotnot((0, 5*calc.pi), y: (-2, 2), x => calc.sin(x))

On peut utiliser un analiseur de spectre (une transformation de Fourrier...) pour obtenir la fréquence ou les fréquences qui compose le signal:

Exemple:

#figcan({
	import draw: *
	arrow((0, 0), (0, 4))
	arrow((0, 0), (4, 0))

	content((2, 5), [Avec $x(t) = X_1 cos(omega_1 t) + x_2 cos(omega_2 t) + X_3 cos(omega_3 t)$])

	content((1, -0.3), $f_1$)
	content((1, 1.3), $X_1$)
	line((1, 0), (1, 1))
	content((2, -0.3), $f_2$)
	content((2, 3.3), $X_2$)
	line((2, 0), (2, 3))
	content((3, -0.3), $f_3$)
	line((3, 0), (3, 2))
	content((3, 2.3), $X_3$)
})
