import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheorem

structure CarbonNanotubePackage where
  chirality : Type u
  diameter : Prop
  conductivity : Prop
  strength : Prop
  electronicStructure : Prop
  diameterDefined : diameter
  conductivityDefined : conductivity
  strengthDefined : strength
  electronicStructureDefined : electronicStructure

structure CarbonNanotubeEvidence (C : CarbonNanotubePackage) where
  chiralityClosed : C.chirality
  diameterClosed : C.diameter
  conductivityClosed : C.conductivity
  strengthClosed : C.strength
  electronicStructureClosed : C.electronicStructure

def CarbonNanotubeClosed (C : CarbonNanotubePackage) : Prop :=
  C.chirality ∧ C.diameter ∧ C.conductivity ∧ C.strength ∧ C.electronicStructure

theorem carbon_nanotube_closed_from_evidence (C : CarbonNanotubePackage) (E : CarbonNanotubeEvidence C) : CarbonNanotubeClosed C := by
  exact And.intro E.chiralityClosed
    (And.intro E.diameterClosed
      (And.intro E.conductivityClosed
        (And.intro E.strengthClosed E.electronicStructureClosed)))

end MaterialsCarbonNanotubesFullerenesTheorem
end HautevilleHouse