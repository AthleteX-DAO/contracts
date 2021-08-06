const Migrations = artifacts.require("../contracts/Migrations");
const StakingRewards = artifacts.require('../contracts/StakingRewards');

module.exports = function (deployer) {
  // deployer.deploy(Migrations);
  deployer.deploy(StakingRewards);
};
