// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./libraries/SafeERC20.sol";
import "./interfaces/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Robbie is Ownable {
    using SafeERC20 for IERC20;

    uint256 public start = 1632453602; // 3/1/2021 12 AM UTC
    uint256 public end = 1632453720; // 3/1/2022 12 AM UTC

    IERC20 public constant AX = IERC20(0x8C086885624C5b823Cc6fcA7BFF54C454D6b5239);
    mapping(address => uint256) private _vested;
    mapping(address => uint256) private _total;

    constructor() {
        _total[0x571F8e570Efe1fb0BA8ff75f4749b629a471f458] = 4001 ether;
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