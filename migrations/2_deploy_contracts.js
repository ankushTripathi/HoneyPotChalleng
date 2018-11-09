var Attack = artifacts.require('./Attack.sol');
var contract_address = "0x78C800AAe93F075214390C412812dffdc0A22576";

module.exports = function(deployer){

   deployer.deploy(Attack,contract_address);

}