import hre from "hardhat";
import {chooseConfig} from "../util/chooseConfig";

export default async function main(test: boolean = false) {
    const config = chooseConfig(test);

    const oracle = await hre.ethers.getContractAt("Oracle", config.oracleAddress);

    const oracleApproved = config.approved.map((approved) => approved.address);
    const priceFeeds = config.approved.map((approved) => approved.priceFeed);
    const reservePriceFeeds = config.approved.map((approved) => approved.reservePriceFeed);
    const correctDecimals = config.approved.map((approved) => approved.decimals);
    const oracleSupported = Array(oracleApproved.length).fill(true);
    await oracle.setPriceFeed(oracleApproved, priceFeeds, reservePriceFeeds, correctDecimals, oracleSupported);

    console.log("Setup: Oracle");
}

if (require.main === module)
    main()
        .then(() => process.exit(0))
        .catch((error) => {
            console.error(error);
            process.exit(1);
        });
