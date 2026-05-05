import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const WrappedShitcoinModule = buildModule("WrappedShitcoinModule", (m) => {
  const token = m.contract("WrappedShitcoin");
  return { token };
});

export default WrappedShitcoinModule;