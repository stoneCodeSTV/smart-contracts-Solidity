// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// In Solidity the tpe of the parameter to be passed must be declared (uint, int. string etc.)
// Visibility Modifiers: Only EXTERNAL can't be used on STATE VARIABLES 
/*
    function (<parameter types>)
    { Visibility Modifiers: from least to most restrictive 
        - public --> visible internally and externally, public automatically creates GETTER FUNCTION.   
        - external --> can only be called from the outside.  
        - internal --> only visible internally meaning contract itself of inheritance 
        - private --> only visible to current contract, not even visible to contracts that are inheriting it.  
    }   
    { Restriction Modifiers: 
        - pure --> can't read or modify a state data   
        - view --> can read from state data 
        - payable --> when added a function ca receive ether 
    }  
    [(custom modifiers)] ** see later 
    [ returns(<return types>)]
*/

// Parent Contract 
contract Ownable {

    address payable public owner;

    constructor() {
    // Owner of parking lot wallet address
    owner = payable(msg.sender);
    }  

    modifier checkOwnership {
        require( msg.sender == owner, "Invalid Sender, Please Verify Wallet Address.");
        _;
    }
}

// Child contract inheriting from Parent contract 
contract ParkingLot is Ownable {
     

    enum LotStatuses { VACANT, FULL }
    LotStatuses public currentStatus;

    //event declaration 
    event Occupy( address _occupant, uint _value);

    constructor() {
        super; 
        currentStatus = LotStatuses.VACANT; 
    }

    modifier checkVacancy {
        require(currentStatus == LotStatuses.VACANT, "Fully Occupied");
        _;
    }

    modifier checkPayment(uint _amount) {
        require(msg.value >= _amount, "Insufficient amount provided");
        _;
    }

    function park() payable external checkVacancy checkPayment(10 ether) {
        currentStatus = LotStatuses.FULL;
        owner.transfer(msg.value);
        // msg.sender = client paying parking spot
        emit Occupy(msg.sender, msg.value);
    }

    function checkOut() external checkOwnership {
        currentStatus = LotStatuses.VACANT;
    }
}