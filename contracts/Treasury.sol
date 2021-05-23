pragma solidity >=0.6.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";


contract Treasury {
    
    IERC20 public AET;

    constructor() ERC20("Athlete Equity Token", "AET") public
    {

    }

    address[] internal moderators;
    

    // Views

    function viewBalance() public view returns (uint256) {

    }
}