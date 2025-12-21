// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract Fundme {


    uint256 public  number;


    function fund() public  payable {
        
        // Reverting - if a statement has require , incase condition false previous action of require gets undo
        number =5;
 
        require(msg.value > 1e18, "Didnt send enough moeny");
    }



}