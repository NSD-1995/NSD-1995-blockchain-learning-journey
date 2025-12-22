// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

//0x694AA1769357215DE4FAC081bf1f309aDC325306
contract Fundme {
    AggregatorV3Interface public priceFeed;

    uint256 public miniumUSD = 50;

    address[] public funders;

    mapping(address => uint256) public amountsendbyFunders;

    //     struct Funder {
    //     address funder;
    //     uint256 amount;
    // }

    constructor(address _priceFeed) {
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    function fund() public payable {
        require(
            getConversionEthAmount(msg.value) >= miniumUSD * 1e18,
            "Didnt send enough moeny"
        );

        funders.push((msg.sender));
        amountsendbyFunders[msg.sender] = msg.value;
    }

    function getVersion() public view returns (uint) {
        return priceFeed.version();
    }

    function getLatestPrice() public view returns (uint256) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionEthAmount(
        uint256 amount
    ) public view returns (uint256) {
        uint256 ethPrice = getLatestPrice();
        uint256 ethAMountinUSd = uint((ethPrice * amount) / 1e18);
        return ethAMountinUSd;
    }
}
