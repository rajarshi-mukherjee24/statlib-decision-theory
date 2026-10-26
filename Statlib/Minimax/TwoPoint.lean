/-
Copyright (c) 2026 Rajarshi Mukherjee. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Rajarshi Mukherjee
-/
module

public import Statlib.Testing.MinimalError
public import Statlib.Divergence.ChiSquared

/-!
# Le Cam's two-point minimax lower bound

The headline of the minimax arc (blueprint chapter 5). The Neyman–Pearson
optimality (`npTest_isMinimizer`) says the likelihood-ratio test minimizes the
sum of errors; its value at `t = 1` is `1 − TV(P, Q)` (`npTest_error_one_eq`).
Together these give the **two-point lower bound**: no test can separate `P` from
`Q` with total error below `1 − TV(P, Q)`, and — via `TV ≤ ½√χ²` — below
`1 − ½√(χ²(P ‖ Q))`.

## Main results

* `Statlib.Minimax.lecam_two_point` — `α(T) + β(T) ≥ 1 − TV(P, Q)` for every test.
* `Statlib.Minimax.lecam_two_point_chiSq` — the χ² form of the lower bound.
-/

@[expose] public section

open MeasureTheory ENNReal

namespace Statlib.Minimax

open Statlib.Testing Statlib.Divergence

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **Le Cam two-point lower bound (testing form).** No test can make the sum of
its two error probabilities smaller than `1 − TV(P, Q)`: for every measurable
`[0,1]`-valued test `T`, `α(T) + β(T) = errSum P Q 1 T ≥ 1 − TV(P, Q)`. -/
theorem lecam_two_point (P Q : Measure Ω) [IsProbabilityMeasure P] [IsProbabilityMeasure Q]
    {T : Ω → ℝ≥0∞} (hT : Measurable T) (hT1 : ∀ ω, T ω ≤ 1) :
    1 - totalVariation P Q ≤ errSum P Q 1 T := by
  have h : errSum P Q 1 (npTest P Q 1 1) = 1 - totalVariation P Q :=
    npTest_error_one_eq P Q 1 le_rfl
  rw [← h]
  exact (npTest_isMinimizer P Q 1 1 le_rfl).2.2 T hT hT1

/-- **χ² form of the two-point lower bound.** Under `P ≪ Q`, for every measurable
`[0,1]`-valued test `T`, `α(T) + β(T) ≥ 1 − ½√(χ²(P ‖ Q))`. -/
theorem lecam_two_point_chiSq (P Q : Measure Ω) [IsProbabilityMeasure P] [IsProbabilityMeasure Q]
    (hPQ : P ≪ Q) {T : Ω → ℝ≥0∞} (hT : Measurable T) (hT1 : ∀ ω, T ω ≤ 1) :
    1 - 2⁻¹ * (chiSqDiv P Q) ^ ((1 : ℝ) / 2) ≤ errSum P Q 1 T :=
  calc 1 - 2⁻¹ * (chiSqDiv P Q) ^ ((1 : ℝ) / 2)
      ≤ 1 - 2⁻¹ * ∫⁻ ω, ((P.rnDeriv Q ω - 1) + (1 - P.rnDeriv Q ω)) ∂Q :=
        tsub_le_tsub_left (tv_le_chiSq P Q hPQ) 1
    _ = errSum P Q 1 (npTest P Q 1 1) := (npTest_error_one_eq_llr P Q hPQ 1 le_rfl).symm
    _ ≤ errSum P Q 1 T := (npTest_isMinimizer P Q 1 1 le_rfl).2.2 T hT hT1

/-- The **two-point (Bayes) minimax risk**: the least achievable sum of the two
error probabilities over all randomized tests `φ : Test Ω`. -/
noncomputable def minimaxRisk (P Q : Measure Ω) : ℝ≥0∞ :=
  ⨅ φ : Test Ω, errSum P Q 1 φ.toFun

/-- **The two-point minimax risk equals `1 − TV(P, Q)`**, attained by the
Neyman–Pearson test. -/
theorem minimaxRisk_eq (P Q : Measure Ω) [IsProbabilityMeasure P] [IsProbabilityMeasure Q] :
    minimaxRisk P Q = 1 - totalVariation P Q := by
  refine le_antisymm ?_ (le_iInf fun φ => lecam_two_point P Q φ.measurable φ.le_one)
  calc minimaxRisk P Q
      ≤ errSum P Q 1 (thresholdTest P Q 1 1 le_rfl).toFun := iInf_le _ (thresholdTest P Q 1 1 le_rfl)
    _ = 1 - totalVariation P Q := npTest_error_one_eq P Q 1 le_rfl

/-- **χ² lower bound on the two-point minimax risk.** Under `P ≪ Q`,
`minimaxRisk P Q ≥ 1 − ½√(χ²(P ‖ Q))`. -/
theorem minimaxRisk_ge_chiSq (P Q : Measure Ω) [IsProbabilityMeasure P] [IsProbabilityMeasure Q]
    (hPQ : P ≪ Q) :
    1 - 2⁻¹ * (chiSqDiv P Q) ^ ((1 : ℝ) / 2) ≤ minimaxRisk P Q :=
  le_iInf fun φ => lecam_two_point_chiSq P Q hPQ φ.measurable φ.le_one

end Statlib.Minimax
