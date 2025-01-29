// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {Raffle} from "../src/Raffle.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployRaffle is Script {
    function run() public {}

    function deployRaffle() public returns (Raffle, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig.getConfig();

        vm.startBroadcast();

        Raffle raffle = new Raffle(
            config.subscriptionId,
            config.interval,
            config.keyHash,
            config.entranceFee,
            config.callbackGasLimit,
            config.vrfCoordinatorV2
        );

        vm.stopBroadcast();

        return (raffle, helperConfig);
    }
}
