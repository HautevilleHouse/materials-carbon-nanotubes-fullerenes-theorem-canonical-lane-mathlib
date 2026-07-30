import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure AtomicCrystalStructurePackage where
  latticeType : Type
  basisAtoms : Type
  unitCellSymmetry : Prop
  bravaisLatticeClassification : Prop
  atomicPositions : Prop

structure AtomicCrystalStructureEvidence (A : AtomicCrystalStructurePackage) where
  unitCellSymmetryClosed : A.unitCellSymmetry
  bravaisLatticeClassificationClosed : A.bravaisLatticeClassification
  atomicPositionsClosed : A.atomicPositions

def AtomicCrystalStructureClosed (A : AtomicCrystalStructurePackage) : Prop :=
  A.unitCellSymmetry ∧ A.bravaisLatticeClassification ∧ A.atomicPositions

theorem atomic_crystal_structure_closed_from_evidence (A : AtomicCrystalStructurePackage)
    (E : AtomicCrystalStructureEvidence A) : AtomicCrystalStructureClosed A := by
  exact And.intro E.unitCellSymmetryClosed
    (And.intro E.bravaisLatticeClassificationClosed E.atomicPositionsClosed)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse
