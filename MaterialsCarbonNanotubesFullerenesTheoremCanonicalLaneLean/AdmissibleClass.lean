import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean

structure MaterialsAdmittedObject where
  crystalStructure : CrystalStructure
  carbonNanotubeChirality : CarbonNanotubeChirality
  fullereneGeometry : FullereneGeometry
  phaseDiagram : PhaseDiagram
  elasticityTensor : ElasticityTensor
  fractureToughness : FractureToughness
  conclusion : crystal_structure_closed_from_evidence crystalStructure (CrystalStructureEvidence.mk ?_) ∧
              carbon_nanotube_chirality_closed_from_evidence carbonNanotubeChirality (CarbonNanotubeChiralityEvidence.mk ?_) ∧
              fullerene_geometry_closed_from_evidence fullereneGeometry (FullereneGeometryEvidence.mk ?_) ∧
              phase_diagram_closed_from_evidence phaseDiagram (PhaseDiagramEvidence.mk ?_) ∧
              elasticity_tensor_closed_from_evidence elasticityTensor (ElasticityTensorEvidence.mk ?_) ∧
              fracture_toughness_closed_from_evidence fractureToughness (FractureToughnessEvidence.mk ?_)

structure AdmissibleClass where
  object : MaterialsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.crystalStructureClosed ∧ A.object.carbonNanotubeChiralityClosed ∧
  A.object.fullereneGeometryClosed ∧ A.object.phaseDiagramClosed ∧
  A.object.elasticityTensorClosed ∧ A.object.fractureToughnessClosed ∧
  (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsCarbonNanotubesFullerenesTheoremCanonicalLaneLean
end HautevilleHouse