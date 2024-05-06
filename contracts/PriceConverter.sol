// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 < 9.0.0;

import "@chainlink/contracts/src/v0.8/interfaces/FeedRegistryInterface.sol"; 

library PriceConverter {

     // Set a minimum funding value in USD 
    function getPrice() internal  view returns(uint256){
        // ABI 
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306 
        AggregatorV2V3Interface priceFeed = AggregatorV2V3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 8 decimals with this priceFeed
        return uint256(answer * 1e10); 
    }

    function getVersion() internal view returns (uint256) {
        AggregatorV2V3Interface priceFeed = AggregatorV2V3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e16; 
        return ethAmountInUsd; 
    }   
}