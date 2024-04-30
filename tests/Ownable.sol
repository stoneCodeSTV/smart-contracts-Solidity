// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Ownable {

    address payable public owner;

    constructor() {
    // Owner of parking lot wallet address
    owner = payable(msg.sender);
    }  

    modifier checkOwnership {
        require( msg.sender == owner, "Invalid Sender, Please Verify Wallet Address.");
        _;
    }
}