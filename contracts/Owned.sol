pragma solidity 0.7.4;

contract Owned {

    address public owner;

    constructor()
    {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require( msg.sender == owner);
        _; /// Not sure at all what this is for
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }   
}