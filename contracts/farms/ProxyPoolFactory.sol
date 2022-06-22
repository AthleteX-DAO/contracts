pragma solidity ^0.8.4;

import "@gysr/core";


contract ProxyPoolFactory is IPoolFactory, OwnerController {

    private PoolFactory _poolFactory = new PoolFactory();
    

    /**
     * @Override create
     */
    function create(address staking, address reward) external returns (address) {
        return _poolFactory.create(staking, reward, [] []);
    }

    function treasuy external view override returns (address)
    {
    //  Invokes getter
     return _poolFactory.treasury();   
    }
    
    function fee() {
    // Invokes Getter
        return _poolFactory.fee();
    }

    function setTreasury(address newTreasury) external {
        _poolFactory.setTreasury(newTreasury);
    }

    funciton setFee(uint256 theFees) external {
        _poolFactory.setFee(theFees);
    }

    function setWhitelist(address factory_, uint256 type_) external {
        _poolFactory.setWhitelist(factory_, type_);
    }

    /** @return count of pools created by the factory */
    function count() public view returns (uint256) {
        return _poolFactory.count();
    }
}