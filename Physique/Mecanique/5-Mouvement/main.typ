#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Mouvement des particules chargées dans des champs
	électriques et magnétiques uniformes et stationnaires
]

= Force de Lorenz

La force de Lorenz est la force qui s'exerce
sur une particule chargée en présence d'un champ électrique
ou magnétique.

== Définition

On définit la force de Lorenz $arw(f)$ par:
$ arw(f) = F_"elec" + F_"mag" =  q (arw(E) + arw(v) and arw(B))  \
F_"elec" = q arw(E) "et" F_"mag" = q arw(v) and arw(B)
$

Avec $q$ la charge (en $"eV"$) qui peut être positive ou négative,
$arw(v)$ la vitesse de la particule,
$arw(E)$ le champ électrique et $arw(B)$ le champ magnétique.

#note[On verra la définition et la création des champs magnétiques
l'année prochaine. Cette année, ils seront donnés dans les exercices.]

On remarque que les particules stationnaires ne sont pas affectées
par le champ magnétique.

== Ordre de grandeur

Les particules étudiées sont en genéral des particules possédant
une charge élémentaire (protons ou neutrons), donc
$ abs(q) = e $

On se place dans un environnement relativiste
(donc vitesses bien plus faible que la vitesse de la lumière),
au max $v <= c/10$

En prenant un champ magnétique relativement fort de $B = 0.1 "T"$,
on trouve un ordre de grandeur de la force magnétique de:
$ F_"mag" approx e v B = 5 times 10^(-13) " N" $

Si on suppose que $F_"elec"$ est du même ordre de grandeur que $F_"mag"$, \
on aurait alors $E approx v B approx 3.10^6 " V m"^(-1)$,
qui est un énorme champ électrique qui ne sera pas vu en général.

La majorité du temps, la force électrique sera donc négligeable
devant la force magnétique.

La force de gravitation est de l'ordre de
$m g = 9.1 times 10^(-31) times 10 approx 10^(-29) "N"$ et est complètement négligeable.

= Mouvement dans un champ électrique

La majorité du temps, les champs électriques donnés seront uniformes.
Dans le cas contraire, on aura l'expression du champ et il faudra faire avec.

== Équation du mouvement

On étudie le système $q$ de masse $m$ dans le référentiel terrestre
supposé Galiléen.
Bilan des forces:
- Poids, que l'on néglige
- Force électrique: $arw(f) = q arw(E)$

On applique le principe fondamental de la dynamique:
$ m arw(a) = q arw(E) <=> arw(a) = q/m arw(E) $

Si $arw(E)$ est uniforme, l'accélération sera constante.

== Étude de la trajectoire

On considère une particule de vitesse initiale dans le plan $x,y$:

#figcan({
	import draw: *
	arrow((0, 0, 0), (2, 0, 0), tip: $x$)
	arrow((0, 0, 0), (0, 2, 0), tip: $y$)
	arrow((0, 0, 0), (0, 0, 2), tip: $z$)

	point((0, 0, 0), value: $q$)
	arrow((1, 2, 0), (3, 2, 0), stroke: red, pad: 1, tip: $arw(E) = E arw(u_x)$)

	arrow((0, 0, 0), (1, 0.5, 0), tip: $v_0$, pad: 0.3)
	arrow((0, 0, 0), (1.5, 0, 0), stroke: blue)
})

$ 
cases(
	diaer(x) = q/m E "constante",
	diaer(y) = 0,
	diaer(z) = 0
) \
<=> cases(
	dot(x) = q/m E t + v_0 cos alpha,
	dot(y) = v_0 sin alpha,
	dot(z) = 0
) \
<=> cases(
	x = (q E)/(2 m) t^2 + v_0 cos alpha,
	y = v_0 t sin alpha,
	z = 0
) \

"Si" alpha eq.triple 0 [pi], "on obtient une trajectoire rectiligne" \
"Sinon", "la trajectoire est courbée:"
$

#figcan({
	import draw: *
	arrow((-4, 0), (4, 0), tip: $x$)
	arrow((0, -3), (0, 3), tip: $y$)

	bezier-through((-4, 2), (1, 0.7), (-4, -1), stroke: (dash: "dashed"))
	bezier-through((4, 1), (-1, -0.85), (4, -2), name: "b")

	content((-3, 2.3), $q < 0$)
	content((3, -2.3), $q > 0$)

	point("b.20%")
	arrow("b.20%", ("b.20%", 1, "b.19%"), stroke: red, tip: $v_0 \ ""$, pad: 0.1)
	arrow("b.20%", (rel: (2, 0)), stroke: blue, tip: $arw(f)$)
})

== Accélération d'une particule chargée par un champ électrique

On va étudier l'accélération subie par une particule dans un champ,
c'est à dire qu'on s'intéresse à la variation du module de la vitesse.
On utilise donc un raisonnement énergétique.

On sait que la force électrique est une force conservative
(par parachutage du résultat de deuxième année).

#let grad = math.op("grad")

On a donc:
$ arw(F) = - grad(E_p) "avec" E_p = underbrace(q V, "potentiel électrique") + "constante" $

On n'a que des forces conservatives, donc par
théorème de l'énergie mécanique:
$ E_m = E_c + E_p = "constante" $

$ Delta E_c = - Delta E_p = - Delta (q V + "constante")
= - q Delta V
$

#note[
$Delta V$, c'est la différence de potentiel, autrement dit la tension $u$.
]

$ Delta E_c = - q u $

Si le champ éléctrique n'est pas nul, $Delta E_c$ sera forcément non-nul,
donc la particule sera soit accélérée, soit chargée.

Autrement dit, si la particule entre dans le champ magnétique en
$x_1$ avec une vitesse $v_1$ et ressort en $x_2$, alors elle
ressortira avec une vitesse $v_2$ soit plus grande soit plus petite que $v_1$.

#grid(
	columns: (1fr, 1fr),
	align: (left, center),
	[
	On a $arw(E) = - grad V$,
	$ E = -(dif V)/(dif x) $
	Donc $V = - E x + "constant"$, \
	$ u = V_1 - V-2 = - E (x_1 - x_2) $
	],
	canvas({
		import draw: *
		arrow((0, 0), (4, 0), tip: $x$)

		line((1, -1.5), (1, 1.5), stroke: (dash: "dashed"))
		line((3, -1.5), (3, 1.5), stroke: (dash: "dashed"))

		content((1, 2), $x_1$)
		content((3, 2), $x_2$)
		arrow((3, -0.8), (1, -0.8))
		content((2, -1), $u$)

		point((1, 0.5))
		arrow((1, 0.5), (1.5, 0.5), tip: $v_1$, pad: 0.3)

		point((3, 0.5))
		arrow((3, 0.5), (4, 0.5), tip: $v_2$, pad: 0.3)

}))

Si on fait l'hypothèse que la vitesse initiale est nulle
$(v(t = 0) = 0)$, on pose $v_f$ la vitesse finale, alors on a:
$ 1/2 m (v_f)^2 = - q U $
$ v_f = sqrt((-2 q u)/m) "si" q "et" u "sont de signe différent, on prend l'opposé sinon" $

== Déviation d'une particule chargée par un champ électrique

On fait l'hypothèse d'une vitesse initiale $v_0$ perpendiculaire
au champ électrique, limité à la distance $L$. On se place dans le plan $x, y$:

#grid(
	columns: (1fr, 1fr),
	align: (left, center),
	[
	On pose les équation horaires:
	$ cases(diaer(x) = (q E)/m, diaer(y) = 0) \
	<=> cases(dot(x) = (q E)/m t, dot(y) = v_0) \
	<=> cases(x = (q E)/(2 m) t^2, y = v_0 t)
	$
],
	canvas({
		import draw: *

		arrow((-1, 0), (4, 0), tip: $x$)
		arrow((0, -1), (0, 3), tip: $y$)

		point((0, 0), value: $q$)

		arrow((0, 0), (1.5, 0), stroke: blue, tip: $arw(E) \ "" \ ""$)
		arrow((0, 0), (0, 1), stroke: red, tip: $arw(v_0) "    "$, pad: 0)

		line((0, 2), (4, 2), stroke: (dash: "dotted"))
		content((-0.4, 2), $L$)

		catmull((0, 0), (0.6, 1), (2.5, 2), name: "c")
		point("c.99%")
		arrow("c.99%", ("c.99%", 1.5, "c.100%"), tip: $arw(v_1)$, stroke: red)
}))

On pose $theta$ la déviation entre $arw(v_0)$ la vitesse
initiale et $arw(v_1)$ la vitesse finale.

$ tan theta = diaer(x_1)/dot(y_1) $

On pose $t_1$ le temps de sortie:
$ tan theta = (q E t_1)/(m v_0) $

$y_1$ est l'ordonnée de la fin du champ, donc:
$
y_1 = L = v_0 t_1 => t_1 = L/v_0
$

Donc #resultb[$ tan theta = (q E L)/(m v_0^2) $]

== Application pratique: oscilloscope analogique

#figure(image("oscillo.png", width: 70%))

= Mouvement dans un champ magnétique

On étudie le système $q$ de masse $m$,
on se place dans le RefTerGal, on fait un bilan des forces:
- Le poids qui est négligeable
- La force de Lorenz $arw(f) = q arw(v) and arw(B)$

== Travail de la force magnétique - Mouvement uniforme

On calcule le travail élémentaire:
$ delta W &= arw(f) dot dif arw(O M)  \
&= (q arw(v) and arw(B)) dot arw(v) dif t $

Or le produit vectoriel de $arw(v)$ et $arw(B)$ est
par définition perpendiculaire à $arw(v)$.

Donc $delta W = 0$, le travail est nul.

On applique le théorème de l'énergie cinétique:
$ Delta E_c = W (arw(f)) = 0 => E_c "constante" $
Donc le module de la vitesse restera constant.
#resultb[
	Une particule chargée dans un champ magnétique exhibe
	donc un mouvement uniforme.
]

#note[
	Si l'on veut accélérer une particule chargée, il faudra donc 
	nécesseraiment la mettre dans un champ $arw(E)$...
]

#pagebreak()

== Étude de la trajectoire circulaire perpendiculairement au champ magnétique

On considère une particule se déplaçant dans le plan perpendiculaire
à $arw(B)$.

#figcan({
	import draw: *

	arrow((0, 0, 0), (2, 0, 0), tip: $x$)
	arrow((0, 0, 0), (0, 2, 0), tip: $y$)
	arrow((0, 0, 0), (0, 0, 2), tip: $z$)

	arrow((1.5, 1, 0), (1.5, 2, 0), tip: $arw(B) = B arw(u_y)$, stroke: red)

	on-xz({
		grid((0, 0), (4, 6), step: 0.5, stroke: black.transparentize(90%))

		circle((2, 4), radius: 1, stroke: (paint: blue, dash: "dashed"), name: "a")
		circle((2, 2), radius: 1, stroke: (paint: green, dash: "dashed"), name: "b")

		mark("a.90%", "a.91%", symbol: ">", stroke: blue, fill: blue, scale: 2, anchor: "center")
		mark("b.60%", "b.58%", symbol: ">", stroke: green, fill: green, scale: 2, anchor: "center")
	})

	arrow((2, 0, 3), (2, 0, 4), tip: $arw(f)$, stroke: blue)
	arrow((2, 0, 3), (2, 0, 2), tip: $arw(f)$, stroke: green)

	content((4, 0, 1.5), $q > 0$)
	content((4, 0, 4.5), $q < 0$)

	point((2, 0, 3), value: $q$)
	arrow((2, 0, 3), (3, 0, 3), tip: $arw(v)$, stroke: purple)
})

On applique le principe fondamental de la dynamique:
$ m arw(a) = q arw(v) and arw(B) $
Comme le module de la vitesse va rester constant,
on aura $(dif v)/(dif t) = 0$. \
Ainsi, exprimer $arw(a)$ dans la base de Frenet:
$ arw(a) = (dif v)/(dif t) arw(u_t) + v^2/R arw(u_n) $
Nous permet de dire que:
$ arw(a) = v^2/R arw(u_n) $

On sait que $arw(v) = v arw(u_t)$

En revenant, sur le PFD, on a:
$ m v^2/R arw(u_n) = q arw(v) and arw(B) $

Par hypothèse, $arw(B) perp arw(u_t)$, et comme $arw(u_n)$ résulte
d'un produit vectoriel avec $arw(B)$, on a $arw(B) perp arw(u_n)$.

On projette donc sur $arw(u_n)$:
$ m v^2/R = abs(q) v B $

On en déduit que $R$, le rayon de courbure est une constante:
$ R = (m v)/(abs(q) B) $
#resultb[Donc la particule suit une trajectoire circulaire.]

Comme on suit un trajectoire circulaire, on peut
poser $omega$ la vitesse angulaire, et on a par définition:
$ omega = (2 pi)/T "avec" T "la période de rotation" $
$ v = omega R = (2 pi R)/T $

Donc $T$ la période de rotation vaut:
$ T = (2 pi R)/v $
En substituant $R$:
$ T = (2 pi m)/(abs(q) B) $

Dans le cas d'un champ magnétique, la vitesse angulaire $omega$
est aussi appellée *pulsation synchrotron*:
$ omega = (2pi)/T = (abs(q) B)/m $

#tip[
	Le sens de la rotation dépend du signe de $q$:
	en regardant le produit vectoriel entre $arw(v_0)$ et $arw(B)$,
	le cercle part vers la main droite si $q$ est positif et vers
	la main gauche si $q$ est négatif. (voir schéma)
]

== Déviation d'une particule chargée par un champ magnétique

À force équivalente, la déviation par un champ magnétique
sera plus forte que par un champ électrique, car
le champ magnétique va modifier la direction du vecteur vitesse,
alors que le champ électrique va ajouter une composante
au vecteur vitesse.

On ne pourra jamais suivre une trajectoire circulaire avec un champ
électrique constant.

#figcan({
	import draw: *

	content((-3, 3), [Après champ électrique])
	line((0, -2), (0, 3))

	point((-3, -2), value: $q$)
	arrow((-3, -2), (-3, -1), tip: $arw(v)$)

	bezier-through((-3, -2), (-2.5, 0), (-2, 1), stroke: (dash: "dashed"))

	arrow((-2, 1), (-2, 2), tip: $arw(v)$, stroke: (dash: "dotted"))
	arrow((-2, 1), (-1.2, 1), tip: $arw(v_x)$, stroke: (dash: "dotted"))
	arrow((-2, 1), (-1.2, 2), tip: $arw(v_f)$)

	// ---

	content((3, 3), [Après champ magnétique])

	point((2, -2), value: $q$)
	arrow((2, -2), (2, -1), tip: $arw(v)$)
	arrow((4.5, .5), (5.5, .5), tip: $arw(v_f)$)

	arc((2, -2), start: 180deg, stop: 90deg, radius: 2.5, stroke: (dash: "dashed"))
})

== Cas où $arw(v_0)$ en partie sur la direction de $arw(B)$

#figcan({
	import draw: *
	arrow((0, 0, 0), (2, 0, 0), tip: $y$)
	arrow((0, 0, 0), (0, 2, 0), tip: $z$)
	arrow((0, 0, 0), (0, 0, 2), tip: $x$)

	arrow((2, 1, 0), (2, 2, 0), tip: $arw(B)$, stroke: red)

	point((0, 0, 1), value: $q$)
	arrow((0, 0, 1), (1, 0, 1), tip: $arw(v)_(o,y)$, stroke: green, pad: 0.5)
	arrow((0, 0, 1), (0, 1, 1), tip: $arw(v)_(o,z)$, stroke: green, pad: 0.5)

	for i in range(80) {
		let t = i/4 - calc.pi/2
		let tp = (i+1)/4 - calc.pi/2
		line((calc.cos(t), t/6 + calc.pi/12, calc.sin(t) + 2), (calc.cos(tp), tp/6 + calc.pi/12, calc.sin(tp) + 2), stroke: red)
	}

})

= Mouvement dans le champ électromagnétique, applications

== Expérience de Thomson

#figure(caption: [Expérience de Thomson], image("thomson.png", width: 50%))

On lance une particule au début du dispositif. \
Dans la zone $arw(E_0)$, on applique un champ électrique pour accélerer
la particule.

Dans le premier temps de l'expérience,
dans la zone $a$ (entre les pointillés), on n'applique *pas* le champ magnétique $arw(B)$, seulement le champ électrique $arw(E)$.

Le champ électrique $arw(E)$ va dévier les électrons d'un certain angle
$theta$, et les électrons vont atterir sur l'écran à une
certaine hauteur $d$. \
En supposant $a << L$, la trajectoire de l'électron à partir
de la zone $a$ est à peu près un triangle rectangle, et on a donc:
$ tan theta = (q E a)/(m v^2) approx d/L $

Dans le second temps de l'expérience, on applique le champ magnétique
$arw(B)$ en même temps que le champ électrique $arw(E)$.

Donc, une fois arrivés dans la zone $a$, les électrons seront à la fois
affectés par le champ électrique et le champ magnétique.

On va modifier le champ magnétique jusqu'à ce que les deux champs
s'annulent complètement (que l'électron suive une ligne droite).

On aura donc $m arw(a) = q E - q V B = 0$. \
En réinjectant, on aura $q/m = (d E)/(a L B^2)$

== Spectromètre de masse

On peut utiliser les champs électriques et les champs magnétiques
pour différencier les isotopes d'un même élément.

Deux isotopes possèdent un même nombre de protons et d'électrons,
donc possèdent une même charge.

Cependant, ils ont un nombre de neutrons différent,
et donc une masse différente.

On devra travailler avec des ions (chargés positivement)
pour pouvoir les accélerer avec des champs électromagnétiques.

#grid(
	columns: (1fr, 1fr),
	[
		On commence par accélerer les ions avec
		un champ électrique constant $arw(E)$.
	    Les ions sortent avec une vitesse:
	    $ v_0 = sqrt((2 abs(q) V)/m) $
		On applique ensuite un champ magnétique qui va courber les ions
		sortant de la source.
	    En exprimant le rayon de courbure, on trouve:
	    $ R = 1/B sqrt((2 m V)/abs(q)) $
		Donc le rayon de courbure dépend de la masse:
	    on peut séparer les différents isotopes en fonction de
	    leur zone d'impact sur la plaque photographique.
	],
	image("spectrometre.png")
)

== Cyclotron

Les cyclotrons ont pour objectif d'accélerer des particules chargées
élémentaires.

#let lerp(a, b, t) = (a + (b - a)*t)

#figcan({
	import draw: *

	arc((-0.5, 0.1), radius: 2.1, start: 90deg, delta: 180deg, anchor: "origin", mode: "CLOSE")

	arc((0.5, 0.4), radius: 2.4, start: 90deg, delta: -180deg, anchor: "origin", mode: "CLOSE")

	for i in range(3) {
		let t = lerp(0, 2.1, (i+1)/4)
		let dif = lerp(0, 2.1, (i+2)/4) - t

		let r = t + dif/2

		arc((-0.5, 0.1), radius: r, start: 90deg, delta: 180deg, anchor: "origin", stroke: (dash: "dotted"))
		line((0.5, 0.1 + r), (-0.5, 0.1 + r), stroke: (dash: "dotted"))
		line((0.5, 0.1 - r), (-0.5, 0.1 - r), stroke: (dash: "dotted"))
	}

	for i in range(4) {
		let t = lerp(0, 2.1, (i+1)/4)

		arc((0.5, 0.36), radius: t, start: 90deg, delta: -180deg, anchor: "origin", stroke: (dash: "dotted"))
	}
})
Ça va vite!
