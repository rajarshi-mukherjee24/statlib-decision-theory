# The Neyman–Pearson lemma

With the [error probabilities](01-testing-and-errors.md) in hand, we characterise
the test that minimises a weighted sum of the two errors — the Bayes, or
_sum-of-errors_, form of the Neyman–Pearson lemma. This is the development in
the accompanying notes: build a common dominating measure $\mu = P + Q$, form
the likelihood-ratio statistic from the densities, and show that a single
randomised threshold test is optimal simultaneously for every weight. The
equal-weight case is the object [Chapter 3](03-total-variation.md) ties to total
variation.

The measure-theoretic scaffolding the notes prove by hand — existence and
a.e.-uniqueness of the Radon–Nikodym derivative, approximation of a measurable
function by simple functions, and the change-of-measure identity — is **already
in Mathlib**. The Lean development reuses those declarations rather than
re-deriving them; they are cited once here and used directly in the proofs.

> [!note] Mathlib prerequisites (not reproved here)
> These correspond to Lemmas 1.2.1–1.2.3 of the source notes and are consumed
> as library facts:
>
> - **Radon–Nikodym derivative — existence and a.e. uniqueness.**
>   `MeasureTheory.Measure.rnDeriv` with
>   `MeasureTheory.Measure.withDensity_rnDeriv_eq` and
>   `MeasureTheory.Measure.absolutelyContinuous_iff_withDensity_rnDeriv_eq`
>   (module `Mathlib.MeasureTheory.Measure.Decomposition.RadonNikodym`).
> - **Simple-function approximation of a measurable function.**
>   `MeasureTheory.SimpleFunc.approxOn` / `MeasureTheory.SimpleFunc.eapprox`
>   with their monotone-convergence lemmas.
> - **Change of measure**, $\int \varphi \, \mathrm dQ = \int \varphi \, \frac{\mathrm dQ}{\mathrm dP} \, \mathrm dP$
>   for $Q \ll P$: `MeasureTheory.lintegral_rnDeriv_mul`
>   (`∫⁻ x, μ.rnDeriv ν x * f x ∂ν = ∫⁻ x, f x ∂μ`), with
>   `MeasureTheory.setLIntegral_rnDeriv_mul` and the Bochner form
>   `MeasureTheory.integral_toReal_rnDeriv_mul`.

<a id="def:dominating"></a>

## Definition: Common dominating measure and densities

Following Lemma 1.2.4(1–3) of the notes, set $\mu = P + Q$. Then $\mu$ is a
finite measure and $P \ll \mu$, $Q \ll \mu$, so both have Radon–Nikodym
derivatives
$$p = \frac{\mathrm dP}{\mathrm d\mu}, \qquad q = \frac{\mathrm dQ}{\mathrm d\mu},$$
with $p, q \ge 0$ $\mu$-a.e. Existence is the Radon–Nikodym theorem
(`MeasureTheory.Measure.rnDeriv`); the absolute continuities $P, Q \ll P + Q$
are also standard in Mathlib. Nothing here needs a new proof — this item only
_names_ the objects the threshold test is built from.

<a id="def:threshold-test"></a>

## Definition: Threshold test — the Neyman–Pearson family generator

Fix $\gamma > 0$ and let $N = \{\omega : p(\omega) = 0\}$. Define the
likelihood-ratio statistic and, for $t, \gamma \ge 0$ and $\eta \in [0,1]$, the
randomised **threshold test**, as in Lemma 1.2.4(4–5):
$$h_{p,q;\gamma} = \frac{q}{p}\,\mathbf 1(p \ne 0) + \gamma\,\mathbf 1(p = 0),$$
$$T_{t,\eta}(h_{p,q;\gamma}) = \mathbf 1\big(h_{p,q;\gamma} > t^{-1},\, N^c\big) + \eta\,\mathbf 1\big(h_{p,q;\gamma} = t^{-1},\, N^c\big) + \mathbf 1(N).$$
Both are measurable (measurability of the density quotient and of these
indicator combinations is immediate from Mathlib), so $T_{t,\eta}(h_{p,q;\gamma})$
is a [critical function](01-testing-and-errors.md#def:test) $\Omega \to [0,1]$. It rejects $H_0$ where the
density ratio $q/p$ exceeds the threshold $t^{-1}$, randomises with probability
$\eta$ on the tie set, and rejects on the $P$-null set $N$.

Read as a map $(t, \eta) \mapsto T_{t,\eta}(h_{p,q;\gamma})$, this is the
**generator of the Neyman–Pearson test family**: sweeping the threshold $t$ and
the tie-breaking weight $\eta$ traces out the entire one-parameter family that
[Chapter 7](07-np-class.md) packages as the [NP test family](07-np-class.md#def:np-test-family)
and shows to be a [complete class](07-np-class.md#def:complete-class) of admissible tests.

<a id="def:weighted-risk"></a>

## Definition: Weighted error risk

For weights $a, b > 0$, the **weighted error risk** of a test $\phi$ is
$$R_{a,b}(\phi) = a\,\alpha(\phi) + b\,\beta(\phi).$$
It is the Bayes risk of $\phi$ under prior odds $b : a$ with $0/1$ loss. The
source notes minimise $\int \phi \, \mathrm dP + t \int (1 - \phi)\,\mathrm dQ = R_{1,t}(\phi)$;
the plain sum $\alpha(\phi) + \beta(\phi)$ is the equal-weight case $a = b = 1$.

<a id="thm:np-weighted"></a>

## Theorem: Neyman–Pearson lemma — the Bayes-risk envelope

This is Theorem 1.3.1 of the notes, stated as a statement about the **whole
envelope** rather than a single weight. Define the concave envelope function
$$t \;\longmapsto\; E(t) = \min_T \big(\alpha(T) + t\,\beta(T)\big) = \int_\Omega \min\!\big(\mathrm dP,\; t\,\mathrm dQ\big) = \int_\Omega \min(p,\, t\,q)\,\mathrm d\mu, \qquad t \in [0,\infty),$$
the least achievable Bayes risk at prior odds $t$. For every $t, \gamma \ge 0$
and $\eta \in [0,1]$ the [threshold test](#def:threshold-test)
$T^\* = T_{t,\eta}(h_{p,q;\gamma})$ attains this minimum simultaneously — a
**single** family of tests realises the envelope at every $t$:
$$\int_\Omega T^\* \, \mathrm dP + t \int_\Omega (1 - T^\*)\,\mathrm dQ \;\le\; \int_\Omega T \, \mathrm dP + t \int_\Omega (1 - T)\,\mathrm dQ \quad \text{for all measurable } T : \Omega \to [0,1].$$
The map $t \mapsto E(t)$ is exactly the object [Chapter 8](08-error-function.md)
repackages as the [error function](08-error-function.md#def:error-function) of the experiment, whose
concavity and endpoint behaviour encode every Neyman–Pearson tradeoff at once.

### Proof

Rewrite both integrals against the common dominating measure using the Mathlib
change-of-measure identity `MeasureTheory.lintegral_rnDeriv_mul` (so
$\int T\,\mathrm dP = \int T p\,\mathrm d\mu$ and likewise for $Q$); this is the
step the notes spend Lemmas 1.2.1–1.2.3 justifying, and it is _not_ reproved
here. It then suffices to compare integrands region by region. Partition
$\Omega = N \cup R_1 \cup R_0 \cup R_{eq}$ with
$$R_1 = \{q > t^{-1}p\} \cap N^c, \quad R_0 = \{q < t^{-1}p\} \cap N^c, \quad R_{eq} = \{q = t^{-1}p\} \cap N^c.$$
On $N$, $T^\* = 1$ and $p = 0$, so its contribution is $\le$ that of any $T$; on
$R_1$, $T^\* = 1$ and $p - tq < 0$; on $R_0$, $T^\* = 0$ and $p - tq > 0$; on
$R_{eq}$, $p = tq$ so the integrand is independent of $T$. In each region the
pointwise minimiser of $T\,(p - tq)$ agrees with $T^\*$, and summing gives the
inequality with value $\int \min(p, tq)\,\mathrm d\mu$. (To be formalised.)

<a id="lem:np-sum"></a>

## Lemma: Sum-minimizing test

With equal weights $t = 1$, the test minimising $\alpha(\phi) + \beta(\phi)$ is
the [threshold test](#def:threshold-test) at $t = 1$, i.e. $\mathbf 1\{q > p\}$
off the null set (equivalently $\mathbf 1\{\mathrm dP < \mathrm dQ\} = \mathbf 1\{L < 1\}$),
and the minimal total error is
$$\min_\phi\big(\alpha(\phi) + \beta(\phi)\big) = \int_\Omega \min(\mathrm dP, \mathrm dQ) = \int_\Omega \min(p, q)\,\mathrm d\mu.$$
This is the special case $t = 1$ of [the sum-of-errors optimum](#thm:np-weighted)
that [Chapter 3](03-total-variation.md) identifies with $1 - \mathrm{TV}(P,Q)$.
