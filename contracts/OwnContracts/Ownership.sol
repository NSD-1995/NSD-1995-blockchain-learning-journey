// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Ownershiptransfer {

    address _owner;

    constructor() {
        _owner = msg.sender;
    }

    modifier checkowner() {
        require(msg.sender == _owner);
        _;
    }

    function OwnershipTransfer(address newOwner) external checkowner {
        _owner = newOwner;
    }

    function getOwnerDetails() public view returns(address) {
        return _owner;
    }
}