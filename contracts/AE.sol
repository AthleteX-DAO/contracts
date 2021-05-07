// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "synthetix/contracts/interfaces/IERC20.sol";

contract AE is IERC20
{
    string public constant TOKEN_NAME;
    string public constant TOKEN_SYMBOL;
    uint8 public constant DECIMALS; 
    uint256 public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allownace;

        // Events
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor() public {

        TOKEN_NAME="Athlete Equity";
        TOKEN_SYMBOL="AE";
        DECIMALS="18";
        // Inits totalSupply of 100m
        _totalSupply = 100000000;
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function name() external view returns (string memory) 
    {
        return TOKEN_NAME;
    }

    function symbol() external view returns (string memory) 
    {
        return TOKEN_SYMBOL;
    }

    function decimals() external view returns (uint8)
    {
        return DECIMALS;
    }

    // Views
    function totalSupply() external view returns (uint)
    {
        return _totalSupply;
    }

    function balanceOf(address owner) external view returns (uint)
    {
        return balances[owner];
    }

    function allowance(address owner, address spender) external view returns (uint)
    {
        return allownace[owner][spender];
    }

    // Mutative functions
    function approve(address guy, uint256 value) public returns (bool) {
        allowance[msg.sender][guy] = value;
        emit Approval(msg.sender, guy, value);
        return true;
    }
    
    function transfer(address to, uint value) external returns (bool)
    {
    return transferFrom(sender, recipient, amount);
    emit Transfer(sender, recipient, amount);
    }

    function _burn(address account, uint256 value) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(value);
        _totalSupply = _totalSupply.sub(value);
        emit Transfer(account, address(0), value);
    }

    function transferFrom(
        address from,
        address to,
        uint value
    ) external returns (bool)
    {
        require(balanceOf[from] >= value);
        if (from != msg.sender && allowance[from][msg.sender] != uint256(-1))
            require(allowance[from][msg.sender] >= value);
            allowance[from][msg.sender] -= value;
        }
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
        return true;
    }

}