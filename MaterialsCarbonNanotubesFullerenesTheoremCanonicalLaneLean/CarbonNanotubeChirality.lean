import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure CarbonNanotubeChirality where
  n : Nat
  m : Nat
  diameter : Float
  chiralAngle : Float
  metallicOrSemiconducting : String
  handedness : String

structure CarbonNanotubeChiralityEvidence (C : CarbonNanotubeChirality) where
  nClosed : C.n > 0
  mClosed : C.m ≥ 0
  diameterClosed : C.diameter > 0
  chiralAngleClosed : 0 ≤ C.chiralAngle ∧ C.chiralAngle < 90
  metallicOrSemiconductingClosed : C.metallicOrSemiconducting ∈ {"metallic", "semiconducting"}
  handednessClosed : C.handedness ∈ {"left", "right"}

def CarbonNanotubeChiralityClosed (C : CarbonNanotubeChirality) : Prop :=
  C.n > 0 ∧ C.m ≥ 0 ∧ C.diameter > 0 ∧ 0 ≤ C.chiralAngle ∧ C.chiralAngle < 90 ∧
  C.metallicOrSemiconducting ∈ {"metallic", "semiconducting"} ∧ C.handedness ∈ {"left", "right"}

theorem carbon_nanotube_chirality_closed_from_evidence (C : CarbonNanotubeChirality) (E : CarbonNanotubeChiralityEvidence C) :
  CarbonNanotubeChiralityClosed C := by
  exact And.intro E.nClosed
    (And.intro E.mClosed
      (And.intro E.diameterClosed
        (And.intro E.chiralAngleClosed.1
          (And.intro E.chiralAngleClosed.2
            (And.intro E.metallicOrSemiconductingClosed E.handednessClosed)))))

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse