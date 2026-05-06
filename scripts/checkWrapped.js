const hre = require("hardhat");

async function main() {
  const address = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const code = await hre.ethers.provider.getCode(address);

  console.log("contract code exists:", code !== "0x");
  console.log("address:", address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});