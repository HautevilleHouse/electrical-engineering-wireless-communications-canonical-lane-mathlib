import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure WirelessSignalClassificationPackage {C : WirelessChannelModelPackage} where
  modulationClassification : Prop
  codingClassification : Prop
  detectionMethod : Prop
  berAnalysis : Prop

structure WirelessSignalClassificationEvidence {C : WirelessChannelModelPackage}
    (S : WirelessSignalClassificationPackage C) where
  modulationClassificationClosed : S.modulationClassification
  codingClassificationClosed : S.codingClassification
  detectionMethodClosed : S.detectionMethod
  berAnalysisClosed : S.berAnalysis

def WirelessSignalClassificationClosed {C : WirelessChannelModelPackage}
    (S : WirelessSignalClassificationPackage C) : Prop :=
  S.modulationClassification ∧ S.codingClassification ∧
  S.detectionMethod ∧ S.berAnalysis

theorem wireless_signal_classification_closed_from_evidence
    {C : WirelessChannelModelPackage} (S : WirelessSignalClassificationPackage C)
    (E : WirelessSignalClassificationEvidence S) : WirelessSignalClassificationClosed S := by
  exact And.intro E.modulationClassificationClosed
    (And.intro E.codingClassificationClosed
      (And.intro E.detectionMethodClosed E.berAnalysisClosed))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse