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
  resistlr((0, 0), label: [Dipôle], name: "d")

  node((-2, 0), name: "A")
  node((2, 0), name: "B")

  fil("A", "d.l", i: $i$)
  fil("d.r", "B")

  tension("d.l", "d.r", (0, -0.5), tenserl($u$))
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
  resistlr((-2, 0), name: "d1", tense: tenserl($u_1$))
  resistlr((0, 0), name: "d2", tense: tenserl($u_2$))
  resistlr((2, 0), name: "d3", tense: tenserl($u_3$))
  resistlr((4, 0), name: "d4", tense: tenserl($u_4$))

  tension("d4.r", "d1.l", (0, -1), tenselr($u$), size: 3.5)

  fil((-3, 0), "d1.l", "d1.r", "d2.l", "d2.r", "d3.l", "d3.r", "d4.l", "d4.r", (5, 0), i: $i$)
})

En série, l'intensité reste la même et les tensions s'additionnent:
$ u = sum_k u_k $

Pour vérifier qu'un circuit est en série, on suit le chemin des électrons.
Si on rencontre un (vrai!) nœud, on n'est pas en série.

== En parallèle

On met des éléments en parallèles les un aux autres:

#figcan({
  derivation((0, 0), i: $i$, tense: tenserl($u$),
    apply(resistlr),
    apply(resistlr),
    apply(resistlr),
    apply(resistlr),
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

Bon, on appelle tout une résistance.

#note[Un résistor peut quand-même avoir des comportements un peu chelou qui ne peuvent pas être modélisés par la caractéristique résistance]

Schéma:
#figcan(resistlr((0, 0)))

En convention récepteur, la caractéristique du résistor est une droite et obéit à $u = R dot i$.

Attention, en convention générateur, le signe est inversé, on a $u = -R dot i$

=== Association en série
#figcan({
  resistlr((-2, 0), name: "d1", label: $R_1$)
  resistlr((0, 0), name: "d2", label: $R_2$)
  resistlr((2, 0), name: "d3", label: $R_3$)

  tension("d3.r", "d1.l", (0, 1), tenselr($u$), size: 1)

  fil((-3, 0), "d1.l", "d1.r", "d2.l", "d2.r", "d3.l", "d3.r", (3, 0), i: $i$)
})

On a:
$ u &= u_1 + u_2 + u_3 \
 &= R_1 i + R_2 i + R_3 i \
 &= i(R_1 + R_2 + R_3)
$

Donc une association en série de résistances est équivalente à une grosse résistance:

#figcan({
  resistlr((0, 0), name: "D", size: 1, label: $R_"eq"$)
  fil((-3, 0), "D.l", "D.r", (3, 0), i: $i$)
})

Avec:
$ R_"eq" = sum_k R_k $

=== Association en parallèle

#figcan({
  resistlr((0, 2), name: "d2")
  resistlr((0, 1), name: "d3")
  resistlr((0, 0), name: "d4")

  node((-2, 1), name: "A")
  node((2, 1), name: "B")

  tension("d2.r", "d2.l", (0, 0.7), tenselr($u$), size: 1.2)

  fil(rev: 1, "A", "d2.l", "A", "d3.l", "A", "d4.l")
  fil("d2.r", "B", "d3.r", "B", "d4.r", "B")

  fil((-3, 1), "A", i: $i$)
  fil("B", (3, 1), i: $i$)
})

On a:
$ i &= i_1 + i_2 + i_3 \
&= u_1/R_1 + u_2/R_2 + u_3/R_3 \
&= underbrace((1/R_1 + 1/R_2 + 1/R_3), "1/R_eq") u
$

#caution[On fait très attention à l'homogénéité. On ne peut pas juste poser
$R = 1/R_1 + 1/R_2 + 1/R_3$, car les unités ne fonctionnent pas.]

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

#todo[Dessine la bobine fdp]

On a la relation:
$ u = L (dif i)/(dif t) $

La bobine est un fil enroulé autour d'un truc. Le fil possède très probablement une résistance.

La majorité du temps, on représentera une bobine par une inductance ET une résistance.

On ne peut pas exclure un comportement de type condensateur dans une bobine.
