/**
 * @type import('hardhat/config').HardhatUserConfig
 */

  require("@nomiclabs/hardhat-etherscan");
  require("@nomiclabs/hardhat-waffle");
  require("hardhat-gas-reporter");
  require("solidity-coverage");

  var $mnem = "off neither whip umbrella skill monitor wall cup style fatal device month";

module.exports = {
  defaultNetwork: "matic",
  solidity: "0.8.0",

  networks: {
    matic: { // MATIC MAINNET
      url: "https://polygon-rpc.com/",
      accounts: []
    },
    mumbai: { //MATIC TESTNET
      url: "https://matic-mumbai.chainstacklabs.com",
      accounts: {
        mnemonic: $mnem,
      }
    },
  },
  mocha: {
    timeout: 20000
  }
};
