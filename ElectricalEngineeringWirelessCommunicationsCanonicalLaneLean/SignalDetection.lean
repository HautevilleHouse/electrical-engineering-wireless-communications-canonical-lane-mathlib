import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.CodingScheme

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure SignalDetectionPackage {M : WirelessChannelModelPackage}
    {Mod : ModulationSchemePackage M} {C : CodingSchemePackage Mod} where
  detectionAlgorithm : Prop
  estimationError : Prop
  complexity : Prop

structure SignalDetectionEvidence {M : WirelessChannelModelPackage}
    {Mod : ModulationSchemePackage M} {C : CodingSchemePackage Mod}
    (D : SignalDetectionPackage C) where
  detectionAlgorithmExists : D.detectionAlgorithm
  estimationErrorBounded : D.estimationError
  complexityFeasible : D.complexity

def SignalDetectionClosed {M : WirelessChannelModelPackage}
    {Mod : ModulationSchemePackage M} {C : CodingSchemePackage Mod}
    (D : SignalDetectionPackage C) : Prop :=
  D.detectionAlgorithm ∧ D.estimationError ∧ D.complexity

theorem signal_detection_closed_from_evidence
    {M : WirelessChannelModelPackage} {Mod : ModulationSchemePackage M}
    {C : CodingSchemePackage Mod} {D : SignalDetectionPackage C}
    (E : SignalDetectionEvidence D) : SignalDetectionClosed D := by
  exact And.intro E.detectionAlgorithmExists
    (And.intro E.estimationErrorBounded E.complexityFeasible)

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse