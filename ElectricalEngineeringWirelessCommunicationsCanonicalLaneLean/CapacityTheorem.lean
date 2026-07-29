import ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean.ModulationScheme

/-!
# Capacity Theorem Package
-/

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure CapacityTheoremPackage {C : ChannelModelPackage}
    {M : ModulationSchemePackage C} where
  shannonLimit : Prop
  achievableRate : Prop
  outageProbability : Prop

structure CapacityTheoremEvidence {C : ChannelModelPackage}
    {M : ModulationSchemePackage C} (T : CapacityTheoremPackage C M) where
  shannonLimitClosed : T.shannonLimit
  achievableRateClosed : T.achievableRate
  outageProbabilityClosed : T.outageProbability

def CapacityTheoremClosed {C : ChannelModelPackage}
    {M : ModulationSchemePackage C} (T : CapacityTheoremPackage C M) : Prop :=
  T.shannonLimit ∧ T.achievableRate ∧ T.outageProbability

theorem capacity_theorem_closed_from_evidence
    {C : ChannelModelPackage} {M : ModulationSchemePackage C}
    (T : CapacityTheoremPackage C M) (E : CapacityTheoremEvidence T) :
    CapacityTheoremClosed T := by
  exact And.intro E.shannonLimitClosed (And.intro E.achievableRateClosed E.outageProbabilityClosed)

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse