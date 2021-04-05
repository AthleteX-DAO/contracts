const { Web3Provider } = require("ethers/providers");

const AEToken = artifacts.require('../contracts/AEToken/AEToken.sol');
const Price = artifacts.require('../contracts/Price.sol');

module.exports = function (deployer) {
    deployer.deploy(Migrations);
  };  