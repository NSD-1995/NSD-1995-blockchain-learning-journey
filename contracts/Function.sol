// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract MyFunctionContract{

    // uint value=0;

    // function setter( uint x) public  {
    //     value = x;
    // }

    // function getter() public  view returns(uint x) {
    //     return value;
    //     //
    // }

    //Struct and Array

    // adding of Mapping


    mapping(string => uint256) public nametoAge;

    struct People{

        string Name;
        uint age;
    }

    People[] public  people;

    function AddPeople(string memory _name, uint256 age) public  {
        people.push(People({Name:_name ,age:age}));
        nametoAge[_name]=age;
    }


    function getArray(uint256 index) public view   returns(People memory) {

        return people[index]; 

    }
}