// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "contracts/Library/PriceConvertor.sol";


// 0x694AA1769357215DE4FAC081bf1f309aDC325306
contract Fundme {
    using PriceConvertor for uint256;

    uint256 public minimumUSD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public amountsendbyFunders;

    AggregatorV3Interface public priceFeed;

    constructor(address pricefeedAddress) {
        priceFeed = AggregatorV3Interface(
            pricefeedAddress
        );
    }

    function fund() public payable {
        require(  //msg.value is first paramter , second paramater is pricefeed
            msg.value.getConversionEthAmount(priceFeed) >= minimumUSD,
            "Didn't send enough money"
        );

        funders.push(msg.sender);
        amountsendbyFunders[msg.sender] += msg.value; // if the same user send money then + required 
    }
}
