import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure FullereneCageGeometryPackage where
  carbonAtoms : Nat
  pentagonCount : Nat
  hexagonCount : Nat
  closedCage : Prop
  eulerCharacteristicFormula : Prop
  isolatedPentagonRule : Prop

structure FullereneCageGeometryEvidence (G : FullereneCageGeometryPackage) where
  closedCageClosed : G.closedCage
  eulerCharacteristicFormulaClosed : G.eulerCharacteristicFormula
  isolatedPentagonRuleClosed : G.isolatedPentagonRule

def FullereneCageGeometryClosed (G : FullereneCageGeometryPackage) : Prop :=
  G.closedCage ∧ G.eulerCharacteristicFormula ∧ G.isolatedPentagonRule

theorem fullerene_cage_geometry_closed_from_evidence (G : FullereneCageGeometryPackage) (E : FullereneCageGeometryEvidence G) :
    FullereneCageGeometryClosed G := by
  exact And.intro E.closedCageClosed (And.intro E.eulerCharacteristicFormulaClosed E.isolatedPentagonRuleClosed)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse