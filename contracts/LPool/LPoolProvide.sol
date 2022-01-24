//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./LPoolLiquidity.sol";
import "./LPoolToken.sol";

abstract contract LPoolProvide is LPoolLiquidity {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    // Return the amount of LP tokens received for adding a given amount of tokens as liquidity
    function addLiquidityOutLPTokens(IERC20 token_, uint256 amount_) public view onlyApprovedPT(token_) returns (uint256) {
        LPoolToken LPToken = LPoolToken(address(LPFromPT(token_)));

        uint256 totalSupply = LPToken.totalSupply();
        uint256 totalValue = tvl(token_);

        if (totalValue == 0) return amount_;

        return amount_.mul(totalSupply).div(totalValue);
    }

    // Add tokens to the liquidity pool and receive LP tokens that represent the users share in the pool
    function addLiquidity(IERC20 token_, uint256 amount_) external onlyApprovedPT(token_) returns (uint256) {
        require(amount_ > 0, "LPoolProvide: Amount of tokens must be greater than 0");

        LPoolToken LPToken = LPoolToken(address(LPFromPT(token_)));

        uint256 value = addLiquidityOutLPTokens(token_, amount_);
        require(value > 0, "LPoolProvide: Not enough tokens provided");

        token_.safeTransferFrom(_msgSender(), address(this), amount_);
        LPToken.mint(_msgSender(), value);

        emit AddLiquidity(_msgSender(), token_, amount_, value);

        return value;
    }

    // Get the value for redeeming LP tokens for the underlying asset
    function removeLiquidityOutPoolTokens(IERC20 token_, uint256 amount_) public view onlyLP(token_) returns (uint256) {
        LPoolToken LPToken = LPoolToken(address(token_));
        IERC20 approvedToken = PTFromLP(token_);

        uint256 totalSupply = LPToken.totalSupply();
        uint256 totalValue = tvl(approvedToken);

        return amount_.mul(totalValue).div(totalSupply);
    }

    // Redeem LP tokens for the underlying asset
    function removeLiquidity(IERC20 token_, uint256 amount_) external onlyLP(token_) returns (uint256) {
        require(amount_ > 0, "LPoolProvide: Amount of tokens must be greater than 0");

        LPoolToken LPToken = LPoolToken(address(token_));
        IERC20 approvedToken = PTFromLP(token_);

        uint256 value = removeLiquidityOutPoolTokens(LPToken, amount_);
        require(value <= liquidity(approvedToken), "LPoolProvide: Not enough liquidity to redeem at this time");

        LPToken.burn(_msgSender(), amount_);
        approvedToken.safeTransfer(_msgSender(), value);

        emit RemoveLiquidity(_msgSender(), token_, amount_, value);

        return value;
    }

    event AddLiquidity(address indexed account, IERC20 token, uint256 amount, uint256 value);
    event RemoveLiquidity(address indexed account, IERC20 token, uint256 amount, uint256 value);
}
