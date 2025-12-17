// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


contract StorageFactory{

    SimpleStorage[] public simpleStorageArray;


    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function getSimpleStorageArray() public view returns(SimpleStorage[] memory){
        return simpleStorageArray;
    }

    function getSimpleArrayBasedonIndex(uint index) public view   returns (SimpleStorage ){
        return simpleStorageArray[index];
    }

    function AddPersoninStorage (string memory Name, uint Age,uint index  ) public {

       SimpleStorage add = simpleStorageArray[index];

       add.AddPerosnToArry(Name,Age);


    }




    // First access the indexof simpleStorage, inthat I am 
    function getAddperonStorage (uint index,uint simplestorageIndex ) public view returns(SimpleStorage.People memory) {
        SimpleStorage retrive = simpleStorageArray[index];

          SimpleStorage.People memory data = retrive.getIndexBased(simplestorageIndex);

        return data;
   



     
    }




}