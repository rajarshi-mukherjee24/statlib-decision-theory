# Total variation and the minimal total error

The [sum-minimizing test](02-neyman-pearson.md#lem:np-sum) has a value that is a distance between
the hypotheses. This chapter defines the total variation distance, records the
integral form we need, and proves the identity that the smallest achievable
$\alpha + \beta$ equals $1 - \mathrm{TV}(P,Q)$. That identity is the hinge of
the development: it turns a statement about optimal tests into one about a
distance, which [Chapter 4](04-f-divergences.md) then bounds and
[Chapter 5](05-lecam-two-point.md) turns into a minimax lower bound.

<a id="def:tv"></a>

## Definition: Total variation distance

The **total variation distance** between $P$ and $Q$ is
$$\mathrm{TV}(P,Q) = \sup_{A \in \mathcal F} \big| P(A) - Q(A) \big| \in [0,1].$$

<a id="lem:tv-forms"></a>

## Lemma: Integral forms of total variation

With densities $p, q$ against a common dominating measure $\mu$,
$$\mathrm{TV}(P,Q) = \tfrac12 \int_{\mathcal X} |p - q| \, \mathrm d\mu = \tfrac12 \lVert P - Q \rVert_1 = 1 - \int_{\mathcal X} \min(p, q)\, \mathrm d\mu.$$
The supremum in [the definition](#def:tv) is attained by $A = \{p > q\}$.

### Proof

For any $A$, $P(A) - Q(A) = \int_A (p - q)\,\mathrm d\mu$, maximised by taking
$A = \{p > q\}$, giving $\int (p-q)_+ \,\mathrm d\mu$. Since
$\int (p - q)\,\mathrm d\mu = 0$, the positive and negative parts are equal, so
this equals $\tfrac12 \int |p-q|\,\mathrm d\mu$. Finally
$\min(p,q) = \tfrac12(p + q - |p-q|)$ integrates to $1 - \mathrm{TV}(P,Q)$.

<a id="thm:min-error-tv"></a>

## Theorem: Minimal total error equals one minus total variation

The smallest total error achievable by any test equals
$$\min_\phi \big(\alpha(\phi) + \beta(\phi)\big) = \int_{\mathcal X} \min(\mathrm dP, \mathrm dQ) = 1 - \mathrm{TV}(P,Q),$$
and the minimum is attained by the [sum-minimizing Neyman–Pearson test](02-neyman-pearson.md#lem:np-sum)
$\phi^\* = \mathbf 1\{\mathrm dP < \mathrm dQ\}$. This identity is the equal-weight
instance of the general theory downstream: it is precisely the **target** of
[Chapter 8](08-error-function.md)'s [error-function total-variation lemma](08-error-function.md#lem:error-function-tv),
which reads $1 - \mathrm{TV}(P,Q)$ off the value $E(1)$ of the
[error function](08-error-function.md#def:error-function). We record the direct proof here and note
the general derivation there.

### Proof

The first equality is [the sum-minimizing optimum](02-neyman-pearson.md#lem:np-sum); the second is
the last identity of [the integral forms](#lem:tv-forms).
