#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Complément Chapitre 2 - Le produit vectoriel]

#show heading.where(level: 1): it => {
	align(center, rect(
		inset: 1.2em,
		stroke: (thickness: 0.5pt),
		width: 90%,
		[
		#place(top + left, dy: -1.85em,
			rect(stroke: none, fill: white, 
				context { numbering("1", ..counter(heading).get()) }
			)
		)
		#it.body
	]
	))
}

= Orientation de l'espace

Deux bases possibles:
#align(center, grid(
	columns: (1fr, 1fr),
	[Direct (main droite)
	#figcan({
		import draw: *
		arrow((0, 0, 0), (1, 0, 0))
		arrow((0, 0, 0), (0, 1, 0))
		arrow((0, 0, 0), (0, 0, 1))

		content((1.1, 0, 0), [$arw(x)$ (pouce)], anchor: "west")
		content((0, 1.1, 0), [$arw(y)$ (index)], anchor: "south")
		content((0, 0, 1.4), [$arw(z)$ (majeur)])
	})

	#figcan({
		import draw: *
		arrow((0, 0, 0), (1, 0, 0))
		arrow((0, 0, 0), (0, 1, 0))
		arrow((0, 0, 0), (0, 0, 1))

		content((1.1, 0, 0), [$arw(y)$ (index)], anchor: "west")
		content((0, 1.1, 0), [$arw(z)$ (majeur)], anchor: "south")
		content((0, 0, 1.4), [$arw(x)$ (pouce)])
	})

],
	[Indirect (main gauche)
	#figcan({
		import draw: *
		arrow((0, 0, 0), (1, 0, 0))
		arrow((0, 0, 0), (0, 1, 0))
		arrow((0, 0, 0), (0, 0, -1))

		content((1.1, 0, 0), [$arw(x)$ (pouce)], anchor: "west")
		content((0, 1.1, 0), [$arw(y)$ (index)], anchor: "south")
		content((0.5, 0, -1.4), [$arw(z)$ (majeur)])
	})

	#figcan({
		import draw: *
		arrow((0, 0, 0), (-1, 0, 0))
		arrow((0, 0, 0), (0, 1, 0))
		arrow((0, 0, 0), (0, 0, 1))

		content((-1.1, 0, 0), [$arw(y)$ (index)], anchor: "east")
		content((0, 1.1, 0), [$arw(z)$ (majeur)], anchor: "south")
		content((0.5, 0, 1.4), [$arw(x)$ (pouce)])
	})
]
))

= Produit vectoriel

On définit le produit vectoriel comme l'opérateur $and$ qui à deux vecteurs $arw(A)$ et $arw(B)$ associent le vecteur $arw(A) and arw(B)$ qui est:
+ Si $arw(A)$ et $arw(B)$ ne sont pas colinéaires
  - Perpendiculaire au plan formé par $(O, arw(A), arw(B))$
  - Tel que $(arw(A), arw(B), arw(A) and arw(B))$ forme une base directe
  - De magnitude $sin((arw(A), arw(B))) norm(arw(A)) norm(arw(B))$
+ Si $arw(A)$ et $arw(B)$ sont colinéaires:
  $arw(A) and arw(B) = 0$

#figcan({
	import draw: *

	let (a, b, c) = (0, 1, 0)
	let (x, y, z) = (1, 0, -1)
	arrow((0, 0, 0), (a, b, c))
	arrow((0, 0, 0), (x, y, z))

	arrow((0, 0, 0), (
		b*z - c*y,
		c*x - a*z,
		a*y - b*x
	), stroke: (dash: "dotted"))

	content((a+0.2, b+0.2, c), $arw(A)$)
	content((x+0.2, y+0.2, z), $arw(B)$)
})

Le produit vectoriel est anti-commutatif:
$ arw(A) and arw(B) = - (arw(B) and arw(A)) $

Il est associatif/commutatif avec la multiplication externe (pour $k in RR$):
$ (k arw(A)) and arw(B) = arw(A) and (k arw(B)) = k (arw(A) and arw(B)) $
Il est distributif (à gauche et à droite) par rapport à l'addition:
$ arw(A) and (arw(B) + arw(C)) = (arw(A) and arw(B)) + (arw(A) and arw(C)) $

Calcul du produit vectoriel:
Pour $arw(A) = vec(x, y, z)$ et $arw(B) = vec(x', y', z')$,
$ arw(A) and arw(B) = vec(y z' - y' z, z x' - z' x, x y' - x' y) $

Moyen mémotechnique: ça ressemble à la formule du déterminant, en utilisant les composants externes:
$ arw(A) and arw(B) = vec(
	det mat(y, y'; z, z'),
	det mat(x', x; z', z),
	det mat(x, x'; y, y'),
) $

#warn[
	Attention à la ligne du milieu
]

Preuve: horrible

= Application au mouvement circulaire

On introduit le vecteur rotation $arw(omega)$, avec $norm(omega)$
la vitesse angulaire $omega$, et colinéaire à $arw(u_z)$

On peut alors exprimer la vitesse:
$arw(omega) and arw(O M) = r omega arw(u_z) and arw(u_r) = r omega arw(u_theta) = arw(v) $

== Expression de l'accélération

On dérive:
$ arw(a) = (dif arw(v))/(dif t) &= dif/(dif t) (arw(r) and arw(O M)) \
&= (dif arw(r))/(dif t) and arw(O M) + arw(r) and (dif arw(O M))/(dif t) \
&= diaer(theta) arw(u_z) and R arw(u_r) + dot(theta) arw(u_z) and arw(v) \
&= R diaer(theta) arw(u_theta) + dot(theta) arw(u_z) and R dot(theta) arw(u_theta) \
&= R diaer(theta) arw(u_theta) - R dot(theta)^2 arw(u_r)
$

Dans le cas du mouvement circulaire uniforme, l'accélération est orthogonale à la vitesse:
$ arw(a) = arw(v) and arw(r) $
