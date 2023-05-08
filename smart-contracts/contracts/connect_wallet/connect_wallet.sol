// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;


contract connect_wallet {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external  {
        require(msg.sender == owner, "only the owner can call this method");
        payable(msg.sender).transfer(_amount);
    }

    function get_balance() external  view returns (uint) {
        return address(this).balance;
    }
}