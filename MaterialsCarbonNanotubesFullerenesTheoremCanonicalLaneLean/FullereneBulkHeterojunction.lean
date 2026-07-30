import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure FullereneBulkHeterojunctionPackage where
  donorMaterial : String
  acceptorMaterial : String
  blendMorphology : Prop
  chargeSeparationEfficiency : ℝ
  percolationPathway : Prop

structure FullereneBulkHeterojunctionEvidence (H : FullereneBulkHeterojunctionPackage) where
  blendMorphologyClosed : H.blendMorphology
  chargeSeparationEfficiencyPositive : H.chargeSeparationEfficiency > 0
  percolationPathwayClosed : H.percolationPathway

def FullereneBulkHeterojunctionClosed (H : FullereneBulkHeterojunctionPackage) : Prop :=
  H.blendMorphology ∧ (H.chargeSeparationEfficiency > 0) ∧ H.percolationPathway

theorem fullerene_bulk_heterojunction_closed_from_evidence (H : FullereneBulkHeterojunctionPackage) (Ev : FullereneBulkHeterojunctionEvidence H) :
    FullereneBulkHeterojunctionClosed H := by
  exact And.intro Ev.blendMorphologyClosed (And.intro Ev.chargeSeparationEfficiencyPositive Ev.percolationPathwayClosed)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse