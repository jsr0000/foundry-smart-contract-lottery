// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions


// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/**
* @title Raffle Contract
* @dev Implements Chainlink VRFv2.5 to generate random numbers for a raffle
* @notice This contract is a sample raffle contract
* @author Josh Regnart
 */

contract Raffle {
    // Error messages
    error Raffle__SendMoreToEnterRaffle();
    // State variables
    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    address payable[] private s_players;
    // Events
    event RaffleEntered(address indexed player);


    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
    }

    function enterRaffle() external payable{
        // require(msg.value >= i_entranceFee, "Not enough funds to enter the raffle");
        // require(msg.value >= i_entranceFee, SendMoreToEnterRaffle());
        if(msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() external {
        
    }

    // Get the entrance fee
    function getEntranceFee() external view returns(uint256) {
        return i_entranceFee;
    }
}

