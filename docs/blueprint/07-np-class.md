# The Neyman–Pearson class: completeness and admissibility

The [Neyman–Pearson lemma](02-neyman-pearson.md#thm:np-weighted) singles out, at each prior odds
$t$, a likelihood-ratio [threshold test](02-neyman-pearson.md#def:threshold-test) that minimises the
Bayes risk. Read across all $t$ and all tie-breaks, those tests form **one
family**, and this chapter proves the structural statements that make that
family canonical: it is a [complete class](#def:complete-class) (nothing outside
it is worth using), every member is [admissible](#def:admissible), and it traces
out the [envelope power function](#def:envelope-power) of the testing problem.
It packages the material of §§7–8 and §10 of the source notes.

<a id="def:testing-problem"></a>

## Definition: The testing problem at level α

For the [binary experiment](01-testing-and-errors.md#def:experiment) $\mathcal E = (\mathcal X, \mathcal A, (P,Q))$
and a level $\alpha \in [0,1]$, the **testing problem** asks for a
[critical function](01-testing-and-errors.md#def:test) $\phi$ with size at most $\alpha$ maximising the
power against $Q$:
$$\text{maximise } 1 - \beta(\phi) = \mathbb E_Q[\phi] \quad\text{subject to}\quad \alpha(\phi) = \mathbb E_P[\phi] \le \alpha.$$
This is the constrained (Neyman) form of the problem, dual to the
weighted-sum (Bayes) form of [Chapter 2](02-neyman-pearson.md): the Lagrangian of
the constraint is exactly the weighted error risk whose minimiser is the
threshold test.

<a id="def:better-test"></a>

## Definition: One test better than another

A test $\phi$ is **at least as good as** $\psi$ when it is no worse in both
coordinates,
$$\alpha(\phi) \le \alpha(\psi) \quad\text{and}\quad \beta(\phi) \le \beta(\psi),$$
and **better** when at least one inequality is strict. This is the componentwise
(Pareto) order on the risk point $(\alpha(\phi), \beta(\phi)) \in [0,1]^2$; the
whole theory of admissibility and complete classes is the order theory of this
single partial order.

<a id="def:non-randomized"></a>

## Definition: Non-randomized test

A [critical function](01-testing-and-errors.md#def:test) $\phi$ is **non-randomized** (deterministic)
when it takes only the values $0$ and $1$, i.e. $\phi = \mathbf 1_R$ for a
rejection region $R = \{\phi = 1\} \in \mathcal A$. Randomized tests are the
convex hull of these extreme points; when $P, Q$ have no atoms on the
likelihood-ratio tie set, non-randomized tests already suffice, and the tie
weight $\eta$ of the [threshold test](02-neyman-pearson.md#def:threshold-test) can be taken in
$\{0,1\}$.

<a id="def:unbiased-test"></a>

## Definition: Unbiased test

A test $\phi$ of size $\alpha(\phi) = a$ is **unbiased** when its power is at
least its size,
$$1 - \beta(\phi) = \mathbb E_Q[\phi] \ge a = \mathbb E_P[\phi],$$
so it is at least as likely to reject under the alternative as under the null.
Every [most powerful](#def:envelope-power) test of the two-point problem is
unbiased, since the constant test $\phi \equiv a$ is available and has power $a$.

<a id="def:envelope-power"></a>

## Definition: Envelope power function

The **envelope power function** (power envelope) of the
[testing problem](#def:testing-problem) is the best attainable power as a
function of the level,
$$\beta^\*(\alpha) = \sup\{\, \mathbb E_Q[\phi] : \alpha(\phi) \le \alpha \,\}, \qquad \alpha \in [0,1].$$
It is concave and non-decreasing, with $\beta^\*(0) \ge 0$ and $\beta^\*(1) = 1$;
its graph is the upper boundary of the **risk set**
$\{(\alpha(\phi), 1-\beta(\phi))\}$, and reading it against the
$45^\circ$ line measures how far $P$ and $Q$ can be told apart.

<a id="lem:optimal-exists"></a>

## Lemma: Existence of an optimal test

For every level $\alpha \in [0,1]$ the [testing problem](#def:testing-problem)
has a solution: a test $\phi_\alpha$ with $\alpha(\phi_\alpha) \le \alpha$ whose
power equals the [envelope](#def:envelope-power) value $\beta^\*(\alpha)$. Hence
the supremum defining $\beta^\*$ is attained, and $\phi_\alpha$ is not
[bettered](#def:better-test) by any test of size $\le \alpha$.

### Proof

The set of achievable risk points $\{(\alpha(\phi), \mathbb E_Q[\phi]) : \phi\}$
is convex (mix tests) and, by weak-$*$ compactness of critical functions in
$L^\infty(\mu)$ with $0 \le \phi \le 1$ together with weak-$*$ continuity of
$\phi \mapsto (\int \phi\,\mathrm dP, \int \phi\,\mathrm dQ)$, closed. A
continuous linear objective over a compact convex set attains its supremum,
giving $\phi_\alpha$.

<a id="def:complete-class"></a>

## Definition: Complete class of tests

A class $\mathcal C$ of tests is a **complete class** when every test outside
$\mathcal C$ is [bettered](#def:better-test) by some test inside it: for all
$\psi \notin \mathcal C$ there is $\phi \in \mathcal C$ at least as good as
$\psi$ and better in at least one coordinate. A complete class can be used
without loss — whatever a statistician might do, the class contains something at
least as good.

<a id="def:admissible"></a>

## Definition: Admissible test

A test $\phi$ is **admissible** when no other test is [better](#def:better-test):
there is no $\psi$ with $\alpha(\psi) \le \alpha(\phi)$ and
$\beta(\psi) \le \beta(\phi)$ and at least one strict. Admissible tests are the
Pareto frontier of the risk set; a [minimal complete class](#def:complete-class)
consists precisely of admissible tests.

<a id="def:np-test-family"></a>

## Definition: The Neyman–Pearson test family

The **Neyman–Pearson test family** is the image of the
[threshold-test generator](02-neyman-pearson.md#def:threshold-test) as the threshold $t \in [0,\infty]$
and the tie weight $\eta \in [0,1]$ range over their values (for a fixed
convention $\gamma$ on the $P$-null set),
$$\mathcal T_{\mathrm{NP}} = \big\{\, T_{t,\eta}(h_{p,q;\gamma}) : t \in [0,\infty],\ \eta \in [0,1] \,\big\}.$$
Sweeping $(t,\eta)$ traces a curve from the trivial test $\phi \equiv 0$
($t = \infty$) to $\phi \equiv 1$ ($t = 0$); this one family is the object the
completeness and admissibility theorems below are about.

<a id="thm:np-existence"></a>

## Theorem: Existence of a most powerful NP test at every level

For each $\alpha \in [0,1]$ there are $t, \eta$ with
$\alpha\big(T_{t,\eta}\big) = \alpha$, and this
[NP-family](#def:np-test-family) test attains the
[envelope power](#def:envelope-power) $\beta^\*(\alpha)$. Thus the most powerful
test of any prescribed size can be chosen inside $\mathcal T_{\mathrm{NP}}$, and
randomisation on the tie set is needed only to hit a size the deterministic
thresholds skip over.

### Proof

The size $t \mapsto \alpha(T_{t,0})$ is non-increasing with jumps exactly at
atoms of the likelihood ratio; the tie weight $\eta$ interpolates linearly
across each jump, so $(t,\eta) \mapsto \alpha(T_{t,\eta})$ is onto $[0,1]$. At
the matching $t$, [the Bayes-risk envelope](02-neyman-pearson.md#thm:np-weighted) shows $T_{t,\eta}$
minimises $\alpha + t\beta$, which is the Lagrangian optimality certifying
maximal power at that size.

<a id="thm:np-monotone"></a>

## Theorem: Monotonicity of the NP family

Along the [NP family](#def:np-test-family), size and power move together: if
$t' \le t$ then $\alpha(T_{t',\cdot}) \ge \alpha(T_{t,\cdot})$ and
$1 - \beta(T_{t',\cdot}) \ge 1 - \beta(T_{t,\cdot})$, and the induced points
$(\alpha, 1-\beta)$ trace the graph of the [envelope power
function](#def:envelope-power) $\beta^\*$ monotonically from $(0,\cdot)$ to
$(1,1)$.

### Proof

Lowering the threshold $t^{-1}$ enlarges the rejection region
$\{q > t^{-1} p\}$, so both $\int T\,\mathrm dP$ and $\int T\,\mathrm dQ$
increase. That the resulting curve is the envelope is the previous theorem read
across all $t$.

<a id="thm:np-complete-class"></a>

## Theorem: The NP family is a complete class

The [Neyman–Pearson test family](#def:np-test-family) $\mathcal T_{\mathrm{NP}}$
is a [complete class](#def:complete-class): any test $\psi$ is
[bettered](#def:better-test) by some $T_{t,\eta} \in \mathcal T_{\mathrm{NP}}$
with $\alpha(T_{t,\eta}) \le \alpha(\psi)$ and $\beta(T_{t,\eta}) \le \beta(\psi)$.

### Proof

Given $\psi$, pick the NP test of the same size $\alpha(\psi)$ (by
[existence](#thm:np-existence)); by [the envelope](02-neyman-pearson.md#thm:np-weighted) it has
power at least that of $\psi$, so $\beta(T_{t,\eta}) \le \beta(\psi)$ while
matching the size. Hence it is at least as good, and strictly better unless
$\psi$ already lies on the envelope.

<a id="thm:np-admissible"></a>

## Theorem: Every NP test is admissible

Each test $T_{t,\eta}$ in the [NP family](#def:np-test-family) with
$t \in (0,\infty)$ is [admissible](#def:admissible): no test is better in one of
$(\alpha,\beta)$ without being worse in the other.

### Proof

If some $\psi$ dominated $T_{t,\eta}$ it would strictly lower
$\alpha + t\beta$, contradicting the Bayes-optimality of $T_{t,\eta}$ from [the
envelope](02-neyman-pearson.md#thm:np-weighted) at the strictly positive weight $t$. The endpoints
$t \in \{0,\infty\}$ are the trivial tests, admissible separately.

<a id="thm:np-optimal-at-Q"></a>

## Theorem: The NP test is optimal at Q

Among all tests of size at most $\alpha$, an [NP test](#def:np-test-family) of
size $\alpha$ maximises the power $\mathbb E_Q[\phi]$ against the alternative
$Q$; equivalently it realises the [envelope](#def:envelope-power)
$\beta^\*(\alpha)$ and no test does strictly better at $Q$. This optimality "at
$Q$" is the input [Chapter 8](08-error-function.md) turns into the extremal
characterisation of the [error function](08-error-function.md#def:error-function).

### Proof

The size-$\alpha$ NP test minimises $\alpha(\phi) + t\beta(\phi)$ at the
matching multiplier $t$ by [the envelope](02-neyman-pearson.md#thm:np-weighted); for any competitor
$\psi$ with $\alpha(\psi) \le \alpha$ this forces
$\beta(\text{NP}) \le \beta(\psi)$, i.e. at least the NP power.

<a id="def:generalized-np-test"></a>

## Definition: Generalized Neyman–Pearson test

With $k$ side constraints given by finite measures $\mu_1, \dots, \mu_k$ and a
target $\mu_0$, a **generalized Neyman–Pearson test** thresholds a linear
combination of [likelihood ratios](01-testing-and-errors.md#def:likelihood-ratio): for multipliers
$c_1, \dots, c_k$,
$$\phi = \mathbf 1\Big\{ \tfrac{\mathrm d\mu_0}{\mathrm d\lambda} > \textstyle\sum_{i} c_i\,\tfrac{\mathrm d\mu_i}{\mathrm d\lambda} \Big\} \;(+\ \text{randomisation on the tie set}),$$
against a common dominating $\lambda$. The two-point [threshold
test](02-neyman-pearson.md#def:threshold-test) is the case $k = 1$.

<a id="thm:generalized-np"></a>

## Theorem: The generalized Neyman–Pearson lemma

If a [generalized NP test](#def:generalized-np-test) $\phi^\*$ with non-negative
multipliers meets the $k$ constraints $\int \phi^\*\,\mathrm d\mu_i = \gamma_i$
with equality, then it maximises $\int \phi\,\mathrm d\mu_0$ over all tests
satisfying $\int \phi\,\mathrm d\mu_i \le \gamma_i$. It is the multi-constraint
generalisation of [the weighted-sum optimum](02-neyman-pearson.md#thm:np-weighted).

### Proof

For any feasible $\phi$, the integrand identity
$(\phi^\* - \phi)\big(\tfrac{\mathrm d\mu_0}{\mathrm d\lambda} - \sum_i c_i \tfrac{\mathrm d\mu_i}{\mathrm d\lambda}\big) \ge 0$
holds pointwise by the definition of $\phi^\*$ (each factor shares a sign).
Integrating and using $c_i \ge 0$ with the binding constraints gives
$\int \phi^\*\,\mathrm d\mu_0 \ge \int \phi\,\mathrm d\mu_0$.
