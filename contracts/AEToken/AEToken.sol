// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AEToken is ERC20 {

    string public constant NAME = "Athlete Equity Token";
    string public constant SYMBOL = "AE";
    uint public constant DECIMALS = 18;

    constructor() ERC20("Athlete Equity", "AE")
    {
        // initial amount is 100 million
        _mint(msg.sender, 100000000);
    }
}