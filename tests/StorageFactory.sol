// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 < 9.0.0;

import './SimpleStorage.sol';

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray; 

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNum) public {
        // Address
        // ABI - Application Binary Interface (Tells code how to interact)
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNum); 
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();       
    }   
}