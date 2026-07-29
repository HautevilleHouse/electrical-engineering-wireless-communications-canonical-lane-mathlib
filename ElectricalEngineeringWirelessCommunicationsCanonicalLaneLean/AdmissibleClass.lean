import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure WirelessAdmittedObject where
  systemId : String
  channelCapacity : ℝ
  spectralEfficiency : ℝ
  coverageAchieved : Prop
  conclusion : coverageAchieved

structure AdmissibleClass where
  object : WirelessAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse