// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConvertor { 
    // AggregatorV3Interface public priceFeed; //not support 

    // constructor(address _priceFeed) { // not support
    //     priceFeed = AggregatorV3Interface(_priceFeed);
    // }

    function getVersion(AggregatorV3Interface priceFeed) internal  view returns (uint) {
        return priceFeed.version();
    }

    function getLatestPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionEthAmount(
        uint256 amount ,AggregatorV3Interface priceFeed
    ) public view returns (uint256) {
        uint256 ethPrice = getLatestPrice(priceFeed);
        uint256 ethAMountinUSd = uint((ethPrice * amount) / 1e18);
        return ethAMountinUSd;
    }
}
