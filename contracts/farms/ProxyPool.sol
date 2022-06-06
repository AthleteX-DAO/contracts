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
        if (oldPool == null) {
            _setup();
        } else {
            _proxyPool = IPool(oldPool);
        }
    }

    /**
     * @notice creates a pool contract
     * @dev this contract automatically sets the stakingmodule & friendly reward
     * module like a gysr fountain
     * 
     */
    function _setup() returns (address) {
        // Requires treasury and rewardtoken address
        address tokenAddress = "";
        address treasuryAddress = "";
        PoolFactory _factory = new PoolFactory(tokenAddress, treasuryAddress);
        poolAddress = _factory.create();
        proxyPool = IPool(poolAddress);
    }

    /**
     * @notice allows users to stake
     * @param amount {uint256} amount to stake
     * 
     * @return {void}
    */
    function stake(uint256 amount) {
        _proxyPool.stake(amount, [], []);
    }

    /**
     * @notice allows users to unstake
     * @param amount {uint256} amount to unstake
     * 
     * @return {void}
    */
    function unstake(uint256 amount) {
        _proxyPool.unstake(amount, [], []);
    }
    
    /**
     * @notice allows users to claim
     * @param amount {uint256} amount to claim
     * 
     * @return {void}
    */
    function claim(uint256 amount) {
        _proxyPool.claim(amount, [], []);
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