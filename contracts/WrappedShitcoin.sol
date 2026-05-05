// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WrappedShitcoin {
    string public name = "Wrapped Shitcoin";
    string public symbol = "wSHITCOIN";
    uint8 public decimals = 18;
    uint public totalSupply;

    address public owner;
    address public bridge;

    mapping(address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint value);
    event BridgeUpdated(address indexed bridge);

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    modifier onlyBridge() {
        require(msg.sender == bridge, "not bridge");
        _;
    }

    constructor() {
        owner = msg.sender;
        bridge = msg.sender;
    }

    function setBridge(address _bridge) public onlyOwner {
        bridge = _bridge;
        emit BridgeUpdated(_bridge);
    }

    function mint(address to, uint amount) public onlyBridge {
        balanceOf[to] += amount;
        totalSupply += amount;
        emit Transfer(address(0), to, amount);
    }

    function burn(address from, uint amount) public onlyBridge {
        require(balanceOf[from] >= amount, "not enough");
        balanceOf[from] -= amount;
        totalSupply -= amount;
        emit Transfer(from, address(0), amount);
    }

    function transfer(address to, uint value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "not enough");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}