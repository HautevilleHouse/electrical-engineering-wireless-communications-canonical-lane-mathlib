import electricalEngineeringWirelessCommunicationsCanonicalLaneLean.SignalProcessingPackage

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure MIMOPackage {C : ChannelModelPackage} {M : ModulationCodingPackage C} {S : SignalProcessingPackage C M} where
  numberOfAntennas : Prop
  spatialMultiplexing : Prop
  diversityGain : Prop
  precodingMatrix : Type u

structure MIMOEvidence {C : ChannelModelPackage} {M : ModulationCodingPackage C} {S : SignalProcessingPackage C M} (P : MIMOPackage C M S) where
  numberOfAntennasClosed : P.numberOfAntennas
  spatialMultiplexingClosed : P.spatialMultiplexing
  diversityGainClosed : P.diversityGain
  precodingMatrixClosed : P.precodingMatrix

def MIMOClosed {C : ChannelModelPackage} {M : ModulationCodingPackage C} {S : SignalProcessingPackage C M} (P : MIMOPackage C M S) : Prop :=
  P.numberOfAntennas ∧ P.spatialMultiplexing ∧ P.diversityGain ∧ P.precodingMatrix

theorem mimo_closed_from_evidence {C : ChannelModelPackage} {M : ModulationCodingPackage C} {S : SignalProcessingPackage C M} (P : MIMOPackage C M S) (E : MIMOEvidence P) :
    MIMOClosed P :=
  by
    exact And.intro E.numberOfAntennasClosed (And.intro E.spatialMultiplexingClosed (And.intro E.diversityGainClosed E.precodingMatrixClosed))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse