import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure FractureToughness where
  stressIntensityFactor : Float
  crackLength : Float
  appliedStress : Float
  fractureMode : String
  material : String

structure FractureToughnessEvidence (F : FractureToughness) where
  stressIntensityFactorClosed : F.stressIntensityFactor > 0
  crackLengthClosed : F.crackLength > 0
  appliedStressClosed : F.appliedStress > 0
  fractureModeClosed : F.fractureMode ∈ {"I", "II", "III"}
  materialClosed : F.material ≠ ""

def FractureToughnessClosed (F : FractureToughness) : Prop :=
  F.stressIntensityFactor > 0 ∧ F.crackLength > 0 ∧ F.appliedStress > 0 ∧
  F.fractureMode ∈ {"I", "II", "III"} ∧ F.material ≠ ""

theorem fracture_toughness_closed_from_evidence (F : FractureToughness) (E : FractureToughnessEvidence F) :
  FractureToughnessClosed F := by
  exact And.intro E.stressIntensityFactorClosed
    (And.intro E.crackLengthClosed
      (And.intro E.appliedStressClosed
        (And.intro E.fractureModeClosed E.materialClosed)))

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse