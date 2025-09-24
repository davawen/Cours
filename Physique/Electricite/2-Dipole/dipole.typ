#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[Dipôle linéaires]

= Notion de pôle électromagnétique

== Definition d'un dipôle

Un dipôle est un élément de circuit possédant deux bornes.

== Caractéristique d'un dipôle

Il y a deux caractéristique d'un dipôle: la tension et l'intensité.

#figcan({
  serie((0, 0), i: $i$, left: "A", right: "B",
    apply(resistor, u: tenserl($u$))
  )
})

On peut grapher l'intensité en fonction de la tension, ou la tension en fonction de l'intensité.

On appelle ce graphe la *caractéristique* d'un dipôle.

#warn[
Certains dipôles ne sont pas symmétriques. Les bornes $A$ et $B$ ne répondront pas de la même manière aux changements d'intensite et de tension. Exemple: la diode.
]

== Dipôles actifs ou passifs

#def[Dipôle actif]: Un dipôle dont la caractéristique ne passe pas par l'origine \
#def[Dipôle passif]: Un dipôle dont la caractéristique passe par l'origine.

#figure(caption: [Dipôle passif et actif], grid(columns: (1fr, 1fr), 
  image("dipole-passif.png"),
  image("dipole-actif.png")
))

== Dipôle linéaire ou non-linéaire

#def[Dipôle linéaire]: Dipôle dont la caractéristique est une droite. \
#def[Dipôle non-linéaire]: Dipôle dont la caractéristique n'est pas droite.

#figure(caption: [Dipôle linéaire et non-linéaire], image("dipole-lineaire-non-lineaire.png", width: 80%))

Deux dipôles connus qui ne rentrent pas dans cette catégorie sont les condensateurs et les bobines. En statique, il n'existe pas de caractéristique de ces éléments.

Tant qu'on ne s'intéresse qu'à des dérivées ou à des intégrales (comme pour les condensateurs ou les bobines), les opérations resterons linéaires ($(f + g)' = f' + g'$, $integral (f + g) = integral f + integral g$).

On considéra donc les condensateurs et les bobines comme des dipôles linéaires.

Dès lors qu'on fera des produits/quotients d'intensité, de fonctions ou de dérivés, on sortira du cadre des dipôles linéaire.

Par la suite, on ne considérera que des dipôles linéaires.

== Générateurs - Récepteurs $!=$ Actif - Passif

Un dipôle générateur est un dipôle où la *puissance fournie* est plus grande *puissance reçue*.

Un dipôle récepteur est un dipôle où la *puissance reçue* est plus grande *puissance fournie*.

Il n'y a aucun lien formel avec *actif* et *passif* (même si les dipôles actifs auront souvent des allures de générateurs).

== Limites de fonctionnement

Les dipôles possèdent une puissance maximale de fonctionnement, $P_max$.
Au-delà de cette puissance, il est probable qu'ils grillent.

#figure(image("puissance-max.png", width: 50%))

= Association de dipôles

== En série

On met des élément les uns après les autre:
#figcan({
  serie((0, 0), i: $i$, u: tenserl($u$),
    apply(resistor, u: tenserl($u_1$)),
    apply(resistor, u: tenserl($u_2$)),
    apply(resistor, u: tenserl($u_3$)),
  )
})

En série, l'intensité reste la même et les tensions s'additionnent:
$ u = sum_k u_k $

Pour vérifier qu'un circuit est en série, on suit le chemin des électrons.
Si on rencontre un (vrai!) nœud, on n'est pas en série.

== En parallèle

On met des éléments en parallèles les un des autres:

#figcan({
  derivation((0, 0), i: $i$, u: tenserl($u$),
    apply(serie, (i: $i_1$), apply(resistor)),
    apply(serie, (i: $i_2$), apply(resistor)),
    apply(serie, (i: $i_3$), apply(resistor)),
  )
})

En parallèle, la tension reste la même et les intensités s'additionnent:
$ i = sum_k i_k $

== Point de fonctionnement

On essaye de comprendre comment un circuit fonctionne dans sa globalité.

#def[Point de fonctionnement]: Intersection des caractéristiques d'un circuit. C'est le point qui correspond au fonctionnement "normal" de l'association.

#image("fonctionnement.png", width: 50%)

Ici, on a deux droites, on peut le résoudre analytiquement.

= Dipôles linéaires passifs

== Résistor de résistance $R$

Il faut faire la distinction entre le composant (résistor) et sa caractéristique (résistance).

#note[La différence réside dans le fait qu'un résistor (qui est un composant réel) peut avoir des comportements chelou (particulièrement à haute tension ou intensité, ou dans un champ magnétique, etc...) qui ne peuvent pas être modélisés par la caractéristique résistance (qui est une approximation linéaire "parfaite")]

En électricité, on parlera presque exclusivement de résistance.

Schéma:
#figcan(resistor((0, 0)))

En convention récepteur, la caractéristique du résistor est une droite et obéit à $u = R dot i$.

Attention, en convention générateur, le signe est inversé, on a $u = -R dot i$

=== Association en série
#figcan({
	serie((0, 0), u: tenserl($u$), i: $i$,
		apply(resistor, label: $R_1$, u: tenserl($u_1$)),
		apply(resistor, label: $R_2$, u: tenserl($u_2$)),
		apply(resistor, label: $R_3$, u: tenserl($u_3$)),
	)
})

On a:
$ u &= u_1 + u_2 + u_3 \
 &= R_1 i + R_2 i + R_3 i \
 &= i(R_1 + R_2 + R_3)
$

Donc une association en série de résistances est équivalente à une grosse résistance:

#figcan({
  resistor((0, 0), name: "D", size: 1, label: $R_"eq"$)
  fil((-3, 0), "D.l", "D.r", (3, 0), i: $i$)
})

Avec:
$ R_"eq" = sum_k R_k $

=== Association en parallèle

#figcan({
	derivation((0, 0), i: $i$, left: "A", right: "B",
        u: tenserl($u$),
		apply(resistor),
		apply(resistor),
		apply(resistor),
	)
})

On a:
$ i &= i_1 + i_2 + i_3 \
&= u_1/R_1 + u_2/R_2 + u_3/R_3 \
&= underbrace((1/R_1 + 1/R_2 + 1/R_3), "1/R_eq") u
$

On pose $G$ la conductance avec $G = 1/R$.
Ici, on a:
$ G_"eq" = sum_k G_k  $

Donc:
$ R_"eq" = 1/G_"eq" $

=== Puissance

On a:
$ cal(P)_"reçue" = u dot i $
Et:
$ u = R dot i $

Donc:
$ cal(P)_"reçue" = R i^2 = u^2/R $

Donc $cal(P)_"reçue" > 0$ en convention récepteur.

== Bobine d'inductance $L$

Schéma:
#figcan({
  bobine((0, 0), u: tenserl($u$))
})

On a la relation:
$ u = L (dif i)/(dif t) $

La bobine est un fil enroulé autour d'un truc. Le fil possède très probablement une résistance.
La majorité du temps, on représentera une bobine par une inductance ET une résistance.
On ne peut pas exclure un comportement de type condensateur dans une bobine.

#note[
  On distingue encore une fois l'*inductance*, qui est la caractéristique
  parfaite qu'on trouve dans les schémas d'électricité, et la *bobine*,
  qui est un composant réel. Une bobine réelle sera _presque toujours_ 
  représentée par une inductance _et_ une résistance interne:
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: horizon + center,
    image("bobine.jpg", width: 70%), $<==>$, 
    figcan(serie((0, 0), apply(resistor, label: $r$), apply(bobine, label: $L$)))
  )
]

=== Association en série

Plusieurs bobines:
#figcan({})

$ u &= u_1 + u_2 + u_3 \
&= L_1 (dif i)/(dif t) + L_2 (dif i)/(dif t) + L_3 (dif i)/(dif t) \
&= (L_1 + L_2 + L_3) (dif i)/(dif t)
$

Les inductances s'ajoutent en série.
$ L = sum_k L_k $

=== Association en parallèle
#figcan({
  derivation((0, 0), i: $i$, u: tenserl($u$),
    apply(bobine),
    apply(bobine)
  )
})

$ i = i_1 + i_2 \
<=> (dif i)/(dif t) = (dif i_1)/(dif t) + (dif i_2)/(dif t) \
(dif i)/(dif t) = u/L_1 + u/L_2 \
= underbrace((1/L_1 + 1/L_2), "1/L_eq")u 
$

L'inverse des inductances s'ajoutent en parallèle:
$ 1/L_"eq" = sum_k 1/L_k $

=== Puissance

On a:
$ cal(P)_"reçue"(t) = i(t) u(t) $

Or,
$ u(t) = L (dif i)/(dif t) $

D'où:
$ cal(P)_"reçue"(t) = i(t) L (dif i(t))/(dif t) \
= L i(t) (dif i(t))/(dif t) \
= (dif)/(dif t)(1/2 L dot i^2(t))
$

Or, on a aussi que la puissance est l'énergie au cours du temps:
$E = cal(P) dot T$ pour une puissance constante, et pour une puissance variable:
$ E(t) = integral_0^t cal(P)(x)dif x \
= integral_0^t (dif)/(dif x) (1/2 L dot i^2(x)) dif x \
= 1/2 L dot i^2 (t)
$

Intuition: si l'intensité augmente, la bobine est réceptrice. Si l'intensité diminue, la bobine est génératrice. Elle lisse les changement d'intensité dans le circuit.

On a l'inductance définie en Henry, $H = V dot A^-1 dot s$

== Condensateur de capacité $C$

Schéma:

#figcan({
  draw.scale(1)
  condensateur((0, 0), u: tenserl($u$, offset: (0, -0.3)), name: "c")

  fil((-1, 0), "c.l", "c.r", (1, 0), i: $i$)

  draw.content((-0.4, -0.6), $q$)
  draw.content((0.3, -0.6), $-q$)
})

#note[
  Même remarque sur la différence entre condensateur et capacité...
]

Un condensateur est composé de deux plaques conductrices séparée par un matériau di-électrique (isolant).

En tirant de la charge d'un coté du condensateur, elle est accumulée de l'autre coté.

On a:
$ q = C dot u $

Avec $q$ la charge du condensateur, $C$ la capacité en farads ($F$) et $u$ la tension aux bornes.

(Donc: $u = q/C$)

Pour connaître l'intensité d'un capaciteur, on repart de la définition de l'intensité:
$ i = (dif q)/(dif t) = dif / (dif t) (C dot u) = C (dif u)/(dif t) $


=== Association en série:

#figcan({

})

On a:
$ u = u_1 + u_2 \
(dif u)/(dif t) = (dif u_1)/(dif t) + (dif u_2)/(dif t) \
= i/C_1 + i/C_2 \
= (1 / C_1 + 1/C_2)i
$

En série, la somme des capacité s'additionnent

=== Association en parallèle:

#figcan({
  derivation((0, 0), inset: 1.4, i: $i$, 
    apply(condensateur),
    apply(condensateur),
    apply(condensateur),
  )
})

$ i = i_1 + i_2 + i_3 \
= C_1 (dif u)/(dif t) + C_2 (dif u)/(dif t) + C_3 (dif u)/(dif t) \
= (C_1 + C_2 + C_3)(dif u)/(dif t)
$

En parallèle, les capacité s'ajoutent:
$ C_"eq" = sum_k C_k $

#caution[Les règles d'ajout des tensions/intensités sont inversées entre les capaciteurs et les autres dipôle.]

=== Puissance

On a:
$ cal(P)_"reçue"(t) = i(t) u(t) \
cal(P)_"reçue"(t) = u(t) C (dif u)/(dif t) \
cal(P)_"reçue"(t) = (dif)/(dif t)(1/2 C dot u(t)^2)
$

D'où:
$ E_c (t) = 1/2 C dot u(t)^2 $

Si l'énergie augmente, on la stocke, et on peut la restituer.

= Dipoles linéaires actifs

== Source idéale de tension

Rappel: les dipoles linéaires actifs ont une caractéristique qui ne passe pas par l'origine.

Situation la plus simple: la caractéristique est une droite.

Si cette droite est horizontale, la tension aux bornes du dipôle sera toujours la même.
On nomme $E$ cette tension.
On appelle ce genre de dipôle une *source idéale de tension*, de symbole:

#figcan({
  source-ideale((0, 0), name: "s", label: tenselr($E$), u: tenserl($u$))
  fil((-1, 0), "s.l", "s.r", (1, 0), i: $i$)
})

On se place le plus souvent en convention générateur, mais on peut ne peut le faire:
#caution[Faire attention au signe!!]

== Hors programme: source idéale de courant

On nomme une source idéale de courant une source d'on l'intensité est la même peut-importe la tension.

Sa caractéristique (avec l'intensité en abscisse) est une droite verticale. On nomme $I_0$ son intensité.

#figcan({
  source-ideale-courant((0, 0), name: "s", u: tenserl($u$))
  fil((-1, 0), "s.l", "s.r", (1, 0), i: $I_0$)
})

Il existe une combinaison des deux, avec une caractéristique "carré" (de tension constante jusqu'a une certaine intensité, à partir de laquelle l'intensité devient constante).

== Source réelle = modèle de Thévenin

La caractéristique d'une source réelle est une droite qui n'est pas horizontale, pas verticale, et qui ne passe pas par l'origine.

Cette droite a donc une pente, notée $-R$, elle intersecte l'axe des ordonnées en $E$, la tension quand l'intensité est nulle, et elle intersecte l'axe des abscisses en $I_0$, l'intensité quand la tension est nulle.

On a donc:
$ u = E - R dot i $

Par homogénéité, $E$ et $R dot i$ sont en Volts, donc on peut poser les tensions $u_1$ et $u_2$ avec:
$ u = u_1 + u_2 $
Avec $u_1 = E$ et $u_2 = -R dot i$

On peut représenter un dipôle de tension constante $u_1$ par une source idéale de courant de tension $E$, et un dipôle de tension $-R dot i$ avec un résistor de résistance $R$ en convention générateur:

#figcan({
  //serie()

  source-ideale((0, 0), label: tenselr($E$), u: tenselr($u_1$), name: "s")
  resistor((2, 0), label: $R$, u: tenselr($u_2$), name: "r")

  fil((-1, 0), "s.l", "s.r", "r.l", "r.r", (4, 0), i: $i$)
  tension((-1, 0), (4, 0), (0, -1.3), tenselr($u$), size: 4)
})

Le modèle de Thevenin est donc caractérisé par:
- La tension à vide de force électromotrice $E$
- La résistance interne $R$

(D'où le fait qu'une source idéale de tension n'existe pas dans la vrai vie: pas de résistance nulle)

=== Modèle de Norton (hors programme)

On refait la même chose avec une source idéale de courant:

On a $I_0$ l'intensité quand la tension est nulle, et $E$ la tension quand l'intensite est nulle.

Sa caractéristique (d'axe $u$) est une droite dont la pente est $-1/R$

On peut poser:
$ R dot i &= E - u \
<=> i &= E/R - 1/R u $

Par homogénéité, $i = i_1 + i_2$ avec:
- $i_1 = E/R = I_0$ (modélisable par une source idéale de courant d'intensité $I_0$)
- $i_2 = -1/R$ (modélisable par un résistor de résistance $R$)

On a:
#figcan({
  derivation((0, 0), i: $i$, u: tenselr($u$),
    apply(source-ideale-courant, label: tenselr($I_0 = E/R$)),
	(inset: 1),
    apply(resistor, label: $R$)
  )
})

On peut caractériser le modèle de Norton par:
- Le courant de court-circuit $I_0 = E/R$
- La résistance interne $R$

On peut basculer du modèle de Norton vers le modèle de thévenin (avec le terme $E/R$).
