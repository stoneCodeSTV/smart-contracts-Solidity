// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 < 9.0.0;

import './SimpleStorage.sol'; 

contract ExtraStorage is SimpleStorage {

    // Override 
    // Virtual Override (view same function in SimpleStorage.sol ) 
    function store(uint256 _favoriteNum) public override  {
    favoriteNum = _favoriteNum + 5;   
    }
}