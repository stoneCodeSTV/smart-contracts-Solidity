// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 < 9.0.0;

contract FallbackExample {

    uint256 public result; 

    receive() external payable { 
        result = 1; 
    } 

    fallback() external payable { 
        result = 2; 
    }
    
}