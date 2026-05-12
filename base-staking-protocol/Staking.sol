// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address, address, uint) external returns (bool);
    function transfer(address, uint) external returns (bool);
}

contract Staking {
    IERC20 public token;

    struct Stake {
        uint amount;
        uint timestamp;
    }

    mapping(address => Stake) public stakes;

    constructor(address tokenAddress) {
        token = IERC20(tokenAddress);
    }

    function stake(uint amount) external {
        token.transferFrom(msg.sender, address(this), amount);

        stakes[msg.sender] = Stake(amount, block.timestamp);
    }

    function unstake() external {
        Stake memory s = stakes[msg.sender];

        require(s.amount > 0, "no stake");

        uint reward = (block.timestamp - s.timestamp) * 1e15;

        token.transfer(msg.sender, s.amount + reward);

        delete stakes[msg.sender];
    }
}
