import canonicalLaneMathlib.AdmissibleClass

/-!
# Carbon Nanotube Phase Diagram Package

Defines temperature-composition phase diagrams for nanotube dispersions and
fullerene solutions, including solubility curves and phase transitions.
-/

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  temperatureRange : ℚ × ℚ
  concentrationRange : ℚ × ℚ
  solubilityCurve : Type u
  criticalTemperature : ℚ
  phaseBoundaries : Type v
  coexistenceCurvesValid : Prop
  criticalTemperatureComputed : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  coexistenceCurvesValidClosed : P.coexistenceCurvesValid
  criticalTemperatureComputedClosed : P.criticalTemperatureComputed

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.coexistenceCurvesValid ∧ P.criticalTemperatureComputed

theorem phase_diagram_closed_from_evidence
    (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.coexistenceCurvesValidClosed E.criticalTemperatureComputedClosed

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse
