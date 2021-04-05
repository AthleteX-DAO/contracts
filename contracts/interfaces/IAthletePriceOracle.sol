pragma solidity ^0.7.1;

contract AthletePriceOracleInterface {
    function getLatestAthletePrice() public returns (uint);
}