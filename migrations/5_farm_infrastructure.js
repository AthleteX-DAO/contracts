const ProxyPool = artifacts.require('../contracts/farms/ProxyPool.sol');
const ProxyPoolFactory = artifacts.require('../contracts/farms/ProxyPoolFactory.sol');

module.exports = function(deployer) {
    deployer.deploy(ProxyPoolFactory);
    deployer.deploy(ProxyPool);
}