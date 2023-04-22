//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from  "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from  "@openzeppelin/contracts/access/Ownable.sol";

contract AvengerToken is ERC20, Ownable{
   
    // Define the supply of AvengerToken : 1,000,000 
    uint256 constant initialSupply = 1000000 * (10 ** 18);

    constructor() ERC20("AvengerToken", "Avenger") {
        _mint(msg.sender, initialSupply);
    }
} 