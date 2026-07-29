import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.LinearAlgebra

namespace HautevilleHouse
namespace ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean

structure MIMOGeometryPackage where
  mimoChannelMatrix : Prop
  singularValueDecomposition : Prop
  beamformingVectorSpace : Prop
  spatialMultiplexingGain : Prop
  diversityOrder : Prop

structure MIMOGeometryEvidence (M : MIMOGeometryPackage) where
  mimoChannelMatrixClosed : M.mimoChannelMatrix
  singularValueDecompositionClosed : M.singularValueDecomposition
  beamformingVectorSpaceClosed : M.beamformingVectorSpace
  spatialMultiplexingGainClosed : M.spatialMultiplexingGain
  diversityOrderClosed : M.diversityOrder

def MIMOGeometryClosed (M : MIMOGeometryPackage) : Prop :=
  M.mimoChannelMatrix ∧ M.singularValueDecomposition ∧
  M.beamformingVectorSpace ∧ M.spatialMultiplexingGain ∧ M.diversityOrder

theorem mimo_geometry_closed_from_evidence
    (M : MIMOGeometryPackage) (E : MIMOGeometryEvidence M) :
    MIMOGeometryClosed M := by
  exact And.intro E.mimoChannelMatrixClosed
    (And.intro E.singularValueDecompositionClosed
      (And.intro E.beamformingVectorSpaceClosed
        (And.intro E.spatialMultiplexingGainClosed E.diversityOrderClosed)))

end ElectricalEngineeringWirelessCommunicationsCanonicalLaneLean
end HautevilleHouse