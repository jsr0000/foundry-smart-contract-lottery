# Raffle Smart Contract

**Raffle** is a decentralized application (dApp) that implements a raffle system using Chainlink's VRF (Verifiable Random Function) v2.5 to ensure fair and random winner selection. This contract is designed to manage a simple raffle where participants can enter by paying an entrance fee, and a winner is selected at random after a specified interval.

## Features

- **Enter Raffle**: Participants can enter the raffle by sending a specified entrance fee.
- **Random Winner Selection**: Utilizes Chainlink VRF to select a random winner, ensuring fairness and transparency.
- **Automated Upkeep**: Uses Chainlink Automation to check and perform upkeep tasks, such as selecting a winner when conditions are met.

## Technology Stack

- **Smart Contracts**: Solidity, Foundry
- **Randomness**: Chainlink VRF v2.5
- **Automation**: Chainlink Automation

## Getting Started

### Prerequisites

Before deploying the contract, ensure you have the following:

- **Ethereum Wallet**: A wallet with some ETH for gas fees.
- **Chainlink Subscription**: A funded Chainlink subscription for VRF and Automation.
- **Development Environment**: Node.js, Hardhat, or Foundry for contract deployment and testing.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/raffle-contract.git
   cd raffle-contract
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Compile the contract**:
   ```bash
   forge build
   ```

### Deployment

1. **Deploy the contract**:
   Update the deployment script with your Chainlink subscription ID, key hash, and VRF coordinator address, then run:
   ```bash
   <!-- npx hardhat run scripts/deploy.js --network yourNetwork -->
   ```

## Usage

### Entering the Raffle

Participants can enter the raffle by sending the required entrance fee to the contract. This can be done via a web interface or directly through a wallet.

### Checking and Performing Upkeep

The contract uses Chainlink Automation to check if the conditions for selecting a winner are met. The conditions include:

- The specified time interval has passed.
- The raffle is open.
- The contract has a balance and players.

If all conditions are met, the `performUpkeep` function is called to request a random number and select a winner.

### Winner Selection

The winner is selected using the `fulfillRandomWords` function, which is called by the Chainlink VRF coordinator. The function calculates the winner based on the random number provided and transfers the contract balance to the winner.

## Contract Functions

- **constructor**: Initializes the contract with the necessary parameters, including the entrance fee, interval, and Chainlink VRF details.
- **enterRaffle**: Allows users to enter the raffle by paying the entrance fee.
- **checkUpKeep**: Checks if the conditions for selecting a winner are met.
- **performUpkeep**: Requests a random number from Chainlink VRF and transitions the raffle state to calculating.
- **fulfillRandomWords**: Selects the winner based on the random number and transfers the prize.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License.

## Contact

For questions or support, please contact Josh at josh.regnart@gmail.com. 
