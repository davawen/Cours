#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#show link: it => underline[#it]

#titleb[Mouvement dans un champ à force constante \ Cas de la gravitation - Lois de Kepler \ Planètes et satellites]

= Force centrale conservative - Cas de la gravitation 

== Force centrale

On rappelle la définition d'une *force centrale*:
une force centrale est une force dont la droite d'action passe
toujours par un point fixe: 

#figcan({
  import draw: *
  point((0, 0), value: $O$, name: "O")

  point((3, 2), value: $M$, name: "M")
  arrow("M", ("M", 1, "O"), tip: $arw(f)$)

  point((-2, 1), value: $M$, name: "M")
  arrow("M", ("M", 1, "O"), tip: $arw(f)$)

  point((4, -1), value: $M$, name: "M")
  arrow("M", ("M", 1, "O"), tip: $arw(f)$)
})

== Force conservative

#let grad = $arw(op("grad"))$

On rappelle la définition d'une *force conservative*:
c'est une force $arw(f)$ qui dérive d'un potentiel:
$ arw(f) = - grad E_p $
Pour montrer qu'une force est conservative, on veut montrer que:
$ delta W = - dif E_p $

Pour étudier une force centrale, on se place en coordonnées sphériques:
$ arw(f) = f arw(u_r) $
Si on étudie une force conservative de cette forme, on a alors:
$ arw(f) = - grad E_p = - (dif E_p)/(dif r) arw(u_r) $

== Exemple de la gravitation

On étudie les points $M_1$ de masse $m_1$, et $M_2$ de masse $m_2$.

On a:
$ arw(f)_(1->2) = - G (m_1 m_2)/(M_1 M_2)^3 arw(M_1 M_2) $

On place le point $M_1$ à l'origine $O$ on renomme le point
$M_2$ en point $M$ et on se place en coordonnées sphériques:
$ arw(f)_(O->M) = - G (m_1 m_2)/(O M)^3 arw(O M) = - G (m_1 m_2)/r^2 arw(u_r)  $

On calcule le trvail élémentaire:
$ delta W &= arw(f) dot dif arw(O M) \
&= - G (m_1 m_2)/r^2 arw(u_r) dot (dif r arw(u_r) + r dif theta arw(u_theta) + r sin theta dif phi arw(u_phi)) \
&= - G (m_1 m_2)/r^2 dif r \
&= - dif (- G (m_1 m_2)/r) = - dif E_p 
$
Avec:
$ E_p = - G (m_1 m_2)/r + "constante" $

En générale, on choisit l'origine des potentiels à l'infini. La constante
est donc nulle.

== Autres exemples

On peut prendre comme exemple:
- La force de coulomb:
  #figcan({
  point((-2, 0), value: $q_1$)
  point((2, 0), value: $q_2$)

  arrow((2, 0), (1, 0), tip: $arw(f)_(1->2)$, pad: 0.5)
})
  Avec $arw(f)_(1->2) = 1/(4 pi epsilon_0) (q_1 q_2)/r^2 arw(u_r)$. \

- La force de rappel du ressort:
  #let uext = $arw(u)_"ext"$
  #figcan({
  import draw: *
  point((0, 0), value: $O$, name: "O")
  point((2, 1), value: $M$, name: "M")
  arrow(("M"), ("O", 3.5, "M"), tip: $uext$)

  cetz.decorations.coil(line("O", "M"), amplitude: 0.3)
})
  $ arw(f) = - k Delta l uext $
  $ arw(f) = - k (r - l_0) arw(u_r) $
  $ delta W = arw(f) dot dif arw(O M) 
   &= - k (r - l_0) arw(u_r) dot (dif r arw(u_r) + ...) \
   &= - k (r - l_0) dif r \
   &= - dif (1/2 k (r - l_0)^2)
$
  D'où: $E_p = 1/2 k (r - l_0)^2 + "constante"$

= Généralités des mouvements à force centrale conservative

#tip[
  On devra presque toujours redémontrer ces résultats en exercice.
]

On étudie le système du point $M$ dans un référentiel galiléen.
On fait un bilan des forces:
- La force centrale conservative $arw(f) = f arw(u_r)$

== Conservation du moment cinétique

On commence par montrer la conservation du moment cinétique.
Par le théorème du moment cinétique:
#let momcin = $arw(L_O) (M)$
#let momfor = $arw(cal(M)_O)$
$ (dif momcin)/(dif t) = momfor (arw(f)) = arw(O M) and arw(f) $
Or $arw(O M) = r arw(u_r)$ et $arw(f) = f arw(u_r)$, donc les deux vecteurs sont colinéaires, donc:
$ (dif momcin)/(dif t) = arw(O M) and arw(f) = 0 $
Le moment cinétique est donc conservé.

== Mouvement plan

Comme le moment cinétique est conservé, on peut montrer que le point $M$
évolue dans un plan. On a établi que:
$ momcin = arw(O M) and m arw(v) (M) = "constante" $
Par définition du produit vectoriel, $arw(O M)$ et $arw(v)$ sont 
perpendiculaires au vecteur $momcin$, qui est constant.

- Si $arw(O M)$ et $arw(v)$ sont colinéaires, le mouvement est rectiligne.
- Sinon, $arw(O M)$ et $arw(v)$ forment un plan passant par le
  point $O$, et ce plan est perpendiculaire à $momcin$.
Dans les deux cas, le point $M$ évolue dans un plan qui reste fixe.
On peut donc se placer en coordonnées polaires:
$ arw(O M) = r arw(u_r) $

== Constante des aires

On reprend le moment cinétique:
$ momcin &= r arw(u_r) and m arw(v) \
&= m r arw(u_r) and ( dot(r) arw(u_r) + r dot(theta) arw(u_theta) )  \
&= m r^2 dot(theta) arw(u_z)
$
Le moment cinétique et la masse sont constants, donc la quantité
$r^2 dot(theta)$ reste constante.

Donc la vitesse angulaire sera beaucoup plus grande proche
du centre de la trajectoire que loin.

== Conservation de l'énergie mécanique

$arw(f)$ est une force conservative, donc l'énergie mécanique se conserve.

On peut expliciter la forme prise par l'énergie cinétique:
$ E_c = 1/2 m v^2 $
En cordonnées polaires:
$ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) $
Donc:
$ v^2 = dot(r)^2 + r^2 dot(theta)^2 $
D'où:
$ E_c = 1/2 m (dot(r)^2 + r^2 dot(theta)^2)  $
On peut donc exprimer l'énergie mécanique:
$ E_m = E_c + E_p (r) "(l'énergie potentielle ne dépend que de "r")" $
$ E_m = 1/2 m dot(r)^2 + 1/2 m r^2 dot(theta)^2 + E_p (r) $
$ E_m = 1/2 m dot(r)^2 + 1/2 m 1/r^2 r^4 dot(theta)^2 + E_p (r) $
$ E_m = 1/2 m dot(r)^2 + C^2 1/2 m/r^2 + E_p (r) "avec" C = r^2 dot(theta) "constante" $
On peut donc exprimer l'énergie mécanique en fonction d'un seul
paramètre. Super! Les raisonnements énergitiques sont donc super youpi maintenant.

== Énergie potentielle effective et étude qualitative du mouvement

On a maintenant une super intuition qui nous chuchote dans l'oreille
d'essayer de séparer les termes en $dot(r)$ et en $r$.

On définit l'*énergie potentielle effective*. Elle récupère une partie de
l'énergie cinétique, mais
comme une énergie potentielle normale, _elle ne dépend
que de la position_. Ici:
$ E_(p,"eff") = 1/2 (m C^2)/r^2 + E_p (r) $

On reprend l'expression tronquée d'énergie cinétique. On sait que:
$ 1/2 m dot(r)^2 >= 0 $
Donc, à tout moment,
$ E_m >= E_(p,"eff") (r) $

Selon l'énergie mécanique originale du système, le mouvement peut
donc être *libre* ($r$ peut aller jusqu'a $+oo$) ou *lié* ($r$ est confiné à un intervalle)
#figcan({
  import draw: *
  arrow((0, 0), (4, 0), tip: $r$)
  arrow((0, 0), (0, 2), tip: $E_(p,"eff")$)
  catmull((0, 1.5), (1, 0), (3, 1), (4, 0.5))

  set-style(stroke: (paint: red, dash: "dashed"))
  line((0, 0.5), (4.5, 0.5))
  line((0, 1.6), (4.5, 1.6))
  content((4.6, 0.5), [lié], anchor: "west")
  content((4.6, 1.6), [libre], anchor: "west")
})

= Cas d'une interaction newtonienne

== Interaction newtonienne

On définit une *interaction newtonienne* $arw(f)$ par une
force _centrale_ d'amplitude proportionelle à $1/r^2$:
$ arw(f) = K/r^2 arw(u_r) $

On montre qu'elle est conservative:
$ delta W = arw(f) dot dif arw(O M) \
= (K/r^2 arw(u_r)) dot (dif r arw(u_r) + r dif theta arw(u_theta) + r sin theta dif phi arw(u_phi)) \
= dif r K/r^2 = - dif (K/r) = -dif E_p
$

On prend donc $E_p = K/r + "constante"$ avec la constante nulle pour
l'origine des potentiels à l'infini.

== Caractère attractif ou répulsif

- Si $K > 0$, $arw(f)$ va dans le même sens que $arw(u_r)$ et est donc
  centrifuge (répulsive)
- Si $K < 0$, $arw(f)$ va dans le sens inverse de $arw(u_r)$ et est donc
  centripète (attractive)

== Discussion qualitative du mouvement

On reprend l'expression de l'énergie potentielle effective vue précedemment:
$ E_p = K/r => E_(p,"eff") = 1/2 m c^2/r^2 + K/r $
On dérive:
$ (dif E_(p,"eff"))/(dif r) = - (m c^2)/r^3 - K/r^2 = - (m c^2 + K r)/r^3  $

On a toujours $m c^2 > 0$ et $r > 0$.

Dans le cas $K > 0$, $m c^2 + K r > 0$, donc
$ (dif E_(p,"eff"))/(dif r) < 0  $
l'énergie potentielle effective ne s'annule jamais et est une fonction décroissante de $r$.
En regardant les limites pour $r->0$ et $r->+oo$, $E_(p,"eff")$ est de la forme:
#plot((1, 5), (x => 1/(x*x)))

Donc tout système possède un mouvement libre.

#tip[
  Comme $E_m = E_c + E_p$, si on trouve une énergie mécanique
  négative dans l'étude d'une force newtonienne avec $K>0$, on sait qu'on s'est
  trompé.
]

- Si $K < 0$, alors $(dif E_(p,"eff"))/(dif r)$ s'annule pour
  $r_0 = - (m c^2)/K$. \
  L'énergie potentielle effective est décroissante jusqu'en
  $r_0$ puis croissante. Elle admet donc un minimum en $r_0$.
  
  On calcule ce minimum:
  $ E_(p,"eff") (r_0) = -(K^2)/(2 m c^2) $

  #figcan({
  import draw: *

  arrow((-1, 0), (4, 0), tip: $r$)
  arrow((0, -2), (0, 2), tip: $E_(p,"eff")$)

  set-style(stroke: blue)
  catmull((0, 1.6), (1, -1.6), (3, -0.2), (4, 0))
})

Dans le cas de la gravitation, les mouvement peuvent être
liés ou libres

== Discussion sur la nature du mouvement

Pour $K < 0$,
la trajectoire du mouvement suivra un conique:
- Pour $E_m < 0$, la trajectoire suivie est une ellipse
- Pour $E_m = 0$, la trajectoire suivie est parabolique
- Pour $E_m > 0$, la trajectoire suivie est hyperbolique
On définit un paramètre $e$, l'eccentricité, qui pour chacun des cas respecte $e < 1$, $e = 1$ et $e > 1$, d'équation de trajectoire:
$ r = (p)/(- epsilon + e cos(theta - theta_0)) "avec" P = (m C^2)/abs(K) "et" epsilon = K/abs(K) = plus.minus 1 $

= Mouvement des planètes et lois de Kepler

== Énoncé des lois de Kepler

#theorem[
+ Le centre des planètes décrit une ellipse dont l'un des foyers est
   le Soleil
+ Les rayons vecteurs balaient des aires égales pour des intervalles de
  temps égaux
+ Le rapport entre le carré de la période $T$ de révolution
  de la planète autour du Soleil et le cube du demi grand axe $a$
  de la trajectoire est indépendant de la planète

  $ T^2/a^3 = "constante" $
]

== Étude la trajectoire circulaire

On suppose que le mouvement étudié est plan donc on utilise
les coordonnées polaires.

Donc:
$ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta)  $
Par hypothèse de trajectoire circulaire, $r = R "constant"$, donc:
$ arw(v) = r dot(theta) arw(u_theta) $
Et:
$ arw(a) = r (diaer(theta) arw(u_theta) - dot(theta)^2 arw(u_r)) $

Le mouvement étudié est uniforme, donc:
$ arw(L_O)(M) = m r^2 dot(theta) arw(u_z) = "constante" $
Comme $r = R$ est constant, alors $dot(theta) = "constante"$

On souhaite obtenir le rayon de la trajectoire à partir de la vitesse:

$ dot(theta) = "constante" $
$ norm(arw(v)) = R dot(theta) = "constante" $
On a:
$ m R dot(theta)^2 = (G M m)/R^2 $
$ R dot(theta)^2 = (G M)/R^2 $
Donc:
$ v^2 = R^2 dot(theta)^2 = R (G M)/R^2 = (G M)/R => v = sqrt((G M)/R) $

De plus, on a:
$ v = R abs(dot(theta)) => abs(dot(theta)) = v/R = 1/R (sqrt((G M)/R)) $
On en déduit la période de rotation:
$ omega = abs(dot(theta)) = (2 pi)/T \
=> T = (2 pi)/abs(dot(theta)) = 2 pi sqrt(R^3/(G M)) $
On obtient la troisième loi de Kepler:
#resultb[$ T^2/R^3 = (4 pi^2)/(G M) $]

Étude énergétique:
$ E_p = - (G M m)/r + "constante" $

On prend l'origine des potentiels à l'infini, donc:

#resultb[$ E_p = - (G M m)/R $]

#resultb[$ E_c = 1/2 m v^2 = 1/2 m (G M)/R = (G M m)/(2 R) = - 1/2 E_p $]

On en déduit l'énergie mécanique:
$ E_m = E_p + E_c = 1/2 E_p $

== Quelques caractéristiques de la trajectoire elliptique

#table(
  columns: (1fr, 1fr, 1fr),
  inset: 10pt,
  [], [Circulaire], [Elliptique],
  $E_m$, $ - (G M m)/(2 R) $, $ - (G M m)/(2 a) $,
  [3#super[eme] Loi de Kepler], $ T^2/R^3 = (4 pi^2)/(G M) $,
  $ T^2/a^3 = (4 pi^2)/(G M) $
)

= Quelques remarques sur les satellites

== Vitesse circulaire ou 1#super[ere] vitesse cosmique

C'est la vitesse pour se placer en orbite circulaire:
$ v_0 = sqrt( (G M)/R ) $

== Vitesse de libération ou 2#super[eme] vitesse cosmique

C'est la vitesse nécessaire pour se libérer de l'attraction de l'astre.
On regarde le graphe d'énergie mécanique:

#figcan({
  import draw: *

  arrow((-1, 0), (4, 0), tip: $r$)
  arrow((0, -2), (0, 2), tip: $E_p$)

  set-style(stroke: blue)
  catmull((0, 1.6), (1, -1.6), (3, -0.2), (4, 0))
})

$E_m = 0$ est la première valeure possible en partant d'un état
lié pour obtenir un état libre. On a:
$ E_m = E_c + E_p $
On se place dans l'hypothèse d'un satellite sur une trajectoire
circulaire de rayon $R$
$ => E_p = (- G M m)/R $
Pour avoir:
$ E_c = 1/2 m v_L^2 "avec" v_L "la vitesse de libération" $
$ 1/2 m v_L^2 - (G M m)/R = 0 => v_L = sqrt(2 (G M m)/R) = sqrt(2) v_0 $

== Satellite géostationnaire

Un satellite géostationnaire tourne à la même vitesse
que la vitesse de rotation de la Terre (il reste au-dessus du même point
tout le temps).

Il faut donc que la période de rotation $T$ valle $T = 24 " " "H"$

On a:
$ T^2/R^3 = (4 pi^2)/(G M) => R = root(3, T^2 (G M)/(4 pi^2)) $
