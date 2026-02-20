// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage{

    uint128 public   storageValue;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    event SimpleStorageEvents(
        address indexed caller,
        uint128 storageNumber

    );

    //Customer Error
    error NotOwner();
    error NozeroValueAccceptable();


    function UpdateValue(uint128 value)external {
         if (msg.sender != owner) revert NotOwner();
         if(value == 0) revert NozeroValueAccceptable();
        storageValue=value;
        emit SimpleStorageEvents(msg.sender, value);
    }   


    function GetValue() public view returns(uint128){
        return storageValue;
    }
}