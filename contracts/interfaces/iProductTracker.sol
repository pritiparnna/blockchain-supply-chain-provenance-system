/// @title IProductTracker
/// @notice Interface for the supply chain provenance tracking contract.
/// @dev Defines the main functions that the smart contract is expected to support.
interface IProductTracker {
    function registerProduct(
        uint256 productId,
        string calldata name,
        string calldata origin,
        string calldata batchNumber
    ) external;

    function transferCustody(
        uint256 productId,
        address newOwner
    ) external;

    function updateProductStatus(
        uint256 productId,
        string calldata newStatus
    ) external;

    function verifyProduct(
        uint256 productId
    ) external view returns (
        string memory name,
        string memory origin,
        string memory batchNumber,
        address currentOwner,
        string memory status,
        uint256 createdAt
    );
}