// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;



contract DemoContract {
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }

    function pay() public payable {
        payments[msg.sender] = msg.value;
    }

    function withdrawAll(address payable _to) external {
        _to.transfer(address(this).balance);
    }
}