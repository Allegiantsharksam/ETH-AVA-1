# Smart Contract for Error Handling

Example Smart Contract with Error Handling and Owner Management using `require()`, `assert()`, and `revert()` functions. It includes functions for setting values, updating user balances, withdrawing funds, transferring ownership, getting the sum of an array of numbers, concatenating two strings, checking if a number is prime, and ensuring contract consistency.

## Description

This smart contract is designed to illustrate various essential features of Solidity, including:

1. Error handling using `require()`, `assert()`, and `revert()`.
2. Managing ownership to restrict certain functions to the contract owner.
3. Basic financial transactions such as withdrawing Ether and accepting deposits.
4. Event logging to track significant actions within the contract.
5. Implementing a fallback function to handle direct Ether transfers.
6. Custom error implementation for more specific error handling scenarios.

The contract includes:

1. Functions to set and reset values.
2. Storing a string.
3. Updating user balances.
4. Owner-restricted functions for withdrawing funds and transferring ownership.
5. A function to get the sum of an array of numbers.
6. A function to concatenate two strings.
7. A function to check if a number is prime.
8. A function to check contract consistency using `assert()`.

## Getting Started

### Installing

This program runs on EVM along with ".sol" as an extension. You can run it on websites like Remix or even on Visual Studio Code.

### Executing program

You need a Solidity compatible virtual machine to run this program. Create a new file with ".sol" extension and use the following code:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
pragma experimental ABIEncoderV2;

contract InnovativeContract {
    address public owner;
    uint256 public storedValue;
    string public storedString;
    mapping(address => uint256) public userBalances;

    // Events for logging
    event ValueChanged(uint256 newValue);
    event StringStored(string newString);
    event UserBalanceUpdated(address indexed user, uint256 newBalance);
    event EtherWithdrawn(address indexed owner, uint256 amount);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict functions to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Function to set a new value with custom logic
    function setValue(uint256 _value) public {
        require(_value > 0, "Value must be positive");
        storedValue = _value;
        emit ValueChanged(_value);
    }

    // Function to store a new string
    function storeString(string calldata _newString) public {
        storedString = _newString;
        emit StringStored(_newString);
    }

    // Function to update the balance of a user
    function updateUserBalance(address _user, uint256 _amount) public onlyOwner {
        userBalances[_user] = _amount;
        emit UserBalanceUpdated(_user, _amount);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "Insufficient balance");
        payable(owner).transfer(amount);
        emit EtherWithdrawn(owner, amount);
    }

    // Function to transfer ownership
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    // Function to get the sum of an array of numbers
    function getSum(uint256[] memory numbers) public pure returns (uint256 sum) {
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
    }

    // Function to concatenate two strings
    function concatenateStrings(string memory str1, string memory str2) public pure returns (string memory) {
        return string(abi.encodePacked(str1, str2));
    }

    // Function to check if a number is prime
    function isPrime(uint256 number) public pure returns (bool) {
        if (number <= 1) return false;
        for (uint256 i = 2; i * i <= number; i++) {
            if (number % i == 0) return false;
        }
        return true;
    }

    // Function to check contract consistency with assert
    function checkConsistency() public view {
        // Assert that the stored value is non-negative
        assert(storedValue >= 0);
    }

    // Fallback function to accept Ether
    receive() external payable {}

    // Custom errors
    error InvalidValue(uint256 provided, string reason);

    // Function with custom error
    function setValueWithCustomError(uint256 _value) public {
        if (_value > 1000) {
            revert InvalidValue(_value, "Value exceeds maximum limit");
        }
        storedValue = _value;
        emit ValueChanged(_value);
    }
}
```

## Help

Common Issues:
1. **Contract Compilation Errors**:
   - Ensure your Solidity version is compatible (0.8.8 or later).
   - Check for syntax errors or typos in the contract.

2. **Function Call Errors**:
   - Ensure you are using the correct contract address and ABI.
   - Check for access restrictions if encountering permission errors (e.g., only owner functions).

## Authors

Contributors names and contact info:
- Sparsh Shandil
- [@Allegiantshark](https://linktr.ee/allegiantshark)

## License

This project is licensed under the Sparsh Shandil License - see the LICENSE.md file for details.
