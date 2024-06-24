// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ExampleContract {
    address public owner;
    uint256 public value;

    // Events for logging
    event ValueChanged(uint256 newValue);
    event ValueReset();
    event DivisionResult(uint256 result);
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

    //etting the value with require statement
    function setValue(uint256 _value) public {
        // Require that the value must be positive
        require(_value > 0, "Value must be positive");
        value = _value;
        emit ValueChanged(_value);
    }

    //Checking if the sender is the owner with assert statement
    function onlyOwnerCanCall() public view returns (bool) {
        // Assert that the sender is the owner
        assert(msg.sender == owner);
        return true;
    }

    //Reset the value to zero with revert statement
    function resetValue() public onlyOwner {
        value = 0;
        emit ValueReset();
    }

    // Demonstrating a function in a condition with both require and revert
    function safeDivision(uint256 a, uint256 b) public returns (uint256) {
        // Require that the divisor is not zero
        require(b != 0, "Cannot divide by zero");
        uint256 result = a / b;

        // Check result and revert if something went wrong
        if (result * b != a) {
            revert("Division resulted in a remainder");
        }

        emit DivisionResult(result);
        return result;
    }

    // New function to withdraw Ether (for example purposes)
    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "Insufficient balance");
        payable(owner).transfer(amount);
        emit EtherWithdrawn(owner, amount);
    }

    //Withdrawing all Ether from the contract
    function withdrawAll() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No Ether to withdraw");
        payable(owner).transfer(balance);
        emit EtherWithdrawn(owner, balance);
    }

    //Transfering ownership
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    // Fallback function to accept Ether
    receive() external payable {}

    //custom errors
    error ValueTooHigh(uint256 provided, uint256 maxAllowed);

    function setValueWithCustomError(uint256 _value) public {
        uint256 maxValue = 1000;
        if (_value > maxValue) {
            revert ValueTooHigh(_value, maxValue);
        }
        value = _value;
        emit ValueChanged(_value);
    }
}
