// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract FirstContract {

    // have a state variable - count
    // "unit": declaring an Unsigned Integer
    // "public": automatically sets getter function 
    uint public count = 10;

    // A CONSTRUCTOR FUNCTION is something that runs only once when you deploy the contract.
    // It will also assign a default value to our state variable
    // Since state variable is initialized above (line 8) constructor is not needed below example would require contructor. 
    /* 
            unit count;

            constructor() {
                 count = 10; 
        }
    */

    // a getter function for that variable 
    // "public" functions can be called from outside 
    // "view" means does not change any state but returns current state of blockchain
    // Since state variable is listed as public (line 8) the getter function is not needed below example would require getter function     
    /*
        uint count = 10;

            function getCount() public view returns(uint)  {
                return count;
    }
    */

    // add a number to that variable 
    function addNum(uint num) public {
        count +=num; 
    }

    // subtract from that variable 
        function subtractNum(uint num) public {
        count -=num; 
    }
}