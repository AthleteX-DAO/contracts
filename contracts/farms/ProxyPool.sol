// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@gysr/core";

contract ProxyPool is IPool {

    Pool private _fountain;

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

    /**
     * @notice allows users to stake
     * @param amount {uint256} amount to stake
     * 
     * @return {void}
    */
    function stake(uint256 amount) {
        // This invokes a new pool contract
        _fountain.stake(amount);
    }

    function unstake(uint256 amount) {
        _fountain.unstake(amount);
    }

    function withdraw(uint256 amount) {
        require(amount > 0, "p1");
        _fountain.withdraw(amount);
    }


}