// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 < 9.0.0;

// boolean, uint, int, address, bytes 
/*
    bool hasFavoriteNum = true; 
    string favoriteNumInText = 'Five';
    int256 favoriteInt = -5; 
    address myAddress = 0x3667af366de7AF90bf811DC541ADB681b3dce850; 
    bytes32 favoriteBytes = 'cats'; // 0x12345... 
*/

contract SimpleStorage {

    // This gets initialized to zero if a value is not given
    uint256 favoriteNum;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNum; 
        string name; 
    }

    // uint256[] public favoriteNumbersList;
    People[] public people; 


    function store(uint256 _favoriteNum) public virtual {
        favoriteNum = _favoriteNum;   
    } 

    // view, pure 
    function retrieve() public view returns (uint256)   {
    return favoriteNum; 
   }

    // calldata, memory, storage
   function addPerson(string memory _name, uint256 _favoriteNum) public  {
    people.push(People(_favoriteNum, _name));
    nameToFavoriteNumber[_name] = _favoriteNum;
   }

   function deletePerson(uint _index) public {  
     delete people[_index];
   }
}