pragma solidity ^0.7.4;

import "../interfaces/IAthletePriceOracle";
import "@openzeppelin/contracts/access/Ownable.sol";
/// @title Caller Contract for the Athlete Equity Oracle
/// @author kamto
/// @notice Explain to an end user what this does
/// @dev built using standard syntax from crypto zombies
contract CallerContract is Ownable {
    address private OracleAddress;
    IAthletePriceOracle private athletePriceInstance;
    mapping(uint => bool) requests;
    event newOracleAddressEvent(address OracleAddress);
    event RecievedNeWRequestIdEvent(uint id);
    function setOracleInstanceAddress (address _oAddress) public onlyOwner
    {
        OracleAddress = _oAddress;
        athletePriceInstance = IAthletePriceOracle();
        emit newOracleAddressEvent(OracleAddress);
    }

    function updateAthletePrice()
    {
        uint id = 
        requests[id] = true;
    }
}


// How it works
// To initiate an ETH price update, the smart contract should call the getLatestEthPrice function of the oracle.
// Now, due to its asynchronous nature, there's no way the getLatestEthPrice function can return this bit of information.
// What it does return instead, is a unique id for every request.
// Then, the oracle goes ahead and fetches the ETH price from the Binance API and executes a callback function exposed by the caller contract.
// Lastly, the callback function updates the ETH price in the caller contract.