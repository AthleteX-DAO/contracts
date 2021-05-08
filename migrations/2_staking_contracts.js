const Staking = artifacts.require('../contracts/Staking');
const BN = require('bn.js');
module.exports = function (deployer, network, accounts) {
    deployer.deploy(Staking);
  };
  