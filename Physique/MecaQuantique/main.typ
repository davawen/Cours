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

== Vérification expérimentale

Plusieurs expériences ont permi de vérifier le caractère à la fois
corpusculaire et ondulatoire des objets de petite taille:

+ Expérience de Davisson Germer
+ Interférence des électrons

#pagebreak()

= Fonction d'onde et probabilité

== Interférence et probabilité

On définit la *fonction d'onde* par une application de l'espace
et du temps dans $CC$.

La probabilité $dif P$ qu'une particule se trouve à l'instant $t$
au sein d'un volume élémentaire $dif tau$ autour d'un point $M(x, y, z)$
vaut le module de la fonction d'onde:
$ dif P(x, y, z, t) = abs(psi(M, t))^2 dif tau $

== Inégalité de Heisenberg

=== Inégalité de Heisenberg spatiale

#let pi = math.pi

On ne peut pas à la fois connâitre parfaitement la position et la 
vitesse d'un objet. On peut connaître les deux à la fois mais
avec une incertitude plus grande. En posant $Delta x$
et $Delta p_x$ les incertitudes sur la position et sur la 
quantité de mouvement, ainsi que $planck.reduce = h/(2 pi)$, on a:
$ Delta x Delta p_x >= planck.reduce/2 $

En mécanique quantique, on travaille avec des loi de probabilité
plutôt que des directement des valeurs

=== Inégalité de Heisenberg entre énergie et temps

De même:
$ Delta E Delta t >= planck.reduce/2 $

=== Exemples

#figure(image("heisenberg.png"))

= Quantification de l'énergie

== Notion de quantification

(On verra en deuxim̀e année en résolvant l'équation de Schrodinger)

On parle de quantification si l'ensemble des valeurs atteignables
est discret.

== Spectre de l'atome d'hydrogène

En notant $R_H$ la constante de Rydberg, $n$ et $m$ les niveaux d'énergie
de l'atome, on obtient la fréquence de la lumière émise par:
$ 1/lambda = R_H (1/n^2 - 1/m^2) $

== Modèle Plantétaire de Bohr

On fait une analogie avec les planètes (totalement préscientifique?).
On considère que les électrons suivent une interaction électrostatique
qui s'apparente à la gravité.

On considère le système de l'électron dans le référentiel
étudié supposé galiléen.
On fait un bilan des forces:
- La force électromagnétique: $arw(f)_e = 1/(4 pi epsilon_0) (q_e q_p)/r^2 arw(u_r)$

Par le premier principe (actions réciproques):
$ m_p (dif arw(v_p))/(dif t) = - m_e (dif arw(v)_e)/(dif t) $
$ norm(arw(v)_p)/norm(arw(v_e)) = m_e/m_p << 1 $
On considère donc que le proton est quasi-immobile par-rapport à 
l'électron, et on prend le proton $P$ comme origine .

La force $arw(f_e)$ est donc une force newtonienne.
On calcule le moment cinétique et on trouve que l'électron est en
mouvement plan autour du proton.

On calcule le moment cinétique:
$ L_P = m_e r^2 dot(theta) $
#parachute[
  $ L_P = n planck.reduce "selon Bohr" $
]

On calcule l'énergie mécanique:
$ E_m = E_c + E_p = 1/2 m v^3 - e^2/(4 pi epsilon_0 r) $

On fait un PFD:
$ m arw(a) = -1/(4 pi epsilon_0) e^2/r^2 arw(u_r) $
On fait l'hypothèse des trajectoires circulaires à vitesse uniforme, donc:
$ arw(v) = R dot(theta) arw(u_theta) $
$ arw(a) = R diaer(theta) arw(u_theta) - R dot(theta)^2 arw(u_r)
= - R dot(theta)^2 arw(u_r)
$

On projette le PFD sur $arw(u_r)$:
$ m R dot(theta)^2 = 1/(4 pi epsilon_0) e^2/r^2 $

#let hbar = $planck.reduce$

On pose:
$ v^2 = e^2/(4 pi epsilon_0 r m_e) $
$ v = sqrt(e^2/(4 pi epsilon_0 r m_e)) $
$ L_P = m_e r v = n hbar  $
$ m_e r sqrt(e^2/(4 pi epsilon_0 m_e r)) = n hbar $

$ sqrt((e^2 m_e r)/(4 pi epsilon_0)) = n hbar $

Donc:
$ r = (4 pi epsilon_0 n^2 hbar^2)/(m_e e^2) $
$ v = (n hbar)/(m_e r) = (n hbar m_e e^2)/(m_e 4 pi epsilon_0 n^2 h^2)
= e^2/(4 pi epsilon_0 n hbar)
$

$ E_m = 1/2 m_e v^2 = e^2/(4 pi epsilon_0 r) $
$ E_m = 1/2 m_e e^4/((4 pi epsilon_0)^2 n^2 hbar^2)
- (m_e e^4)/((4pi epsilon_0)^2 n^2 hbar^2) \
= - (m_e e^4)/(32 pi^2 epsilon_0^2 n^2 hbar^2) \
= - E_1/n^2
$

$ E_1 = (m_e e^4)/(32 pi^2 epsilon_0^2 hbar^2) = 2.18 times 10^(-12) "J" = 13.6 "eV" $

$ Delta E = - E n + E m
= (-13.6 "eV")/m^2 + (13.6 "eV")/n^2 \
= 13.6 (1/n^2 - 1/m^2)
$

$ Delta E = h c/lambda $
$ 1/lambda = (13.6 "eV")/(h c) (1/n^2 - 1/m^2) $
