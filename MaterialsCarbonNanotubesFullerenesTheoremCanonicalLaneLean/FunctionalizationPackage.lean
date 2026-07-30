import canonicalLaneMathlib.AdmissibleClass

/-!
# Functionalization Package

Defines covalent and non-covalent functionalization of nanotubes and fullerenes:
reaction sites, binding energies, and resulting modification of electronic properties.
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure FunctionalizationPackage where
  functionalGroupType : String
  bindingEnergy : ℚ
  reactionSite : ℕ
  modifiedBandGap : ℚ
  functionalizationReversible : Prop
  bindingEnergyComputed : Prop
  bandGapShiftComputed : Prop

structure FunctionalizationEvidence (F : FunctionalizationPackage) where
  bindingEnergyComputedClosed : F.bindingEnergyComputed
  bandGapShiftComputedClosed : F.bandGapShiftComputed

def FunctionalizationClosed (F : FunctionalizationPackage) : Prop :=
  F.bindingEnergyComputed ∧ F.bandGapShiftComputed

theorem functionalization_closed_from_evidence
    (F : FunctionalizationPackage) (E : FunctionalizationEvidence F) :
    FunctionalizationClosed F := by
  exact And.intro E.bindingEnergyComputedClosed E.bandGapShiftComputedClosed

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse
