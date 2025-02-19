#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[Effets du filtrage sur un signal]

#warn[
	Le filtrage est entièrement dépendant
	de la linéarité des circuits utilisés.

	(Revoir Chapitre 5 - Circuits linéaires en régime continu)
]

= Décomposition harmonique

On a deux manières de représenter un signal:
- La représentation temporelle, où le signal est posé comme une fonction $s$ donnant une amplitude en fonction du temps
- La représentation spectrale, où le signal est représenté par une somme
  de sinusoïdes. On représente chaque fréquence par une barre dont la
  hauteur donne l'amplitude de la sinusoïde de cette fréquence.

== Quelques observations

=== Spectre d'une sinusoïde

#figure(table(
	columns: 2,
	align: (center, center),
	[Représentation temporelle], [Représentation spectrale],
	plot((0, 5*calc.pi), x-tick: none, y-tick: none, x => calc.sin(x)),
	plot((0, 2), y: (0, 1), x-tick: none, y-tick: none,
		x-ticks: ((1, $omega$),),
		(vert: (1,)),
	)
))

=== Somme de deux sinusoïdes

#figure(table(
	columns: 2,
	align: (center, center),
	[Représentation temporelle], [Représentation spectrale],
	plot((0, 5*calc.pi), x-tick: none, y-tick: none,
		x => calc.sin(x) + 0.5*calc.sin(0.5*x)
	),
	plot((0, 2), y: (0, 1), x-tick: none, y-tick: none,
		x-ticks: ((1, $omega_1$), (0.5, $omega_2$)),
		(vert: (1,)),
		(vert: (0.5,), max: 0.5),
	)
))

=== Somme de sinusoïdes et signaux périodiques

Si on fait la somme des signaux de la forme:
$ s_n (t) = 1/n sin(n t ) $

#let plot_sin(n) = plot(
	(0, 5*calc.pi), y: (-2, 2), x-tick: none, y-tick: none,
		x => (1/n) * calc.sin(n*x)
	)

#let plot_sum(n) = plot(
	(0, 5*calc.pi), y: (-2, 2), x-tick: none, y-tick: none,
		x => range(1, n+1).map(n => (1/n) * calc.sin(n*x)).sum()
	)

#align(center, table(
	columns: 3,
	[n], [Sinusoïde], [Somme des sinusoïdes],
	$1$, plot_sin(1), plot_sum(1),
	$2$, plot_sin(2), plot_sum(2),
	$3$, plot_sin(3), plot_sum(3),
	$4$, plot_sin(4), plot_sum(4),
))

#show link: it => underline(it)

Voir la #link("https://www.desmos.com/calculator/5d8drooit2")[version interactive].

== Fonction périodique et série de Fourrier

#parachute[
Si $f(t)$ est une fonction "plutôt régulière" de période $T$,
on pourra toujours la décomposer
en une somme infinie de sinusoïdes:

$ f(t) =
a_0/2 + sum_(n=1)^(+oo) (a_n cos(n omega t) + b_n sin(n omega t))
"avec" omega = (2pi)/T
$

En définissant les coefficients par
$ 
a_n = 2/T integral_(t_0)^(t_0 + T) f(t) cos(n omega t) dif t \
b_n = 2/T integral_(t_0)^(t_0 + T) f(t) sin(n omega t) dif t
$

On appelle cette décomposition la décomposition en série de Fourrier
du signal.
]

== Exemples de décomposition en série de Fourrier

=== Signal créneau

=== Signal triangulaire

== Analyse harmonique

On utilise la décomposition en série de Fourrier
pour analyser le signal.

On distingue notemment:

=== La composante continue

Le coefficient $a_0/2$, c'est la  valeur moyenne du signal au cours du temps.

=== La fondamentale et les harmoniques

On appelle la fréquence de la sinusoïde pour $n = 1$ la
"fréquence fondamentale" du signal.
C'est elle qui lui donne sa forme globale
(et elle a la très grande majorité du temps la plus grande amplitude).

Les harmoniques sont les composantes pour $n > 1$

=== Analyse harmonique ou analyse spectrale

#def[Analyse harmonique]:
détermination des fréquences présentes et des amplitudes
correspondantes, autrement dit, détermination de la décomposition en 
série de Fourrier.

= Analyse harmonique et circuits linéaires

== Importance de l'analyse harmonique pour les circuits linéaires

Comme on ne s'intéresse qu'a des circuits linéaires
(autrement dit, des circuits tels que $H(s_1 + s_2) = H(s_1) + H(s_2)$),
pour *n'importe quel signal*, on peut:
+ Le décomposer en série de Fourrier
+ Déterminer la réponse du filtre pour chaque sinusoïdale
+ Refaire la somme des signaux en sortie  

Et ainsi obtenir la réponse du filtre pour ce signal.

== Lien avec les fonctions de transfert et diagramme de Bode

== Utilisation du diagramme de Bode

=== Analyse de l'amplitude

On regarde premièrement au diagramme de Bode en gain.
Les harmoniques (les multiples de la fréquences fondamentale du signal)
qui ne sont pas dans la bande passante du filtre sont coupés.

=== Cas de la composante continue

La composante continue correspond à un signal de fréquence nulle.
Il ne faut pas l'oublier!

=== Analyse de déphasage

= Principe du filtrage


