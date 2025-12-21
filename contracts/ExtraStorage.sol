

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


contract ExtraStorage is SimpleStorage{

        //Overide a parent function
        function AddPerosnToArry(string memory Name, uint Age) public override  {
        people.push(People({name: Name, age: Age}));
        nametoAge[Name] = Age + 5; 
    }

}

