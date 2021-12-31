//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./YieldAccount.sol";
import "./YieldRates.sol";

abstract contract YieldStake is YieldAccount, YieldRates {
    function stake(IERC20 token_, uint256 amount_) external {

    }

    function stakeValue(IERC20 token_, uint256 amount_) public view returns (uint256) {
        
    }

    event Stake();
    event Unstake();
}