import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure MIMOChannelPackage where
  numTransmitAntennas : ℕ
  numReceiveAntennas : ℕ
  channelMatrixDimension : ℕ × ℕ
  capacity : ℝ
  rank : ℕ
  numTransmitPositive : Prop
  numReceivePositive : Prop
  rankPositive : Prop

structure MIMOChannelEvidence (M : MIMOChannelPackage) where
  numTransmitPositiveClosed : M.numTransmitAntennas > 0
  numReceivePositiveClosed : M.numReceiveAntennas > 0
  channelMatrixDimensionValid : M.channelMatrixDimension = (M.numReceiveAntennas, M.numTransmitAntennas)
  rankPositiveClosed : M.rank > 0
  rankUpperBound : M.rank ≤ min M.numTransmitAntennas M.numReceiveAntennas

def MIMOChannelClosed (M : MIMOChannelPackage) : Prop :=
  M.numTransmitAntennas > 0 ∧ M.numReceiveAntennas > 0 ∧
  M.channelMatrixDimension = (M.numReceiveAntennas, M.numTransmitAntennas) ∧
  M.rank > 0 ∧ M.rank ≤ min M.numTransmitAntennas M.numReceiveAntennas

theorem mimo_channel_closed_from_evidence (M : MIMOChannelPackage) (E : MIMOChannelEvidence M) : MIMOChannelClosed M := by
  exact And.intro E.numTransmitPositiveClosed
    (And.intro E.numReceivePositiveClosed
      (And.intro E.channelMatrixDimensionValid
        (And.intro E.rankPositiveClosed E.rankUpperBound)))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse