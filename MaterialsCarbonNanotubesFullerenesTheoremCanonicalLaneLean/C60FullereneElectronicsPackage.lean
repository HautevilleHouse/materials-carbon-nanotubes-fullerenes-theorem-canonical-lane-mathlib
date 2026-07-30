import canonicalLaneMathlib.AdmissibleClass

/-!
# C60 Fullerene Electronic Structure Package

Defines the electronic structure of C60: molecular orbitals,
HOMO-LUMO gap, optical transitions, and electron correlation.
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure C60FullereneElectronicsPackage {G : C60FullereneGeometryPackage} where
  molecularOrbitals : Type u
  homoLevel : ℚ
  lumoLevel : ℚ
  homoGap : ℚ
  opticalTransitionEnergies : List ℚ
  electronCorrelationModel : String
  orbitalsComputed : Prop
  gapConsistent : Prop

structure C60FullereneElectronicsEvidence {G : C60FullereneGeometryPackage}
    (F : C60FullereneElectronicsPackage G) where
  orbitalsComputedClosed : F.orbitalsComputed
  gapConsistentClosed : F.gapConsistent

def C60FullereneElectronicsClosed {G : C60FullereneGeometryPackage}
    (F : C60FullereneElectronicsPackage G) : Prop :=
  F.orbitalsComputed ∧ F.gapConsistent

theorem c60_fullerene_electronics_closed_from_evidence
    {G : C60FullereneGeometryPackage}
    (F : C60FullereneElectronicsPackage G)
    (E : C60FullereneElectronicsEvidence F) : C60FullereneElectronicsClosed F := by
  exact And.intro E.orbitalsComputedClosed E.gapConsistentClosed

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse
