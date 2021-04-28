pragma solidity >=0.6.0 <0.8.0;


import 'synthetix/contracts/interfaces/IStakingRewards.sol';

contract AEStaking {


    address public contractAddress;
    address public stakerAddress;
    uint256 private stakedAmount;
    

    IStakingRewards stakingContract;
    event SetNewStakerAddress();
    // Pass the athlete equity token upon init
    constructor () {
        xAE = _ae;
        contractAddress = address(this);
        stakerAddress = msg.sender;
    }

    function setContractAddress(address newAddress)
    {
        contractAddress = newAddress;
        emit SetNewStakerAddress(contractAddress);
    }

    function stake(uint256 amount) external {
        require(amount > 0, "Cannot stake 0");
        _totalSupply = _totalSupply.add(amount);
        _balances[msg.sender] = _balances[msg.sender].add(amount);
        stakingToken.safeTransferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Cannot withdraw 0");
        _totalSupply = _totalSupply.sub(amount);
        _balances[msg.sender] = _balances[msg.sender].sub(amount);
        stakingToken.safeTransfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }

    function getReward() public nonReentrant updateReward(msg.sender) {
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

}