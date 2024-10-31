//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; //solidity version 

contract SimpleStorage{
    //Basic Type: boolean , uint , int ,address, bytes
      uint256 favouritNumber;//0 // favorite number get initialize 0, if no value is given.

      function store(uint256 _favouriteNumber) public{ //Making a function
        favouritNumber = _favouriteNumber;
      }

      function retrieve() public view returns (uint256){ // if we don't want to use public in favourite number, then we can use another funtion for view like this
        return favouritNumber;
      }


}