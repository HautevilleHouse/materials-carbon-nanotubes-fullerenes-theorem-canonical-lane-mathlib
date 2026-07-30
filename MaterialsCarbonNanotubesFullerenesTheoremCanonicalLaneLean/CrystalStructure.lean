import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheorem

structure CrystalStructurePackage where
  unitCell : Type u
  bravaisLattice : Type v
  atomPositions : unitCell -> Type w
  latticeVectors : Type u
  symmetryGroup : Type u
  structureFactor : Prop
  xrdPattern : Prop
  latticeVectorsDefined : structureFactor
  symmetryGroupDefined : xrdPattern

structure CrystalStructureEvidence (C : CrystalStructurePackage) where
  unitCellClosed : C.unitCell
  bravaisLatticeClosed : C.bravaisLattice
  atomPositionsClosed : C.atomPositions
  structureFactorClosed : C.structureFactor
  xrdPatternClosed : C.xrdPattern

def CrystalStructureClosed (C : CrystalStructurePackage) : Prop :=
  C.unitCell ∧ C.bravaisLattice ∧ C.atomPositions ∧ C.structureFactor ∧ C.xrdPattern

theorem crystal_structure_closed_from_evidence (C : CrystalStructurePackage) (E : CrystalStructureEvidence C) : CrystalStructureClosed C := by
  exact And.intro E.unitCellClosed
    (And.intro E.bravaisLatticeClosed
      (And.intro E.atomPositionsClosed
        (And.intro E.structureFactorClosed E.xrdPatternClosed)))

end MaterialsCarbonNanotubesFullerenesTheorem
end HautevilleHouse
