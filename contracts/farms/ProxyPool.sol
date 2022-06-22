// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@gysr/core";

contract ProxyPool is IPool {

    address poolAddress;
    Pool _proxyPool;

    /**
     * setup of a gysr fountain
     */
    constructor(address oldPool) {
        // creates a pool if it isn't there
            _proxyPool = IPool(oldPool); //Is there a constructor for IPool?
    }

    /**
     * @notice allows users to stake
     * @param amount {uint256} amount to stake
     * 
     * @return {void}
    */
    function stake(uint256 amount, bytes calldata stakingdata, bytes calldata rewarddata) external {
        _proxyPool.stake(amount, stakingdata, rewarddata);
    }

    /**
     * @notice allows users to unstake
     * @param amount {uint256} amount to unstake
     * 
     * @return {void}
    */
    function unstake(uint256 amount, bytes calldata stakingdata, bytes calldata rewarddata) external {
        _proxyPool.unstake(amount, stakingdata, rewarddata);
    }
    
    /**
     * @notice allows users to claim
     * @param amount {uint256} amount to claim
     * 
     * @return {void}
    */
    function claim(uint256 amount, bytes calldata stakingdata, bytes calldata rewarddata) external {
        _proxyPool.claim(amount, stakingdata, rewarddata);
    }

    /**
     * @notice allows users to withdraw
     * @param amount {uint256} amount to withdraw
     * 
     * @return {void}
    */
    function withdraw(uint256 amount) {
        _proxyPool.withdraw(amount);
    }
}