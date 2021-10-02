// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Vesting is Ownable {
    using SafeERC20 for IERC20;

    // Starts now and ends in 60 seconds
    uint256 public start = 1633140000;  // Start Date: 10/1/2021 22:00 EST
    uint256 public end = 1759370400;   // End Date: 10/1/2025 22:00 EST

    IERC20 public constant AX = IERC20(0x5617604BA0a30E0ff1d2163aB94E50d8b6D0B0Df);
    mapping(address => uint256) private _vested;
    mapping(address => uint256) private _total;

    constructor() {
        _total[0xe8a59f004D2A14B3c6Fd2dF93c1B609DdbDA9813] = 6698059 ether; // Kevin - 1 token allocated
        _total[0xa93e39E1f2C87b407E723Fe9135e3571E1a44720] = 2184867 ether; // Alex - 1 token allocated
        _total[0x3266f39E8B1F6DeC962C3903AeFEBdA602c4b2b1] = 2031378 ether; // Aydan - 1 token allocated
        _total[0x36A9941835335Aa6dbE69AF6bBFaB778c0992f87] = 6698059 ether; // Robbie - 1 token allocated
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