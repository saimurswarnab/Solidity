// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract FundMe{

    uint256 public minimumUsd = 5e18; //5 * 1e18
    address[] public funders;
    mapping(address funder=>uint256 amountFunded) public addressToAmountFunded;

    function fund()public payable{
        //Allow users to send $
        //Have a minimum $ sent
        //1. How do we send ETH to the contract?

        require(getCoversionRate(msg.value ) >= minimumUsd, "didn't send enough eth"); //1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18 wei
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;


    }

    //function withdraw()public{}

    function getPrice()public view returns(uint256){
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface pirceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = pirceFeed.latestRoundData();
        //price of ETH in term of USD
        //200.00000000
        return uint256(answer * 1e10);
    }
    function getCoversionRate(uint256 ethAmount)public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountUsd;

    }
}