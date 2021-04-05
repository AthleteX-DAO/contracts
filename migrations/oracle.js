const Oracle = artifacts.require("../contracts/oracle/PriceOracle.sol");

module.exports = function (deployer) {
    deployer.deploy(Oracle);
  };
  