// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

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
