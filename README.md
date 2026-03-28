# Blockchain-Based Supply Chain Provenance System

## Project Description
This project is a blockchain-based supply chain provenance system that tracks a product from manufacturer to consumer. It improves transparency, traceability, and trust by recording product registration, ownership transfers, and status updates on the blockchain.

Traditional supply chain systems often suffer from fragmented data, lack of visibility, and the risk of tampering. This system leverages blockchain technology to create an immutable and verifiable record of product movement across different stakeholders.

### Why Blockchain?
Blockchain is used because it provides:
- **Decentralization** – No single point of control  
- **Immutability** – Data cannot be altered once recorded  
- **Transparency** – All participants can verify records  
- **Trust** – Eliminates the need for a central authority  

---

## Objectives
The main objectives of this project are:
- Implement product registration on the blockchain  
- Enable ownership or custody transfer between stakeholders  
- Track product status across the supply chain lifecycle  
- Provide a mechanism to verify product authenticity and history  

---

## Tech Stack / Dependencies
The following tools and technologies are used:
- Solidity (Smart contract development)  
- Remix IDE / Hardhat (Development & deployment)  
- MetaMask (Wallet and blockchain interaction)  
- Ethereum / Polygon Amoy Testnet (Blockchain network)  
- Node.js (Scripting and development tools)  
- Ethers.js / Web3.js (Blockchain interaction libraries)  
- GitHub (Version control and collaboration)  

---

## Setup Instructions
- Clone the repository
git clone https://github.com/pritiparnna/blockchain-supply-chain-provenance-system.git
- Navigate to the project directory
cd blockchain-supply-chain-provenance
- Open the smart contract in Remix IDE
- Visit: https://remix.ethereum.org
- Upload or paste the contract files
- Install and configure MetaMask 
- Add Polygon Amoy Testnet (via ChainList)
- Get test POL tokens from a faucet
- Compile the contract
- Select Solidity compiler version (0.8.x)
- Compile in Remix

---

## Basic usage / Deployment Instructions
- Compile the smart contract in Remix or Hardhat
- Connect MetaMask to the selected test network
- Deploy the contract
- Interact with contract functions:
- registerProduct() → Create a new product
- updateProductStatus() → Track product movement
- transferCustody() → Transfer ownership
- verifyProduct() → Verify product details and history 

---

## Repository Structure
```text
blockchain-supply-chain-provenance/
│
├── README.md
├── contracts/
│   ├── SupplyChainProvenance.sol
│   ├── ProductRegistry.sol
│   ├── AccessControlManager.sol
│   └── interfaces/
│       └── IProductTracker.sol
│
├── docs/
│   └── design-notes.md
│
├── scripts/
│   └── deploy.js
│
├── test/
│   └── placeholder-test.js
│
└── .gitignore