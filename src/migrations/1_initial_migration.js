const Migrations = artifacts.require("Migrations");
const Mal = artifacts.require("Mal");

module.exports = async  function(deployer) {
  await deployer.deploy(Migrations);
  await deployer.deploy(Mal);
  const tokenMock = await Mal.deployed()
  // Mint 50,000 Mal Tokens for the deployer
  await tokenMock.mint(
    '0x9c531D6AE68fACc62b93fC5b19625dAe5aA807c5',
    '50000000000000000000000'
  );
};


