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

1. Creating variables
```
// public variables here
    string public tokenName = "Sparsh";
    string public tokenAbbrv = "SP";
    uint256 public totalSupply = 0; //Initial token supply
```
In it the Token has been created "Sparsh" and it's abreviation has also been created "SP". Intial value has been set to 0.
2. Mapping variables
```
   // mapping variable here
     mapping(address =>uint256) public balances;
```
The "balances" mapping associates each address (key) with a uint256 value (the balance of tokens for that address). This allows 
the contract to keep track of how many tokens are available on each token address.
3. minting of tokens
```
    // mint function
    function mint(address _to, uint256 _value) public{ //Private to make sure no one mints it
       totalSupply += _value;
       balances[_to] += _value;
    }
```
In it the value of tokenn get's increased;   totalSupply += _value adds the new value to the total supply and balances[_to] += _value 
deals with increase in balance of the tokens.

4. Burning of tokens
``` 
    // burn function
    function burn(address _from, uint256 _value)public { 
       require(balances[_from] >= _value, "Balance isn't sufficient");
       totalSupply -= _value;
       balances[_from] -= _value;
    }
```
require(balances[_from] >= _value, "Balance isn't sufficient") this code snippet deals with the exception that if the number of tokens to be 
burned are more than the current value then an exception error is thrown "Balance isn't sufficient". totalSupply -= _value; balances[_from] -= _value;
These both code snippet deals with the decrease in value of the current "balances" and the update it.



Once done implementing it you are required to press "Ctrl + S" or Compile the program.

After compiling, it;s time to deploy, deploy the program and look out for the various functions created in order to make the program feasible.



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
