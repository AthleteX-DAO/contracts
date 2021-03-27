// SPDX-License-Identifier: MIT

// Athlete Equity utility tokens

pragma solidity ^0.7.1;

import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/token/ERC20.sol";
// IMPORTANT - MAY NOT BE NECESSARY
contract AEX is Ownable, Pausable, ERC20 {
    // private fields
    string public Symbol = "AEX";
    string public Name = "Athlete Equity Coin";

    // no-args constructor -- not entirely sure why constructor is empty
    constructor() public Ownable() ERC20(Name, Symbol) {}

    function mint(address _to, uint256 _value) external onlyOwner {
        _mint(_to, _value);
    }

    /**
     * @dev _beforeTokenTransfer hook
     */
    function _beforeTokenTransfer(
        address _from,
        address _to,
        uint256 _amount
    )
        internal virtual override
    {
        super._beforeTokenTransfer(_from, _to, _amount);

        require(!paused(), "ERC20Pausable: token transfer while paused");
    }

    function pause(bool _freeze) public onlyOnwer {
        _freeze ? _pause() : _unpause();
    }
}
