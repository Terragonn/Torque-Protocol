//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

interface WETH {
    function deposit() external payable;

    function withdraw(uint256 amount) external;
}
