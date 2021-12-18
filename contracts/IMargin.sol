//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IMargin {
    // ======== Modifiers ========

    /**
     *  @dev Set the minimum amount of collateral for a given token required to borrow against
     *  @param _token The token to set the minimum collateral of
     *  @param _amount The minimum amount of collateral
     */
    function setMinCollateral(IERC20 _token, uint256 _amount) external;

    // ======== Calculations ========

    /**
     *  @dev Gets the minimum amount of collateral required to borrow a token
     */
    function getMinCollateral(IERC20 _token) external view returns (uint256);

    /**
     *  @dev Get the minimum borrow length
     */
    function getMinBorrowLength() external view returns (uint256);

    /**
     *  @dev Get the percentage rewarded to a user who performed an autonomous operation
     */
    function compensationPercentage() external view returns (uint256);

    /**
     *  @dev Return the total amount of a given asset borrowed
     *  @param _token The token to get the borrowed amount of
     */
    function totalBorrowed(IERC20 _token) external view returns (uint256);

    /**
     *  @dev Return the amount of liquidity available to be borrowed for a given asset
     *  @param _token The token to get the liquidity available
     */
    function liquidityAvailable(IERC20 _token) external view returns (uint256);

    /**
     *  @dev Calculate the margin level from the given requirements - returns the value multiplied by decimals
     *  @param _deposited The amount of the collateral deposited
     *  @param _initialBorrowPrice The amount of the collateral asset the initial borrowed amount could be redeemed for
     *  @param _borrowTime The time at which the first borrow was made
     *  @param _amountBorrowed The amount of the asset borrowed
     *  @param _collateral The asset used as collateral
     *  @param _borrowed The asset borrowed
     */
    function calculateMarginLevel(uint256 _deposited, uint256 _initialBorrowPrice, uint256 _borrowTime, uint256 _amountBorrowed, IERC20 _collateral, IERC20 _borrowed) external view returns (uint256);

    /**
     *  @dev Return the minimum margin level in terms of decimals
     */
    function getMinMarginLevel() external view returns (uint256);

    /**
     *  @dev Get the margin level of the given account
     *  @param _collateral The asset used as collateral
     *  @param _borrowed The asset borrowed
     */
    function getMarginLevel(address _account, IERC20 _collateral, IERC20 _borrowed) external view returns (uint256);

    /**
     *  @dev Get the interest rate for a given asset
     *  @param _borrowed The asset to calculate the interest rate of
     */
    function calculateInterestRate(IERC20 _borrowed) external view returns (uint256);

    /**
     *  @dev Calculate the interest at the current time for a given asset from the amount initially borrowed
     *  @param _borrowed The asset borrowed
     *  @param _initialBorrow The amount of the asset borrowed initially
     *  @param _borrowTime The time at which the first borrow was made
     */
    function calculateInterest(IERC20 _borrowed, uint256 _initialBorrow, uint256 _borrowTime) external view returns (uint256);

    // ======== Deposit ========

    /**
     *  @dev Deposit the given amount of collateral to borrow against a specified asset
     *  @param _collateral The asset to use as collateral
     *  @param _borrowed The asset to be borrowed
     *  @param _amount The amount of collateral to deposit
     */
    function deposit(IERC20 _collateral, IERC20 _borrowed, uint256 _amount) external;

    /**
     *  @dev Get the collateral of an account for a given pool and period id
     *  @param _account The account to check the collateral of
     *  @param _collateral The asset to use as collateral
     *  @param _borrowed The asset to borrow
     *  @param _periodId The id of the period to check the accounts collateral
     */
    function collateralOf(address _account, IERC20 _collateral, IERC20 _borrowed, uint256 _periodId) external view returns (uint256);

    // ======== Borrow ========

    /**
     *  @dev Borrow a specified number of the given asset against the collateral
     *  @param _collateral The asset to use as collateral
     *  @param _borrowed The asset to borrow
     *  @param _amount The amount of the asset to borrow
     */
    function borrow(IERC20 _collateral, IERC20 _borrowed, uint256 _amount) external;

    /**
     *  @dev Get the debt of a given account
     *  @param _account The account to check the debt of
     *  @param _collateral The asset to use as collateral
     *  @param _borrowed The asset to borrow
     */
    function debtOf(address _account, IERC20 _collateral, IERC20 _borrowed) external view returns (uint256);

    /**
     *  @dev Get the most recent borrow time for a given account
     *  @param _account The account to check the time of the most recent borrow
     *  @param _collateral The asset to use as collateral
     *  @param _borrowed The asset to borrow
     */
    function borrowTime(address _account, IERC20 _collateral, IERC20 _borrowed) external view returns (uint256);

    // ======== Repay and withdraw ========

    /**
     *  @dev Check the current margin balance of an account
     *  @param _account The account to get the balance of
     *  @param _collateral The asset to be used as collateral
     *  @param _borrowed The asset to borrow
     *  @param _periodId The id of the period to check the accounts balance
     */
    function balanceOf(address _account, IERC20 _collateral, IERC20 _borrowed, uint256 _periodId) external view returns (uint256);

    /**
     *  @dev Repay the borrowed amount for the given asset and collateral
     *  @param _account The account to repay - if in the epilogue period anyone may repay the account
     *  @param _collateral The asset to be used as collateral
     *  @param _borrowed The asset to borrow
     *  @param _periodId THe id of the period to redeposit for
     */
    function repay(address _account, IERC20 _collateral, IERC20 _borrowed, uint256 _periodId) external;

    /**
     *  @dev Withdraw collateral from the account if the account has no debt
     *  @param _collateral The asset to be used as collateral
     *  @param _borrowed The asset to borrow
     *  @param _amount The amount of the asset to withdraw
     *  @param _periodId The id of the period to withdraw from
     */
    function withdraw(IERC20 _collateral, IERC20 _borrowed, uint256 _amount, uint256 _periodId) external;

    // ======== Liquidate ========

    /**
     *  @dev Check if an account is liquidatable
     *  @param _account The account to check if liquidatable
     *  @param _collateral The asset to be used as collateral
     *  @param _borrowed The asset to borrow
     */
    function isLiquidatable(address _account, IERC20 _collateral, IERC20 _borrowed) external view returns (bool);

    /**
     *  @dev Liquidates a users account that is liquidatable / below the minimum margin level
     *  @param _account The account to be liquidated
     *  @param _collateral The asset to be used as collateral
     *  @param _borrowed The asset to borrow
     */
    function flashLiquidate(address _account, IERC20 _collateral, IERC20 _borrowed) external;

    // ======== Events ========

    event Deposit(address indexed account, uint256 indexed periodId, IERC20 collateral, IERC20 borrowed, uint256 amount);
    event Withdraw(address indexed account, uint256 indexed periodId, IERC20 collateral, IERC20 borrowed, uint256 amount);

    event Borrow(address indexed account, uint256 indexed periodId, IERC20 collateral, IERC20 borrowed, uint256 amount);
    event Repay(address indexed account, uint256 indexed periodId, IERC20 collateral, IERC20 borrowed, uint256 balance);

    event FlashLiquidation(address indexed account, uint256 indexed periodId, address liquidator, IERC20 collateral, IERC20 borrowed, uint256 amount);
}