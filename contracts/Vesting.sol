// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./libraries/SafeERC20.sol";
import "./interfaces/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Vesting is Ownable {
    using SafeERC20 for IERC20;

    uint256 public start = 1632974400; // 9/30/2021 12 AM UTC
    uint256 public end = 1790740800; // 9/30/2026 12 AM UTC

    // TODO - update IERC20($AX-ADDRESS)
    IERC20 public constant AX = IERC20(0x2aECCB42482cc64E087b6D2e5Da39f5A7A7001f8);
    mapping(address => uint256) private _vested;
    mapping(address => uint256) private _total;

    constructor() {
        // TODO - replace default address with team wallet addresses & update ETHER count
        _total[0x82BBd2F08a59f5be1B4e719ff701e4D234c4F8db] = 1018750 ether;  // Aydan
        _total[0x406a0c87A6bb25748252cb112a7a837e21aAcD98] = 8291667 ether; // Kevin
        _total[0x3e677718f8665A40AC0AB044D8c008b55f277c98] = 1218750 ether; // Alex
        _total[0x094AD38fB69f27F6Eb0c515ad4a5BD4b9F9B2996] = 8291667 ether; //Robbie
    }

    function vest() external {
        require(_total[msg.sender] > 0, "Vesting: no vesting schedule!");
        require(block.timestamp >= start, "Vesting: !started");
        uint256 toBeReleased = releasableAmount(msg.sender);
        require(toBeReleased > 0, "Vesting: no tokens to release");

        _vested[msg.sender] = _vested[msg.sender] + toBeReleased;
        AX.safeTransfer(msg.sender, toBeReleased);
    }

    function releasableAmount(address _addr) public view returns (uint256) {
        return _unlockedAmount(_addr) - _vested[_addr];
    }

    function _unlockedAmount(address _addr) private view returns (uint256) {
        if (block.timestamp <= end) {
            uint256 duration = end - start;
            uint256 timePassed = block.timestamp - start;
            return (_total[_addr] * timePassed) / duration;
        } else {
            return _total[_addr];
        }
    }
}