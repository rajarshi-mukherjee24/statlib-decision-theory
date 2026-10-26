# $f$-divergences and comparison inequalities

Total variation and the chi-square divergence are two members of a single
family — the $f$-divergences — and the bound $\mathrm{TV} \le \tfrac12\sqrt{\chi^2}$
is one instance of the comparison inequalities that family enjoys. This chapter
sets up $f$-divergences, records their two structural properties (non-negativity
and joint convexity) and the data-processing inequality they imply, exhibits
[total variation](03-total-variation.md#def:tv) and chi-square as $f$-divergences, and proves the two
comparisons used later: $\mathrm{TV} \le \tfrac12\sqrt{\chi^2}$ and Pinsker's
inequality.

<a id="def:f-div"></a>

## Definition: f-divergence

Let $f : (0,\infty) \to \mathbb R$ be convex with $f(1) = 0$. For $P \ll Q$ the
**$f$-divergence** of $P$ from $Q$ is
$$D_f(P \,\Vert\, Q) = \int_{\mathcal X} f\!\left(\frac{\mathrm dP}{\mathrm dQ}\right) \mathrm dQ,$$
with the usual conventions ($f(0) = \lim_{t\to 0^+} f(t)$, and a recession-slope
term $f'(\infty)\,P(\mathrm dQ = 0)$ when $P \not\ll Q$).

<a id="lem:fdiv-nonneg"></a>

## Lemma: Non-negativity

$D_f(P \Vert Q) \ge 0$, and if $f$ is strictly convex at $1$ then
$D_f(P \Vert Q) = 0$ iff $P = Q$.

### Proof

Jensen's inequality applied to the convex $f$ and the $Q$-law of
$\mathrm dP/\mathrm dQ$, whose mean is $1$: $D_f(P\Vert Q) \ge f(\mathbb E_Q[\mathrm dP/\mathrm dQ]) = f(1) = 0$.

<a id="lem:fdiv-convex"></a>

## Lemma: Joint convexity

The map $(P, Q) \mapsto D_f(P \Vert Q)$ is jointly convex: for
$\lambda \in [0,1]$,
$$D_f\big(\lambda P_0 + (1-\lambda)P_1 \,\Vert\, \lambda Q_0 + (1-\lambda)Q_1\big) \le \lambda D_f(P_0 \Vert Q_0) + (1-\lambda) D_f(P_1 \Vert Q_1).$$

### Proof

The **perspective** $g(x,y) = y\,f(x/y)$ of a convex $f$ is jointly convex on
$(0,\infty)^2$; $D_f$ is the integral of $g(\mathrm dP, \mathrm dQ)$ against
$\mu$, and integration preserves convexity.

<a id="thm:dpi"></a>

## Theorem: Data-processing inequality

For any Markov kernel (channel) $K$ from $\mathcal X$ to $\mathcal Y$,
$$D_f(KP \,\Vert\, KQ) \le D_f(P \,\Vert\, Q),$$
where $KP$ denotes the push-forward of $P$ through $K$. Processing the data can
only decrease an $f$-divergence.

### Proof

The joint convexity of $D_f$ together with its invariance under a common
deterministic transport yields contraction under stochastic maps; equivalently,
apply Jensen to the conditional law of $\mathrm dP/\mathrm dQ$ given the output.

<a id="lem:tv-as-fdiv"></a>

## Lemma: Total variation as an f-divergence

$\mathrm{TV}(P,Q) = D_f(P \Vert Q)$ for $f(t) = \tfrac12 |t - 1|$.

### Proof

$\int \tfrac12\,|\mathrm dP/\mathrm dQ - 1|\,\mathrm dQ = \tfrac12 \int |p - q|\,\mathrm d\mu = \mathrm{TV}(P,Q)$
by [the integral form](03-total-variation.md#lem:tv-forms).

<a id="def:chi-square"></a>

## Definition: Chi-square divergence

For $P \ll Q$ the **chi-square divergence** is
$$\chi^2(P \,\Vert\, Q) = \int_{\mathcal X} \left(\frac{\mathrm dP}{\mathrm dQ} - 1\right)^2 \mathrm dQ = \int_{\mathcal X} \frac{(p - q)^2}{q}\,\mathrm d\mu.$$

<a id="lem:chisq-as-fdiv"></a>

## Lemma: Chi-square as an f-divergence

$\chi^2(P \Vert Q) = D_f(P \Vert Q)$ for $f(t) = (t - 1)^2$.

### Proof

Immediate from the definitions: $f(\mathrm dP/\mathrm dQ) = (\mathrm dP/\mathrm dQ - 1)^2$.

<a id="def:hellinger"></a>

## Definition: Squared Hellinger distance and affinity

With densities $p, q$ against a common dominating measure $\mu$, the
**squared Hellinger distance** and the **Hellinger affinity** (Bhattacharyya
coefficient) are
$$H^2(P, Q) = \tfrac12 \int_{\mathcal X} \big(\sqrt p - \sqrt q\big)^2 \, \mathrm d\mu = 1 - \rho(P,Q), \qquad \rho(P,Q) = \int_{\mathcal X} \sqrt{p\,q}\,\mathrm d\mu \in [0,1].$$
The affinity $\rho$ is symmetric, dominating-measure independent, and equals $1$
iff $P = Q$; $H^2 \in [0,1]$ is a bona fide (squared) metric on probability
measures. It sits between the other divergences — $H^2 \le \mathrm{TV} \le \sqrt{H^2(2 - H^2)}$ —
and tensorises multiplicatively over products, which is what makes it the
natural gauge for the [contiguity](10-convergence-contiguity.md) of product
experiments.

<a id="lem:hellinger-as-fdiv"></a>

## Lemma: Squared Hellinger as an f-divergence

$H^2(P \Vert Q) = D_f(P \Vert Q)$ for the convex $f(t) = \tfrac12(\sqrt t - 1)^2$
(with $f(1) = 0$).

### Proof

$D_f(P \Vert Q) = \int \tfrac12\big(\sqrt{\mathrm dP/\mathrm dQ} - 1\big)^2 \mathrm dQ = \tfrac12\int \big(\sqrt{p/q} - 1\big)^2 q \, \mathrm d\mu = \tfrac12 \int (\sqrt p - \sqrt q)^2 \, \mathrm d\mu = H^2(P,Q)$,
and $t \mapsto \tfrac12(\sqrt t - 1)^2$ is convex on $(0,\infty)$.

<a id="thm:tv-le-chisq"></a>

## Theorem: Total variation is bounded by chi-square

$$\mathrm{TV}(P,Q) \le \tfrac12 \sqrt{\chi^2(P \,\Vert\, Q)}.$$

### Proof

By [the integral form](03-total-variation.md#lem:tv-forms) and Cauchy–Schwarz,
$$\mathrm{TV}(P,Q) = \tfrac12 \int \left|\frac{p}{q} - 1\right| q\,\mathrm d\mu \le \tfrac12 \left(\int \left(\frac{p}{q} - 1\right)^2 q\,\mathrm d\mu\right)^{1/2}\!\left(\int q\,\mathrm d\mu\right)^{1/2} = \tfrac12 \sqrt{\chi^2(P \Vert Q)},$$
since $\int q\,\mathrm d\mu = 1$. This is the $f$-divergence comparison
specialised to $f = \tfrac12|t-1|$ against $f = (t-1)^2$.

<a id="def:kl"></a>

## Definition: Kullback–Leibler divergence

The **Kullback–Leibler divergence** is the $f$-divergence with $f(t) = t\log t$,
$$\mathrm{KL}(P \,\Vert\, Q) = \int_{\mathcal X} \log\!\left(\frac{\mathrm dP}{\mathrm dQ}\right) \mathrm dP.$$

<a id="thm:pinsker"></a>

## Theorem: Pinsker's inequality

$$\mathrm{TV}(P,Q) \le \sqrt{\tfrac12\, \mathrm{KL}(P \,\Vert\, Q)}.$$

### Proof

A second $f$-divergence comparison: reduce to two-point distributions via [the
data-processing inequality](#thm:dpi) applied to the test
$\mathbf 1\{p > q\}$, then verify the scalar inequality
$2(a - b)^2 \le a\log\frac{a}{b} + (1-a)\log\frac{1-a}{1-b}$ on Bernoulli pairs.
