import {HardhatRuntimeEnvironment} from "hardhat/types";

import {chooseConfig, ConfigType} from "../utils/config/utilConfig";

export default async function main(configType: ConfigType, hre: HardhatRuntimeEnvironment) {
    const config = chooseConfig(configType);

    const flashLender = await hre.ethers.getContractAt("FlashLender", config.contracts.flashLender);

    await (await flashLender.setPool(config.contracts.leveragePoolAddress)).wait();
    console.log("-- Set pool");

    const flashLenderApprovedTokens = config.tokens.approved.filter((approved) => approved.setup.flashLender).map((approved) => approved.address);
    const isApproved = Array(flashLenderApprovedTokens.length).fill(true);
    await (await flashLender.setApproved(flashLenderApprovedTokens, isApproved)).wait();
    console.log("-- Set approved flash lend tokens");

    console.log("Setup: FlashLender");
}
