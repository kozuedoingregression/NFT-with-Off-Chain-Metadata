const { ethers } = require("hardhat");

async function main()
{
    const[deployer] = await ethers.getSigners();
    const token = await ethers.deployContract("SentimentNFT");
}

main().then(()=> process.exit(0)).catch((error)=>{
    console.log(error);
    process.exit(1);
});