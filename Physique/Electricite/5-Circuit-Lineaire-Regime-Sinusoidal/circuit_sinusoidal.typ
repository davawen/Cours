#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[Circuit linéaire en régime sinusoïdal forcé]

= Caractéristique d'un signal sinusoïdal

== Définition

On définit un signal sinusoïdal $x$ par:
$ x(t) = X sin(omega t + phi) "ou" x(t) = X cos(omega t + phi) $
On peut très facilement passer du sinus au cosinus.

On a $3$ caractéristiques du signal sinusoïdal.

== Pulsation, fréquence, période

On peut qualifier la "vitesse" du signal par trois valeures:
- $omega$, la pulsation
- $f$, la fréquence
- $T$, la période

Avec:
$ omega = 2 pi f = (2pi)/T $
$ f = 1/T $

== Mesure

#let plotnot = plot.with(x-tick: none, y-tick: none)

On peut mesurer la période $T$ d'un signal en regardant un graphique:
#plotnot((0, 5*calc.pi), y: (-2, 2), x => calc.sin(x))

On peut utiliser un analiseur de spectre (une transformation de Fourrier...) pour obtenir la fréquence ou les fréquences qui compose le signal:

Exemple:

#figcan({
	import draw: *
	arrow((0, 0), (0, 4))
	arrow((0, 0), (4, 0))

	content((2, 5), [Avec $x(t) = X_1 cos(omega_1 t) + x_2 cos(omega_2 t) + X_3 cos(omega_3 t)$])

	content((1, -0.3), $f_1$)
	content((1, 1.3), $X_1$)
	line((1, 0), (1, 1))
	content((2, -0.3), $f_2$)
	content((2, 3.3), $X_2$)
	line((2, 0), (2, 3))
	content((3, -0.3), $f_3$)
	line((3, 0), (3, 2))
	content((3, 2.3), $X_3$)
})

== Amplitude - Valeur efficace

On nomme $X$ l'amplitude de notre signal en fonction du temps:
$ x(t) = underbrace(X, "amplitude") cos(omega t + phi) $

#warn[L'amplitude $X$ n'est pas $V_"cc"$ la valeur crête à crête
donnée par l'oscilloscope]

#let moyenne(x) = $angle.l #x angle.r$

On a 
$ moyenne(x) = 1/T integral_(t_0)^(t_0 + T) x(t) dif t $
$ X_"eff" = sqrt(1/T integral_(t_0)^(t_0 + T) x^2(t) dif t ) $

Pour une sinusoïde pure:
$ moyenne(x) = 0 "et" X_"eff" = X/sqrt(2) $

== Phases

#def[Phase instantané]: Position du signal à un instant donné: $omega t + phi$

#def[Phase à l'origine]: Caractéristique du signal: $phi$

== Déphasage entre deux signaux de même fréquence

Soient deux signaux:

$ x_1 (t) = X_1 cos(omega_1 t + phi_1) $
$ x_2 (t) = X_2 cos(omega_2 t + phi_2) $

Condition à vérifier: $omega_1 = omega_2$.

Dans ce cas, on appelle déphasage des deux signaux la différence entre leurs deux phases:
$ phi = phi_2 - phi_1 $

#note[Cette expression est le déphasage du deuxième signal par rapport au premier. Le déphasage du premier par rapport au deuxième est opposé.]

On peut trouver le déphasage entre deux signaux expérimentalement en mesurant $Delta t$ le décalage entre deux crêtes des deux signaux. On a alors:
$ phi = underbrace((2pi)/T, omega) Delta t $

Attention au signe!

Le signal qui passe par son maximum en premier sera considéré comme l'origine des phases.

= Interêt de la notation complexe
== Exemple du circuit RC <avomir>

#figcan({
	carre((0, 0),
		branch(apply(source-ideale, u: tenserl($e(t)$))),
		apply(resistor, label: $R$),
		(i: $i$),
		branch(apply(condensateur, label: $C$, u: tenserl($u$)))
	)
})

On fait comme avec un régime transitoire:
$ e(t) = E cos(omega t) $
$ e(t) - R i - u = 0 $
$ i = C (dif u)/(dif t) $
$ R C (dif u)/(dif t) + u = E cos(omega t) $
$ (dif u)/(dif t) + u/(R C) = E/(R C) cos(omega t) $

$ u(t) = u_H (t) + u_P (t) $
$ u(t) = U e^(-t/(R C)) + u_P (t) $

Pour trouver une solution particulière, on fait une variation de la constante:
$ u_P (t) = V cos(omega t + phi) $
$ (dif u_P (t))/(dif t) = - V omega sin(omega t + phi) $

On réinjecte:
$ -R C V omega sin(omega t + phi) + V cos(omega t + phi) = E cos(omega t) $
$ -R C V omega ( sin(omega t)cos(phi) + cos(omega t)sin(phi) )
+ V (cos(omega t) cos(phi) - sin(omega t) sin(phi) ) 
= E cos(omega t) $
$ (-R C V omega cos(phi) - V sin(phi)) sin(omega t) 
+ (V cos(phi) - R C V omega sin(phi)) cos(omega t)
= E cos(omega t)
$

D'où:
$ cases(
	-R C V omega cos(phi) - sin(phi) = 0,
	V(cos(phi) - R C omega sin(phi)) = E
) $
$ cases(
	tan(phi) = -R C omega,
	V = E/(cos(phi) - R C omega sin(phi))
) $

$ V &= E/(cos(phi) + tan(phi)sin(phi)) \
&= E/(cos(phi) + (sin^2(phi))/cos(phi)) \
&= (E cos(phi))/(cos^2(phi) + sin^2(phi)) = E cos(phi)
$

$ 1/(cos^2(phi)) = (sin^2(phi) + cos^2(phi))/(cos^2(phi)) = tan^2(phi) + 1 $

$ cos(phi) = 1/sqrt(R^2 C^2 omega^2 + 1) $

#resultb[
$ cases(V = E/(sqrt(R^2 C^2 omega^2 + 1)), tan(phi) = -R C omega) $
]

#align(center, image("yipee.gif", width: 20%))

== Notation complexe

#let Re = math.op("Re")
#let ux = $underline(x)$
#let uX = $underline(X)$

On pose $j^2 = -1$.
On a:
$ x(t) = X cos(omega t + phi) = Re(X e^(j (omega + phi))) = Re(ux) $

Donc:
$ ux(t) &= X e^(j (omega t + phi)) \
&= X e^(j phi) e^(j omega t) \
&= underbrace(uX, "amplitude complexe") e^(j omega t) "avec" uX = X e^(j phi)
$

$ X = |uX| = |ux| $

On peut donc récuperer la phase à l'origine avec l'argument complexe:
$ phi = arg(uX) $
Et la phase instantanée:
$ omega t + phi = arg(ux) $

== Représentation du plan complexe dite de Fresnel

On peut représenter les valeurs électriques complexes dans le plan complexe.

C'est la représentation de Fresnel.

== Dérivation et intégration

On utilise les règles usuelles de dérivation et d'intégration:


$ ux(t) = uX e^(j omega t) $
$ (dif ux(t))/(dif t) = uX j omega e^(j omega t) $
$ integral ux(t) dif t = uX integral e^(j omega t) dif t = uX (e^(j omega t)/(j omega)) = uX (e^(j omega t) (-j omega))/(omega^2) = uX (-j e^(j omega t))/omega $

== Utilisation de la notation complexe pour l'étude du circuit $R$,$C$

#note[
Pour $tan(phi) = A/B$, il y a deux angles (entre $]-pi/2; pi/2[$ ou entre $]pi/2; (3pi)/2[$) qui résolvent cette équation.

On peut étudier le signe de $cos(phi)$ pour trouver lequel est le bon:
- si $cos(phi) > 0$: $phi = arctan(A/B)$
- si $cos(phi) < 0$: $phi = arctan(A/B) + pi$
]

Plutot que faire l'horreur vu @avomir, 
on résout les équations différentielles avec des complexes.

= Lois de Kirchhoff en notation complexe

#note[Convention:
- Une majuscule non-soulignée est une grandeur de régime continu
- Une minuscule non-soulignée est une grandeur de régime sinusoïdale réelle
- Une majuscule soulignée est une amplitude complexe
- Une minuscule soulignée est une sinusoïdale complexe
]

== Validité des loi du continu en sinusoïdale fixé

Les fréquences qu'on va utiliser ne sont pas problématiques, donc
on se place dans l'ARQS et les lois des régimes continus sont vérifiés.

== Loi des nœuds

#let und = math.underline
#let ui = $underline(i)$

$ sum_k epsilon_k I_k = 0 $
De par l'ARQS, on peut passer à:
$ sum_k epsilon_k i_k (t) = 0 $

On passe en notation complexe:
$ sum_k epsilon_k I_k e^(j(omega t + phi)) = 0 $
$ sum_k epsilon_k und(i_k) = 0 $

On divise par $e^(j omega t)$:

$ sum_k epsilon_k I_k e^(j phi) = 0 $
$ sum_k epsilon_k und(I_k) = 0 $

== Loi des mailles

Du même tonneau:
$ sum_k epsilon_k und(u_k) (t) = 0 $  
$ sum_k epsilon_k und(U_k) = 0 $  

#pagebreak()
= Impédance et admittance complexes

== Impédance complexe

En régime continu, on a la loi d'Ohm:
$ U = R I $
$ u(t) = R i(t) $

En sinusoïdal forcé, on va avoir de même:
$ und(U) e^(j omega t) = und(Z) und(I) e^(j omega t) $
$ <=> und(U) = und(Z) und(I) $

On appelle $und(Z)$ l'impédance complexe, et $und(Y) = 1/und(Z)$ l'admittance (qui correspond à la conductance réelle $G = 1/R$).

== Notation exponentielle: impédance et déphasage

À partir du moment ou $und(Z)$ est un complexe, on peut l'écrire sous forme exponentielle:
$ und(Z) = Z e^(j phi') $
$ Z = abs(und(Z)) $

On appelle $Z$ l'impédance, et $phi'$ le déphasage.
Comme $und(U) = und(Z) und(I)$ doit rester vrai, on a $phi = -phi'$.

== Partie réelle et partie imaginaire

On peut aussi écrire $und(Z)$ sous forme algébrique:
$ und(Z) = R + j X $
La partie réelle de $und(Z)$, $R$ est la résistance habituelle. La partie imaginaire $X$ est la réactance.

== Exemples d'impédance 

On revisite les dipôles habituels:

- Résistance $R$: on a $u(t) = R i(t)$, qu'on transforme en:
  $ und(u)(t) = R und(i) (t) $
  $ und(U) = R und(I) $
  Par identification, on a $und(Z) = R$ (donc l'impédance est réelle).

  Comme $und(Z) in RR$, aucun déphasage n'est introduit.
- Inductance $L$: on a:
  $ u(t) = L (dif i)/(dif t) $
  $ und(u)(t) = L j omega und(i) (t) $
  D'où (on indentifie): $und(Z) = j L omega = L omega e^(j pi/2)$ \
  $und(Z)$ est un imaginaire pur ($L$ et $omega$ sont des réels positifs), donc l'inductance va introduire un déphasage de $pi/2$.
- Capacité $C$: on a:
  $ i(t) = C (dif u)/(dif t) $
  $ und(i)(t) = C j omega und(u)(t) $
  $ und(u)(t) = und(i)(t) 1 / (C j omega) $
  On a donc $und(Z) = 1/(C j omega) = -j 1/(C omega)$.
  $und(Z)$ est encore un imaginaire pur, mais il est négatif. Il introduit un déphasage de $-pi/2$.

== Association de dipoles

#figcan({
	serie((0, 0), 
		apply(resistor, label: $und(Z_1)$, u: tenserl($u_1$)),
		apply(resistor, label: $und(Z_2)$, u: tenserl($u_2$)),
		apply(resistor, label: $und(Z_3)$, u: tenserl($u_3$)),
		apply(resistor, label: $und(Z_4)$, u: tenserl($u_4$)),
	)
})

$ und(u) &= und(u_1) + ... + und(u_4) \
&= und(Z_1) und(i) + ... + und(Z_4) und(i) \
&= und(i) ( und(Z_1) + ... und(Z_4) ) \
&= und(Z_"eq") und(i) $

Comme avec des résistances normales:

Les impédances s'ajoutent en série.
$ und(Z_"eq") = sum_k und(Z_k) $
L'inverse des impédances s'ajoute en dérivation:
$ 1/und(Z_"eq") = sum_k 1/und(Z_k) $

#warn[One does not simply ajouter des nombres complexes. \
Faire attention aux calculs de con. \
Surtout quand il faut trouver des modules et des arguments.]

= Ponts diviseurs

== Pont diviseurs de tensions

#figcan({
	carre((0, 0),
		branch(),
		apply(dots),
		(i: $i$),
		retour(apply(dots), (i: $i$, rev: true)),
		branch(
			u: tenserl($u$, size: -0.4),
			apply(resistor, label: $Z_2$),
			apply(resistor, label: $Z_1$, u: tenserl($u_1$)),
		)
	)
})

$ und(u) = (und(Z_1) + und(Z_2)) und(i) <=> und(i) = und(u)/(und(Z_1) + und(Z_2)) $

$ und(u_1) = und(Z_1) und(i) $
D'où:
$ und(u_1) = u und(Z_1)/(und(Z_1) + und(Z_2)) $

== Pont diviseur de courant

#figcan({
	derivation((0, 0), i: $i$, u: tenserl($u$),
		apply(resistor, label: $und(Z_1)$),
		apply(resistor, label: $und(Z_2)$),
	)
})

$ und(Z_1) und(i_1) = und(Z_2) und(i_2) <=> und(i_2) = und(Z_1)/und(Z_2) und(i_1) $

$ und(i) = und(i_1) + und(i_2) = und(i_1) ( 1 + und(Z_1)/und(Z_2) ) $
D'où:
$ und(i_1) = und(i) und(Z_2)/(und(Z_1) + und(Z_2)) $

= Régime sinusïdal forcé et régime transitoire

On peut observer le délai entre le régime transitoire et le régime permanent.

#align(center, image("sinusoidal.png"))

= Application: Analyse d'un chronogramme
