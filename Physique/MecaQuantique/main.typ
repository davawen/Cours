#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#titleb[¿ Intrøductiøn à la mécåníqũė qûȧntique ?]

= Dualité onde corpuscule

== Lumière et onde

On associe habituellement la lumière à une onde.

La fréquence de cette onde caractérise l'énergie et le type de lumière.

== Effet photoélectrique

On pose une plaque de zinc initialement chargée positivement.

En dessous, on pose l'électroscope qui permet de détecter des
charges de même signe.

En éclairant le zinc, on arrache des électrons au zinc
(ce qu'on observe sur l'électroscope).

On place ce dispositif dans un circuit et on mesure l'intensité.

L'intensité mesurée augmente avec l'intensité lumineuse.

La fréquence impact l'effet photoélectrique.
On observe un seuil de fréquence en-dessous duquel
aucun effet photoélectrique est observé. De plus,
l'augmentation de la fréquence ne cause pas plus d'arrachage,
toute l'énergie d'un photon est transmis à l'électron (sous la
forme d'énergie cinétique).

L'énergie d'un photon est ammené "par paquet": ces paquets (quanta)
d'énergie sont indivisibles
(un même photon ne peux pas arracher deux électrons) et non accumulable
(deux photons ne peuvent pas s'ajouter pour arracher un électron).

Pour pouvoir arracher un électron,
l'énergie apportée par la lumière $E = h nu$  doit être supérieur
à $W_0$ l'énergie nécessaire pour arracher l'électron.

#principe[
  + L'effet photoélectrique ne se produit qu'au-delà d'une fréquence
    seuil $nu_0$ dont la valeur dépend du métal
  + L'émission est quasi-instantanéé même à faible intensité lumineuse
  + L'énergie cinétique des photoélectrons ne dépend pas de l'intensité
    lumineuse mais uniquement de la fréquence de rayonnement
]

== Notion de photon

On définit le *photon* comme étant une particule de masse nulle,
se déplaçant à la vitesse de la lumière dans le vide.

On lui associe une énergie $E = planck nu = (h c)/(lambda)$ avec
$planck = 6.62 dot 10^(-34) " J" dot "S"$ la constante de 
Planck et $nu$ la fréquence de l'onde associée.

On lui associe aussi une quantité de mouvement $p$.
Seulement, la quantité de mouvement classique n'est valide que dans
un cadre non relativiste. On utilise donc l'énergie
relativiste:
$ E^2 = p^2 c^2 + m^2 c^4 $
\
Dans le cas du photon ($m = 0$):
$ E^2 = p^2 c^2 => p = E/c = h/lambda $

== Absorption et émission de photons

Les atomes ont des niveaux discrets d'énergie entre les électrons,
et l'énergie d'un photon doit correspondre exactement à ce niveau
pour être émis ou absorbé, d'où l'apparition de raies
à des fréquences spécifiques.

== Compléments - Effet Compton

#figure(image("compto.png", width: 40%))

#let pi = $"photon incident"$
#let er = $"e"^- "au repos"$
#let pd = $"photon diffusé"$
#let ed  = $"e"^- "diffusé"$

On utilise (dans le cadre relativiste):
- La conservation totale de l'énergie:
  $ E_pi + E_er = E_pd + E_ed $
  #resultb[$ h v + m_e c^2 = h v' + sqrt(p^2 c^2 + m_e^2 c^4) $]
- La conservation de la quantité de mouvement:
  $ p_pi + p_er = p_pd + p_ed $
  #resultb[$ h/lambda arw(u) = h/(lambda') arw(u)' + arw(p)_ed $]

On récupère la nouvelle quantité de mouvement de l'électron:
$ arw(p_e) = h/lambda arw(u) - h/(lambda) arw(u)' $
On prend le produit scalaire:
$ p_e^2 = h^2/lambda^2 + h^2/lambda'^2 - 2 h/lambda h/lambda' cos theta $
$ p_e^2 c^2 = (h^2 c^2)/lambda^2 + (h^2 c^2)/lambda'^2 - 2 (h^2 c^2)/(lambda lambda') cos theta $

Par la conservation de l'énergie, on a:
$ sqrt(p_e^2 c^2 + m_e^2 c^4) = (h c/lambda + m_e c^2 - h c/lambda') $
Donc:
$ p_e^2 c^2 + m_e^2 c^4 = (h c/lambda + m_e c^2 - h c/lambda')^2 $
On développe en substituant $p_e^2 c^2$:
$ (h^2 c^2)/lambda^2 + (h^2 c^2)/lambda'^2 - 2 (h^2 c^2)/(lambda lambda') cos theta + m_e^2 c^4 &= (h^2 c^2)/lambda^2 + (h c^3 m_e)/lambda - (h^2 c^2)/(lambda lambda') + (h c^3 m_e)/lambda + m_e^2 c^4 \
&- (h m_e c^3)/lambda' - (h^2 c^2)/(lambda lambda') - (h m_e c^3)/lambda'
+ (h^2 c^2)/(lambda'^2)  $
$ (2 h c)/lambda m_e c^2 - (2 h^2 c^2)/(lambda lambda')
- 2 (m_e c^2 h c)/lambda' + (2 h^2 c^2)/(lambda lambda') cos theta = 0 $
$ (h c)/(lambda lambda') (cos theta - 1) + m_e c^2 (1/lambda - 1/lambda') = 0 $
$ lambda lambda' (1/lambda - 1/lambda') = h/(m_e c) (1 - cos theta) $
#resultb[$ Delta lambda = h/(m_e c) (1 - cos theta) $]

== Onde de matière associée à une particule - Relation de De Broglie

$ arw(p) = h/lambda arw(u) $

On associe donc une longueur d'onde à toute objet selon sa vitesse:
$ lambda_"DB" = h/p $

#figure(image("exemple1.png", width: 80%))
#figure(image("exemple3.png", width: 80%))

