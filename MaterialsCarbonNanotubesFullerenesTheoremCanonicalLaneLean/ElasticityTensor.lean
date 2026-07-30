import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure ElasticityTensor where
   c11 : Float
   c12 : Float
   c44 : Float
   youngModulus : Float
   poissonRatio : Float
   material : String

structure ElasticityTensorEvidence (E : ElasticityTensor) where
  c11Closed : E.c11 > 0
  c12Closed : E.c12 ∈ Set.Ioo (-E.c11) (E.c11)
  c44Closed : E.c44 > 0
  youngModulusClosed : E.youngModulus > 0
  poissonRatioClosed : E.poissonRatio ∈ Set.Ioo (-1) 0.5
  materialClosed : E.material ≠ ""

def ElasticityTensorClosed (E : ElasticityTensor) : Prop :=
  E.c11 > 0 ∧ E.c12 > -E.c11 ∧ E.c12 < E.c11 ∧ E.c44 > 0 ∧
  E.youngModulus > 0 ∧ E.poissonRatio > -1 ∧ E.poissonRatio < 0.5 ∧ E.material ≠ ""

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensor) (Ev : ElasticityTensorEvidence E) :
  ElasticityTensorClosed E := by
  rcases Ev with ⟨c11pos, c12range, c44pos, ypos, prange, mneq⟩
  rcases c12range with ⟨c12gt, c12lt⟩
  rcases prange with ⟨prgt, prlt⟩
  exact And.intro c11pos (And.intro c12gt (And.intro c12lt (And.intro c44pos (And.intro ypos (And.intro prgt (And.intro prlt mneq))))))

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse