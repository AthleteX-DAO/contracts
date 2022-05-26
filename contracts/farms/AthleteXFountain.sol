// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@gysr/core";

contract AthleteXFountain is IPool {

    /**
     * setup of a gysr fountain
     */
    constructor() {
        // creates a pool factory if it isn't there
        _setup();
    }

    /**
     * @notice creates a pool contract
     * @dev this contract automatically sets the stakingmodule & friendly reward
     * module like a gysr fountain
     * 
     */
    function _setup() {
        // Requires treasury and rewardtoken address
        PoolFactory _factory = new PoolFactory();
    }

    /**
     * @notice allows users to stake
     * @param amount {uint256} amount to stake
     * 
     * @return {void}
    */
    function stake(uint256 amount) {

    }
}