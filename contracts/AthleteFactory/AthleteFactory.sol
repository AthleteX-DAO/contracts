pragma solidity ^0.7.1;
import './CloneFactory';

// Athletes are functionally the same, just differentiated by price / feed
event newAthlete(uint aID, string name, uint aPrice );

contract AthleteFactory is CloneFactory 
{
    struct Athletes {
        string aName;
        uint aPrice;
    }

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

    // Need to create oracle
}