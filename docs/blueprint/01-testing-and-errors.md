# Simple tests and error probabilities

This first chapter fixes the objects of two-point hypothesis testing used in
the rest of the notes. Throughout, $(\mathcal X, \mathcal A)$ is a
measurable space and $P, Q$ are two probability measures on it — the two
_simple_ (point) hypotheses $H_0 : P$ and $H_1 : Q$. We package this single
datum as a [binary experiment](#def:experiment) and read every later object off
it. A statistician observes a single draw and must decide between them; the
quality of a decision rule is measured by two error probabilities.

These definitions feed the whole arc: the [Neyman–Pearson lemma](02-neyman-pearson.md#thm:np-weighted)
optimises them, their minimal sum is the [total variation distance](03-total-variation.md#thm:min-error-tv),
that distance is controlled by [f-divergences](04-f-divergences.md#thm:tv-le-chisq), and the chain
culminates in [LeCam's two-point lower bound](05-lecam-two-point.md#thm:lecam-two-point) on the
minimax risk. Making the experiment explicit is also what lets the later
chapters on comparison and convergence of experiments speak of _the_
experiment and compare one to another. The definitions below correspond to the
declarations in [`lean/Blueprint.lean`](../../lean/Blueprint.lean).

<a id="def:experiment"></a>

## Definition: Binary experiment

A **binary experiment** is a triple $\mathcal E = (\mathcal X, \mathcal A, (P, Q))$:
a measurable space $(\mathcal X, \mathcal A)$ carrying two probability measures,
$P$ under the null $H_0$ and $Q$ under the alternative $H_1$. It is the primitive
object of the whole development: the critical function, the two
error probabilities, and the [likelihood ratio](#def:likelihood-ratio) are all
functionals of $\mathcal E$ alone. Writing it down as one datum is what later
lets us treat "the experiment" as a point in a space of experiments and measure
how much one experiment loses relative to another (deficiency, convergence).

<a id="def:test"></a>

## Definition: Critical function

A **critical function** (or randomized test) for the
[experiment](#def:experiment) is a measurable function
$\phi : \mathcal X \to [0,1]$. Observing $x$, the statistician rejects $H_0$
(decides in favour of $Q$) with probability $\phi(x)$; a **deterministic** (or
[non-randomized](07-np-class.md#def:non-randomized)) test is the special case
$\phi = \mathbf 1_R$ for a rejection region $R \in \mathcal A$. Randomization
lets the test attain any prescribed error level exactly, which the
Neyman–Pearson optimum will need at the likelihood-ratio threshold.

<a id="def:type-one"></a>

## Definition: Type I error

The **Type I error** (size) of a test $\phi$ is the probability of rejecting
$H_0$ when the [experiment](#def:experiment)'s null $P$ is true,
$$\alpha(\phi) = \mathbb E_P[\phi] = \int_{\mathcal X} \phi \, \mathrm dP.$$

<a id="def:type-two"></a>

## Definition: Type II error

The **Type II error** of a test $\phi$ is the probability of failing to reject
$H_0$ when the [experiment](#def:experiment)'s alternative $Q$ is true,
$$\beta(\phi) = \mathbb E_Q[1 - \phi] = \int_{\mathcal X} (1 - \phi) \, \mathrm dQ.$$
The **power** against $Q$ is $1 - \beta(\phi) = \mathbb E_Q[\phi]$.

<a id="def:likelihood-ratio"></a>

## Definition: Likelihood ratio

Reading the two measures of the [experiment](#def:experiment) against a common
dominating measure $\mu$ (for instance $\mu = P + Q$), with densities
$p = \mathrm dP/\mathrm d\mu$ and $q = \mathrm dQ/\mathrm d\mu$, the
**likelihood ratio** is the Radon–Nikodym derivative
$$L = \frac{\mathrm dP}{\mathrm dQ},$$
defined $Q$-almost everywhere and equal to $p/q$ where $q > 0$. Neyman–Pearson
tests threshold this single statistic $L$; the later identities re-express the
error probabilities as integrals against $L$, which is what connects them to
the total variation and $f$-divergences.
