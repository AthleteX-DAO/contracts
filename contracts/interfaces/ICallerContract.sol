pragma solidity ^0.7.4;

contract CallerContractInterface {
  function callback(uint256 _ethPrice, uint256 id) public;
}
