const AEStaking = artifacts.require('../contracts/implementation/AEStaking.sol');

module.exports = function (deployer) {
    deployer.deploy(AEStaking);
  };
  