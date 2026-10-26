# The error function of an experiment

The whole Neyman–Pearson tradeoff of a [binary experiment](01-testing-and-errors.md#def:experiment) is
carried by a single scalar function of the prior odds $t$: the **error
function** $E(t)$, the least achievable Bayes risk at odds $t$. It is exactly
the envelope $t \mapsto \int \min(\mathrm dP, t\,\mathrm dQ)$ that [the
Neyman–Pearson lemma](02-neyman-pearson.md#thm:np-weighted) already produced; naming it and reading
off its shape is what lets the later chapters compare whole experiments through
one function rather than test by test. Its endpoint value $E(1)$ is the target the
[total-error identity](03-total-variation.md#thm:min-error-tv) of [Chapter 3](03-total-variation.md)
names in advance.

<a id="def:error-function"></a>

## Definition: Error function

The **error function** of the [experiment](01-testing-and-errors.md#def:experiment) $\mathcal E = (\mathcal X, \mathcal A, (P,Q))$
is the least Bayes risk at prior odds $t$,
$$E(t) = \min_{\phi}\big(\alpha(\phi) + t\,\beta(\phi)\big) = \int_{\mathcal X} \min(\mathrm dP,\, t\,\mathrm dQ) = \int_{\mathcal X} \min(p,\, t\,q)\,\mathrm d\mu, \qquad t \in [0,\infty),$$
the value produced by [the Neyman–Pearson envelope](02-neyman-pearson.md#thm:np-weighted). It is the
experiment's coordinate-free summary: everything an observer can do to separate
$P$ from $Q$ is encoded in the single concave curve $E$.

<a id="thm:error-function-np"></a>

## Theorem: The error function is realised by the NP family

For every $t \ge 0$ the value $E(t)$ is attained by the
[Neyman–Pearson test](07-np-class.md#def:np-test-family) at threshold $t$, and
$$E(t) = \alpha(T_t) + t\,\beta(T_t), \qquad E'(t^-) \le -\beta(T_t) \le E'(t^+),$$
so the subdifferential of $E$ at $t$ recovers the Type II error of the optimal
test there. The error function is thus the Legendre-type envelope of the NP
family's risk points.

### Proof

Attainment is [the envelope](02-neyman-pearson.md#thm:np-weighted) at odds $t$; the test realising
it is [optimal at $Q$](07-np-class.md#thm:np-optimal-at-Q). Differentiating the affine
selection $\alpha(T_t) + t\beta(T_t)$ and using that $E$ is the pointwise
minimum of the affine maps $t \mapsto \alpha(\phi) + t\beta(\phi)$ gives the
one-sided derivative bracket.

<a id="cor:error-function-concave"></a>

## Corollary: Concavity and endpoints of the error function

$E$ is concave, non-decreasing, and $1$-Lipschitz on $[0,\infty)$, with
$$E(0) = 0, \qquad E'(0^+) = 1, \qquad \lim_{t\to\infty} \big(t - E(t)\big) = 0,$$
and $E$ is the pointwise infimum of the affine functions
$t \mapsto \alpha(\phi) + t\,\beta(\phi)$. Concavity and these endpoints encode
every Neyman–Pearson tradeoff of the experiment at once.

### Proof

$E$ is an infimum of affine functions of $t$, hence concave and, being a min of
functions with slopes $\beta(\phi) \in [0,1]$, non-decreasing and $1$-Lipschitz.
The endpoints are the values at the trivial tests $\phi \equiv 0$ (giving
$E(0) = 0$) and $\phi \equiv 1$ (bounding the large-$t$ behaviour), read from
[the NP realisation](#thm:error-function-np).

<a id="lem:error-function-tv"></a>

## Lemma: The error function computes total variation

At equal weights the [error function](#def:error-function) recovers the
[total variation distance](03-total-variation.md#def:tv):
$$E(1) = \int_{\mathcal X} \min(\mathrm dP, \mathrm dQ) = 1 - \mathrm{TV}(P, Q).$$
This is the general derivation behind the [total-error
identity](03-total-variation.md#thm:min-error-tv) recorded directly in
[Chapter 3](03-total-variation.md): that identity is the $t = 1$ slice of the error
function.

### Proof

Set $t = 1$ in [the error function](#def:error-function):
$E(1) = \int \min(p,q)\,\mathrm d\mu$, and the last of [the integral forms of
total variation](03-total-variation.md#lem:tv-forms) equates $\int \min(p,q)\,\mathrm d\mu$ with
$1 - \mathrm{TV}(P,Q)$.
