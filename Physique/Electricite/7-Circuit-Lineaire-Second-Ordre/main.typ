#import "@local/physique:0.1.0": *
#import elec: *

#show: doc => template(doc)

#titleb[Circuit Linéaire du Second Ordre]

= Oscillations libres du circuit $L,C$

== Circuit $(L, C)$

On utilise le circuit:
#figcan({
	carre((0, 0),
		branch(apply(condensateur)),
		(i: $i$),
		branch(apply(bobine, u: tenserl($u$)))
	)
})

On commence avec C chargé par une tension.

$C$ est en convention générateur, $L$ est en convention récépteur.

On a:
$ u = L (dif i)/(dif t) $
$ i = - C (dif u)/(dif t) $

On remplace pour obtenir une équation différentielle en une seule variable:
#grid(
	columns: (1fr, 1fr),
	$ u = -L C (dif^2 u)/(dif t) $,
	$ i = -L C (dif^2 i)/(dif t) $
)

On peut les écrires sous la forme:
$ (dif^2 u)/(dif t) + omega_0^2 u = 0, "avec" omega_0 = 1/sqrt(L C) $

== Solution d'un oscillateur harmonique

#caution[
	Le plus et le carré dans l'équation sont essentiels pour dire qu'il s'agit d'un oscillateur harmonique.
]

Lorsqu'on est face à un oscillateur harmonique, on peut parachuter la forme de la solution, qui sera:
$ u(t) &= A cos(omega_0 t) + B sin(omega_0 t) \ &= U cos(omega_0 t + phi) $

== Conditions initiales

On a deux constantes à déterminer: $(A, B)$ ou $(U, phi)$, en utilisant les conditions initiales $u(0)$ et $u'(0)$ (solution d'un problème de Cauchy)

Pour obtenir les conditions initiales, on utilisera toujours les conditions de continuité. \
Ici, comme on a deux conditions initiales à déterminer, il nous faudra deux conditions de continuité:
- La continuité de la tension aux bornes de $C$
- La continuité de l'intensité traversant $I$

== Bilan énergétique

On repart des l'équadiffs originales:
$ u = L (dif i)/(dif t) $
$ i = - C (dif u)/(dif t) $

Pour obtenir une puissance, on peut soit multiplier la première par $i$, soit la deuxième par $u$:
$ u = L (dif i)/(dif t) \
u i = L i (dif i)/(dif t) \
-C (dif u)/(dif t) u = (dif)/(dif t) (1/2 L i^2) \
-(dif)/(dif t) ( 1/2 C u^2 ) = dif/(dif t) (1/2 L i^2) \
dif/(dif t) ( 1/2 C u^2 + 1/2 L i^2 ) = 0
$

Donc échange d'énergie sans perte.

= Circuit linéaires du second ordre
== Circuit $R,L,C$ en série

#figcan({
	carre((0, 0),
		branch(apply(dots), u: tenserl($e$)),
		apply(bobine, u: tenserl($u_L$)),
		apply(resistor, u: tenserl($u_R$)),
		(i: $i$),
		branch(apply(condensateur, u: tenserl($u$)))
	)
})

#note[On obtient un résultat similaire avec un circuit $R,L,C$ en parallèle]

On utilise un signal échelon:
$ e(t) = cases(0 "si" t < 0, E "si" t > 0) $

On a:
$ e &= u + u_R + u_L \
&= u + R i + L (dif i)/(dif t) \
&= u + R C (dif u)/(dif t) + L (dif t)/(dif t) \
&= u + R C (dif u)/(dif t) + L C (dif^2 u)/(dif t^2) \
$

On peut le laisser sous cette forme, ou tout diviser par $L C$:
$ (dif^2 u)/(dif t^2) + R/L (dif u)/(dif t) + 1/(L C) u = 1/(L C) e $
On pose: $omega_0^2 = 1/(L C), omega_0 = 1/sqrt(L C)$.
On obtient cette forme:
$ (dif^2 u)/(dif t^2) + omega_0/Q (dif u)/(dif t) + omega_0^2 u = omega_0^2 e $
Pour trouver $Q$, on identifie:
$ R/L = omega_0/Q = 1/(Q sqrt(L C)) <=> Q = L/(R sqrt(L C)) = 1/R sqrt(L/C) $

== Regime libre ou régime propre

#def[Régime libre ou régime propre]: régime se mettant en place en l'absence de source, c'est à dire quand $e = 0$, on s'intéressera donc uniquement à la description du régime transitoire.

== Équation caractérisique - Trois types de régimes

Pour résoudre l'équadiff du second ordre qu'on obtient, on utilise l'équation caractéristique:
$ r^2 + omega_0/Q r + omega_0^2 = 0 $

$ Delta = (omega_0/Q)^2 - 4 omega_0^2 = omega_0^2 (1/Q^2 - 4) $

- Si $Delta > 0$: \
  On trouve deux solutions réelles à l'équation caractéristique.
  $ r_1 = - omega_0/(2 Q) + omega_0/2 sqrt(1/Q^2 - 4) $
  $ r_2 = - omega_0/(2 Q) - omega_0/2 sqrt(1/Q^2 - 4) $
  On a $u(t)$ de la forme $u(t) = A e^(r_1 t) + B e^(r_2 t)$
  #tip[ Le régime transitoire fini par disparaître: les exponentielles doivent tendre vers 0 ]
  $r_2 < 0$ de manière évidente. Pour $r_1$:
  $ - omega_0/(2 Q) + omega_0/(2 Q) underbrace(sqrt(1 - 4 Q^2), < 1) $
  $sqrt(1 - 4Q^2 < 1)$, donc $r_1 < 0$.
  
  On appellera ce régime le régime *apériodique*.

  Comme $Delta > 0$, $1/Q^2 - 4 > 0$, donc:
  $ 1/Q^2 > 4 <=> 1/Q > 2 <=> Q < 1/2 $
  Ainsi:
  $ Q = 1/R sqrt(L/C) < 1/2 <=> R > 2 sqrt(L/C) $
  On verra ce régime avec un fort amortissement (grande résistance).

  #image("./simul_aperiodique.png", width: 50%)

- Si $Delta = 0$, $Q = 1/2 <=> R = 2 sqrt(L/C)$

  Cette situation sera peu commune, car l'égalite doît être rigoureuse. \
  Dans ces conditions, on parlera de régime *critique*. \
  C'est la limite entre les deux autres régimes.

  On a une solution réelle double:
  $ r_0 = - omega_0/(2 Q) $
  La solution est alors de la forme:
  $ u(t) = A e^(r_0 t) + B t e^(-r_0 t) = (A + B t) e^(-r_0 t) $
  
  Le régime critique est le plus rapide dans le retour à zéro.
  #image("./simul_critique.png", width: 50%)

- Si $Delta < 0$,
  $ Q > 1/2 <=> R < 2 sqrt(L/C) $
  On a deux solutions complexes conjuguées:
  $ r_(1,2) = - omega_0/(2 Q) plus.minus j omega_0/2 sqrt(4 - 1/Q^2) $
  #resultb[$ u(t) = A e^(-t omega_0/(2 Q)) e^(j t omega_0/2 sqrt(4 - 1/Q^2)) + B e^(-t omega_0/(2 Q)) e^(-j t omega_0/2 sqrt(4 - 1/Q^2)) $]
  #note[On cherche des solutions réelles. On va donc directement écrire $u(t)$ avec des $cos$ et des $sin$]
  $ u(t) = (U_1 cos(omega t) + U_2 sin(omega t)) e^(-t omega_0/(2 Q))
  \ "avec" omega = omega_0/2 sqrt(4 - 1/Q^2) = (omega_0 sqrt(4Q^2 - 1))/(2 Q)
  \ "ou" u(t) = U cos(omega t + phi) e^(-t omega_0/(2 Q))
  $
  On appellera $omega$ la *pseudo-pulsation*, et ce régime *pseudo-périodique*.
  #image("./simul_pseudoperiodique.png", width: 50%)
  
  On peut ainsi calculer la *pseudo-période*:
  $ T = (2pi)/omega = (4 pi Q)/(omega_0 sqrt(4 Q^2 - 1)) $
  Pour qualifier la baisse d'amplitude avec le temps, on définit le décrément logarithmique:
  $ delta = ln(u(t + n T)/(u(t + (n+1) T))) = 1/N ln(u(t + n T)/(u(t + (n + N)t))) $
  #note[On calcule la valeur d'avant sur la valeur d'après: on mesure la décroissance.]
  
  On reprend la forme $u(t) = U cos(omega t + phi) e^(-t omega_0/(2 Q))$:
  $ delta &= ln(u(t + n T)/u(t + (n+1) T)) \
  &= ln((U cos(omega (t + n T) + phi)e^(-(t + n T) omega_0/(2 Q)))/
	(U cos (omega (t + (n+1)T))e^(-(t + (n + 1) T) omega_0/(2 Q)))) \
  $ 
  Les cosinus sont pris à une période d'écart, et sont donc égaux:
  $
  delta &= ln((exp(-(t + n T) omega_0/(2 Q)))/
	(exp(-(t + (n + 1) T) omega_0/(2 Q)))) \
  &= ln(exp(-(t + n T)omega_0/(2 Q) + (t + (n+1)T) omega_0/(2 Q))) \
  &= omega_0/(2 Q)(-t - n T + t + n T + T ) \
  &= omega_0/(2 Q) T = omega_0/(2 Q) (4 pi Q)/(omega_0 sqrt(4 Q^2 - 1)) \
  &= (2 pi)/sqrt(4 Q^2 - 1)
  $
  Le régime pseudo-périodique est obtenu dans le cas d'un faible amortissement, \
  soit quand $R < 2 sqrt(L/C)$. \
  Si $R << 2 sqrt(L/C) <=> Q >> 1/2$ \
  Quand $Q -> oo$, $delta -> 0$ et $T approx T_0$. Plus l'amortissement est petit, \
  plus on s'approche d'un vrai régime périodique.

== Réponse à un échelon de tension

On a pour l'instant résolu l'équadiff dans le régime libre.

Si on applique un échelon de tension, on tend uste vers un régime permanent de tension différente.

== Aspects énergétiques

On repart de l'équation différentielle:
$ e = u + u_R + u_L \
e i = u i + R i i + L (dif i)/(dif t) i \
e i = u C (dif u)/(dif t) + R i^2 + (dif)/(dif u) ( 1/2 L i^2 ) \
e i = dif/(dif t) (1/2 C u^2) + dif/(dif t) (1/2 L i^2) + R i^2
$ 
Une partie est stockée dans la capacité, une partie est stockée dans la bobine, et une partie part en effet Joule dans la résistance.

== Un exemple: le pont de Wien

#figcan({
	carre((0, 0),
		apply(resistor, label: $R$),
		apply(condensateur, label: $C$, u: tenserl($u_C$)),
		(i: $i$),
		branch((i: $i_1$), apply(condensateur, label: $C$)),
		branch(u: tenserl($u$), (i: $i_2$), apply(resistor, label: $R$))
	)
})

=== Établir l'équation différentielle vérifiée par la tension $u$

$ i = i_1 + i_2 $
$ i_1 = C (dif u)/(dif t) $
$ i_2 = u/R $

$ i = C (dif u_C)/(dif t) <=> (dif u_C)/(dif t) = i/c $
$ e = u + R i + u_C $

On dérive:
$ (dif e)/(dif t) &= (dif u)/(dif t) + R (dif i)/(dif t) + (dif u_C)/(dif t) \
&= (dif u)/(dif t) + R (dif i)/(dif t) + i/C \
&= (dif u)/(dif t) + R (dif)/(dif t) ( i_1 + i_2 ) + (i_1 + i_2)/C \
&= (dif u)/(dif t) + R (dif)/(dif t) (C (dif u)/(dif t) + u/R) + 1/C (C (dif u)/(dif t) + u/R) \
&= (dif u)/(dif t) + R C (dif^2 u)/(dif t^2) + (dif u)/(dif t) + (dif u)/(dif t) + u/(R C)
$

Donc:
$ R C (dif^2 u)/(dif t^2) + 3 (dif u)/(dif t) + u/(R C) = (dif e)/(dif t) $

=== L'écrire sous forme canonique. Donner les expressions de $omega_0$ et $Q$ en fonction de $R, C$

On met sous forme canonique:
$ (dif^2 u)/(dif t^2) + 3/(R C) (dif u)/(dif t) + 1/(R^2 C^2) u = 1/(R C) (dif e)/(dif t) $
$ omega_0^2 = 1/(R^2 C^2) <=> omega_0 = 1/(R C)  $
$ omega_0/Q = 3/(R C) <=> Q = 1/3 $

Le circuit sera toujours apériodique car $Q < 1/2$, on a donc un fort amortissement (logique car dans un $R L C$ série, $Q = 1/R sqrt(L/C)$).
