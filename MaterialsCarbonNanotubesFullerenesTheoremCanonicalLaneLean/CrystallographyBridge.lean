import canonicalLaneMathlib.AdmissibleClass

/-!
# Crystallography Bridge Package
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure CrystallographyPackage where
  BravaisLattice : Type
  unitCell : Type
  reciprocalLattice : Type
  symmetryGroup : Prop
  spaceGroupClassification : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  symmetryGroupClosed : C.symmetryGroup
  spaceGroupClassificationClosed : C.spaceGroupClassification

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.symmetryGroup ∧ C.spaceGroupClassification

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.symmetryGroupClosed E.spaceGroupClassificationClosed

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse