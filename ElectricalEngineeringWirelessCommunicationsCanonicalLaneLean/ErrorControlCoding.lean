import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure ErrorControlCodingPackage where
  codeLength : ℕ
  messageLength : ℕ
  minimumDistance : ℕ
  errorCorrectionCapability : ℕ
  codingGain : ℝ
  codeValid : Prop

structure ErrorControlCodingEvidence (E : ErrorControlCodingPackage) where
  codeLengthValid : E.codeLength > 0
  messageLengthValid : E.messageLength > 0
  messageLessThanCode : E.messageLength < E.codeLength
  minimumDistanceValid : E.minimumDistance ≥ 1
  errorCorrectionCapabilityValid : E.errorCorrectionCapability = (E.minimumDistance - 1) / 2
  codingGainValid : E.codingGain > 0
  codeValidClosed : E.codeValid

def ErrorControlCodingClosed (E : ErrorControlCodingPackage) : Prop :=
  E.codeLength > 0 ∧ E.messageLength > 0 ∧ E.messageLength < E.codeLength ∧
  E.minimumDistance ≥ 1 ∧ E.errorCorrectionCapability = (E.minimumDistance - 1) / 2 ∧
  E.codingGain > 0 ∧ E.codeValid

theorem error_control_coding_closed_from_evidence (E : ErrorControlCodingPackage) (Ev : ErrorControlCodingEvidence E) : ErrorControlCodingClosed E :=
  And.intro Ev.codeLengthValid (And.intro Ev.messageLengthValid (And.intro Ev.messageLessThanCode (And.intro Ev.minimumDistanceValid (And.intro Ev.errorCorrectionCapabilityValid (And.intro Ev.codingGainValid Ev.codeValidClosed)))))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse