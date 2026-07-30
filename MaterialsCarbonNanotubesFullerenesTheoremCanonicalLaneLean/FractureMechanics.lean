import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheorem

structure FractureMechanicsPackage where
  crackPropagation : Type u
  stressIntensity : Type v
  fractureToughness : Prop
  crackGrowthRate : Prop
  fatigueLife : Prop
  fractureToughnessDefined : fractureToughness
  crackGrowthRateDefined : crackGrowthRate
  fatigueLifeDefined : fatigueLife

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  crackPropagationClosed : F.crackPropagation
  stressIntensityClosed : F.stressIntensity
  fractureToughnessClosed : F.fractureToughness
  crackGrowthRateClosed : F.crackGrowthRate
  fatigueLifeClosed : F.fatigueLife

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.crackPropagation ∧ F.stressIntensity ∧ F.fractureToughness ∧ F.crackGrowthRate ∧ F.fatigueLife

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.crackPropagationClosed
    (And.intro E.stressIntensityClosed
      (And.intro E.fractureToughnessClosed
        (And.intro E.crackGrowthRateClosed E.fatigueLifeClosed)))

end MaterialsCarbonNanotubesFullerenesTheorem
end HautevilleHouse