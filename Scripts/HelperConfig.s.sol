//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;


import  {Script} from 'forge-std/Script.sol'
import {MockV3Agregator} from '../test/mocks/MockV3Aggregator.sol'

contract HelperConfig is Script {
	
	NetworkConfig public activeNetworkConfig;

	uint8 public constant DECIMALS = 8;
	int256 public constant INITIAL_PRICE = 2000E8;

	struct NetworkConfig {
		address priceFeed;
	}


	constructor() {
		if (block.chainid == 11155111){
			activeNetworkConfig = getSepoliaEthConfig();

		} else if (block.chainid == 1){
			activeNetworkConfig = getMainnetConfig();

		} else {
			activeNetworkConfig = getAnvilEthConfig();
		}

		

	}

	function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
		NetworkConfig memory sepoliaConfig = NetworkConfig({
			priceFeed: 0x695546456546_sepoloia_2315564546
		})

		return  sepoliaConfig;
	}



	function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
		NetworkConfig memory ethConfig = NetworkConfig({
			priceFeed: 0x1111221_mainnet__6789
		})

		return  ethConfig;
	}



	function getAnvilEthConfig() public returns (NetworkConfig memory){


		if (activeNetworkConfig.priceFeed != address(0) {
			return activeNetworkConfig;
		}

		vm.startBroadCast();
		MockV3Agreggator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
		vm.stopBroadCast();

		NetworkConfig memory anvilConfig =  NetworkConfig ({ priceFeed: address(mockPricecFeed) })

		return anvilConfig;
	}

}



// .env file

SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/ya5a123jskaaskdlkdsa
MAINNET_RPC_URL=https://eth-mainnet.g.alchemy.com/v2/213312ioi1211221