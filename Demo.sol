// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;



contract DemoContract {
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }



    // modifiers
    modifier basicCheckModifier(address _to) {
        require(msg.sender == owner, "You are not an owner");
        require(_to != address(0), "Incorrect address");
        _;
    }



    // functions
    function pay() public payable {
    }

    function withdrawAll(address payable _to) external basicCheckModifier(_to) {
        _to.transfer(address(this).balance);
    }
}