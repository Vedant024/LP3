// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract BankAccount {
// State variable to store balance of the account holder
mapping(address => uint256) balances;
// Deposit money into the account
function deposit(uint256 amount) public payable {
require(amount > 0, "Deposit must be greater than zero");
balances[msg.sender] += amount;
}
// Withdraw money from the account
function withdraw(uint256 amount) public {
require(amount <= balances[msg.sender], "Insufficient balance");
balances[msg.sender] -= amount;
}
// Show account balance
function getBalance() public view returns (uint) {
return balances[msg.sender];
}
}
