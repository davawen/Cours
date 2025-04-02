#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#let und = math.underline

#titleb[Introduction à L'ALI - Amplificateur Linéaire Integré]

= Amplificateur Linéaire Intégré 

== Présentation pratique

#note[
	On alimentera les ALI avec les boîtiers
	d'alimentation $15 "V"$.
]

On considérera un ALI comme une boîte noire à huit pattes:
#figcan({
	import draw: *

	rect((0, 0), (2, 1))
	for i in range(1, 5) {
		content((i/2 - 0.25, 1.5), [#i])
	}
	for i in range(5, 9) {
		content((i/2 - 2.25, -0.4), [#i])
	}
})

Description des bornes:
+ Réglage offset (normalement nul)
+ $v_-$ (Entrée inverseuse)
+ $v_+$ (Entrée non-inverseuse)
+ $V_"cc"^-$ (Alimentation)
+ Réglage offset (normalement nul)
+ $s$ (Sortie)
+ $V_"cc"^+$ (Alimentation)
+ Inutile

L'utilisation du composant en lui même se fait par
les bornes $2, 3, "et" 6$.

== Notations

On appelle *courants de polarisation* les courants $i_-$ et $i_+$
se déplaçant à travers les entrées.

On notera un signe $oo$ en-dessous du triangle si on considère
l'ALI idéal.

#figcan({
	import draw: *

	rect((2, 2), (4, 4))
	content((2.5, 2.5), $+$)
	content((2.5, 3.5), $-$)
	content((3.5, 3.5), $triangle.r$)

	fil((4, 3), (6, 3), i: $i_s$)

	fil((-0.5, 2.5), (2, 2.5), i: $i_+$)
	fil((-1.5, 3.5), (2, 3.5), i: $i_-$)

	tension((2, 2.5), (2, 3.5), (-0.5, 0), tenselr($epsilon$))

	fil((-1, 1), (6, 1))
	masse((3, 1))

	tension((1, 1), (1, 2.5), (-1, 0), tenselr($v_+$), size: 1.5)
	tension((1, 1), (1, 3.5), (-2, 0), tenselr($v_-$), size: 2.5)
})

= Étude statique de l'ALI

== Caractéristique statique

On trace la caractéristique de la sortie en fonction de la différence
de tension $epsilon$ de l'entrée.

Si la tension d'entrée est trop grande, le dipôle sature
(il limite la tension de sortie) à la tension $V_"sat"$.

Entre ces deux points de saturation, le composant suit une
sortie linéaire.
On nomme $mu_0$ la pente de cette droite, et 
$epsilon_"min"$ et $epsilon_"max"$ les limites de cette zone
linéaire.

#note[En théorie,
	$epsilon_"min" = - epsilon_"max"$,
	mais les imperfections du composants peuvent faire
	que la sortie du composant n'est pas symmétrique.
]

#figcan({
	import draw: *

	arrow((-4, 0), (4, 0))
	arrow((0, -2), (0, 2))
	content((3.5, 0.3), $epsilon$)

	set-style(stroke: blue)
	line((-3, -1.5), (-0.5, -1.5), (0.5, 1.5), (3, 1.5))

	content((-1, -2), $-V_"sat"$)
	content((1, 2), $V_"sat"$)

	set-style(stroke: (dash: "dashed", paint: red))
	line((-0.5, -2), (-0.5, 2))
	line((0.5, -2), (0.5, 2))

	content((1, 0.3), $epsilon_"max"$)
	content((-1, 0.3), $epsilon_"min"$)
})

== Régime saturé ou saturation

La majorité du temps, le composant donnera une tension de sortie de
$V_"sat"$ ou $-V_"sat"$.

== Régime linéaire

Le composant ne fonctionne en régime linéaire que quand la tension
d'entrée est dans la zone $[epsilon_"min", epsilon_"max"]$.

Dans un ALI parfait, on supposera que la pente $mu_0 -> +oo$ et
qu'on se situe dans le régime linéaire uniquement quand $epsilon = 0$.

"Un peu" comme pour les filtres
(qui sont en réalité des quadriprôles),
on va modeliser les ALI par des circuits équivalents
pour l'entrée et pour la sortie.

== Étude du circuit d'entrée en régime linéaire

On modélise l'entrée de l'ALI par une impédance équivalente:

#figcan({
	import draw: *

	carre((0, 0),
		apply(node, name: "+"),
		(i: $i_+$),
		apply(node, name: " "),
		retour(apply(node, name: "-"), (i: $i_-$, rev: true), apply(node, name: " ")),
		branch(apply(resistor, label: $underline(Z_d)$))
	)

	rect((1, -3), (5, 0))
	content((4, -1.5), [ALI])
})

Et on a donc $und(epsilon) = und(Z_d) und(i_e)$

Dans un ALI idéal, l'impédance équivalente d'entrée tend vers l'infini.

En pratique, elle est de l'ordre de $100 "k" Omega " à " 10 "G" Omega$

== Étude du circuit de sortie en régime linéaire

On modélise la sortie de L'ALI par un modèle de Thévenin:

#figcan({
	import draw: *

	carre((0, 0),
		branch(apply(source-ideale, u: tenserl($mu_0 epsilon "  "$))),
		apply(resistor, label: $p$),
		(i: $i_s$),
		apply(node, name: " "),
		apply(node, name: " "),
		branch(apply(dots), u: tenserl($s$))
	)

	rect((-5, -3), (1.5, 0.5))
	content((-4, 0), [ALI])
})

Avec:
$ und(s) = mu_0 und(epsilon) - p und(i_s) $

== Modèle idéal de l'amplificateur linéaire intégré

Dans un modèle idéal,
- le coefficient d'amplification $mu_0$ tend vers $+oo$
- l'impédance équivalente en entrée tend vers $+ oo$ (donc $i_e = i_s = 0$)
- l'impédance de sortie est nulle: source idéale de tension

On note un ALI idéal avec un petit symbole $+oo$ en dessous du triangle.

=== Conséquences du modèle idéal sur la caractéristique

La caractéristique forme une fonction d'heaviside et
$epsilon_"min" = epsilon_"max" = 0$

#figcan({
	import draw: *

	arrow((-4, 0), (4, 0))
	arrow((0, -2), (0, 2))
	content((3.5, 0.3), $epsilon$)

	set-style(stroke: blue)
	line((-3, -1.5), (0, -1.5), (0, 1.5), (3, 1.5))

	content((-1, -2), $-V_"sat"$)
	content((1, 2), $V_"sat"$)
})

=== Conséquences du modèle idéal sur le régime linéaire

$und(s) = mu_0 und(epsilon) "et" mu_0 -> +oo "donc" epsilon = 0$

=== Remarques importantes: deux hypothèses indépedantes

Les deux hypothèses suivantes sont complètement indépendantes
et changent le comportement du circuit de manières différentes:
- L'ALI est idéal
- L'ALI fonctionne en régime linéaire

== Quelques écarts au modèle idéal

=== Saturation en tension

Sin on passe un signal en entrée qui dépasse les
valeurs de saturation de l'ALI, on observera la saturation
en sortie:

#plot((-10, 10), color: auto,
	(x => calc.sin(x)),
	(x => calc.clamp(calc.sin(x), -0.6, 0.6))
)

=== Comportement en fréquence et modèle dynamique

En dynamique, on va regarder l'impact de la fréquence
sur le signal de sortie de L'ALI.

Quand on regarde le comportement en gain et en phase de l'ALI,
(emprique) il se comporte comme un filtre passe bas du premier ordre.

On pose alors:
$ und(s) = und(mu) (omega) times (und(v_+) - und(v_-)) $
$ und(mu)(omega) = (mu_0)/(1 + (j omega)/omega_c) $

Avec $mu_0 approx 10^5$ et $omega_c approx 100 "rad"$ en pratique.

#figure(caption: [Diagramme de bode de l'amplificateur linéaire integré], image("bode.png", width: 50%))

=== Vitesse de balayage ou slew rate

Le composant met un certain temps à réagir.
On appelle ce retard la #def[vitesse de balayage] ou
le #def[slew rate] du composant.

=== Courants de polarisation


Les courants de polarisation ne sont pas toujours 
complètement nuls

#figure(caption: [???], image("???.png", width: 70%))

Ducoup, les courants de polarisation ne sont pas toujours rigoureusement nuls, il faut en tenir compte.

=== Grandeurs caractéristique de l'ALI

#align(center, table(
	columns: 3,
	[Caractéristique], [TL081], [741],
	[Gain en boucle ouverte], $mu_0 = 2 times 10^5$, $mu_0 = 2 times 10^5$,
	[Produit gain - Bande passante], $3 "MHz"$, $1.5 "MHz"$,
	[Impédance d'entrée], $Z_d = 1 "G"Omega$, $Z_d = 1 "M"Omega$,
	[Tension de décalage], $V_"off" < 15 "mV"$, $V_"off" < 7.5 "mV"$,
	[Slew rate (retard)], 
))

= Quelques montages en régime linéaire

== Montage suiveur

#figcan({
	import draw: *

	rect((2, 2), (4, 4))
	content((2.5, 2.5), $+$)
	content((2.5, 3.5), $-$)
	content((3.5, 3.5), $triangle.r$)

	fil((4, 3), (6, 3))

	resistor((6, 1), name: "r", rot: -90deg)

	fil((6, 3), "r.l")
	fil("r.r", (0, 0), rev: 1)

	source-ideale((0, 1), rot: 90deg, name: "s")

	resistor((1, 2.5), name: "t")

	fil((0, 0), "s.l")
	fil("s.r", "t.l", rev: 1)
	fil("t.r", (2, 2.5))

	// fil((0, 2.5), (2, 2.5), i: $i_0$)
	fil((5, 3), (2, 5), rev: 1)
	fil((2, 5), (1, 3.5))
	fil((1, 3.5), (2, 3.5), i: $i_-$)
})

On boucle sur le $-$, et l'impédance s'adapte en tension.

$
mu = und(s)/und(e) = mu_0/(1 + (j omega/omega_0)) \
s + 1/omega_0 (dif s)/(dif t) = mu_0 (v_+ - v_-) \
v_- = s \
v_+ = e \
s + 1/omega_0 (dif s)/(dif t) = mu_0 (e - s) \
1/(omega_0) (dif s)/(dif t) + (1 + mu_0) s = mu_0 e \
s_H (t) = e^(-t/tau) \
tau = 1/((1 + mu_0) omega_0) \
s_P (t) = (h_0)/(1 + mu_0) e approx e \
s = s_H + s_P
$

Si on essaye de boucler sur le $+$ à la place:

$ v_- = e $
$ v_+ = s $
$ 

1/(omega_0) (dif s)/(dif t) + s = mu_0 (s - e) \
underbrace(1/omega_0, > 0) (dif s)/(dif t) + underbrace((1 - mu_0), < 0) s = - mu_0 e
$

Donc:
$ s(t) = S e + t/tau  $
$ tau = 1/((mu_0 - 1) omega_0) $

On pourrait s'attendre à ce que $s -> +oo$,
mais en réalité on sature,
donc $s -> V_"sat"$

Donc la boucle $+$ est complètement inutile.

== Montage non inverseur

#figure(image("non_inverseur.png", width: 40%))

On se place en régime linéaire avec un amplificateur idéal,
donc $epsilon = 0$

$ epsilon = v_+ - v_- $
$ v_+ = e \
v_- = (R_1 s)/(R_1 + R_2) - underbrace((R_1 R_2 i_0)/(R_1 + R_2), = 0 "car idéal")
$

$ e - (R_1 s)/(R_1 + R_2) <=> s/e = 1 + R_2/R_1 $

On par d'amplificateur, car $1 + R_2/R_1 > 1 $ \
Et on parle de non inverseur, car $s "et" e$ sont de même signe.

== Amplificateur inverseur

#figure(image("amplificateur_inverseur.png", width: 50%)) 

On se place en régime linéaire avec un amplificateur idéal, donc $epsilon = 0$ 

On voit que $v_+ = 0$

On applique le théorème de Millman:
$ v_- = (e/R_1 + s/R_2)/(1/R_1 + 1/R_2) = (R_2 e + R_1 s)/(R_1 R_2) $

On pose $i$ la tension sortant de la résistance $R_2$

$ i = (s - v_-)/(R_2) = (v_- - e)/(R_1) $
$ v_- (1/R_1 + 1/R_2) = s/R_2 + e/R_1 $
$ v_- = (R_1 s + R_2 e)/(R_1 + R_2) $
$ epsilon = 0 => v_+ = v_- $ 
$ (R_1 s + R_2 e)/(R_1 + R_2) = 0 $
$ s/e = -R_2/R_1 $

== Montages intégrateurs et pseudo-intégrateur

=== Montage intégrateur théorique et amplificateur linéaire intégré idéal

#figure(image("mitalii.png", width: 40%))

$ epsilon = 0 $

$ v_+ = 0 $

Par millman sur les impédances:
$ v_- = ((s/R) + j C omega s)/(1/R + j C omega)  \
= (e + j R C omega s)/(1 + j R C omega) \
s/e = - 1/(j R C omega)
$

Donc:
$ e = - R C (dif s)/(dif t) <=> s = - 1/(R C) integral e(t) dif t $

=== Influence des courants de polarisation

Les courants de polarisation (qui ne sont pas nuls en pratique)
vont s'accumuler en chargeant le condensateur, ce qui
va ajouter un terme linéaire au signal de sortie.

#let step(x) = (if x < 0 { -1 } else { 1 })
#let trig(x) = (calc.rem(x, calc.pi)/calc.pi)

Par exemple, si on filtre un créneau:
#plot((-4, 4), color: auto,
	(x => step(calc.sin(x))),
	(x => trig(x)),
	(x => x/4)
)

=== Montage pseudo-intégrateur

Pour éviter "l'accumulation" de ce courant polarisateur,
on ajoute une résistance en parallèle du condensateur:

#figure(image("pseudointeg.png", width: 50%))

Par millman:
$ v_+ = 0 $
$ v_- = (e/R + s/(und(Z_P)))/(1/R + 1/und(Z_P)) =
(und(Z_P) und(E) + R_2 + und(Z_P) + R) $


$ und(Z_P) = (r 1/(j C omega))/(r + 1/(j C omega)) = (r)/(1 + j r C omega) $

$ epsilon = 0 => und(v_+) = und(v_-) $
$ und(Z_P) und(e) + R und(s) = 0  $
$ und(s)/und(e) = - und(Z_P)/R $
$ und(H) = und(s)/und(e) = (- r)/(R (1 + j r C omega)) $

Donc la fonction de transfert n'est pas intégratice 
(car division par $1 + j C omega$ plutot que $j omega$)

Mais on observera un comportement intégrateur si $1 << r C omega$
et on aura alors:
$ und(H) approx -1/(j R C omega) $

== Montage dérivateur

#figure(image("derivat.png", width: 50%))

$ v_+ = 0 $

Par Millman:
$ und(v_-) = (und(e)/und(Z_C) + und(s)/R)/(1/und(Z_C) + 1/R) 
= (R und(e) + und(Z_C) und(s))/(R + und(Z_C))
$

On suppose un ALI idéal en régime linéaire $ epsilon = v_+ - v_- = 0 $

$ und(s)/und(e) = - R/und(Z_C) = - j R C omega $
$ s = - R C (dif e)/(dif t) $


#note[Comme on ne va pas "garder des choses en mémoire"
    dans un circuit dérivateur, on n'aura pas le problème
	d'accumulation des courants polarisateur qu'on a eu dans le
	circuit intégrateur.
]

#tip[
	Pour pouvoir affirmer qu'on étudie un ALI en régime linéaire,
	on peut utiliser deux éléments:
	- Si le montage boucle sur le $-$ de l'ALI, le système est linéaire
	- Si on parle de filtrage dans l'énoncé, on admet implicitement
	  (ou explicitement) fonctionner en régime linéaire
]

= Stabilite d'un système

== Définition

Un système avec ALI est considéré stable si la sortie tend vers 
0 en $+oo$ (si la sortie ne tend pas vers $0$,
elle finira toujours par saturer).

== Cas des systèmes du premier ordre

On définit un système du premier ordre par son équation différentielle:
$ a (dif s)/(dif t) + b s = 0 $

(ou en régime permanent, $a j omega und(s) + b und(s) = 0$)

La solution est de la forme:
$ s(t) = S e^(-b/a t)$

Le système est stable si $a$ et $b$ sont de même signes.

== Cas des systèmes du deuxième ordre

De même, on définit un système du premier ordre par son équation différentielle:
$ a (dif^2 s)/(dif t^2) + b (dif s)/(dif t) + c s = 0 $

(ou en régime permanent, $- a omega^2 und(s) + b j omega und(s) + c und(s) = 0$)

#todo[Étude à faire, voir poly]

On arrive à la condition que $a$, $b$ et $c$ doivent être de même signe
pour que le système soit stable.

== Stabilité d'un montage quelconque à amplificateur opérationel

Il faut boucler sur le moins pour que le montage soit stable

= Quelques montages en régime saturé

== Comparateur simple

#figure(image("compat.png", width: 30%))

Il n'y a pas de boucle sur le moins, donc on peut supposer
que le montage n'est pas stable, et qu'il finirat
donc par saturer.

On doit donc traiter deux cas:
- Si on tend vers $+ V_"sat"$, alors $s -> + V_"sat"$,
  c'est le cas si $epsilon > 0$, or
  $epsilon = v_+ - v_- = e - U > 0$, donc $e > U$
 
  On tendra donc vers $+ V_"sat"$ si $U > 0$
- Si on tend vers $- V_"sat"$, c'est la même chose:
  $s -> - V_"sat"$,
  $epsilon < 0$, or
  $epsilon = v_+ - v_- = e - U < 0$, donc $e < U$
 
  On tendra donc vers $+ V_"sat"$ si $U > 0$

On comprend le nom de comparateur.
Problème avec ce montage: on ne peut pas mesure des tensions 
plus grandes que $V_"sat"$, et le bruit peut faire osciller
le résultat du comparateur

== Comparateur à hystérésis ou trigger de Schmidt

#figure(image("compatschmidt.png", width: 40%))

On ramène la tension de sortie sur la borne d'entrée
non-inverseuse.
Comme on boucle sur le plus, on verra un régime saturé.

- Si $s = +V_"sat"$, alors $epsilon = v_+ - v_- > 0$,
  Or on considère qu'il n'y a pas de courant
  taversant la branche $+$, donc on peut appliquer un pont
  diviseur de tension:
  $ v_+ = (R_1 s)/(R_1 + R_2) = (R_1 V_"sat")/(R_1 + R_2) $
  $ v_- = e $
  Donc:
  $ e < (R_1 V_"sat")/(R_1 + R_2) $
- Si $s = - V_"sat"$, alors $epsilon = v_+ - v_- < 0$,
  De même, par pont diviseur de tension:
  $ v_+ = (R_1 s)/(R_1 + R_2) = - (R_1 V_"sat")/(R_1 + R_2) $
  $ v_- = e $
  Donc il faut que:
  $ e > -(R_1 V_"sat")/(R_1 + R_2) $

On a donc deux tensions qui permettent de basculer d'un état vers l'autre:
#plot((-4, 4), 
	(horz: (1,), min: -4, max: 1),
	(vert: (1,), min: -1, max: 1),
	(stroke: red),
	(vert: (-1,), min: -1, max: 1),
	(horz: (-1,), min: -1, max: 4)
	// (horz: (-4), min: -4, max: 2)
)

Si $e$ est plus grande ou plus petite que les deux tensions de déclenchement, on est certain qu'on est dans l'état $+V_"sat"$ ou
$-V_"sat"$. Par contre, si on est dans la zone intermédiaire,
l'état de la sortie dépend de l'état précédent du système.

Ce système possède donc une certaine résistance au bruit.

Par contre, il inverse le signal d'entrée
(une grande tension positive donne $-V_"sat"$ et une grande tension
négative donne $+V_"sat"$).

En mettant une sinusoïde en entrée, on obtient un créneau.


== Comparateur à hystérésis non inverseur

#figure(image("compatnoninv.png", width: 40%))

Dans ce montage, on utilise le $-$
comme zéro, et on met la tension d'entrée dans la borne $+$
(qui est la borne bouclée).

Cela permet de ne pas inverser le signal d'entrée:

#figure(image("basculenoninv.png", width: 40%))

Par contre, les tensions de bascules sont
$ plus.minus R_1/R_2 V_"sat"$, donc si les valeurs
de résistance sont mal choisies, la tension de bascule
est potentiellement inatteignable (l'ALI sera coincé sur $+V_"sat"$
ou $-V_"sat"$ selon son état initial).
