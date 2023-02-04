import { expect } from "chai";
import { Contract, Signer, BigNumber } from "ethers";
import { ethers } from "hardhat";

const BN = BigNumber;
let precision = BN.from(10).pow(18);

let accounts: Signer[];
let attacker: Signer;
let o1: Signer;
let o2: Signer;
let admin: Signer; // should not be used
let flatLaunchpeg: Contract;
let startBlock: Number;

/// preliminary state
before(async () => {
  accounts = await ethers.getSigners();
  [attacker, o1, o2, admin] = accounts;

  let flatLaunchpegFactory = await ethers.getContractFactory("FlatLaunchpeg");
  flatLaunchpeg = await flatLaunchpegFactory.connect(admin).deploy(69, 5, 5);

  startBlock = await ethers.provider.getBlockNumber();
});

it("solves the challenge", async function () {
  // implement solution here
  let FlatAttack = await ethers.getContractFactory("FlatAttack");
  let flatAttack = await FlatAttack.deploy(flatLaunchpeg.address);

  console.log(flatLaunchpeg.address);
  console.log(await flatLaunchpeg.balanceOf(flatAttack.address));
});

/// expected final state
after(async () => {
  // expect(await flatLaunchpeg.totalSupply()).to.be.equal(69);
  // expect(await flatLaunchpeg.balanceOf(await attacker.getAddress())).to.be.equal(69);
  // expect(await ethers.provider.getBlockNumber()).to.be.equal(startBlock.toString() + 1);
});
