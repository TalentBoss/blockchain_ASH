require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
const dotenv = require("dotenv");

dotenv.config();

const INFURA_API_KEY = process.env.INFURA_API_KEY;

const SEPOLIA_PRIVATE_KEY = process.env.SEPOLIA_PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.14",
  networks: {
    sepolia: {
      url : `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY]
    }
  }
};
