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

    address public owner;

    AggregatorV3Interface public priceFeed;

    constructor(address pricefeedAddress) {
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(pricefeedAddress);
    }

    function fund() public payable {
        require(
            //msg.value is first paramter , second paramater is pricefeed
            msg.value.getConversionEthAmount(priceFeed) >= minimumUSD,
            "Didn't send enough money"
        );

        funders.push(msg.sender);
        amountsendbyFunders[msg.sender] += msg.value; // if the same user send money then + required
    }

    function withdraw() public onlyOwner {
        /* startIndex, endIndex, step amount */

        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funderAddress = funders[funderIndex]; /// taking addrees of funders
            amountsendbyFunders[funderAddress] = 0;

            //Three way of transacction

            // 1) payable (msg.sender).transfer(address(this).balance);
            // 2) bool sucess = payable (msg.sender).send(address(this).balance);
            // require(sucess,"failed");
            //3
            (bool callsucess, ) = payable(msg.sender).call{
                value: address(this).balance
            }("");
            require(callsucess, "call failed");
        }
    }

    modifier onlyOwner() {
        (msg.sender == owner, "The person is not the owner");
        _;
    }
}
