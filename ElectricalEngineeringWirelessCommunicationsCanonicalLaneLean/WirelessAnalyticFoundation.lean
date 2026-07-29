import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.CapacityTheorem

/-!
# Wireless Analytic Foundation
-/

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure WirelessAnalyticFoundation where
  channel : ChannelModelPackage
  channelEvidence : ChannelModelEvidence channel
  modulation : ModulationSchemePackage channel
  modulationEvidence : ModulationSchemeEvidence modulation
  capacity : CapacityTheoremPackage channel modulation
  capacityEvidence : CapacityTheoremEvidence capacity

def WirelessAnalyticFoundationClosed (A : WirelessAnalyticFoundation) : Prop :=
  ChannelModelClosed A.channel ∧
  ModulationSchemeClosed A.modulation ∧
  CapacityTheoremClosed A.capacity

theorem wireless_analytic_foundation_closed_from_evidence
    (A : WirelessAnalyticFoundation) :
    WirelessAnalyticFoundationClosed A := by
  exact And.intro (channel_model_closed_from_evidence A.channel A.channelEvidence)
    (And.intro (modulation_scheme_closed_from_evidence A.modulation A.modulationEvidence)
      (capacity_theorem_closed_from_evidence A.capacity A.capacityEvidence))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse