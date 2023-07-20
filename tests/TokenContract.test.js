const { expect } = require("chai");
const { ethers } = require("hardhat");

describe(TokenContract),
  function () {
    before(async function () {
      this.TokenContract = await ethers.getContractFactory("TokenContract");
    });

    beforeEach(async function () {
      this.tokenContract = await this.TokenContract.deploy();
      await this.tokenContract.deployed();

      const signers = await ethers.getSigners();

      this.ownerAddress = signers[0].address;
      this.recipientAddress = signers[1].address;

      this.signerContract = this.tokenContract.connect(signers[1]);
    });

    // Test cases
    it("Creates a token with a name", async function () {
      expect(await this.tokenContract.name()).to.exist;
      // expect(await this.tokenContract.name()).to.equal('SAYALI');
    });
  };
