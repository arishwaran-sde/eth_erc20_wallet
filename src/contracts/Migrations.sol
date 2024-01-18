// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Migrations {
    address public owner;
    uint public lastCompletedMigration;

    constructor() {
        owner = msg.sender;
    }

    modifier restricted() {
        require(msg.sender == owner, "Restricted to owner only.");
        _;
    }

    function setCompleted(uint completed) public restricted {
        lastCompletedMigration = completed;
    }

    function upgrade(address newAddress) public restricted {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(lastCompletedMigration);
    }
}
