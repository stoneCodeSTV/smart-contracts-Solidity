// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 < 9.0.0;

/*  

    - GAS COST OF CONTRACT Initially : 756623
    - + Constant keyword on a state varaible : 733374 (uint public constant minimumUsd) 
    - + Immutable keyword : 710191 (address public immutable owner)  
    - + Using Custom Errors for Reverts: 685785 (adding error at top + if(msg.sender != i_owner) {revert NotOwner();}) 


*/

import './PriceConverter.sol'; 

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    // **STANDARD: Constant Varaibles written in ALL CAPS w/Underscores** 
    uint public constant MINIMUM_USD = 1; 
    // 2446 gas - non-constant
    //  347 gas - constant

    address[] public funders; 

    mapping(address => uint256) public addressToAmountFunded;  

    // immutable is used when variable is set once but set outside of line declared.
    // **STANDARD: Immutable Variables written w/ i_name** 
    address public immutable i_owner; 

    constructor() {
    // set outside of line declared 
    i_owner = msg.sender;  
    // 2574 gas - non-immutable
    //  439 gas - immutable
    }

    // Get funds from users
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, 'Insufficient Amount.'); // 1e18 == 1* 10 * 18 == 1,000,000,000,000,000,000 Wei == 1 ETH
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    } 

    // Withdraw funds 
    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) 
        {
            address funder = funders[funderIndex];
            // resetting amount of funder to 0 
            addressToAmountFunded[funder] = 0;  
        }

        // reset the array and store amount contributed 
        funders = new address[](0);

        // withdraw into wallet 
        // 3 Ways (transfer, send, call)  

/*
        // transfer (2300 gas, throws error) max 2300 gas throws an error will fails, automatically reverts 
        payable(msg.sender).transfer(address(this).balance);

        // send (2300 gas, returns bool) max 2300 returns boolean, only reverts with require statement  
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, 'Send Failed');
*/

        // call (forward all gas or set gas, returns bool) no gas cap, returns boolean, only reverts with require statement  
        // for now we only care about callSuccess, dataReturned will be explained later
        // **Recommended Way for now*** (May 6th 2024)
        (bool callSuccess, /*bytes memory dataReturned*/) = payable(msg.sender).call{value: address(this).balance}('');
        require(callSuccess, 'Call Failed');
    
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, NotOwner()); ** This is not yet allowed **
        // require(msg.sender == i_owner, 'Please Verify Wallet Address'());
         if(msg.sender != i_owner) {revert NotOwner();}
        // The underscore tells the program to run the rest of the code after the condition has been met 
        _;
    }
}

