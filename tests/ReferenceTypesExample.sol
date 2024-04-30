// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 < 9.0.0;

contract ReferenceTypes {

    // this is storage by default (under the hood: uint[] storage public x = [1, 2...])
    //everywhere else it must be specified 
    uint[] public x = [1, 2, 3, 4, 5, 6];

    function realTest() external {
        // passing uint to the function by REFERENCE
        _doubleValue(x);
    }


    // 2x function // 'PURE' keyword means does not take anything from BLOCKCHAIN state and does not change BLOCKCHAIN state
    // passing by reference points to the original value location on x so _value = the value of x   
    function _doubleValue(uint[] storage _value) internal returns(uint[] memory) {
        _value[0] = 42; 
        return _value;
    }
}

// READ SOLIDITY DOCS: TYPES/REFERENCE TYPES