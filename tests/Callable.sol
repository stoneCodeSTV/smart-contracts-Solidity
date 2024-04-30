// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// An interface is just a signature of a contract
interface ICallable {
    function getScore() external view returns(uint); 
}

contract Callable {
    
    // since public indicator is not used we must create getter function below. 
    uint score = 20; 

    function getScore() external view returns(uint) {
        return score; 
    }
}