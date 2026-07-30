import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure MechanicalElasticityPackage where
  elasticModulus : Prop
  youngModulus : Prop
  shearModulus : Prop
  poissonRatio : Prop
  stressStrainRelation : Prop

structure MechanicalElasticityEvidence (M : MechanicalElasticityPackage) where
  elasticModulusClosed : M.elasticModulus
  youngModulusClosed : M.youngModulus
  shearModulusClosed : M.shearModulus
  poissonRatioClosed : M.poissonRatio
  stressStrainRelationClosed : M.stressStrainRelation

def MechanicalElasticityClosed (M : MechanicalElasticityPackage) : Prop :=
  M.elasticModulus ∧ M.youngModulus ∧ M.shearModulus ∧ M.poissonRatio ∧ M.stressStrainRelation

theorem mechanical_elasticity_closed_from_evidence (M : MechanicalElasticityPackage)
    (E : MechanicalElasticityEvidence M) : MechanicalElasticityClosed M := by
  exact And.intro E.elasticModulusClosed
    (And.intro E.youngModulusClosed
      (And.intro E.shearModulusClosed
        (And.intro E.poissonRatioClosed E.stressStrainRelationClosed)))

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse
