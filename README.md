# contracts
AthleteX protocol contracts

Architecture:

1) Brokerage.sol

## LSP Deployment

LSP is deployed using [package of UMAprotocol](https://github.com/UMAprotocol/launch-lsp).

The followings are format and parameters for variant networks.

- SX network

```bash
url: 'https://rpc.sx.technology/'
gasPrice: '10'
pairName: '$firstname $lastname APT Pair'
expirationTimestamp: 'Feb 12 2023'
collateralperpair: '1000'
longsynthname: '$firstname $lastname Long APT'
longSynthSymbol: '$f$lLAPT'
shortSynthName: '$firstname $lastname Short APT'
shortSynthSymbol: '$f$lSAPT'
collateralToken: 'https://explorer.sx.technology/address/0xd9Fd6e207a2196e1C3FEd919fCFE91482f705909'
lowerBound: '0'
upperBound: '1000'
proposerReward: '20000000000000000000'
optimisticOracleProposerBond: '40000000000000000000'

( $f: first ch of firstname, $l: first ch of lastname )
```
