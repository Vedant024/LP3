// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {

    // Stores balance for each account holder
    mapping(address => uint256) balances;

    // ✅ Deposit money (msg.value = actual Ether sent)
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than zero");
        balances[msg.sender] += msg.value;
    }

    // ✅ Withdraw money
    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // ✅ Show balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
