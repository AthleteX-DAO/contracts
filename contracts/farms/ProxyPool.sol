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
        };
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

    function unstake(uint256 amount) {
     _proxyPool.unstake(amount, [], []);
    }
    
    function claim(uint256 amount) {
        _proxyPool.claim(amount, [], []);
    }

    function withdraw(uint256 amount) {
        _proxyPool.withdraw(amount);
    }
}