# Le Cam's two-point minimax lower bound

This chapter closes the core arc. LeCam's two-point method reduces bounding the
minimax risk of an estimation problem to distinguishing two hypotheses, and the
best any test can do at that is governed by [the total-error identity](03-total-variation.md#thm:min-error-tv).
Combining the two gives a lower bound in terms of $1 - \mathrm{TV}$, and feeding
in [the chi-square bound](04-f-divergences.md#thm:tv-le-chisq) yields a bound that is checkable
from second moments alone.

> [!note] Where this sits in the larger theory
> The two-point bound is the base case of the abstract comparison-of-experiments
> machinery planned in Chapters 7–10. The quantity $1 - \mathrm{TV}(P_0,P_1)$ is
> the value $E(1)$ of the [error function](08-error-function.md#def:error-function) (Chapter 8); the
> statement that no experiment can distinguish $\theta_0,\theta_1$ better than
> the given one is a [deficiency](09-deficiency.md#def:deficiency) statement (Chapter 9); and the
> asymptotic versions, where $P_{0,n}, P_{1,n}$ are
> [mutually contiguous](10-convergence-contiguity.md#def:mutual-contiguity), are exactly the regime of
> Chapter 10. Nothing below depends on those chapters — this note only places
> the two-point lemma inside them.

<a id="def:minimax-risk"></a>

## Definition: Minimax risk and separated hypotheses

Let $\{P_\theta : \theta \in \Theta\}$ be a statistical model, $d$ a
semi-distance on $\Theta$, and consider estimators $\hat\theta$ of $\theta$. The
**minimax risk** for the loss $d$ is
$$\mathcal R^\* = \inf_{\hat\theta} \sup_{\theta \in \Theta} \mathbb E_{P_\theta}\big[d(\hat\theta, \theta)\big].$$
Two parameters $\theta_0, \theta_1$ are **$\Delta$-separated** when
$d(\theta_0, \theta_1) \ge \Delta$; then any estimate is at distance $\ge \Delta/2$
from at least one of them.

<a id="thm:lecam-two-point"></a>

## Theorem: LeCam two-point lower bound

For $\Delta$-separated $\theta_0, \theta_1$ with laws $P_0 = P_{\theta_0}$,
$P_1 = P_{\theta_1}$,
$$\mathcal R^\* \ge \frac{\Delta}{2}\big(1 - \mathrm{TV}(P_0, P_1)\big) = \frac{\Delta}{2} \int_{\mathcal X} \min(\mathrm dP_0, \mathrm dP_1).$$

### Proof

Restrict the supremum to $\{\theta_0, \theta_1\}$ and lower bound the max by the
average. An estimator $\hat\theta$ induces a test (decide $\theta_1$ when
$\hat\theta$ is closer to it); $\Delta$-separation and the triangle inequality
turn its risk into $\tfrac{\Delta}{2}$ times a total error $\alpha + \beta$. By
[the total-error identity](03-total-variation.md#thm:min-error-tv) that sum is at least
$1 - \mathrm{TV}(P_0, P_1)$, giving the bound.

<a id="cor:lecam-chisq"></a>

## Corollary: Chi-square form of the lower bound

If in addition $P_0 \ll P_1$,
$$\mathcal R^\* \ge \frac{\Delta}{2}\left(1 - \tfrac12\sqrt{\chi^2(P_0 \,\Vert\, P_1)}\right).$$
In particular a bounded chi-square divergence between the two hypotheses forces
a nontrivial minimax lower bound — the form used in practice, since $\chi^2$ is
often the most tractable divergence to compute.

### Proof

Insert [the chi-square bound](04-f-divergences.md#thm:tv-le-chisq) $\mathrm{TV}(P_0,P_1) \le \tfrac12\sqrt{\chi^2(P_0\Vert P_1)}$
into [the two-point bound](#thm:lecam-two-point).
