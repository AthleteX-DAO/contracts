// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

// Stores AX for reserve UNFINISHED
contract Treasury {
    
    IERC20 public AX;

    constructor() ERC20("AthleteX", "AX") public
    {

    }

    address[] internal moderators;
    

    // Views

    function viewBalance() public view returns (uint256) {

    }
}