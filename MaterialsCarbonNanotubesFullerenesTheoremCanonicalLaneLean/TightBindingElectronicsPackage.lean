import canonicalLaneMathlib.AdmissibleClass

/-!
# Tight-Binding Electronic Structure Package

Defines the tight-binding model for carbon nanotubes: hopping integrals,
band structure, density of states, and metallicity condition.
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure TightBindingElectronicsPackage {C : CarbonNanotubeCrystallographyPackage} where
  hoppingParameter : ℚ
  onsiteEnergy : ℚ
  unitCellHamiltonian : Type u
  bandStructure : Type v
  bandGap : ℚ
  metallicityCondition : Prop
  hamiltonianHermitian : Prop
  bandStructureComputed : Prop

structure TightBindingElectronicsEvidence {C : CarbonNanotubeCrystallographyPackage}
    (T : TightBindingElectronicsPackage C) where
  metallicityConditionClosed : T.metallicityCondition
  hamiltonianHermitianClosed : T.hamiltonianHermitian
  bandStructureComputedClosed : T.bandStructureComputed

def TightBindingElectronicsClosed {C : CarbonNanotubeCrystallographyPackage}
    (T : TightBindingElectronicsPackage C) : Prop :=
  T.metallicityCondition ∧ T.hamiltonianHermitian ∧ T.bandStructureComputed

theorem tight_binding_electronics_closed_from_evidence
    {C : CarbonNanotubeCrystallographyPackage}
    (T : TightBindingElectronicsPackage C)
    (E : TightBindingElectronicsEvidence T) : TightBindingElectronicsClosed T := by
  exact And.intro E.metallicityConditionClosed
    (And.intro E.hamiltonianHermitianClosed E.bandStructureComputedClosed)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse
