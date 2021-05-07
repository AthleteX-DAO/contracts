
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 >0.8.0;

import "@uma/core/contracts/financial-templates/TokenFactory.sol";

contract AE_TokenFatory is TokenFactory {
    constructor()
    {
        TokenFactory TF = new TokenFactory();
    }

    function createToken(string tokenName, string tokenSymbol, uint8 tokenDecimals) external override(TokenFactory)
    {
        return TF.createToken(tokenName, tokenSymbol, tokenDecimals);
    }
}