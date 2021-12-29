//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "../MarketLink/MarketLink.sol";
import "../LPool/LPool.sol";

abstract contract IsoMarginCore is Ownable {
    using SafeERC20 for IERC20;

    LPool public pool;
    MarketLink public marketLink;

    constructor(LPool pool_, MarketLink marketLink_) {
        pool = pool_;
        marketLink = marketLink_;
    }

    // Set the pool to use
    function setPool(LPool pool_) external onlyOwner {
        pool = pool_;
    }

    // Set the market link to use
    function setMarketLink(MarketLink marketLink_) external onlyOwner {
        marketLink = marketLink_;
    }

    modifier onlyApprovedToken(IERC20 token_) {
        require(pool.isApprovedToken(token_), "Only approved tokens may be used");
        _;
    }

    modifier onlyLPToken(IERC20 token_) {
        require(pool.isLPToken(token_), "Only LP tokens may be used");
        _;
    }

    modifier onlyLPOrApprovedToken(IERC20 token_) {
        require(pool.isApprovedToken(token_) || pool.isLPToken(token_), "Only approved tokens or LP tokens may be used");
        _;
    }

    // Approve the market link to swap and swap between two assets
    function _swap(IERC20 tokenIn_, uint256 amountIn_, IERC20 tokenOut_) internal returns (uint256) {
        tokenIn_.safeApprove(address(marketLink), amountIn_);
        return marketLink.swap(tokenIn_, amountIn_, tokenOut_);
    }
}