// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Product Registry
/// @notice Stores product information
contract ProductRegistry {
    struct Product {
        uint256 id;
        string name;
        string origin;
        address owner;
        string status;
    }

    mapping(uint256 => Product) internal products;

    /// Register new product
    function _registerProduct(
        uint256 id,
        string memory name,
        string memory origin,
        address owner
    ) internal {
        products[id] = Product(id, name, origin, owner, "Created");
    }

    /// Update product status
    function _updateStatus(uint256 id, string memory status) internal {
        products[id].status = status;
    }

    /// Transfer ownership
    function _transfer(uint256 id, address newOwner) internal {
        products[id].owner = newOwner;
    }

    /// Get product
    function _getProduct(uint256 id) internal view returns (Product memory) {
        return products[id];
    }
}
