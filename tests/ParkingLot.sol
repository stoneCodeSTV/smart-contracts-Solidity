// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// To import contracts from other files 
import "./Ownable.sol";


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