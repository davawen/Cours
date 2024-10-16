#import "@local/physique:0.1.0": *
#import optique: *
#import xarrow: xarrow

#show: doc => template(doc)

#titleb[Association de lentilles \ Instruments d'optique]

#let lc = math.cal($L$)

= Association de lentilles

== Méthode générale

Systématiquement faire un schéma synoptique:
$ A -->^(lc_1) B -->^(lc_2) A' -->^(lc_3) ... $

On peut utiliser des conditions particulières dans ce schéma. Par exemple, si notre objet est à l'infini:

$ oo -->^(lc_1) F'_1 -->^(lc_2) ... $

Ou si on sait qu'une de nos lentilles donne une image à l'infini:
$ F'_1 -->^(lc_1) oo -->^(lc_2) ... $

== Cas d'une système afocal

Mis à part les deux cas particuliers qu'on va voir (système afocal et #todo[]), on ne va pas beaucoup parler d'association de lentilles

Dans un système afocal, l'infini est conjugué à l'infini:

$ oo -->^(lc_1) F'_1 -->^(lc_2) ... --> F'_n -->^(lc_n) oo  $

Dans le cas particulier de deux lentilles, on a:
$ oo -->^(lc_1) F'_1 = F'_2 -->^(lc_2) oo $

Les foyer images et objets des deux lentilles sont nécessairement confondues. On a:
$ ov(O_1 O_2) = ov(O_1 F'_1) + ov(F'_1 O_2) = f'_1 + f'_2 $

== Lentilles accolées

#def[Lentilles accoléés]: Lentilles dont les centre sont confondus.

Si deux lentilles $lc_1$ et $lc_2$ sont accolées, on considère que leurs centre respectifs $O_1$ et $O_2$ sont égaux.

Si on a:
$ A -->^(lc_1) A_1 -->^(lc_2) A' $

On va chercher le système optique équivalent possédant une seule lentille  $lc_3$ tel que:
$ A -->^(lc_3) A' $

On utilise la relation de conjugaison:
$ 1/ov(O A_1) = 1/f'_1 + 1/ov(O A) $
$ 1/ov(O A') &= 1/f'_2 + 1/ov(O A_1) \
&= 1/f'_2 + 1/f'_1 + 1/ov(O A) \
&= (f'_1 + f'_2)/(f'_1 f'_2) + 1/ov(O A)
$

Une lentille de distance focale $(f'_1 f'_2)/(f'_1 + f'_2)$ est équivalente à un système focale de deux lentilles #underline[accolées].

On appelle cette relation *théorème des vergences*, car on a $V_3 = V_1 + V_2$

= L'œil

== Description

L'œil est constitué de plusiers parties:
1. Le nerf optique qui transmet le signal au cerveau
2. La rétine, où les images se forment à l'aide de cellules photosensibles
3. La pupille (la partie qui nous interésse)

L'objet traverse un premier dioptre, l'humeure aqueuse, puis passe dans la pupille qui agit comme une lentille.

L'œil capte des rayons de toute direction, on peut donc difficilement se placer dans les conditions de Gauss. L'iris agit ainsi comme un diaphragme qui va limiter l'angle des rayons incident.

L'indice entre l'humeur aqueuse et le cristallin sont généralement très proche, donc on va ignorer la traversée de ce dioptre et on considérera une seule lentille.

== Caractéristiques de l'œil

=== L'accomodation
La principale caractéristique de l'œil est *l'accomodation*.

Dans un œil, on ne peut déplacer ni l'écran, ni la lentille. Pour voir à différentes distances, le cristallin, qui est un muscle, va se contracter afin de modifier la distance focale de la pupille et changer.

De ce fait, cela permet de voir toute une zone. On va définir deux choses:
- Le Punctum Remotum (PR), le point le plus éloigné qu'on peut observer.
- Le Punctum Proximum (PP), le point le plus proche qu'on peut observer.

Ces valeures sont des *points*, #underline[PAS] des distances.

Lorsque l'œil regarde le PR avec la rétine, il est au repos. Le cristallin n'a pas besoin de se contracter. \
Lorsque l'œil regarde le PP, il est le plus contracté.

Pour un œil normal, sans défaut, le PR est à l'infini et le PP est à $25 "cm"$.

=== L'acuité visuelle

#def[Acuité visuelle]: Capacité à distinguer deux points

On parle aussi de résolution angulaire. Un œil normal est capable de distinguer deux points à partir du moment où l'angle des rayon incidents dépasse $4 dot 10^(-4) "rad"$

#figcan({
	import draw: *

	line((-2, 0), (2, 0), mark: (end: "straight"))
	line((-2, 0.5), (2, 0))
})

=== Champ de l'œil

Espace où l'image se forme sur la zone sensible de la rétine.

== Modélisation de l'œil

On va modéliser l'œil par une lentille pour le cristallin et par un écran pour la rétine.

On peut modeliser l'accomodation par un changement de lentille (ce qui n'est pas très pratique), ou par déplacement de l'écran sur l'axe optique.

On détermine la position de l'écran pour un objet à $25 "cm"$, et un objet à l'infini.

En plaçant l'écran entre ces deux positions, on pourra recueillir l'image d'un objet entre $25 "cm"$ et l'infini.

== Défauts de l'œil

On va parler des 4 défauts principaux.

=== Myopie

Le cristallin est trop convergent.
Les rayons à l'infini viennent converger avant la rétine.

Le PR est proche de l'œil, on ne peut pas voir au-delà.

Pour rectifier la miopie, on place une lentille divergente (dîte correctrice) avant le cristallin afin d'envoyer les rayons à l'infini sur le PR de l'œil myope:

$ oo -->^(lc_c) "PR" xarrow("œil myope") "rétine" $

=== Hypermétropie

L'hypermétropie est l'inverse de la myopie. Le cristallin n'est pas assez convergent, les rayons convergent derrière la rétine.

Or, tout les œils peuvent accomoder, l'hypermétropie peut se "régler d'elle même" en accomodant constamment. Cela-dit, l'accomodage est fatigant et l'hypermétropie se détecte par une fatigue visuelle constante.

Pour la rectifier, on place une lentille correctrice convergente avannt le cristallin.

=== Astigmatie
Le cristallin n'est pas parfaitement sphérique, la lentille n'est pas symmétrique.

=== Presbytie
Le cristallin est moins souple, on peut moins accomoder.
