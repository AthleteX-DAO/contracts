pragma solidity 0.7.4;

// import ERC20(?)
// import AEStaking(?)/AEToken
import "./AEToken/AEToken.sol";

contract FeePool {
    using SafeMath for uint256;

    // Current amount added to pool
    uint256 private _pool = 0;
    
    // Current gains within pool
    uint256 private _gains = 0;

    // mapping of Token to its supply
    mapping (AEToken => uint256) tokensTotalSupply;

    // FUNCTIONS
        // add token to pool
        // remove token from pool
        // add/update gains
        // take gains


    /// @dev adding OR updating an AEToken to the pool, increase pool
    /// @param the AEToken to be added
    function updateToken(AEToken _aeToken) external {
        uint256 tokensSupply = _aeToken.totalSupply();

        // should be 0 on adding a token
        uint256 preSupply = tokensTotalSupply[_aeToken];

        tokensTotalSupply[_aeToken] = tokensSupply;
        // pool = newSupply - oldSupply
        _pool = _pool.add(tokensSupply.sub(preSupply));
    }


    /// @dev removing an AEToken to the pool, decreasing pool
    /// @param the AEToken to be removed
    function removeToken(AEToken _aeToken) external {
        // require the token to exist (in the pool)
        // could be an issue if a token has 0 supply
        require (tokensTotalSupply[_aeToken] != 0);
        
        //decuct from the total pool and set to 0
        _pool.sub(tokensTotalSupply[_aeToken]);
        tokensTotalSupply[_aeToken] = 0;
    }


    // not sure about gains
    function updateGains(uint256 _update) external {
        _gains = _gains.add(_update);
    }


    /// @dev returns current amount in the overall gains
    /// @return _gains (total gains)
    function getGains() view external returns (uint){
        return _gains;
    }


    /// @dev owner can take the gains that they have made
    /// @param _owner taking the gains, token they are using
    /// @return the amount of gains taken
    function takeGains(address _owner, AEToken _aeToken)  external returns (uint256){
        // get balance of owner
            // get balance of token                             (not needed)
        // % of token owner has * % token compared to _pool
            // (ownerBalance/tokenSupply) * (tokenSupply/pool)
            // ownerBalance/Pool
        // reduce and return % of gains


        // QUESTION?
        //  How to deal with fractions?
        //  Update owner's balance?
        // should msg.sender be used instead of _owner? (require that msg.sender is _owner)

        require(msg.sender == _owner);

        uint256 ownerBalance = _aeToken.balanceOf(_owner);
            //should this be a uint
        uint256 gainsTaken = ownerBalance.mul(_gains).div(_pool);
        _gains = _gains.sub(gainsTaken);
        return gainsTaken;
    }
}
