pragma solidity ^0.7.1;
import "./CloneFactory.sol";

// Athletes are functionally the same, just differentiated by price / feed
// event newAthlete(uint aID, string name, uint aPrice ); //This is broken -- didn't apply concepts correctly

contract AthleteFactory is CloneFactory 
{
    struct Athletes {
        string aName;
        uint aPrice;
    }

    Athletes[] public arrAthlete;
    address masterContract;

    constructor (address _mC)
    {
        masterContract = _mC;
    }

    function createAthlete(string memory _name, uint _price) external {
        arrAthlete.push(Athletes(_name, _price));
    }
}

contract Athlete {
    uint public price;
    function init(uint _price) external {
        price = _price;
    }

    // Need to create oracle
}