# Design Notes

## Smart Contract Purpose
The smart contract is designed to record product provenance information on-chain. It supports the registration of products, tracking of ownership or custody transfer, status updates, and product verification.

## Main Components
- Product struct for storing product information
- Mapping for product lookup by ID
- Role mapping for stakeholder classification
- Events for tracking important actions
- Interface for defining key contract functions

## Intended Stakeholder Actions
- Producer: registers product
- Distributor: receives or transfers product
- Retailer: updates delivery or receipt status
- Consumer: verifies product details
- Regulator: reviews blockchain records

## Planned Future Improvements
- Role-based access control using modifiers
- Event history storage for each product
- Integration with IPFS for certificates and documents
- Frontend interface for easier interaction