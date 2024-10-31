//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; //solidity version 

contract SimpleStorage{
    //Basic Type: boolean , uint , int ,address, bytes
      uint256 myfavouritNumber;//0 // favorite number get initialize 0, if no value is given.
      //uint256[] listOfFavouriteNumber; //array 

      struct person{ // create new type , own type
        uint256 favouriteNumber;
        string name;
      }

      //static array [3], if we give any size into the array



      //dynamic array
      person [] public listOfPeople;

      //person public myFriend = person(7, "pat")
    //   person public pat = person({favouriteNumber: 6, name:"sam"});

      function store(uint256 _favouriteNumber) public{ //Making a function
        myfavouritNumber = _favouriteNumber;
      }

      function retrieve() public view returns (uint256){ // if we don't want to use public in favourite number, then we can use another funtion for view like this
        return myfavouritNumber;
      }

      function addPerson(string memory _name, uint256 _favNumber ) public{
        listOfPeople.push(person(_favNumber,_name));
      }


}