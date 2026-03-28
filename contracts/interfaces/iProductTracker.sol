// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IProductTracker Interface
/// @notice Defines core functions for product tracking
interface IProductTracker {

    /// Register a new product on blockchain
    function registerProduct(
        uint256 productId,
        string calldata name,
        string calldata origin
    ) external;

    /// Transfer product custody/ownership
    function transferCustody(
        uint256 productId,
        address newOwner
    ) external;

    /// Update product lifecycle status
    function updateStatus(
        uint256 productId,
        string calldata status
    ) external;

    /// Get basic product details
    function getProduct(uint256 productId)
        external view returns (
            string memory name,
            address owner,
            string memory status
        );

    /// Verify product authenticity and details
    /// @notice This function is intended for consumers, retailers, or regulators
    /// to confirm that the product exists and retrieve its provenance details
    function verifyProduct(uint256 productId)
        external view returns (
            uint256 id,
            string memory name,
            string memory origin,
            address owner,
            string memory status,
            bool exists
        );
}