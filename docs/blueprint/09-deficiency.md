# Comparison of experiments: deficiency

Two [experiments](01-testing-and-errors.md#def:experiment) on the same parameter can be compared: one is
**more informative** than another if any decision made from the second can be
matched, up to randomisation, using the first. Le Cam's **deficiency**
quantifies the shortfall, and the resulting **Le Cam distance** metrises the
space of experiments. For the two-point case this comparison collapses onto a
single scalar — the [error function](08-error-function.md#def:error-function) — which makes the
abstract theory concrete here. The randomisations that define deficiency are
the Markov kernels described in [Chapter 6](06-kernel-migration.md).

<a id="def:deficiency"></a>

## Definition: Deficiency

For two [experiments](01-testing-and-errors.md#def:experiment) $\mathcal E = (\mathcal X, (P_\theta))$
and $\mathcal F = (\mathcal Y, (Q_\theta))$ indexed by the same $\theta \in \Theta$,
the **deficiency** of $\mathcal E$ relative to $\mathcal F$ is
$$\delta(\mathcal E, \mathcal F) = \inf_{K} \sup_{\theta \in \Theta} \tfrac12\big\lVert K P_\theta - Q_\theta \big\rVert_{\mathrm{TV}},$$
the infimum over Markov kernels (randomisations) $K$ from $\mathcal X$ to
$\mathcal Y$ of the worst-case total-variation gap between the transported law
$K P_\theta$ and the target $Q_\theta$. It measures how well the observations of
$\mathcal E$, post-processed, can imitate those of $\mathcal F$.

<a id="def:more-informative"></a>

## Definition: More informative experiment

$\mathcal E$ is **more informative** than $\mathcal F$, written
$\mathcal E \succeq \mathcal F$, when $\delta(\mathcal E, \mathcal F) = 0$: some
sequence of randomisations of $\mathcal E$ reproduces $\mathcal F$'s laws to
arbitrary total-variation accuracy, uniformly in $\theta$. Then every risk
attainable in $\mathcal F$ is matched in $\mathcal E$, so no statistical problem
is solved better in $\mathcal F$.

<a id="def:deficiency-distance"></a>

## Definition: Le Cam distance

The **Le Cam distance** between $\mathcal E$ and $\mathcal F$ symmetrises the
[deficiency](#def:deficiency),
$$\Delta(\mathcal E, \mathcal F) = \max\big(\delta(\mathcal E, \mathcal F),\ \delta(\mathcal F, \mathcal E)\big) \in [0,1].$$
It vanishes exactly when each experiment is [more informative](#def:more-informative)
than the other, i.e. when they are statistically equivalent.

<a id="lem:deficiency-pseudometric"></a>

## Lemma: Le Cam distance is a pseudometric

$\Delta$ is a **pseudometric** on experiments over a fixed index set: it is
symmetric, non-negative, satisfies $\Delta(\mathcal E,\mathcal E) = 0$, and obeys
the triangle inequality
$$\Delta(\mathcal E, \mathcal G) \le \Delta(\mathcal E, \mathcal F) + \Delta(\mathcal F, \mathcal G).$$

### Proof

Symmetry and $\Delta(\mathcal E,\mathcal E) = 0$ are immediate (take $K$ the
identity kernel). For the triangle inequality, compose randomisations: if $K$
sends $\mathcal E$ near $\mathcal F$ and $L$ sends $\mathcal F$ near
$\mathcal G$, then $L \circ K$ sends $\mathcal E$ near $\mathcal G$, and the
[data-processing inequality](04-f-divergences.md#thm:dpi) controls the composite total-variation
gap by the sum, since $K$ is a Markov kernel and $\tfrac12\lVert\cdot\rVert_{\mathrm{TV}}$
contracts under it.

<a id="thm:deficiency-error-function"></a>

## Theorem: Deficiency via error functions

For two-point experiments $\mathcal E, \mathcal F$ on the same
$\{\theta_0, \theta_1\}$, the [deficiency](#def:deficiency) is the worst upward
gap between their [error functions](08-error-function.md#def:error-function),
$$\delta(\mathcal E, \mathcal F) = \sup_{t \ge 0} \big(E_{\mathcal F}(t) - E_{\mathcal E}(t)\big)_+,$$
where $E_{\mathcal E}, E_{\mathcal F}$ are the two error functions. Comparison of
two-point experiments is therefore comparison of two concave curves.

### Proof

A randomisation can only raise the Bayes risk (it is post-processing, so [data
processing](04-f-divergences.md#thm:dpi) gives $E_{K\mathcal E} \ge E_{\mathcal E}$ pointwise), and
matching $\mathcal F$ means $E$ of the transported experiment dominates
$E_{\mathcal F}$. Conversely, the [randomisation
criterion](#lem:deficiency-pseudometric) constructs a kernel achieving any gap
allowed by the curves. The two bounds meet at
$\sup_t (E_{\mathcal F} - E_{\mathcal E})_+$.

<a id="cor:equivalence-error-function"></a>

## Corollary: Equivalence is equality of error functions

Two two-point experiments have [Le Cam distance](#def:deficiency-distance)
$\Delta(\mathcal E, \mathcal F) = 0$ if and only if their
[error functions](08-error-function.md#def:error-function) coincide,
$E_{\mathcal E} \equiv E_{\mathcal F}$. The error function is thus a **complete
invariant** of a two-point experiment up to statistical equivalence.

### Proof

By [the error-function formula](#thm:deficiency-error-function), both
$\delta(\mathcal E, \mathcal F) = 0$ and $\delta(\mathcal F, \mathcal E) = 0$
hold iff neither error function exceeds the other anywhere, i.e. iff they are
equal. Then $\Delta = \max(0,0) = 0$, and conversely.
