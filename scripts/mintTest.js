const hre = require("hardhat");

async function main() {
  const token = await hre.ethers.getContractAt(
    "WrappedShitcoin",
    "0x5FbDB2315678afecb367f032d93F642f64180aa3"
  );

  const [owner] = await hre.ethers.getSigners();

  await token.mint(owner.address, hre.ethers.parseEther("1000"));

  console.log("Minted 1000 wSHITCOIN to:", owner.address);
  console.log("Balance:", String(await token.balanceOf(owner.address)));
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});