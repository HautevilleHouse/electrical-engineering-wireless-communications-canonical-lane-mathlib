import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure WirelessSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure WirelessAdmittedObject where
  space : WirelessSpace
  finiteBandwidth : Prop
  powerConstraint : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

structure WirelessEndgameState where
  object : WirelessAdmittedObject

def WirelessWitnessClosed (O : WirelessAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse