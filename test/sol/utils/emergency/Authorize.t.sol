//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import {ICheatCodes} from "../../helpers/ICheatCodes.sol";

import {EmergencyBase} from "./EmergencyBase.sol";
import {Impersonate} from "../../helpers/Impersonate.sol";

import {Config} from "../../helpers/Config.sol";
import {MockEmergency} from "../../../mocks/MockEmergency.sol";

contract Authorize is EmergencyBase, Impersonate {
    MockEmergency private emergency;
    address private empty;

    function setUp() public virtual override {
        super.setUp();

        emergency = _getEmergency();
        empty = _getEmpty();
    }

    // Check that an approved account will be able to use emergency withdraw

    // Check that a non approved account will not be able to use an emergency withdraw

    function _getCheats() internal view virtual override(EmergencyBase, Impersonate) returns (ICheatCodes _cheats) {
        return super._getCheats();
    }
}
