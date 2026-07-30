import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure NanotubeElasticPropertiesPackage where
  youngModulusTPa : ℝ
  poissonRatio : ℝ
  fractureStrain : ℝ
  linearElasticityRange : Prop
  continuumShellModel : Prop

structure NanotubeElasticPropertiesEvidence (E : NanotubeElasticPropertiesPackage) where
  linearElasticityRangeClosed : E.linearElasticityRange
  continuumShellModelClosed : E.continuumShellModel

def NanotubeElasticPropertiesClosed (E : NanotubeElasticPropertiesPackage) : Prop :=
  E.linearElasticityRange ∧ E.continuumShellModel

theorem nanotube_elastic_properties_closed_from_evidence (E : NanotubeElasticPropertiesPackage) (Ev : NanotubeElasticPropertiesEvidence E) :
    NanotubeElasticPropertiesClosed E := by
  exact And.intro Ev.linearElasticityRangeClosed Ev.continuumShellModelClosed

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse