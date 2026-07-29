import electricalEngineeringWirelessCommunicationsCanonicalLaneLean.ModulationCodingPackage

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure SignalProcessingPackage {C : ChannelModelPackage} {M : ModulationCodingPackage C} where
  equalizationType : Type u
  synchronizationAlgorithm : Prop
  channelEstimation : Prop
  detectionMethod : Prop

structure SignalProcessingEvidence {C : ChannelModelPackage} {M : ModulationCodingPackage C} (S : SignalProcessingPackage C M) where
  equalizationTypeClosed : S.equalizationType
  synchronizationAlgorithmClosed : S.synchronizationAlgorithm
  channelEstimationClosed : S.channelEstimation
  detectionMethodClosed : S.detectionMethod

def SignalProcessingClosed {C : ChannelModelPackage} {M : ModulationCodingPackage C} (S : SignalProcessingPackage C M) : Prop :=
  S.equalizationType ∧ S.synchronizationAlgorithm ∧ S.channelEstimation ∧ S.detectionMethod

theorem signal_processing_closed_from_evidence {C : ChannelModelPackage} {M : ModulationCodingPackage C} (S : SignalProcessingPackage C M) (E : SignalProcessingEvidence S) :
    SignalProcessingClosed S :=
  by
    exact And.intro E.equalizationTypeClosed (And.intro E.synchronizationAlgorithmClosed (And.intro E.channelEstimationClosed E.detectionMethodClosed))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse