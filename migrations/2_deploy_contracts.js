const { Web3Provider } = require("ethers/providers");

const AEToken = artifacts.require('../contracts/AEToken/AEToken.sol');
const Price = artifacts.require('../contracts/Price.sol');
const AEStaking = artifacts.require('../contracts/AEToken/AEStaking.sol');
// const AthleteFactory = artifacts.require('../contracts/AthleteFactory/AthleteFactory.sol');

module.exports = function(deployer) {
    deployer.deploy(AEToken);
    deployer.deploy(AEStaking);
}