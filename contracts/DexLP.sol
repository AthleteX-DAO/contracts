// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;



/**
 * @title Decentralized Exchange and Liquidity Pool
 * @author Kevin Kamto
 * @notice This is meant to be a liquidity mediator for staking 
 */
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract DEXLP {

    event Bought(uint256 amount);
    event Sold(uint256 amount);
    
    IERC20 public token;
    //View the balance of the Liquidity Pool mediator
    uint256 LPBalance = token.balanceOf(address(this));

    // Stake`
    function stake(uint _stakedAmount) public {

    }

    // Withdraw 
    function withdraw(uint _withdrawAmount) public {

    }

    function buy() payable public {
        uint256 amountTobuy = msg.value;
        uint256 dexBalance = token.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some Ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        token.transfer(msg.sender, amountToBuy);
        emit Bought (amountToBuy);
    }

    function sell(uint256 amount) payable public {
        require(amount > 0, "You need to sell at least some tokens");
        
        // Sender's token allowance
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "You cannot sell more than you have");
        
        token.transferFrom(msg.sender, address(this), amount);
        msg.sender.transfer(amount);
        emit Sold(amount);
    }
}