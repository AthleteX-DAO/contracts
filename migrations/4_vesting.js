const Vesting = artifacts.require('../contracts/Vesting.sol')

module.exports = function (deployer) {
    deployer.deploy(Vesting);
}