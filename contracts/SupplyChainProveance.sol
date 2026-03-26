import "./interfaces/IProductTracker.sol";

/// @title SupplyChainProvenance
/// @notice Draft smart contract for tracking product provenance in a supply chain.
/// @dev This draft focuses on structure, interfaces, and intended behavior rather than full production functionality.
contract SupplyChainProvenance is IProductTracker {

    /// @notice Represents the current lifecycle stage of a product.
    enum ProductStage {
        Created,
        InTransit,
        Received,
        Delivered
    }

    /// @notice Represents a product tracked by the system.
    /// @dev Stores key information needed for provenance tracking.
    struct Product {
        uint256 productId;
        string name;
        string origin;
        string batchNumber;
        address currentOwner;
        string currentStatus;
        uint256 createdAt;
        bool exists;
    }

    /// @notice Stores all registered products by product ID.
    mapping(uint256 => Product) private products;

    /// @notice Tracks stakeholder roles for future access control.
    /// @dev This is a draft structure and may be expanded later with more robust RBAC.
    mapping(address => string) public stakeholderRoles;

    /// @notice Emitted when a new product is registered.
    event ProductRegistered(
        uint256 indexed productId,
        string name,
        string origin,
        string batchNumber,
        address indexed registeredBy
    );

    /// @notice Emitted when product custody is transferred.
    event CustodyTransferred(
        uint256 indexed productId,
        address indexed previousOwner,
        address indexed newOwner
    );

    /// @notice Emitted when the status of a product is updated.
    event ProductStatusUpdated(
        uint256 indexed productId,
        string newStatus,
        address indexed updatedBy
    );

    /// @notice Assigns a role label to a stakeholder.
    /// @dev In a complete implementation, role management should use stronger access control.
    function assignRole(address stakeholder, string memory role) public {
        stakeholderRoles[stakeholder] = role;
    }

    /// @notice Registers a new product on the blockchain.
    /// @dev This function is intended to be called by a producer or manufacturer.
    /// It creates the initial provenance record for the product.
    function registerProduct(
        uint256 productId,
        string calldata name,
        string calldata origin,
        string calldata batchNumber
    ) external override {
        require(!products[productId].exists, "Product already exists");

        products[productId] = Product({
            productId: productId,
            name: name,
            origin: origin,
            batchNumber: batchNumber,
            currentOwner: msg.sender,
            currentStatus: "Created",
            createdAt: block.timestamp,
            exists: true
        });

        emit ProductRegistered(productId, name, origin, batchNumber, msg.sender);
    }

    /// @notice Transfers custody or ownership of a product to another stakeholder.
    /// @dev In a later version, this should include stricter access checks and role validation.
    function transferCustody(
        uint256 productId,
        address newOwner
    ) external override {
        require(products[productId].exists, "Product does not exist");
        require(products[productId].currentOwner == msg.sender, "Only current owner can transfer");

        address previousOwner = products[productId].currentOwner;
        products[productId].currentOwner = newOwner;

        emit CustodyTransferred(productId, previousOwner, newOwner);
    }

    /// @notice Updates the status of a product as it moves through the supply chain.
    /// @dev Example statuses: Created, Shipped, Received, Delivered.
    function updateProductStatus(
        uint256 productId,
        string calldata newStatus
    ) external override {
        require(products[productId].exists, "Product does not exist");
        require(products[productId].currentOwner == msg.sender, "Only current owner can update status");

        products[productId].currentStatus = newStatus;

        emit ProductStatusUpdated(productId, newStatus, msg.sender);
    }

    /// @notice Returns product details for provenance verification.
    /// @dev Consumers, retailers, or regulators can use this function to inspect product information.
    function verifyProduct(
        uint256 productId
    )
        external
        view
        override
        returns (
            string memory name,
            string memory origin,
            string memory batchNumber,
            address currentOwner,
            string memory status,
            uint256 createdAt
        )
    {
        require(products[productId].exists, "Product does not exist");

        Product memory p = products[productId];

        return (
            p.name,
            p.origin,
            p.batchNumber,
            p.currentOwner,
            p.currentStatus,
            p.createdAt
        );
    }
}