// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Access Control Manager
/// @notice Handles roles of stakeholders in supply chain
contract AccessControlManager {

    mapping(address => string) public roles;

    /// Assign role to user
    function assignRole(address user, string memory role) public {
        roles[user] = role;
    }

    /// Get role of user
    function getRole(address user) public view returns (string memory) {
        return roles[user];
    }
}