import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure ChannelModelPackage where
  pathLossExponent : ℝ
  fadingDistribution : String
  noisePowerSpectralDensity : ℝ
  bandwidth : ℝ
  coherentTime : ℝ
  modelValid : Prop

structure ChannelModelEvidence (C : ChannelModelPackage) where
  pathLossExponentValid : C.pathLossExponent > 0
  fadingDistributionValid : C.fadingDistribution = "Rayleigh" ∨ C.fadingDistribution = "Rician"
  noisePowerSpectralDensityValid : C.noisePowerSpectralDensity > 0
  bandwidthValid : C.bandwidth > 0
  coherentTimeValid : C.coherentTime > 0
  modelValidClosed : C.modelValid

def ChannelModelClosed (C : ChannelModelPackage) : Prop :=
  C.pathLossExponent > 0 ∧ (C.fadingDistribution = "Rayleigh" ∨ C.fadingDistribution = "Rician") ∧
  C.noisePowerSpectralDensity > 0 ∧ C.bandwidth > 0 ∧ C.coherentTime > 0 ∧ C.modelValid

theorem channel_model_closed_from_evidence (C : ChannelModelPackage) (E : ChannelModelEvidence C) : ChannelModelClosed C :=
  And.intro E.pathLossExponentValid (And.intro E.fadingDistributionValid (And.intro E.noisePowerSpectralDensityValid (And.intro E.bandwidthValid (And.intro E.coherentTimeValid E.modelValidClosed))))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse