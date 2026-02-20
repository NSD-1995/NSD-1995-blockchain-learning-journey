// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {

    int256 private _count;
    address public owner;

    event CounterChanged(
        address indexed caller,
        int256 previousValue,
        int256 newValue
    );

    error NotOwner();
    error UnderflowNotAllowed();

    constructor() {
        owner = msg.sender;
    }

    function getCount() external view returns (int256) {
        return _count;
    }

    function increment() external {
        int256 previous = _count;
        _count += 1;

        emit CounterChanged(msg.sender, previous, _count);
    }

    function decrement() external {
        if (_count == 0) revert UnderflowNotAllowed();

        int256 previous = _count;
        _count -= 1;

        emit CounterChanged(msg.sender, previous, _count);
    }

    function reset() external {
        if (msg.sender != owner) revert NotOwner();

        int256 previous = _count;
        _count = 0;

        emit CounterChanged(msg.sender, previous, _count);
    }
}
