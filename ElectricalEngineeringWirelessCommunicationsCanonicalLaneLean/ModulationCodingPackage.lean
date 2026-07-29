import electricalEngineeringWirelessCommunicationsCanonicalLaneLean.ChannelModelPackage

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure ModulationCodingPackage {C : ChannelModelPackage} where
  modulationScheme : Type u
  codingRate : Prop
  berTarget : Prop
  spectralEfficiency : Prop

structure ModulationCodingEvidence {C : ChannelModelPackage} (M : ModulationCodingPackage C) where
  modulationSchemeClosed : M.modulationScheme
  codingRateClosed : M.codingRate
  berTargetClosed : M.berTarget
  spectralEfficiencyClosed : M.spectralEfficiency

def ModulationCodingClosed {C : ChannelModelPackage} (M : ModulationCodingPackage C) : Prop :=
  M.modulationScheme ∧ M.codingRate ∧ M.berTarget ∧ M.spectralEfficiency

theorem modulation_coding_closed_from_evidence {C : ChannelModelPackage} (M : ModulationCodingPackage C) (E : ModulationCodingEvidence M) :
    ModulationCodingClosed M :=
  by
    exact And.intro E.modulationSchemeClosed (And.intro E.codingRateClosed (And.intro E.berTargetClosed E.spectralEfficiencyClosed))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse