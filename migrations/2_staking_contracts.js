const StakingRewards = artifacts.require('../contracts/StakingRewards');
var token = "0x8c086885624c5b823cc6fca7bff54c454d6b5239";
var ownerAddress = "0xcdaa8c55fB92fbBE61948aDf4Ba8Cf7Ad33DBeF0";
var rewardsDistribution = "0xcdaa8c55fB92fbBE61948aDf4Ba8Cf7Ad33DBeF0";

module.exports = function(deployer) {
    deployer.deploy(StakingRewards, ownerAddress, rewardsDistribution, token, token);
}