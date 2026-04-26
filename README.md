# Cross-Chain NFT Bridge

This repository provides an expert-level implementation for bridging ERC721 tokens across different blockchain environments. It ensures that the unique properties and metadata of NFTs are preserved during the transition between chains.

### Bridge Mechanism
* **Source Chain (Lock):** The NFT is transferred to a secure Bridge Vault, where it is held in escrow.
* **Target Chain (Mint):** A "Wrapped NFT" is minted on the destination chain with identical metadata/URI.
* **Return Path (Burn & Unlock):** To move back, the wrapped NFT is burned on the target chain, triggering the release of the original NFT on the source chain.

### Security Features
* **Validator Attestations:** Requires multi-signature verification from bridge oracles before minting.
* **Metadata Integrity:** Synchronizes `tokenURI` across chains to maintain asset visual/data consistency.
