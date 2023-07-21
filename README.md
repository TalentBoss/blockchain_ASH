# ERC20 using Hardhat

A basic implementation of the ERC20 token standard using the Hardhat development environment.

It generates an ERC20  `Token` which is deployed on the sepolia testnet:
https://sepolia.etherscan.io/address/0x51518AE2bCd82Cc2eBC4CB33815afD6Ff94a3Cf1

## Requirements For Initial Setup
- Install [NodeJS](https://nodejs.org/en/)
- Install [Hardhat](https://hardhat.org/)

## Setting Up
### 1. Clone/Download the Repository

### 2. Install Dependencies:
```
$ cd ERC20_Hardhat
$ npm install
```
### 3. Boot up local development blockchain
```
$ cd ERC20_Hardhat
$ npx hardhat node
```
### 4. Migrate Smart Contracts
`npx hardhat run scripts/deploy.js --network localhost`

### 6. Run Tests
`$ npx hardhat test`
