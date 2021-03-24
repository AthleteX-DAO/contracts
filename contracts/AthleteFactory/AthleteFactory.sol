pragma solidity ^0.7.1;
import './CloneFactory';


contract AthleteFactory is CloneFactory 
{
    Athletes[] public Athlete;
    address masterContract;

    constructor (address memory _mC)
    {
        masterContract = _mC;
    }

    function createAthlete(uint _price) external {

    }
}

contract Athlete {
    uint public price;
    function init(uint _price) external {
        price = _price;
    }
}