const { ethers } = require("hardhat");

async function main() {
  const owner = await ethers.getSigners();
  console.log(`deploying contract from: ${owner[0].address}`);

  //hardhat helper to get the ethers contractfactory object
  const AvengerToken = await ethers.getContractFactory('AvengerToken');

  //Deploy the contract
  console.log('Deploying AvengerToken');
  const avengerToken = await AvengerToken.deploy();
  await avengerToken.deployed();
  console.log(`AvengerToken deployed to: ${avengerToken.address}`);
}

main()
 .then(() => process.exit(0))
 .catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
