import canonicalLaneMathlib.AdmissibleClass

/-!
# Phase Diagram Bridge Package
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  phaseBoundary : Type
  criticalTemperature : Prop
  triplePoint : Prop
  phasesPresent : List String
  phaseTransitions : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  criticalTemperatureClosed : P.criticalTemperature
  triplePointClosed : P.triplePoint
  phaseTransitionsClosed : P.phaseTransitions

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.criticalTemperature ∧ P.triplePoint ∧ P.phaseTransitions

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.criticalTemperatureClosed
    (And.intro E.triplePointClosed E.phaseTransitionsClosed)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse