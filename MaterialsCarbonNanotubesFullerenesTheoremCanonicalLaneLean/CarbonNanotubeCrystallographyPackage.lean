import canonicalLaneMathlib.AdmissibleClass

/-!
# Carbon Nanotube Crystallography Package

Defines crystallographic data for carbon nanotubes: chirality indices (n,m),
Bravais lattice, reciprocal lattice, Brillouin zone, and symmetry operations.
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure CarbonNanotubeCrystallographyPackage where
  pairChiralityIndices : ℕ × ℕ
  bravaisLatticeType : String
  reciprocalLatticeVectors : Type u
  brillouinZone : Type v
  symmetryGroup : Type w
  chiralityVectorsDefined : Prop
  latticeStructureConsistent : Prop

structure CarbonNanotubeCrystallographyEvidence (C : CarbonNanotubeCrystallographyPackage) where
  chiralityVectorsDefinedClosed : C.chiralityVectorsDefined
  latticeStructureConsistentClosed : C.latticeStructureConsistent

def CarbonNanotubeCrystallographyClosed (C : CarbonNanotubeCrystallographyPackage) : Prop :=
  C.chiralityVectorsDefined ∧ C.latticeStructureConsistent

theorem carbon_nanotube_crystallography_closed_from_evidence
    (C : CarbonNanotubeCrystallographyPackage)
    (E : CarbonNanotubeCrystallographyEvidence C) : CarbonNanotubeCrystallographyClosed C := by
  exact And.intro E.chiralityVectorsDefinedClosed E.latticeStructureConsistentClosed

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse
