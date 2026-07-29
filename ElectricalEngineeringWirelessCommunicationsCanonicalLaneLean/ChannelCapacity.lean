import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure ChannelCapacityPackage where
  bandwidth : ℝ
  snr : ℝ
  capacity : ℝ
  capacityFormula : String
  bandwidthPositive : Prop
  snrPositive : Prop

structure ChannelCapacityEvidence (C : ChannelCapacityPackage) where
  bandwidthPositiveClosed : C.bandwidth > 0
  snrPositiveClosed : C.snr > 0
  capacityFormulaValid : C.capacityFormula = "Shannon"
  capacityComputed : C.capacity = C.bandwidth * Real.log (1 + C.snr)

def ChannelCapacityClosed (C : ChannelCapacityPackage) : Prop :=
  C.bandwidth > 0 ∧ C.snr > 0 ∧ C.capacityFormula = "Shannon" ∧
  C.capacity = C.bandwidth * Real.log (1 + C.snr)

theorem channel_capacity_closed_from_evidence (C : ChannelCapacityPackage)
    (E : ChannelCapacityEvidence C) : ChannelCapacityClosed C := by
  exact And.intro E.bandwidthPositiveClosed
    (And.intro E.snrPositiveClosed
      (And.intro E.capacityFormulaValid E.capacityComputed))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse