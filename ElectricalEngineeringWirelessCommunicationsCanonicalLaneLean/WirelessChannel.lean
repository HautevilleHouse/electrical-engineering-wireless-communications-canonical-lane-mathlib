import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure WirelessChannelPackage where
  pathLossExponent : ℝ
  fadingDistribution : Type
  coherenceBandwidth : ℝ
  coherenceTime : ℝ
  largeScaleFading : Prop
  smallScaleFading : Prop

structure WirelessChannelEvidence (C : WirelessChannelPackage) where
  pathLossExponentDefined : C.pathLossExponent > 0
  fadingDistributionValid : Nonempty C.fadingDistribution
  coherenceBandwidthPositive : C.coherenceBandwidth > 0
  coherenceTimePositive : C.coherenceTime > 0
  largeScaleFadingValid : C.largeScaleFading
  smallScaleFadingValid : C.smallScaleFading

def WirelessChannelClosed (C : WirelessChannelPackage) : Prop :=
  C.pathLossExponent > 0 ∧ Nonempty C.fadingDistribution ∧
  C.coherenceBandwidth > 0 ∧ C.coherenceTime > 0 ∧
  C.largeScaleFading ∧ C.smallScaleFading

theorem wireless_channel_closed_from_evidence (C : WirelessChannelPackage)
    (E : WirelessChannelEvidence C) : WirelessChannelClosed C := by
  exact And.intro E.pathLossExponentDefined
    (And.intro E.fadingDistributionValid
      (And.intro E.coherenceBandwidthPositive
        (And.intro E.coherenceTimePositive
          (And.intro E.largeScaleFadingValid E.smallScaleFadingValid))))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse