const Staking = artifacts.require('../contracts/Staking');
module.exports = function (deployer, network, accounts) {
    deployer.deploy(Staking);
  };
  