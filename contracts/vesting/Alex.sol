// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../libraries/SafeERC20.sol";
import "../interfaces/IERC20.sol";
import "../libraries/Ownable.sol";

contract Alex is Ownable {
    using SafeERC20 for IERC20;

    uint256 public start = 1614556800; // 3/1/2021 12 AM UTC
    uint256 public end = 1646092800; // 3/1/2022 12 AM UTC

    IERC20 public constant AX = IERC20(0x403A39b1161c87eF709a37B0CE78163700BBaa89);
    mapping(address => uint256) private _vested;
    mapping(address => uint256) private _total;

    constructor() {
        _total[0x094AD38fB69f27F6Eb0c515ad4a5BD4b9F9B2996] = 2300000 ether;
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