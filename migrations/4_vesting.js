const Vesting = artifacts.require('../contracts/Vesting.sol')



module.exports = async () => {
    const VestingContract = await Vesting.new();
    Vesting.setAsDeployed(VestingContract);
}