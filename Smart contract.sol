// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ExampleContract {
    address public owner;
    uint256 public value;

    event ValueChanged(uint256 newValue);
    event ValueReset();
    event DivisionResult(uint256 result);
    event EtherWithdrawn(address indexed owner, uint256 amount);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() { //only owner have access
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function setValue(uint256 _value) public {
        require(_value > 0, "Value must be positive");
        value = _value;
        emit ValueChanged(_value);
    }

    function onlyOwnerCanCall() public view returns (bool) {
        assert(msg.sender == owner);
        return true;
    }

    function resetValue() public onlyOwner {
        value = 0;
        emit ValueReset();
    }
    function safeDivision(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Cannot divide by zero");
        uint256 result = a / b;

        if (result * b != a) {
            revert("Division resulted in a remainder");
        }

        emit DivisionResult(result);
        return result;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "Insufficient balance");
        payable(owner).transfer(amount);
        emit EtherWithdrawn(owner, amount);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    receive() external payable {}

    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }

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
