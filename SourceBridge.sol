// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SourceBridge is Ownable {
    event NFTLocked(address indexed user, address indexed nft, uint256 tokenId, uint256 targetChainId);
    event NFTUnlocked(address indexed user, address indexed nft, uint256 tokenId);

    constructor() Ownable(msg.sender) {}

    function lockNFT(address _nft, uint256 _tokenId, uint256 _targetChainId) external {
        IERC721(_nft).transferFrom(msg.sender, address(this), _tokenId);
        emit NFTLocked(msg.sender, _nft, _tokenId, _targetChainId);
    }

    function unlockNFT(address _nft, uint256 _tokenId, address _recipient) external onlyOwner {
        IERC721(_nft).transferFrom(address(this), _recipient, _tokenId);
        emit NFTUnlocked(_recipient, _nft, _tokenId);
    }
}
