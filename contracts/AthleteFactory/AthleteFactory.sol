pragma solidity >=0.6.0 <0.8.0;
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

    // memory - temporary -> use for pricing value
    // storage - permanent -> transactions

    mapping (uint => address) public athleteToOwner;
    mapping (address => uint) ownerAthleteCount;

    constructor (address memory _mC)
    {
        masterContract = _mC;
    }

    function createAthlete(string memory _name, uint _price) external {
        arrAthlete.push(Athletes(_name, _price));
    }

    function getPrice() external
    {
        
    }

}