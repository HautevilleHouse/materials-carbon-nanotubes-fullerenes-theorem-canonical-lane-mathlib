import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheorem

structure ElasticityPackage where
  elasticTensor : Type u
  stressStrainRelation : Type v
  youngModulus : Prop
  poissonRatio : Prop
  shearModulus : Prop
  bulkModulus : Prop
  youngModulusDefined : youngModulus
  poissonRatioDefined : poissonRatio
  shearModulusDefined : shearModulus
  bulkModulusDefined : bulkModulus

structure ElasticityEvidence (E : ElasticityPackage) where
  elasticTensorClosed : E.elasticTensor
  stressStrainRelationClosed : E.stressStrainRelation
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio
  shearModulusClosed : E.shearModulus
  bulkModulusClosed : E.bulkModulus

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.elasticTensor ∧ E.stressStrainRelation ∧ E.youngModulus ∧ E.poissonRatio ∧ E.shearModulus ∧ E.bulkModulus

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.elasticTensorClosed
    (And.intro Ev.stressStrainRelationClosed
      (And.intro Ev.youngModulusClosed
        (And.intro Ev.poissonRatioClosed
          (And.intro Ev.shearModulusClosed Ev.bulkModulusClosed))))

end MaterialsCarbonNanotubesFullerenesTheorem
end HautevilleHouse