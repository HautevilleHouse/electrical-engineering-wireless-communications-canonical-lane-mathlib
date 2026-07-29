import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure WirelessChannelModelPackage where
  awgnChannel : Prop
  rayleighFading : Prop
  ricianFading : Prop
  multipathChannel : Prop
  pathLossModel : Prop
  shadowingModel : Prop

structure WirelessChannelModelEvidence (P : WirelessChannelModelPackage) where
  awgnChannelClosed : P.awgnChannel
  rayleighFadingClosed : P.rayleighFading
  ricianFadingClosed : P.ricianFading
  multipathChannelClosed : P.multipathChannel
  pathLossModelClosed : P.pathLossModel
  shadowingModelClosed : P.shadowingModel

def WirelessChannelModelClosed (P : WirelessChannelModelPackage) : Prop :=
  P.awgnChannel ∧ P.rayleighFading ∧ P.ricianFading ∧
  P.multipathChannel ∧ P.pathLossModel ∧ P.shadowingModel

theorem wireless_channel_model_closed_from_evidence
    (P : WirelessChannelModelPackage) (E : WirelessChannelModelEvidence P) :
    WirelessChannelModelClosed P := by
  exact And.intro E.awgnChannelClosed
    (And.intro E.rayleighFadingClosed
      (And.intro E.ricianFadingClosed
        (And.intro E.multipathChannelClosed
          (And.intro E.pathLossModelClosed E.shadowingModelClosed))))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse