// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract MyFunctionContract{

    uint value=0;

    function setter( uint x) public  {
        value = x;
    }

    function getter() public  view returns(uint x) {
        return value;
        //
    }
}