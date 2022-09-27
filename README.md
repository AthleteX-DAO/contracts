# contracts
AthleteX protocol contracts

## What is an APT

a seasonal APT is a [UMAprotocol] long-short pair.  They are bound in certain ways:  The AthleteX token is the 'collateralToken', and the 'collateralperpair' is the exact same as the 'upperBound'.  The 'lowerBound' is set to zero.  

## APT Deployment

APT is deployed using [package of UMAprotocol](https://github.com/UMAprotocol/launch-lsp).

After done minting APT, it will be needed to record long and short token addresses individually. It can be usually done by remix IDE. At first, complie [LongShortPair.sol](https://github.com/UMAprotocol/protocol/blob/master/packages/core/contracts/financial-templates/long-short-pair/LongShortPair.sol) smart contract, and then instantiate the smart contract using `AtAddress` with LSP address mint by the above package. Finally, you can get `longToken` and `shortToken` addresses in this LongShortPair instantiation.

The followings are format and parameters for variant networks.

- SX network

    - Parameters

    ```yaml
    url: https://rpc.sx.technology/
    gasPrice: 10
    pairName: $firstname $lastname APT Pair
    expirationTimestamp: 1676332799 (2023-02-13T23:59:59+0000)
    collateralperpair: 1000000000000000000000
    priceIdentifier: APT
    longsynthname: $firstname $lastname Long APT
    longSynthSymbol: $f$lLAPT
    shortSynthName: $firstname $lastname Short APT
    shortSynthSymbol: $f$lSAPT
    collateralToken: 0xd9Fd6e207a2196e1C3FEd919fCFE91482f705909
    lowerBound: 0
    upperBound: 1000000000000000000000
    proposerReward: 20000000000000000000
    optimisticOracleProposerBond: 40000000000000000000

    $f: first ch of firstname
    $l: first ch of lastname
    ```

    - Command template

    ```bash
    node index.js --gasprice 10 --url "https://rpc.sx.technology/" --mnemonic "12 phrase words here" --pairName "$firstname $lastname APT Pair" --expirationTimestamp 1676332799 --collateralPerPair 1000000000000000000000 --priceIdentifier APT --longSynthName "$firstname $lastname Long APT" --longSynthSymbol "$f$lLAPT" --shortSynthName "$firstname $lastname Short APT" --shortSynthSymbol "$f$lSAPT" --collateralToken 0xd9Fd6e207a2196e1C3FEd919fCFE91482f705909 --fpl Linear --lowerBound 0 --upperBound 1000000000000000000000 --proposerReward 20000000000000000000 --optimisticOracleProposerBond 40000000000000000000
    ```
