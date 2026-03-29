// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ProductRegistry.sol";
import "./AccessControlManager.sol";
import "./interfaces/IProductTracker.sol";

/// @title SupplyChainProvenance
/// @notice Main smart contract for a blockchain-based supply chain provenance system
/// @dev This draft focuses on clear structure, function signatures, and intended behavior
contract SupplyChainProvenance is
    ProductRegistry,
    AccessControlManager,
    IProductTracker
{
    /// @notice Emitted when a new product is registered
    event ProductRegistered(
        uint256 indexed productId,
        string name,
        string origin,
        address indexed owner
    );

    /// @notice Emitted when custody/ownership of a product is transferred
    event OwnershipTransferred(
        uint256 indexed productId,
        address indexed previousOwner,
        address indexed newOwner
    );

    /// @notice Emitted when a product status is updated
    event StatusUpdated(
        uint256 indexed productId,
        string status,
        address indexed updatedBy
    );

    /// @notice Registers a new product on the blockchain
    /// @dev The caller becomes the initial owner of the product
    function registerProduct(
        uint256 productId,
        string calldata name,
        string calldata origin
    ) external override {
        Product memory existingProduct = _getProduct(productId);
        require(existingProduct.owner == address(0), "Product already exists");

        _registerProduct(productId, name, origin, msg.sender);

        emit ProductRegistered(productId, name, origin, msg.sender);
    }

    /// @notice Transfers custody or ownership of a product to another stakeholder
    /// @dev Only the current owner can transfer the product
    function transferCustody(
        uint256 productId,
        address newOwner
    ) external override {
        Product memory product = _getProduct(productId);

        require(product.owner != address(0), "Product does not exist");
        require(product.owner == msg.sender, "Only current owner can transfer");
        require(newOwner != address(0), "Invalid new owner address");

        address previousOwner = product.owner;

        _transfer(productId, newOwner);

        emit OwnershipTransferred(productId, previousOwner, newOwner);
    }

    /// @notice Updates the lifecycle status of a product
    /// @dev Only the current owner can update the status
    function updateStatus(
        uint256 productId,
        string calldata status
    ) external override {
        Product memory product = _getProduct(productId);

        require(product.owner != address(0), "Product does not exist");
        require(product.owner == msg.sender, "Only current owner can update status");

        _updateStatus(productId, status);

        emit StatusUpdated(productId, status, msg.sender);
    }

    /// @notice Returns basic product details
    function getProduct(
        uint256 productId
    )
        external
        view
        override
        returns (
            string memory name,
            address owner,
            string memory status
        )
    {
        Product memory p = _getProduct(productId);
        require(p.owner != address(0), "Product does not exist");

        return (p.name, p.owner, p.status);
    }

    /// @notice Verifies product authenticity and returns provenance details
    /// @dev Intended for consumers, retailers, and regulators
    function verifyProduct(
        uint256 productId
    )
        external
        view
        override
        returns (
            uint256 id,
            string memory name,
            string memory origin,
            address owner,
            string memory status,
            bool exists
        )
    {
        Product memory p = _getProduct(productId);

        return (
            p.id,
            p.name,
            p.origin,
            p.owner,
            p.status,
            p.owner != address(0)
        );
    }
}