// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {PriceConverter}from "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18; //5 * 1e18
    address[] public funders;
    mapping(address funder=>uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    constructor() public{
        owner = msg.sender;
        


    }

    function fund()public payable{
        //Allow users to send $
        //Have a minimum $ sent
        //1. How do we send ETH to the contract?
        
        require(msg.value.getCoversionRate() >= minimumUsd, "didn't send enough eth"); //1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18 wei
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;


    }

    function withdraw()public{
        require(msg.sender == owner, "Must be Owner");
        //for loop
        //for (/*star index, ending index, step amount*/)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder]= 0;

        }
        //Reset the array
        funders = new address[](0);
        //withdraw the funds

        //transfer
        //payable(msg.sender).transfer(address(this).balance);
        //send
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require(sendSuccess, "Send Failed");
        //call
        (bool callSuccess, )= payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess, "Call Failed");
       
    }

}