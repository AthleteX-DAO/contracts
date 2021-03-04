// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AEToken is ERC20 {
    constructor() ERC20("Athlete Equity", "AE")
    {
        // initial amount is 100 million
        _mint(msg.sender, 100000000);
    }
}