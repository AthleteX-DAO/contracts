pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/token/ERC20/SafeERC20.sol';


contract AEStaking is ERC20 {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    IERC20 public xAE;
    address public contractAddress;
    address public stakerAddress;

    event NewStakingAddress(address newAddress);

    // Pass the athlete equity token upon init
    constructor(IERC20 _ae) ERC20("AEStaking", "xAE") {
        xAE = _ae;
        contractAddress = address(this);
        stakerAddress = msg.sender;
    }

    function setContractAddress(address newAddress)
    {
        contractAddress = newAddress;
        emit NewStakingAddress(contractAddress);
    }

    // Enter the staking contract
    /// @param _amount the amount of xAE to stake
    function enter(uint256 _amount) public {
        uint256 aeTotalStaked = xAE.balanceOf(contractAddress);
        uint256 circulatingSupply = totalSupply();
        
        // Calculate and mint the amount of AE the AEstaked is worth. The ratio will change overtime, as xAE is burned/minted and AE deposited + gained from fees / withdrawn.
        uint256 aeStake = _amount.mul(circulatingSupply).div(aeTotalStaked);
        // myaeStake = ((Amount I Put In) * 100m ) / (total staked amount in contract)

        (aeTotalStaked == 0 )   //Missing check if total shares are zero -- but that's a given
        ? _mint(msg.sender, _amount) 
        : _mint(msg.sender, aeStake);
        
        // Actually Lock the AE into the contract
        xAE.safeTransferFrom(stakerAddress, contractAddress, _amount);
    }

    // Leave the staking contract & reclaim your xAE ( plus gains!)
    /// @param _myShares the amount of xAE to withdraw (burn)
    function leave(uint256 _myShares) public {
        uint256 circulatingSupply = totalSupply();

        uint stakerShares = _myShares.mul(xAE.balanceOf(contractAddress)).div(circulatingSupply);
        _burn(stakerAddress, _myShares);
        xAE.safeTransfer(stakerAddress, stakerShares);
    }

}