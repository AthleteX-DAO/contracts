// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 >0.8.0;

// Inheritance
import "synthetix/contracts/interfaces/IStakingRewards.sol";
import "synthetix/contracts/interfaces/IERC20.sol";

contract AEStaking is IStakingRewards {
    // Variables
    IERC20 rewardsToken;
    IERC20 stakingToken;
    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public rewardsDuration = 1 days;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;
    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;
    mapping(address => uint256) public rewards;
    mapping(address => uint256) public userRewardPerTokenPaid;

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function stake(amount) external {
        require(amount > 0, "Cannot stake nothing");
        _totalSupply = _totalSupply.add(amount);

        emit Staked(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(amount > 0);
        // withdraw amount
        _totalSupply = _totalSupply.sub(amount);
    }

    //Daily Staking Rewards
    function getReward() external {
        uint256 reward = rewards[msg.sender];
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rewardsToken.safeTransfer(msg.sender, reward);
            emit RewardPaid(msg.sender, reward);
        }
    }

    function exit() external {
        withdraw(_balances[msg.sender]);
        getReward();
    }

    event RewardPaid(address, uint256);
    event Staked(address, uint8);
}
