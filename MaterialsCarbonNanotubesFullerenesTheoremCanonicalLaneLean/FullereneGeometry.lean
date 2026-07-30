import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure FullereneGeometry where
  carbonCount : Nat
  pentagonCount : Nat
  hexagonCount : Nat
  symmetryGroup : String
  icosahedral : Prop
  molecularFormula : String

structure FullereneGeometryEvidence (F : FullereneGeometry) where
  carbonCountClosed : F.carbonCount ≥ 20
  pentagonCountClosed : F.pentagonCount = 12
  hexagonCountClosed : F.hexagonCount = (F.carbonCount - 20) / 2
  symmetryGroupClosed : F.symmetryGroup ≠ ""
  icosahedralClosed : F.icosahedral → F.symmetryGroup = "Ih"
  molecularFormulaClosed : F.molecularFormula ≠ ""

def FullereneGeometryClosed (F : FullereneGeometry) : Prop :=
  F.carbonCount ≥ 20 ∧ F.pentagonCount = 12 ∧ F.hexagonCount = (F.carbonCount - 20) / 2 ∧
  F.symmetryGroup ≠ "" ∧ (F.icosahedral → F.symmetryGroup = "Ih") ∧ F.molecularFormula ≠ ""

theorem fullerene_geometry_closed_from_evidence (F : FullereneGeometry) (E : FullereneGeometryEvidence F) :
  FullereneGeometryClosed F := by
  exact And.intro E.carbonCountClosed
    (And.intro E.pentagonCountClosed
      (And.intro E.hexagonCountClosed
        (And.intro E.symmetryGroupClosed
          (And.intro E.icosahedralClosed E.molecularFormulaClosed))))

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse