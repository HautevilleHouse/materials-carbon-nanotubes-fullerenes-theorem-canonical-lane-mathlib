import canonicalLaneMathlib.AdmissibleClass

/-!
# Elasticity Bridge Package
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure ElasticityPackage where
  elasticModulus : Type
  poissonRatio : Prop
  stressStrainRelation : Prop
  anisotropicElasticity : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  poissonRatioClosed : E.poissonRatio
  stressStrainRelationClosed : E.stressStrainRelation
  anisotropicElasticityClosed : E.anisotropicElasticity

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.poissonRatio ∧ E.stressStrainRelation ∧ E.anisotropicElasticity

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (E2 : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro E2.poissonRatioClosed
    (And.intro E2.stressStrainRelationClosed E2.anisotropicElasticityClosed)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse