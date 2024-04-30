// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// Enum stands for Enumerable: user defined type that contain human readable names for a set of constants. 
/*
    ex: enum Value { Deuce, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, King, Queen, Ace}
        enum Suit { Spades, Clubs, Diamonds, Hearts}
        enum Direction { Left, Right, Up, Down}
        enum State {Created, Locked, Active, Inactive}
        enum Status { On, Off }
*/
contract EnumExample {

    // make a Enum 
    enum ShirtSize {SMALL, MEDIUM, LARGE}
    ShirtSize size; 

    // use the Enum 
    // set a default value to enum
    constructor() {
        size = ShirtSize.LARGE;
    }
    
    // get data from enum 
    function getSize() public view returns(ShirtSize) {
        return size;
    }

    // pass enum to a function as a parameter  
    function setSize(ShirtSize) public {
        size = size; 
    }  
}