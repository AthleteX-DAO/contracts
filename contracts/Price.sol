pragma solidity >=0.7.0 <0.8.0;

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