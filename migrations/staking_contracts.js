const Staking = artifacts.require("../contracts/AEToken/AEStaking.sol");


module.exports = function (deployer) {
    deployer.deploy(Migrations);
  };
  