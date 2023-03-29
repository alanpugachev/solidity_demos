// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;



contract DemoContract {
    address owner;
    mapping (address => uint) payments;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable {
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}