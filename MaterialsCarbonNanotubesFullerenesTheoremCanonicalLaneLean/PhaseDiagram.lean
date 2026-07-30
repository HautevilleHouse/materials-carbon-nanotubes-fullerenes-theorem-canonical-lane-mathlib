import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheorem

structure PhaseDiagramPackage where
  temperatureRange : Type u
  pressureRange : Type v
  phaseBoundaries : Type u
  triplePoint : Prop
  criticalPoint : Prop
  transitionLines : Prop
  triplePointDefined : triplePoint
  criticalPointDefined : criticalPoint
  transitionLinesDefined : transitionLines

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureRangeClosed : P.temperatureRange
  pressureRangeClosed : P.pressureRange
  phaseBoundariesClosed : P.phaseBoundaries
  triplePointClosed : P.triplePoint
  criticalPointClosed : P.criticalPoint
  transitionLinesClosed : P.transitionLines

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureRange ∧ P.pressureRange ∧ P.phaseBoundaries ∧ P.triplePoint ∧ P.criticalPoint ∧ P.transitionLines

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeClosed
    (And.intro E.pressureRangeClosed
      (And.intro E.phaseBoundariesClosed
        (And.intro E.triplePointClosed
          (And.intro E.criticalPointClosed E.transitionLinesClosed))))

end MaterialsCarbonNanotubesFullerenesTheorem
end HautevilleHouse