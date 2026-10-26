# Convergence of experiments and contiguity

The [Le Cam distance](09-deficiency.md#def:deficiency-distance) makes "experiments" a metric
space, and asymptotic statistics lives in its limits: a sequence of experiments
$\mathcal E_n$ **converges** to a limit experiment $\mathcal E$, and local
questions reduce to that limit. The companion notion for the underlying
sequences of measures is **contiguity** — the asymptotic form of absolute
continuity — controlled, as one expects from [Chapter 4](04-f-divergences.md), by
the [Hellinger affinity](04-f-divergences.md#def:hellinger). This closing chapter lays out both.

<a id="def:experiment-convergence"></a>

## Definition: Convergence of experiments

A sequence of [experiments](01-testing-and-errors.md#def:experiment) $\mathcal E_n$ **converges** to
$\mathcal E$ when the [Le Cam distance](09-deficiency.md#def:deficiency-distance) vanishes,
$$\Delta(\mathcal E_n, \mathcal E) \xrightarrow[n\to\infty]{} 0.$$
For experiments over a fixed finite index set this is equivalent to convergence
of all finite-dimensional Bayes risks; $\mathcal E$ is the **limit experiment**,
and asymptotic optimality in $\mathcal E_n$ is optimality in $\mathcal E$.

<a id="thm:np-power-convergence"></a>

## Theorem: Convergence of NP power functions

Two-point experiments $\mathcal E_n$ converge to $\mathcal E$ if and only if
their [error functions](08-error-function.md#def:error-function) converge uniformly,
$$\Delta(\mathcal E_n, \mathcal E) \to 0 \iff \sup_{t \ge 0} \big| E_{\mathcal E_n}(t) - E_{\mathcal E}(t) \big| \to 0,$$
equivalently the [envelope power functions](07-np-class.md#def:envelope-power) converge. The
limiting Neyman–Pearson tradeoff is read off the limit error function.

### Proof

Immediate from [the two-point deficiency
formula](09-deficiency.md#thm:deficiency-error-function): $\Delta(\mathcal E_n, \mathcal E)$ is
the two-sided sup-gap between $E_{\mathcal E_n}$ and $E_{\mathcal E}$, so its
vanishing is uniform convergence of the error functions. Uniform convergence of
the concave $E$'s transfers to their power-function transforms.

<a id="def:contiguity"></a>

## Definition: Contiguity

A sequence of measures $(Q_n)$ is **contiguous** with respect to $(P_n)$,
written $Q_n \triangleleft P_n$, when null sets are asymptotically null: for
measurable $A_n$,
$$P_n(A_n) \to 0 \implies Q_n(A_n) \to 0.$$
It is the asymptotic analogue of absolute continuity $Q \ll P$, applied to the
null/alternative pairs of a sequence of [experiments](01-testing-and-errors.md#def:experiment).

<a id="def:mutual-contiguity"></a>

## Definition: Mutual contiguity

$(P_n)$ and $(Q_n)$ are **mutually contiguous**, written
$P_n \triangleleft\triangleright Q_n$, when each is [contiguous](#def:contiguity)
with respect to the other. This is the asymptotic form of mutual absolute
continuity $P \equiv Q$ and is the regime in which likelihood ratios have
non-degenerate limits — precisely the setting invoked by [LeCam's two-point
bound](05-lecam-two-point.md) for sequences $P_{0,n}, P_{1,n}$.

<a id="lem:contiguity-hellinger"></a>

## Lemma: Contiguity via Hellinger affinity

If the [Hellinger affinities](04-f-divergences.md#def:hellinger) stay bounded away from $0$,
$$\liminf_{n} \rho(P_n, Q_n) > 0, \qquad \rho(P_n, Q_n) = \int \sqrt{p_n q_n}\,\mathrm d\mu_n,$$
then $(P_n)$ and $(Q_n)$ are [mutually contiguous](#def:mutual-contiguity). For
product experiments the affinity tensorises, so a bounded per-coordinate
[squared Hellinger distance](04-f-divergences.md#def:hellinger) summing to a finite total gives
contiguity of the products.

### Proof

The affinity dominates: $Q_n(A_n) \le \big(\int_{A_n}\sqrt{p_n q_n}\big)$-type
Cauchy–Schwarz bounds relate $Q_n(A_n)$ to $P_n(A_n)$ and $1 - \rho(P_n,Q_n)$.
When $\rho$ stays bounded below, $P_n(A_n) \to 0$ forces $Q_n(A_n) \to 0$ and
symmetrically, giving mutual contiguity.

<a id="lem:contiguity-characterizations"></a>

## Lemma: Characterizations of contiguity

**(Le Cam's first lemma.)** For $(P_n), (Q_n)$ the following are equivalent:
(i) $Q_n \triangleleft P_n$; (ii) every subsequential weak limit $L$ of the
[likelihood ratios](01-testing-and-errors.md#def:likelihood-ratio) $\mathrm dQ_n/\mathrm dP_n$ under
$P_n$ satisfies $\mathbb E[L] = 1$ (no mass escapes to $+\infty$); (iii) every
subsequential weak limit of $\mathrm dP_n/\mathrm dQ_n$ under $Q_n$ puts no mass
at $0$.

### Proof

The equivalence is a uniform-integrability argument on the likelihood-ratio
statistic: contiguity is exactly the statement that the $P_n$-law of
$\mathrm dQ_n/\mathrm dP_n$ loses no total mass in the limit, which is (ii); the
change of measure between $P_n$ and $Q_n$ turns (ii) into (iii).

<a id="lem:lr-vague-convergence"></a>

## Lemma: Vague convergence of likelihood ratios

Under [contiguity](#def:contiguity), the [likelihood ratios](01-testing-and-errors.md#def:likelihood-ratio)
$L_n = \mathrm dQ_n/\mathrm dP_n$ are asymptotically tight under $P_n$, and any
weak limit $L$ is a non-negative random variable with $\mathbb E[L] = 1$; the
alternative-side law of $L_n$ under $Q_n$ is the $L$-tilt of the null-side
limit. This is the mechanism behind Le Cam's third lemma for shifting limit
distributions between $P_n$ and $Q_n$.

### Proof

Tightness is [the first lemma](#lem:contiguity-characterizations)(ii); the
tilting identity is the change of measure $\mathrm dQ_n = L_n\,\mathrm dP_n$
passed to the limit, valid because $\{L_n\}$ is uniformly integrable under
contiguity.

<a id="cor:accumulation-dominated"></a>

## Corollary: Accumulation points are dominated

Along a [mutually contiguous](#def:mutual-contiguity) sequence, every
[limit experiment](#def:experiment-convergence) is **dominated**: the limiting
pair $(P, Q)$ satisfies $P \equiv Q$, so the limit is a genuine binary
experiment with a well-defined finite likelihood ratio. Hence the two-point
theory of Chapters 1–8 applies verbatim in the limit.

### Proof

By [convergence of error functions](#thm:np-power-convergence) the limit error
function $E$ satisfies $E(0^+) $ and the large-$t$ tail with no flat piece,
which by [the first lemma](#lem:contiguity-characterizations) is exactly
$P \equiv Q$ for the limit; mutual contiguity passes to the limit and rules out
escape of mass to $0$ or $\infty$.
