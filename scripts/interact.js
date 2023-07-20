const { ethers } = require("hardhat");

async function main() {
    console.log('Getting the token contract...');
    const owner = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
    const tokenContract =await ethers.getContractAt('TokenContract', owner);

    //name()
    console.log('Querying token name...');
    const name = await tokenContract.name();
    console.log(`Token name: ${name}\n`);

    //sysmbol()
    console.log('Quering token symbol...');
    const sysmbol = await tokenContract.symbol();
    console.log(`Symbol name ${sysmbol}\n`);

    //decimal()
    console.log(`Querying decimals...`);
    const decimal = await tokenContract.decimals();
    console.log(`Token Decimals ${decimal}\n`);

    //totalSupply()
    console.log('Querying token supply...');
    const totalSupply = await tokenContract.totalSupply();
    console.log(`Total Supply including all decimals: ${totalSupply}`);
    console.log(`Total supply including all decimals comma seperated: ${ethers.utils.commify(totalSupply)}`)

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process,exitCode = 1;
    });