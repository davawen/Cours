#import "@local/physique:0.1.0": *

#show: doc => template(doc)

#let inline(value, title, content) = [
	#underline[*#value:*] 
	#if title != none { [(#title)] } else { [] } \
	#pad(left: 1em, content)
]

#let proposition = inline.with([Proposition])
#let preuve = inline.with([Preuve])
#let corollaire = inline.with([Corollaire])
#let lemme = inline.with([Lemme])
#let remarque = inline.with([Remarque])

= 

==

===

#proposition(none)[
	Soit $F = P/Q$ une fraction admettant $alpha$ comme
	pole simple, alors le coefficient du pôle est
	$P(alpha)/(Q'(alpha))$
]

#preuve(none)[
	La théorie nous donne que:
	$ F = P/Q = A/(X - alpha) + tilde(F) "  " (*) $
	On a donc que:
	$ (P (X - alpha))/(Q) =  $
	Par formule de Taylor, on sait que:
	$ Q &= sum_(k=0)^(+oo) Q^((k)) (alpha) ((X-alpha)^k)/(k!)  \
	&= sum_(k=0)^(+oo) Q^((k)) (alpha) (X-alpha)^k "avec"
	Q^((k)) (alpha) != 0 "car pôle smple"
	$
	Donc:
	$ P/Q (X - alpha) &= (P(X - alpha))/(sum_(k=0)^(+oo) Q^((k)) ((X - alpha)^k)/(k !)) \
	&= (P)/(sum_(k=0)^(+oo) Q^((k)) ((X - alpha)^k - 1)/(k !)) 
	$

	D'où:
	$ (P/Q (X - alpha))(alpha) = P(alpha)/(Q'(alpha)) $

	Et en évaluant en $(*)$
]

#remarque(none)[
	Dans $RR$,
	$ P(t)/Q(t) = A/(t - alpha) + tilde(R) (t) $
	$ P(T) (t - alpha)/(Q(t) - Q(alpha)) = A + (t - alpha) tilde(R) (t) $
]
