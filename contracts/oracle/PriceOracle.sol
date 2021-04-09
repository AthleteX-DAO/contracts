// TODO create a decentralized Oracle populating athlete feed -- starting off as centralized



pragma solidity ^0.8.3;
import "@openzeppelin/contracts/access/Ownable.sol";
import "../interfaces/ICallerContract.sol";
contract EthPriceOracle is Ownable {
  uint private randNonce = 0;
  uint private modulus = 1000;
  mapping(uint256=>bool) pendingRequests;
  event GetLatestEthPriceEvent(address callerAddress, uint id);
  event SetLatestEthPriceEvent(uint256 ethPrice, address callerAddress);
  
  function getLatestAthPrice() public returns (uint) {
      ++randNonce;
      
  }
}