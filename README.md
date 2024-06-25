# Smart contract for errror handling

Example Smart Contract with Error Handling and Owner Management with the use of require(), assert() and revert() functions. It includes
functions for setting values, performing safe division, withdrawing funds, transferring ownership, and destroying the contract.

## Description

This smart contract is designed to illustrate various essential features of Solidity, including:

1. Error handling using require(), assert(), and revert().
2. Managing ownership to restrict certain functions to the contract owner.
3. Basic financial transactions such as withdrawing Ether and accepting deposits.
4. Event logging to track significant actions within the contract.
5. Implementing a fallback function to handle direct Ether transfers.
6. Custom error implementation for more specific error handling scenarios.

The contract includes:

1. Functions to set and reset values.
2. A function to safely divide two numbers.
3. Owner-restricted functions for withdrawing funds and transferring ownership.
4. A function to destroy the contract and send remaining funds to the owner.
5. Custom error handling for setting values with specific constraints.


## Getting Started

### Installing

This program runs on EVM along with ".sol" as extension. We can either run it on websites like REmix or even on Visual Studios.

### Executing program

We need a solidity compatible virtual machine in order to run this program.
Create a new file with ".sol" extension



## Help

Common Issues:
 1. Contract Compilation Errors:
   A. Ensure your Solidity version is compatible (0.8.8 or later).
   B. Check for syntax errors or typos in the contract.

2. Function Call Errors:

   A. Ensure you are using the correct contract address and ABI.
   B. Check for access restrictions if encountering permission errors (e.g., only owner functions).


## Authors


Contributors names and contact info


ex. Sparsh Shandil 
ex. [@Allegiantshark](https://linktr.ee/allegiantshark)


## License

This project is licensed under the Sparsh Shandil License - see the LICENSE.md file for details
