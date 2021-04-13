const { Web3Provider } = require("ethers/providers");
// For now keep everything in one contract --but NOT ideal
const AEToken = artifacts.require('../contracts/AEToken/AEToken.sol');
const Price = artifacts.require('../contracts/Price.sol');
// const AthleteFactory = artifacts.require('../contracts/AthleteFactory/AthleteFactory.sol');
const AEStaking = artifacts.require('../contracts/AEToken/AEStaking.sol');

module.exports = function(deployer) {
    deployer.deploy(AEToken);
    deployer.deploy(AEStaking);
}