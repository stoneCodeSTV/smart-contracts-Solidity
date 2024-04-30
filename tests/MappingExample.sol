// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract MappingExample {
    // initiate simple mapping 
    // Must provide (value type => key type)
    mapping(string => uint) public players; 

    // Nested Mapping 
     mapping(string => mapping(string => uint )) public versions; 

    // fill up mapping data 
    constructor() {
        players['bob'] = 20;
        players['kim'] = 50;
        players['lee'] = 45;
        versions['beta']['amy'] = 60;
    }

    // reading data from mapping 
    function getScore(string memory _player) external view returns(uint) {
        return players[_player];
    }

    //update 
    function updateScore(string memory _player, uint _score) external {
        players[_player] = _score;
    }

    //delete 
    function deletePlayer(string memory _player) external {
        delete players[_player]; 
    }

    // reading data from nested mapping
    function getNestedData(string memory _version, string memory _player) external view returns(uint) {
        return versions[_version][_player];
    }
}
