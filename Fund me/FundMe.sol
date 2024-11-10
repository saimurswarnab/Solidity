// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FundMe{
    uint256 public myValue = 1;
    function fund()public payable{
        //Allow users to send $
        //Have a minimum $ sent
        //1. How do we send ETH to the contract?
        myValue = myValue+2;

        require(msg.value > 1e18, "didn't send enough eth"); //1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18 wei



    }

    //function withdraw()public{}
}