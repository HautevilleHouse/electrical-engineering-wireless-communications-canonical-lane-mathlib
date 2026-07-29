import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure WirelessChannelModelPackage where
  fadingModel : Prop
  noisePower : Prop
  bandwidth : Prop
  channelCapacityFormula : Prop

structure WirelessChannelModelEvidence (M : WirelessChannelModelPackage) where
  fadingModelValid : M.fadingModel
  noisePowerFinite : M.noisePower
  bandwidthPositive : M.bandwidth
  capacityFormulaCorrect : M.channelCapacityFormula

def WirelessChannelModelClosed (M : WirelessChannelModelPackage) : Prop :=
  M.fadingModel ∧ M.noisePower ∧ M.bandwidth ∧ M.channelCapacityFormula

theorem wireless_channel_model_closed_from_evidence
    (M : WirelessChannelModelPackage) (E : WirelessChannelModelEvidence M) :
    WirelessChannelModelClosed M := by
  exact And.intro E.fadingModelValid
    (And.intro E.noisePowerFinite
      (And.intro E.bandwidthPositive E.capacityFormulaCorrect))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse