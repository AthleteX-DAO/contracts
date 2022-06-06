pragma solidity ^0.8.4;

import "@gysr/core";


contract ProxyPoolFactory is IPoolFactory, OwnerController {

    constructor() {
        
        _setup();
    }

    

}