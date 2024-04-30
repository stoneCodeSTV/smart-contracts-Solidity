// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract StructExample {
    // "Struct is like a constructor in JAVA"
    struct Player {
        string name; 
        uint score; 
    }

    // Initializing/Creating STRUCTS
    // Short Form (in this form order of variables matter) 
    Player public bob = Player("Bob", 10); 
    Player public kim = Player("Kim", 20); 
    // Long Form (in this form order of variables does not matter)
    Player public lee = Player({score: 45, name: 'Lee'});

    // Updating STRUCTS 
        function leeScoreChange(uint _score) external {
            lee.score = _score;
        } 

        // Below if Player public lee was not public a getter function would be required.  
        /*
            function getLeeScore() external view returns(unit) {
                return lee.score; 
            } 
        
        */

        // to delete Player 
        function deleteBob() external {
            delete bob;
        }
}