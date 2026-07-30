import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure CarbonNanotubeSynthesisPackage where
  method : String
  growthTemperatureK : ℝ
  catalystMaterial : String
  yieldMg : ℝ
  purityPercent : ℝ
  chiralityControl : Prop

structure CarbonNanotubeSynthesisEvidence (S : CarbonNanotubeSynthesisPackage) where
  chiralityControlClosed : S.chiralityControl
  yieldPositive : S.yieldMg > 0
  puritySufficient : S.purityPercent > 90

def CarbonNanotubeSynthesisClosed (S : CarbonNanotubeSynthesisPackage) : Prop :=
  S.chiralityControl ∧ (S.yieldMg > 0) ∧ (S.purityPercent > 90)

theorem carbon_nanotube_synthesis_closed_from_evidence (S : CarbonNanotubeSynthesisPackage) (E : CarbonNanotubeSynthesisEvidence S) :
    CarbonNanotubeSynthesisClosed S := by
  exact And.intro E.chiralityControlClosed (And.intro E.yieldPositive E.puritySufficient)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse