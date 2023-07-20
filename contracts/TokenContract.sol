// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract TokenContract is IERC20 {
 
    string  public  name;
    string  public  symbol;
    uint8   public  decimals;
    uint256 public  totalSupply_;

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;


    // constructor()  {
    //     name = "SAYALI";
    //     symbol = "SAY";
    //     decimals = 10;
    //     totalSupply_ = 1000000000000;     
    //     balances[msg.sender] = totalSupply_;
    // }

    constructor(string memory _name_, string memory _symbol_, uint8 _decimals_, uint256 _totalSupply_)  {
    
        name = _name_;
        symbol = _symbol_;
        decimals = _decimals_;
        totalSupply_ = _totalSupply_ * (10 ** decimals);

        balances[msg.sender] = totalSupply_;
        emit Transfer(address(0), msg.sender, totalSupply_);
    }


    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balances[msg.sender] > 0, "Zero Balance!");
        require(balances[msg.sender] >= amount, "Low Balance!");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(allowed[sender][msg.sender] > 0, "Zero Allowance!");
        require(allowed[sender][msg.sender] >= amount, "Low Allowance!");
        require(balances[sender] > 0, "Zero Balance!");
        require(balances[sender] >= amount, "Low Balance!");
        allowed[sender][msg.sender] -= amount;
        balances[sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }
}

