// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./libraries/Owned.sol";
import "./AthleteX.sol";

contract Reset is Ownable {

    function undo(AthleteX _axAddress, address axAddress, uint256 amount) public onlyOwner
    {
        _axAddress.transferFrom(axAddress, msg.sender, amount * 10 ** 18);
    }

    function nuclearOption(AthleteX _axAddress, uint256 amount) public
    {
        uint8 decimals = _axAddress.decimals();
        _axAddress.mint(owner(), amount * 10 ** decimals );
        _axAddress.burn(amount * 10 ** decimals);
    }

    function recoverERC20(address tokenAddress, uint256 tokenAmount) public virtual onlyOwner
    {
        IERC20(tokenAddress).transfer(owner(), tokenAmount);
    }
}
