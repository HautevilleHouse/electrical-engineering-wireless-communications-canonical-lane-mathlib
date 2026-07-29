import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

def ConstrainedWirelessClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_wireless_endgame (A : AdmissibleClass) : ConstrainedWirelessClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse