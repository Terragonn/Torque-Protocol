import {HardhatRuntimeEnvironment} from "hardhat/types";

import {ConfigType} from "./utilConfig";
import {OVERRIDE_CONFIG_TYPE} from "./utilConstants";

export default async function getConfigType(hre: HardhatRuntimeEnvironment) {
    const {chainId} = await hre.ethers.provider.getNetwork();
    const configType = mapChainIdToConfigType(hre, chainId);

    return OVERRIDE_CONFIG_TYPE !== null ? OVERRIDE_CONFIG_TYPE : configType;
}

function mapChainIdToConfigType(hre: HardhatRuntimeEnvironment, chainId: number): ConfigType {
    if (chainId === hre.network.config.chainId) return "fork";
    else if (chainId === 4) return "test";
    else if (chainId === 250) return "main";
    else throw Error("Chain Id not supported");
}
