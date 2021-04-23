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

    function deposit(uint256 _stakedAmount)
    {
        // enter the staking contract
        stakingContract.stake(_stakedAmount);
    }
    
    function withdraw(uint256 _withdrawAmount);
    {
        require(_withdrawAmount < stakedAmount);
        
    }

}