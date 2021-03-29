pragma solidity ^0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/token/ERC20/SafeERC20.sol';


contract AEStaking is ERC20Permit {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    IERC20 public xAE;
    address public contractAddress;
    address public stakerAddress;

    // Pass the athlete equity token upon init
    constructor(IERC20 _ae) ERC20("AEStaking", "xAE") {
        xAE = _ae;
        contractAddress = address(this);
        stakerAddress = msg.sender;
    }

    // Enter the staking contract
    /// @param _amount the amount of xAE to stake
    function enter(uint256 _amount) public {
        uint256 aeToLock = xAE.balanceOf(contractAddress);
        uint256 totalShares = totalSupply();
        
        // Calculate and mint the amount of xPremia the Premia is worth. The ratio will change overtime, as xPremia is burned/minted and Premia deposited + gained from fees / withdrawn.
        uint256 aeStake = _amount.mul(totalShares).div(totalPremia);

        (aeToLock == 0 || totalSupply == 0) 
        ? _mint(msg.sender, _amount) 
        : _mint(msg.sender, aeStake);
        
        // Actually Lock the AE into the contract
        xAE.safeTransferFrom(stakerAddress, contractAddress, _amount);
    }

    // Leave the staking contract & reclaim your xAE ( plus gains!)
    /// @param _myShares the amount of xAE to withdraw (burn)
    function leave(uint256 _myShares) public {
        uint256 totalShares = totalSupply();

        uint stakerShares = _myShares.mul(xAE.balanceOf(contractAddress)).div(totalShares);
        _burn(stakerAddress, _myShares);
        xAE.safeTransfer(stakerAddress, stakerShares);
    }

}