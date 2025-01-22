// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/**
* @title Raffle Contract
* @dev Implements Chainlink VRFv2.5 to generate random numbers for a raffle
* @notice This contract is a sample raffle contract
* @author Josh Regnart
 */

contract Raffle {

    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable{
        // Enter the raffle
    }

    function pickWinner() public {
        // Pick the winner
    }

    // Get the entrance fee
    function getEntranceFee() external view returns(uint256) {
        return i_entranceFee;
    }
}

