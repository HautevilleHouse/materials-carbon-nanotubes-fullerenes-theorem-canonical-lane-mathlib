import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheorem

structure FullerenePackage where
  cageStructure : Type u
  symmetryGroup : Type v
  stability : Prop
  reactivity : Prop
  electronicProperties : Prop
  stabilityDefined : stability
  reactivityDefined : reactivity
  electronicPropertiesDefined : electronicProperties

structure FullereneEvidence (F : FullerenePackage) where
  cageStructureClosed : F.cageStructure
  symmetryGroupClosed : F.symmetryGroup
  stabilityClosed : F.stability
  reactivityClosed : F.reactivity
  electronicPropertiesClosed : F.electronicProperties

def FullereneClosed (F : FullerenePackage) : Prop :=
  F.cageStructure ∧ F.symmetryGroup ∧ F.stability ∧ F.reactivity ∧ F.electronicProperties

theorem fullerene_closed_from_evidence (F : FullerenePackage) (E : FullereneEvidence F) : FullereneClosed F := by
  exact And.intro E.cageStructureClosed
    (And.intro E.symmetryGroupClosed
      (And.intro E.stabilityClosed
        (And.intro E.reactivityClosed E.electronicPropertiesClosed)))

end MaterialsCarbonNanotubesFullerenesTheorem
end HautevilleHouse