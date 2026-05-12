async function main() {
  const Token = await ethers.getContractFactory("BaseToken");
  const token = await Token.deploy();

  await token.waitForDeployment();

  console.log("Token:", await token.getAddress());

  const Staking = await ethers.getContractFactory("Staking");
  const staking = await Staking.deploy(await token.getAddress());

  await staking.waitForDeployment();

  console.log("Staking:", await staking.getAddress());
}

main().catch(console.error);
