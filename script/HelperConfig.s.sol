// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";

abstract contract CodeConstants {
    uint256 public constant SEPOLIA_CHAIN_ID = 11155111;
    uint256 public constant LOCAL_CHAIN_ID = 31337;
}

contract HelperConfig is Script, CodeConstants {
    error HelperConfig__UnsupportedNetwork();

    struct NetworkConfig {
        uint256 subscriptionId;
        uint256 interval;
        bytes32 keyHash;
        uint256 entranceFee;
        uint32 callbackGasLimit;
        address vrfCoordinatorV2;
    }

    NetworkConfig public localNetworkConfig;
    mapping(uint256 => NetworkConfig) public networkConfigs;

    constructor() {
        networkConfigs[SEPOLIA_CHAIN_ID] = getSepoliaEthConfig();
    }

    function getConfigByChainId(
        uint256 chainId
    ) public returns (NetworkConfig memory) {
        if (networkConfigs[chainId].vrfCoordinatorV2 != address(0)) {
            return networkConfigs[chainId];
        } else if (chainId == LOCAL_CHAIN_ID) {
            return getOrCreateAnvilConfig();
        } else {
            revert HelperConfig__UnsupportedNetwork();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        return
            NetworkConfig({
                subscriptionId: 0,
                interval: 30,
                keyHash: 0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae,
                entranceFee: 0.01 ether,
                callbackGasLimit: 500000,
                vrfCoordinatorV2: 0x9DdfaCa8183c41ad55329BdeeD9F6A8d53168B1B
            });
    }

    function getOrCreateAnvilConfig() public returns (NetworkConfig memory) {
        if (localNetworkConfig.vrfCoordinatorV2 != address(0)) {
            return localNetworkConfig;
        }
    }
}
