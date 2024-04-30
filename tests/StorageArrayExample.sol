// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 < 9.0.0;

/*
    * Arrays can have only one type of elements 
      exp: uint[] myArray => [1, 2, 7, 8, 9]
      (ALL ELEMENTS of this ARRAY must be UNSIGNED INTEGERS)

    * STORAGE ARRAYS
        -FIXED size or DYNAMIC size
         Fixed exp: uint[5] myArray; \\ Array can hold 5 UINTS (More GAS EFFICIENT) 
         Dynamic exp: int[] myArray; \\ Holds undefined amount of INTS 

    * Arrays can be stored in MEMORY, STORAGE or CALLDATA 
      Arrays act differently on different data locations
      STORAGE ARRAYS {
             STATE VARIABLE ARRAY: ARRAYS in FUNCTIONS, that are DECLARED as STORAGE ex: uint[] storage numbers;
             CHARACTERISTICS: FIXED or DYNAMIC / STORED PERMANENTLY / HAS MEMBERS: PUSH, POP, LENGTH
      }       



    Variables of type 'bytes' and 'string' are special arrays. 
        * A 'bytes' is similar to byte[], but it is packed tightly (uses the least memory spaces) 
          in a calldata and memory data location.

        * 'String' is equal to 'bytes' but does not allow length or index access. 
            ex: string myString = " Who does that?";
                myString[0] // would cause an error


    * CALLDATA ARRAYS 
        - Not STATE VARIABLES
        - CAN'T be RESIZED 
        - NOT STORED PERMANENTLY
        - DON'T HAVE MEMBERS (No PUSH, POP, LENGTH)  
        - Normally USED in PARAMETERS of EXTERNALLY called FUNCTIONS
        ex: function myFunction(uint[] calldata _numbers) external{
            ...
        }

    * MEMORY ARRAYS
        - Not STATE VARIABLES
        - CAN'T be RESIZED 
        - NOT STORED PERMANENTLY
        - DON'T HAVE MEMBERS (No PUSH, POP, LENGTH)  
        - USED Inside FUNCTIONS, or FUNCTION PARAMETERS
        // Inside Function    
        ex: function myFunction(uint[] _numbers) {
                uint[] memory x = _numbers; 
        }

        // Inside Function Paramaters and Function (INTERNAL)
        ex2: function myFunction(uint[] memory _numbers) internal {
                uint[] memory x = _numbers; 
        }

    * Why use MEMORY ARRAYS 
        - Solidity is space constrained 
        - TAKES LESS GAS to use MEMEMORY ARRAYS      
*/

/* There are 3 DATA LOCATIONS:
    - MEMORY: data location whose lifetime is temporary
    - STORAGE: data location where the state variables are stored (must be used to change state variable)(more expensive gas usage)
    - CALLDATA: special data location that contains the function arguments 
*/

contract StorageArrayExample {

    // FIXED ARRAYS DON'T REQUIRE CONSTRUCTOR but DON'T HAVE MEMBERS(PUSH, POP, LENGTH) 
/*
    uint[3] public numbers = [5 , 6, 9]; 
*/

    // DYNAMIC ARRAYS needs a CONSTRUCTOR
    uint[] public numbers; 

    // add elements 
    constructor() {
      numbers.push(5);
      numbers.push(9);
      numbers.push(2); 
    }

    // update element 
    function updateArray(uint _index, uint _updatedVlaue) external {
      numbers[_index] = _updatedVlaue; 
    } 

    // delete element 
    function deleteArray (uint _index) external {
      delete numbers[_index]; 
    }

    // pass a number to function and add that to each element
    function addNumbers(uint _num) external {
       for (uint i =0; i < numbers.length; i++) 
       {
        numbers[i] += _num;
       }
    }  
}