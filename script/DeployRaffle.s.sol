// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {Raffle} from "../src/Raffle.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {VRFCoordinatorV2_5Mock} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol";
import {CreateSubscription} from "script/Interactions.s.sol";

contract DeployRaffle is Script {
    function deployRaffle() public returns (Raffle, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig.getConfig();

        if (config.subscriptionId == 0) {
            CreateSubscription createSubscription = new CreateSubscription();
            (
                config.subscriptionId,
                config.vrfCoordinatorV2
            ) = createSubscription.createSubscription(config.vrfCoordinatorV2);
        }

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
