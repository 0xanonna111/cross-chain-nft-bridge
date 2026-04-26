const { ethers } = require("ethers");

async function initiateBridgeTransfer(nftAddress, tokenId, targetChainId, bridgeContract, signer) {
    console.log(`Approving NFT ${tokenId} for bridge...`);
    const nft = new ethers.Contract(nftAddress, ["function approve(address,uint256) public"], signer);
    await (await nft.approve(await bridgeContract.getAddress(), tokenId)).wait();

    console.log("Locking NFT in source bridge...");
    const tx = await bridgeContract.lockNFT(nftAddress, tokenId, targetChainId);
    const receipt = await tx.wait();
    
    return receipt.hash;
}

module.exports = { initiateBridgeTransfer };
