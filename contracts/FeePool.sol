pragma solidity >=0.6.0;

// SPDX-License-Identifier: MIT

contract FeePool {
    // The Pool - The number of coins in it (not dollar value)
    uint256 private _feePool;

    // Owners Stake in the Pool
    mapping(address => uint256) ownersStake;

    /// @dev invest into the pool, updating each owners stake and the pool
    /// @param _amount owner invests into the pool
    function invest(uint256 _amount) external {
        //get coins from owner (call AEStaking.enter())?
        // Update the owners stake with the new amount
        // ownersStake[msg.sender] = ownersStake[msg.sender].add(_amount);
        // Update the fee pool
        // _feePool = _feePool.add(_amount);
    }

    /// @dev transfers coins to owner
    function retract(uint256 _amount) external {
        require(ownersStake[msg.sender] >= _amount, "Withdraw is too high");

        //// ? update owners account (call AEStaking.leave()) ?

        // Update the owners stake with the new amount
        // ownersStake[msg.sender] = ownersStake[msg.sender].add(_amount);

        //Update the fee pool
        // _feePool = _feePool.sub(_amount);
    }

    /// @dev get the amount in feePool
    function getPool() external returns (uint256) {
        //is this a VIEW function?
        return _feePool;
    }

    //// My own notes :)

    // Create our own coin
    // People invest into it
    // Tie fees into a pool

    // People buy coins and that goes into a pool
    // We set the initial value
    // Where is it set and where can the growth be seen

    // FeePool is the area where we have all the pooled in values

    /*
        FeePool acesses ERC20 totalSupply and figure out how much to leave with

        More people, worth more

        Tie together coin and athletes:
            Athlete's value is based off in game preformance

        Flywheel Pattern,
            2 types of coin: ERC20 business value (AE coin), 


        FeePool is not dealing with changing price, rather just acessing current price and totalBalance 

        Make feePool for AE coin
    */

    // Access to the totalSupply
    // Enter FeePool / Leave FeePool
}
