//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {ISupportsFee} from "../interfaces/utils/ISupportsFee.sol";

abstract contract SupportsFee is Initializable, ISupportsFee {
    address private _recipient;

    function __SupportsFee_init(address recipient) internal onlyInitializing {
        __SupportsToken_init_unchained(recipient);
    }

    function __SupportsToken_init_unchained(address recipient) internal onlyInitializing {
        _recipient = recipient;
    }

    // Get the fee percentage.
    function feePercent() external virtual override returns (uint256 amount);

    // Get the fee amount.
    function feeAmount() external virtual override returns (uint256 amount);

    // Set the fee recipient.
    function setFeeRecipient(address recipient) external virtual override {
        _recipient = recipient;
    }

    // Get the fee recipient.
    function feeRecipient() external virtual override returns (address recipient) {
        return _recipient;
    }
}
