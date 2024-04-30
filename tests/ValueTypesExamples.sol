// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 < 9.0.0;

contract ValueTypes {

    //passed by value
    uint256 public x = 42;

    function realTest() external view {
        // passing uint to the function
        _doubleValue(x);
    }


    // 'PURE' keyword means does not take anything from BLOCKCHAIN state and does not change BLOCKCHAIN state
    // x is cloned into _value, the x varaible above is not changed 
    function _doubleValue(uint256 _value) internal pure returns(uint256) {
        _value = _value*2; 
        return _value;
    }
}

// READ SOLIDITY DOCS: TYPES/VALUE TYPES

