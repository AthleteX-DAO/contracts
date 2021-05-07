// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 ;

import "uma/core/contracts/financial-templates/expiring-multiparty/ExpiringMultiPartyCreator.sol";

contract AE_EMP is ExpiringMultiPartyCreator
{
    ExpiringMultiPartyCreator private EMP;
    address _finderAddress;
    address _tokenFactoryAddress;
    address _timerAddress;
    using FixedPoint for FixedPoint.Unsigned;
    
    struct Params {
        uint256 expirationTimestamp;
        address collateralAddress;
        bytes32 priceFeedIdentifier;
        string syntheticName;
        string syntheticSymbol;
        FixedPoint.Unsigned collateralRequirement;
        FixedPoint.Unsigned disputeBondPercentage;
        FixedPoint.Unsigned sponsorDisputeRewardPercentage;
        FixedPoint.Unsigned disputerDisputeRewardPercentage;
        FixedPoint.Unsigned minSponsorTokens;
        uint256 withdrawalLiveness;
        uint256 liquidationLiveness;
        address financialProductLibraryAddress;
    }

    constructor() public
    {
        EMP = new ExpiringMultiPartyCreator(_finderAddress, _tokenFactoryAddress, _timerAddress);
    }

    function createEMP(Params memory params) returns (address)
    {
        address AthleteDerivative = EMP.createExpiringMultiParty(params);
        return AthleteDerivative;
    }
}