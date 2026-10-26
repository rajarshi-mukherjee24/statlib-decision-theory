# statlib-decision-theory

A Lean 4 + Mathlib formalization of two-point statistical decision theory for
[stat-lib](https://stat-lib.github.io/): the Neyman–Pearson lemma, the minimal
testing error, total variation, and the f-divergence inequalities that lead to
Le Cam's two-point minimax lower bound.

## Code (`Statlib/`)

| Module | Content |
|---|---|
| `Testing.Basic` | `Test`, type I/II errors, likelihood ratio, weighted risk |
| `Testing.NeymanPearson` | threshold test `npTest`, `npTest_isMinimizer` (minimizes the weighted sum of errors) |
| `Testing.MinimalError` | minimal error `= 1 − TV(P,Q)` at `t = 1`, and the χ² Cauchy–Schwarz bound |
| `Testing.Auxiliary` | supporting `ℝ≥0∞` / `∫⁻` lemmas |
| `Divergence.Basic` | `f`-divergence, χ²-divergence, Hellinger affinity (provisional) |
| `Divergence.ChiSquared` | `TV ≤ ½√χ²` |

Namespaces follow Mathlib conventions (`Statlib.Testing`, `Statlib.Divergence`).

## Blueprint & dependency graph (`docs/`)

`docs/blueprint/` holds the mathematical notes: a ten-chapter arc from the
Neyman–Pearson lemma to Le Cam's two-point minimax lower bound, passing through
total variation and f-divergence inequalities (chapters 4–9 are the minimax
architecture still to be formalized). `docs/dependency-graph.html` is the node
dependency graph, colored by formalization status.

The blueprint notes are adapted from the
[lean-minimax](https://github.com/zixiaowang17/lean-minimax) project.

## Build

```bash
lake exe cache get
lake build
```

Toolchain: Lean `v4.33.0`, mathlib `v4.33.0`.
