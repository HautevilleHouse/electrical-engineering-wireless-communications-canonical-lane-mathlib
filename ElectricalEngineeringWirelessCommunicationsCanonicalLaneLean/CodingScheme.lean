import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.ModulationScheme

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure CodingSchemePackage {M : WirelessChannelModelPackage}
    {Mod : ModulationSchemePackage M} where
  codeType : Prop
  codeRate : Prop
  decodingAlgorithm : Prop
  errorCorrectionCapability : Prop

structure CodingSchemeEvidence {M : WirelessChannelModelPackage}
    {Mod : ModulationSchemePackage M} (C : CodingSchemePackage Mod) where
  codeTypeValid : C.codeType
  codeRateFeasible : C.codeRate
  decodingAlgorithmExists : C.decodingAlgorithm
  errorCorrectionCapabilityBounded : C.errorCorrectionCapability

def CodingSchemeClosed {M : WirelessChannelModelPackage}
    {Mod : ModulationSchemePackage M} (C : CodingSchemePackage Mod) : Prop :=
  C.codeType ∧ C.codeRate ∧ C.decodingAlgorithm ∧ C.errorCorrectionCapability

theorem coding_scheme_closed_from_evidence
    {M : WirelessChannelModelPackage} {Mod : ModulationSchemePackage M}
    {C : CodingSchemePackage Mod} (E : CodingSchemeEvidence C) :
    CodingSchemeClosed C := by
  exact And.intro E.codeTypeValid
    (And.intro E.codeRateFeasible
      (And.intro E.decodingAlgorithmExists E.errorCorrectionCapabilityBounded))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse