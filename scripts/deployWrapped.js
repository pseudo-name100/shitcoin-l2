const hre = require("hardhat");

async function main() {
  const Wrapped = await hre.ethers.getContractFactory("WrappedShitcoin");
  const token = await Wrapped.deploy();
  await token.waitForDeployment();
  console.log("wSHIT deployed to:", await token.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});