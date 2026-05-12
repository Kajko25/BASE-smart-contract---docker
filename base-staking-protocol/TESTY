const { expect } = require("chai");

describe("Staking", function () {
  it("should deploy token", async function () {
    const Token = await ethers.getContractFactory("BaseToken");
    const token = await Token.deploy();

    expect(await token.totalSupply()).to.not.equal(0);
  });
});
