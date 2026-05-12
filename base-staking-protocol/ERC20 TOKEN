// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseToken {
    string public name = "BaseStake Token";
    string public symbol = "BST";
    uint8 public decimals = 18;

    uint256 public totalSupply = 1_000_000 * 10**18;

    mapping(address => uint256) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "no balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;

        return true;
    }
}
