# Randomized tests as Markov kernels

This chapter lays out the mathematics behind re-expressing the
[test abstraction](01-testing-and-errors.md#def:test) on top of Mathlib's kernel-based decision theory
(`ProbabilityTheory.bayesRisk` / `minimaxRisk`, where a decision rule is a
`Kernel 𝓧 𝓨`).

> [!note] Why this migration matters downstream
> Recasting a test as a `Kernel 𝒳 Bool` is what lets the later abstract chapters
> speak of a decision rule between *arbitrary* experiments: the
> [comparison-of-experiments](09-deficiency.md) notion of
> [deficiency](09-deficiency.md#def:deficiency) is defined through exactly such kernels
> (randomizations), and the [convergence](10-convergence-contiguity.md) of
> experiments is convergence of their kernel-level risks. This chapter is the
> bridge from the concrete two-point [test](01-testing-and-errors.md#def:test) to that kernel-based
> decision theory.

Everything rests on one identification, so the "math" of each stage is really
about preserving that identification as the objects move. Fix the two-point
decision space $\mathbf{Bool} = \{\texttt{false}, \texttt{true}\}$ with
$\texttt{true} =$ "reject $H_0$." A randomized test
$\varphi : \mathcal X \to [0,1]$ becomes a Markov kernel
$\kappa : \mathcal X \rightsquigarrow \mathbf{Bool}$ with
$\varphi(x) = \kappa(x)(\{\texttt{true}\})$; deterministic $\{0,1\}$ tests are
the Dirac special case, so no expressivity is lost, and measurability does not
disappear — it relocates into the kernel constructor.

<a id="def:kernel-stage0"></a>

## Definition: Stage 0 — The randomized-test ↔ Markov-kernel correspondence

A **Markov kernel** $\kappa : \mathcal X \rightsquigarrow \mathbf{Bool}$ assigns
to each observation $x$ a *probability measure* $\kappa(x)$ on $\mathbf{Bool}$,
measurably in $x$. Since $\mathbf{Bool}$ has two points, such a measure is
determined by the single number
$$\varphi_\kappa(x) := \kappa(x)(\{\texttt{true}\}) \in [0,1], \qquad \kappa(x)(\{\texttt{false}\}) = 1 - \varphi_\kappa(x).$$
Measurability of $\kappa$ in $x$ is exactly measurability of
$\varphi_\kappa : \mathcal X \to [0,1]$. Conversely, any measurable
$\varphi : \mathcal X \to [0,1]$ induces the kernel
$$\kappa_\varphi(x) = \mathrm{Bernoulli}(\varphi(x)) = \varphi(x)\,\delta_{\texttt{true}} + (1-\varphi(x))\,\delta_{\texttt{false}}.$$
These two maps are mutually inverse ($\varphi_{\kappa_\varphi} = \varphi$ and
$\kappa_{\varphi_\kappa} = \kappa$), so
$$\{\text{randomized tests } \varphi : \mathcal X \to [0,1]\} \;\cong\; \{\text{Markov kernels } \mathcal X \rightsquigarrow \mathbf{Bool}\}.$$
The **deterministic** tests $\varphi = \mathbf 1_R$ are exactly the Dirac-valued
kernels ($\kappa(x) = \delta_{\texttt{true}}$ on $R$, $\delta_{\texttt{false}}$
off $R$); they are the extreme points, and randomization is precisely mixing
between them. This is why nothing in $[0,1]$ is lost by moving to
$\mathbf{Bool}$-kernels. One can first prove the correspondence in a scratch
file before changing the main definitions.

<a id="def:kernel-stage1"></a>

## Definition: Stage 1 — Error probabilities as kernel compositions

Write $P \mathbin{\gg\!=} \kappa$ for the composition (bind):
$(P \mathbin{\gg\!=} \kappa)(B) = \int_{\mathcal X} \kappa(x)(B)\,\mathrm dP(x)$,
a probability measure on $\mathbf{Bool}$. The two error functionals are its two
masses:
$$\alpha(\kappa) = (P \mathbin{\gg\!=} \kappa)(\{\texttt{true}\}) = \int_{\mathcal X} \kappa(x)(\{\texttt{true}\})\,\mathrm dP = \int_{\mathcal X} \varphi_\kappa \,\mathrm dP,$$
$$\beta(\kappa) = (Q \mathbin{\gg\!=} \kappa)(\{\texttt{false}\}) = \int_{\mathcal X} \kappa(x)(\{\texttt{false}\})\,\mathrm dQ = \int_{\mathcal X} (1 - \varphi_\kappa)\,\mathrm dQ.$$
The Markov property
$\kappa(x)(\{\texttt{true}\}) + \kappa(x)(\{\texttt{false}\}) = 1$ makes these
agree *identically* with the original [Type I](01-testing-and-errors.md#def:type-one) and
[Type II](01-testing-and-errors.md#def:type-two) definitions $\int \varphi\,\mathrm dP$ and
$\int(1-\varphi)\,\mathrm dQ$; the power against $Q$ is the complementary mass
$(Q \mathbin{\gg\!=} \kappa)(\{\texttt{true}\}) = 1-\beta$. So the kernel forms
are not a new definition — they are the same two numbers, expressed through
composition. This layer can be added under new names alongside the existing
`structure Test`.

<a id="def:kernel-stage2"></a>

## Definition: Stage 2 — Cutover: the test is the kernel

Identifying $\mathrm{Test}\ \mathcal X := \mathrm{Kernel}\ \mathcal X\ \mathbf{Bool}$
(Markov), the critical function $\varphi$ is *recovered* as
$\varphi_\kappa = \kappa(\cdot)(\{\texttt{true}\})$ rather than being primitive.
Mathematically this changes nothing: every statement quantified over tests
$\varphi : \mathcal X \to [0,1]$ becomes the same statement quantified over
Markov kernels $\kappa$, under the dictionary
$\varphi = \kappa(\cdot)(\{\texttt{true}\})$. In particular the
[Neyman–Pearson](02-neyman-pearson.md#thm:np-weighted) objective is invariant,
$$R_{1,t}(\kappa) = \alpha(\kappa) + t\,\beta(\kappa) = \int \varphi_\kappa \,\mathrm dP + t\int (1-\varphi_\kappa)\,\mathrm dQ,$$
so the optimum, its value $\int \min(p,\, t\,q)\,\mathrm d\mu$, and the
equal-weight [total-error identity](03-total-variation.md#thm:min-error-tv)
$\alpha+\beta = 1 - \mathrm{TV}(P,Q)$ all transport verbatim. The one genuinely
new obligation is that the composition $P \mathbin{\gg\!=} \kappa$ is well-defined
and $\sigma$-additive — exactly the content of $\kappa$ being a Markov kernel.
Keeping the names `Test` / `typeIError` / `typeIIError` means the
[Chapter 1](01-testing-and-errors.md) definitions need no edit; the old
structure is then deleted.

<a id="def:kernel-stage3"></a>

## Definition: Stage 3 — The likelihood-ratio threshold test as a kernel

The [dominating measure](02-neyman-pearson.md#def:dominating) $\mu = P + Q$, the densities
$p = \tfrac{\mathrm dP}{\mathrm d\mu},\ q = \tfrac{\mathrm dQ}{\mathrm d\mu}$, and
the [likelihood-ratio](01-testing-and-errors.md#def:likelihood-ratio) statistic
$$h_{p,q;\gamma} = \frac{q}{p}\,\mathbf 1(p \neq 0) + \gamma\,\mathbf 1(p = 0)$$
are measures and a measurable statistic — unchanged by the migration. What
changes is that the critical function
$$\tau_{t,\eta}(x) = \mathbf 1\big(h > t^{-1},\, N^c\big) + \eta\,\mathbf 1\big(h = t^{-1},\, N^c\big) + \mathbf 1(N), \qquad N = \{p = 0\},\ \eta \in [0,1],$$
is now the parameter of a Bernoulli kernel:
$$\kappa^\*(x) = \mathrm{Bernoulli}\big(\tau_{t,\eta}(x)\big) = \begin{cases} \delta_{\texttt{true}} & q(x) > t^{-1} p(x),\ x \in N^c \quad(\text{strict reject})\\[2pt] \delta_{\texttt{false}} & q(x) < t^{-1} p(x),\ x \in N^c \quad(\text{strict accept})\\[2pt] \mathrm{Bernoulli}(\eta) & q(x) = t^{-1} p(x),\ x \in N^c \quad(\text{tie: randomize})\\[2pt] \delta_{\texttt{true}} & x \in N \quad(\text{reject on the }P\text{-null set}).\end{cases}$$
Two things must hold, both elementary. **Markov:** each $\kappa^\*(x)$ is a
probability measure because $\tau_{t,\eta}(x) \in [0,1]$ is a valid Bernoulli
parameter. **Measurability of $x \mapsto \kappa^\*(x)$:** it reduces to
measurability of $\tau_{t,\eta}$ — i.e. of the density quotient $q/p$ and the
threshold indicators $\{h > t^{-1}\}$, $\{h = t^{-1}\}$, $N$ — the same
measure-theoretic facts the bundled-`Test` [threshold test](02-neyman-pearson.md#def:threshold-test)
already needed. Measurability is thus *relocated into the kernel constructor*,
not removed, and the Stage 2 optimality applies to $\kappa^\*$ directly.
