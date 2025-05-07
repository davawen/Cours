#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[Moment cinétique]

= Moment cinétique d'un point matériel

On introduit le moment cinétique, un nouvel outil définit
à l'aide du produit vectoriel.

Il existe deux moments cinétiques différents:
+ Le moment cinétique par-rapport à un point (le moment cinétique sera vectoriel)
+ Le moment cinétique par-rapport à un axe (le moment cinétique sera scalaire)

== Moment cinétique par-rapport à un point

#let ref = $\/cal(R)$

On note $arw(L_(O ref)) (M)$ ou $arw(sigma_(O ref)) (M)$ le moment cinétique d'un point $M$ par-rapport au point $O$,
avec $cal(R)$ le référentiel.

On le définit par:
$ arw(L_(O ref)) (M) &= arw(O M) and arw(P_ref) (M) \
&= arw(O M) and m arw(v_ref) (M)
$

== Dépendance du moment cinétique par-rapport au point considéré

Si on prend $O$ et $O'$ deux points différents on a:
$ arw(L_(O' ref)) (M) &= arw(O' M) and m arw(v_ref) ( M ) \
&= (arw(O' O) + arw(O M)) and m arw(v_ref) (M) \
&= arw(O' O) and m arw(v_ref) (M) + arw(O M) and m arw(v_ref) (M) \
&= arw(O' O) and m arw(v_ref) (M) + arw(L_(O ref))
$

À moins d'avoir une vitesse nulle ou colinéaire au déplacement $arw(O' O)$,
on aura $arw(L_(O' ref)) != arw(L_(O ref))$

== Moment cinétique par-rapport à un axe

#let axe = $Delta$

On considère $axe$ un axe passant par $O$ et dirigé par 
le vecteur unitaire $arw(u_axe)$. \
On pose le moment cinétique par-rapport à $O$:
$ arw(L_(O ref)) (M) = arw(O M) and m arw(v_ref) (M) $

On définit le moment cinétique par-rapport à l'axe $axe$ par:
$ L_(axe ref) (M) = arw(L_(O ref)) (M) dot arw(u_axe) $

#note[
  Le point $O$ peut-être choisi arbitrairement.
  Démonstration en reprenant l'expression précedente avec $O'$ un autre point de $axe$:
  $ arw(L_(O' ref)) (M) dot arw(u_axe)
  &= (underbrace(arw(O' O) and m arw(v_ref), "perpendiculaire à" arw(u_Delta)) + arw(L_(O ref)) (M)) dot arw(u_axe) \
  &= arw(L_(O ref)) (M) dot arw(u_axe)
  $
]

== Cas d'un mouvement circulaire

On considère un point en mouvement circulaire.
On se place en coordonées cylindriques avec l'axe $(O_z)$ perpendiculaire
au plan du mouvement et le point $O$ centre de la trajectoire.

On a donc:
$ arw(O M) = r arw(u_r) + z arw(u_z) = r arw(u_r) $
$ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) = R dot(theta) arw(u_theta) $
Comme on est en mouvement circulaire, on a $r = R "constant"$,
donc $dot(r) = 0$, et $dot(z) = 0$, donc

On calcule le moment cinétique:
$ arw(L_(O ref)) (M) &= arw(O M) and m arw(v_ref) (M) \
&= (R arw(u_r) + z arw(u_z)) and m R dot(theta) arw(u_theta) \
&= R arw(u_r) and m R dot(theta) arw(u_theta) \
&= m R^2 dot(theta) arw(u_z)
$

On en déduit le moment cinétique par-rapport à l'axe $axe = (O_z)$
$ arw(L_(axe ref)) (M) = m R^2 dot(theta) $

== Cas général

On prend un point en coordonées cylindriques:
$ arw(O M) = r arw(u_r) + z arw(u_z) $
$ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) + dot(z) arw(u_z) $

$ arw(L_(O ref))
&= arw(O M) and m arw(v_ref) (M) \
&= (r arw(u_r) + z arw(u_z)) and m (dot(r) arw(u_r) + r dot(theta) arw(u_theta) + dot(z) arw(u_z)) \
&= m (r^2 dot(theta) arw(u_z) - r dot(z) arw(u_theta) + z dot(r) arw(u_theta)
- z r dot(theta) arw(u_r)) \
&= - m r z dot(theta) arw(u_r) + m (z dot(r) - r dot(z)) arw(u_theta) + m r^2 dot(theta) arw(u_z)
$

#tip[On utilisera jamais cette forme.]

= Moment d'une force

== Définition du moment par-rapport à un point

#let mom = $cal(M)$

De la même manière qu'on a définit le travail d'une force,
on définit le moment d'une force par:
$ arw(mom_O) (arw(f)) = arw(O M) and arw(f) $

Si on prend $O'$ un autre point:
$ arw(mom_O') (arw(f)) &= arw(O' M) and arw(f) \
&= arw(O' O) and arw(f) + arw(O M) and arw(f) \
&= arw(O' O) and arw(f) + arw(mom_O) (arw(f))
$
De la même manière, à moins que la force soit nulle ou collinéaire
à $arw(O' O)$, $arw(mom_O') (arw(f)) != arw(mom_O) (arw(f))$

On définit le *bras de levier*, la distance entre le point $O$ et 
*la droite d'action* de la force $arw(f)$, qui permet
de calculer la norme du moment de la force:

#figcan({
  import draw: *

  line((-1, -1), (4, 4), stroke: (paint: gray))

  line((3, -1), (3, 4), stroke: red)
  content((3.3, -0.5), ["droite d'action" de $arw(f)$], anchor: "west")

  content((1.2, -0.8), ["bras de levier"], anchor: "north")

  point((0, 0), value: $O$, name: "O")
  point((3, 3), value: $M$, name: "M")
  point((3, 0), value: $H$)

  arrow("M", (3, 4.5), tip: $arw(f)$)
  cetz.angle.angle((3, 3), (4, 4), (3, 4))
  content((3.4, 3.8), $theta$)

  line((0.2, 0), (2.8, 0))
  content((1.5, -0.2), $d$, anchor: "north")
})

On a:
$ norm(arw(mom_O)(arw(f))) = O M times f times sin theta $

Le triangle $O M H$ est triangle en $H$, donc:
$ sin theta = (O H)/(O M) $
Donc:
$ O M sin theta = O H = d "la distance de" O "à la droite d'action de" arw(f) $

== Moment d'une force par-rapport à un axe

On prend un axe $axe$ passant par un point $O$ et de vecteur directeur
unitaire $arw(u_axe)$, et on définit le moment par-rapport à un axe:
$ mom_axe (arw(f)) = arw(mom_O) (arw(f)) dot arw(u_axe) $

= Théorème du moment cinétique en référentiel galiléen

== Théorème du moment cinétique par-rapport à un point fixe

#theorem[
  La dérivée du moment cinétique par-rapport à un point est égale
  à la somme des moments par-rapport à ce point:

  $ (dif arw(L_(O ref)))/(dif t) = sum arw(mom_O) (arw(f)) $
]

On repart de la définition du moment cinétique:
$ arw(L_(O ref)) (M) = arw(O M) and m arw(v_ref) (M) $

$
(dif arw(L_(O ref)) (M))/(dif t)
&= (dif)/(dif t) (arw(O M) and m arw(v_ref) (M)) \
&= underbrace((dif arw(O M))/(dif t), arw(v_ref) (M) "car" O "fixe") and m arw(v_ref) (M)
+ arw(O M) and underbrace((dif)/(dif t) (m arw(v_ref) ( M )), sum arw(f)) \
&= arw(0) + sum arw(O M) and arw(f) \
&= sum arw(mom_O) (arw(f))
$

#note[
  Si $O$ est mobile, on prend $O'$ un point fixe, on peut décomposer (comme vu précedemment)
  $arw(L_O)$ en $arw(O' O)$ et en $arw(L_O')$ et on tombe sur:
  $ (dif arw(L_(O ref)) (M))/(dif t) = (m arw(v_ref) (M) and arw(v_ref) (O)) + sum arw(mom_O) (arw(f)) $
]

== Théorème du moment cinétique par-rapport à un axe

Soit $O$ un point d'un axe $axe$ fixe.
Par le théorème du moment cinétique:

$ (dif arw(L_(O ref)) (M))/(dif t) = sum arw(mom_O) (arw(f)) $
$ (dif arw(L_(O ref)) (M))/(dif t) dot arw(u_axe) = sum arw(mom_O) (arw(f)) dot arw(u_axe) $

#theorem[
$ (dif L_axe (M))/(dif t) = sum mom_axe (arw(f)) $
]

= Conservation du moment cinétique

== Conditions de la conservation du moment cinétique

Le moment cinétique se conserve (= est constante)
si sa dérivé s'annule, donc:
$ (dif arw(L_(O ref)) (M))/(dif t) = 0 <=> sum arw(mom_O) (arw(f)) = 0 $

En substituant la définition du moment:
$ sum arw(mom_O) (arw(f)) = sum arw(O M) and arw(f) = arw(O M) and sum arw(f) = arw(O M) and arw(F) $

Donc le moment cinétique est constant si:
- Le point étudié est confondu avec l'origine
- La somme des forces est nulle
- Que $arw(O M)$ et $arw(F)$ soient colinéaires.
Dans ce dernier cas, on parle de *force centrale*, quand la force totale
$arw(F)$ est toujours dirigée vers un point fixe $O$.

== Mouvement plan

#let momcin = $arw(L_(O ref))$

Si le moment cinétique est conservé, on a par définition que
$momcin = arw(O M) and m arw(v_ref) (M) = arw("constante") $

On se place dans la situation où le moment cinétique est non-nul,
donc les vecteur $arw(O M)$ et $arw(v_ref) (M)$ sont non-colinéaires
et définissent deux directions différentes:

#grid(columns: (1fr, 1fr), align: (center, left), figcan({
  import draw: *

  arrow((0, 0, 0), (0, 3, 0))

  point((0, 1.5, 0), value: $O$, name: "O")
  point((-1, 1.5, 1), value: $M$, name: "M")
  arrow("O", "M")
  arrow("M", (0, 1.5, 1), tip: $arw(v)$)

}), 
  [$M$ évolue dans le plan perpendiculaire à $momcin (M)$
et passant par $O$
]
)

#tip[
  Il faut d'abords montrer le mouvement plan, puis introduire les coordonnées polaires.
]

== Constante des aires

#figcan({
  import draw: *

  arrow((-4, 0), (4, 0), tip: $x$)
  arrow((0, -2), (0, 2), tip: $x$)

  point((2, 1), value: $M$, name: "M")
  cetz.angle.angle((0, 0), (1, 0), "M")
  line((0, 0), "M")
  content((0.9, 0.8), $r$)
  content((1, 0.25), $theta$)

  circle((-1, 1.5), radius: 0.2)
  circle((-1, 1.5), radius: 0.05, fill: black)
  content((-1, 0.8), $momcin$)
})

On a:
$ arw(O M) = r arw(u_r) $
$ arw(v_ref) (M) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) $
Donc:
$ momcin (M) = (r arw(u_r)) and m (dot(r) arw(u_r) + r dot(theta) arw(u_theta))
= m r^2 dot(theta) arw(u_z)
$

Comme $momcin$, $m$ et $arw(u_z)$ sont constants, on en déduit que
$r^2 dot(theta)$ est constant.

On appelle cette quantité la *constante des aires*:
#figcan({
  import draw: *

  arrow((0, 0), (4, 0), tip: $arw(u_r)$)
  arrow((4, 0), (4, 2), tip: $arw(u_theta)$)

  point((0, 0), value: $O$)

  content((2, -0.2), $r$)
  content((4.4, 1), $r dot(theta)$)

  line((0, 0), (4, 0), (4, 1), closed: true)
})

= Exemple d'utilisation: le pendule simple

#grid(
columns: (1fr, 1fr),
  figcan({
    import draw: *
    point((0, 0), value: $O$)
    point((1, -2))
    line((0, 0), (1, -2))
    content((0.5, -0.5), $l$)
    content((0.5, -2), $M$)

    arrow((1, -2), (1, -3), tip: $arw(p)$, stroke: red)
    arrow((1, -2), (0.5, -1), stroke: red)
    content((1, -1.2), $arw(R)$)

    cetz.angle.angle((0, 0), (0, -1), (1, -2))
    line((0, 0), (0, -2), stroke: (dash: "dotted"))
    content((0.2, -.8), $theta$)

    arrow((1, -2), ((0, 0), 3, (1, -2)), tip: $arw(u_r)$)
    arrow((1, -2), (1.6, -1.66), tip: $arw(u_theta)$)
  }),
  [
  On étudie le système du pendule avec le point $M$ de masse $m$
  dans le référentiel galiléen.
  On fait un bilan des forces:
  - Poids: $arw(p) = m arw(g)$
  - Tension du fil: $arw(R)$
  ]
)

On peut résoudre par PFD, par énergétique ou par #emoji.sparkles Théorème du moment cinétique #emoji.sparkles

#tip[Le théorème du moment cinétique est pratique quand on peut faire
disparaître des forces. Ici, la tension du fil est une force centrale,
donc son moment des nul: pratique!
]

$r = l$ est constant, donc:
$ arw(v) = r dot(theta) arw(u_theta) $
$ arw(a) = r (diaer(theta)arw(u_theta) - dot(theta)^2 arw(u_r)) $

$ (dif momcin (M))/(dif t) = arw(mom_O) (m arw(g)) + arw(mom_O) (arw(R)) $

On se place dans les coordonnées polaires:
$ arw(O M) = l arw(u_r) $
$ arw(v) = l dot(theta) arw(u_theta) $

Donc:
$ momcin (M) = l arw(u_r) and m l dot(theta) arw(u_theta)
= m l^2 dot(theta) arw(u_z)
$

On a:
$ arw(mom_o) (arw(R)) = arw(O M) and arw(R) = arw(0) "car" arw(R) "colinéaire à" arw(O M) $

On doit ensuite calculer le moment du poids:
- Première façon, par règle de la main droite pour le signe:
  $  arw(mom_o) (m arw(g)) &= arw(O M) and m arw(g) \
&= - l m g sin(theta) arw(u_z)
$
- Deuxième façon, par projection:
  $ m arw(g) = m g cos theta arw(u_r) - m g sin theta arw(u_theta) $
  $ arw(O M) = l arw(u_r) $
  $ arw(O M) and m arw(g) &= l arw(u_r) (m g cos theta arw(u_r) - m g sin theta arw(u_theta)) \
&= - l m g sin theta arw(u_z) 
$
- Troisième façon, par bras de levier:
  $ arw(O M) and m arw(g) = plus.minus m g underbrace(d, "bras de levier") arw(u_z) $
  #figcan({
    import draw: *
    point((0, 0), value: $O$)
    point((1, -2))
    line((0, 0), (1, -2))
    content((0.5, -0.5), $l$)

    arrow((1, -2), (1, -3), tip: $arw(p)$, stroke: red)
    line((1, -2), (1, 0), stroke: (paint: red, dash: "dashed"))
    content((1.2, -1), [droite d'action], anchor: "west")

    cetz.decorations.brace((0.9, -2), (0.1, -2))
    content((0.8, -2.8), [bras de levier $d$], anchor: "east")

    cetz.angle.angle((0, 0), (0, -1), (1, -2))
    line((0, 0), (0, -2), stroke: (dash: "dotted"))
    content((0.2, -.8), $theta$)
  })
  On a $d = l sin theta$, donc
  $arw(O M) and m arw(g) = plus.minus l m g sin(theta) arw(u_z) $ \
  Le poids entraîne le fil dans le sens anti-trigonométrique, donc:
  $ arw(O M) and m arw(g) = - l m g sin(theta) arw(u_z) $
 
On se retrouve donc avec:
$ (dif momcin (M))/(dif t) = (dif (m l^2 dot(theta)))/(dif t) 
= -l m g sin(theta) \
<=> m l^2 diaer(theta) = - l m g sin(theta) \
<=> l diaer(theta) + g sin(theta)
$

