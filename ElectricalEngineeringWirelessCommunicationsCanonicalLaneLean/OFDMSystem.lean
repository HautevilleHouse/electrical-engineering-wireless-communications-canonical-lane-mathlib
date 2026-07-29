import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure OFDMPackage where
  numSubcarriers : ℕ
  cyclicPrefixLength : ℕ
  symbolDuration : ℝ
  subcarrierSpacing : ℝ
  fftSize : ℕ
  numSubcarriersPositive : Prop
  cyclicPrefixLengthNonnegative : Prop
  symbolDurationPositive : Prop
  subcarrierSpacingPositive : Prop

structure OFDMEvidence (O : OFDMPackage) where
  numSubcarriersPositiveClosed : O.numSubcarriers > 0
  cyclicPrefixLengthNonnegativeClosed : O.cyclicPrefixLength ≥ 0
  symbolDurationPositiveClosed : O.symbolDuration > 0
  subcarrierSpacingPositiveClosed : O.subcarrierSpacing > 0
  fftSizeValid : O.fftSize = O.numSubcarriers + O.cyclicPrefixLength

def OFDMClosed (O : OFDMPackage) : Prop :=
  O.numSubcarriers > 0 ∧ O.cyclicPrefixLength ≥ 0 ∧ O.symbolDuration > 0 ∧
  O.subcarrierSpacing > 0 ∧ O.fftSize = O.numSubcarriers + O.cyclicPrefixLength

theorem ofdm_closed_from_evidence (O : OFDMPackage) (E : OFDMEvidence O) : OFDMClosed O := by
  exact And.intro E.numSubcarriersPositiveClosed
    (And.intro E.cyclicPrefixLengthNonnegativeClosed
      (And.intro E.symbolDurationPositiveClosed
        (And.intro E.subcarrierSpacingPositiveClosed E.fftSizeValid)))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse