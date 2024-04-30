// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "./Callable.sol";

contract Calling  {

    address public callAdd;

    function setAddress(address _callAdd) external  {
        callAdd = _callAdd;
    } 

    function callExternal() external view returns(uint) {
        // using ineritance from CALLABLE file
         ICallable callable = ICallable(callAdd); 
        return callable.getScore();
    } 
}