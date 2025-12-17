// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    //Create like Objects and with TypeScript concept
    struct People {
        string name;
        uint age;
    }

    //dictonary
    mapping(string => uint256) public nametoAge;
   
    //Creating the private Arr
    People[] people;


    // Setter Function to assing name and age
    function AddPerosnToArry(string memory Name, uint Age) public {
        people.push(People({name: Name, age: Age}));
        nametoAge[Name] = Age;
    }


    //getter function
    function getIndexBased(uint256 index) public view returns (People memory) {
        return people[index];
    }
}
