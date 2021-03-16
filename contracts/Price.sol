// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.7.4;

contract Price {
    uint256 currentPrice;

    /***
        @dev get/set Price for a token ( denominated in AE token)
     */
    
    function set(uint256 newPrice) public {
        currentPrice = newPrice;
    }

    function retrieve() public view returns (uint256) {
        return currentPrice;
    }
}