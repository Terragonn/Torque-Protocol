//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {ISupportsToken} from "../../utils/ISupportsToken.sol";

import {IVaultV1} from "../vault/IVaultV1.sol";

// A strategy that integrates with a vault to earn rewards on deposited tokens.
interface IStrategy is ISupportsToken {
    // Get the vault used by the strategy.
    function getVault() external returns (IVaultV1 vault);

    // Deposit a given amount of funds from the vault into the strategy.
    // Reverts if sender does not have appropriate funds or has not allocated allowance.
    function deposit(uint256[] calldata amount) external;

    // Deposit all of the vaults funds into the strategy.
    // Reverts if sender has not approved funds.
    function depositAll() external;

    // Withdraw a given amount of the contracts funds to the vault.
    // Reverts if there are not enough funds available in the contract.
    function withdraw(uint256[] calldata amount) external;

    // Withdraw all of the contracts funds to the vault.
    function withdrawAll() external;

    // Get the current APY and decimals for the strategy.
    function APY() external view returns (uint256 apy, uint256 decimals);

    // Update the current APY for the strategy.
    // Calling APY after does not necessarily need to equal the submitted APY.
    function updateAPY(uint256 apy) external;

    event Deposit(address indexed caller, uint256[] amount);
    event DepositAll(address indexed caller);
    event Withdraw(address indexed caller, uint256[] amount);
    event WithdrawAll(address indexed caller);
}
