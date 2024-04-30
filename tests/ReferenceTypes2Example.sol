// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 < 9.0.0;

contract ReferenceTypes {

    // this is storage by default (under the hood: uint[] storage public x = [1, 2...])
    //everywhere else it must be specified 
    uint[] public x = [1, 2, 3];

/*  function realTest() external {
        // passing uint to the function by REFERENCE
        _doubleValue(x);
    }
*/

    // 'PURE' keyword means does not take anything from BLOCKCHAIN state and does not change BLOCKCHAIN state
    // passing by reference points to the original value location on x so _value = the value of x   
    function _doubleValue(uint[] calldata _value) public pure returns(uint[] memory) {
        uint[] memory _x = _value;
        _x[0] = 42; 
        return _x;
    }
}

// READ SOLIDITY DOCS: TYPES/REFERENCE TYPES