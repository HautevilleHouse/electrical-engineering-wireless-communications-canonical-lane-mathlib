import electricalEngineeringWirelessCommunicationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure ChannelModelPackage where
  fadingDistribution : Type u
  pathLossExponent : Prop
  noiseModel : Prop
  coherenceTime : Prop

structure ChannelModelEvidence (C : ChannelModelPackage) where
  fadingDistributionClosed : C.fadingDistribution
  pathLossExponentClosed : C.pathLossExponent
  noiseModelClosed : C.noiseModel
  coherenceTimeClosed : C.coherenceTime

def ChannelModelClosed (C : ChannelModelPackage) : Prop :=
  C.fadingDistribution ∧ C.pathLossExponent ∧ C.noiseModel ∧ C.coherenceTime

theorem channel_model_closed_from_evidence (C : ChannelModelPackage) (E : ChannelModelEvidence C) :
    ChannelModelClosed C :=
  by
    exact And.intro E.fadingDistributionClosed (And.intro E.pathLossExponentClosed (And.intro E.noiseModelClosed E.coherenceTimeClosed))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse