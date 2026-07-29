import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.WirelessChannelModel

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure ModulationSchemePackage {M : WirelessChannelModelPackage} where
  modulationType : Prop
  constellationDesign : Prop
  symbolErrorRate : Prop
  spectralEfficiency : Prop

structure ModulationSchemeEvidence {M : WirelessChannelModelPackage}
    (Mod : ModulationSchemePackage M) where
  modulationTypeValid : Mod.modulationType
  constellationDesigned : Mod.constellationDesign
  symbolErrorRateBounded : Mod.symbolErrorRate
  spectralEfficiencyPositive : Mod.spectralEfficiency

def ModulationSchemeClosed {M : WirelessChannelModelPackage}
    (Mod : ModulationSchemePackage M) : Prop :=
  Mod.modulationType ∧ Mod.constellationDesign ∧
  Mod.symbolErrorRate ∧ Mod.spectralEfficiency

theorem modulation_scheme_closed_from_evidence
    {M : WirelessChannelModelPackage} {Mod : ModulationSchemePackage M}
    (E : ModulationSchemeEvidence Mod) : ModulationSchemeClosed Mod := by
  exact And.intro E.modulationTypeValid
    (And.intro E.constellationDesigned
      (And.intro E.symbolErrorRateBounded E.spectralEfficiencyPositive))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse