//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script} from 'forge-std/Script.sol';
import {FundMe} from '../src/FundMe.sol';
import {HelperConfig} from '../HelperConfig.s.sol';


contract DeployFundMe is Script {
	
	function run() external return {FundMe} {

		HelperConfig herlperConfig =  new HelperConfig();
		address ethUsdPriceFeed = HelperConfig.activeNetworkConfig(); 

		vm.startBroadcast();

		FundMe fundMe =  new  FundMe(ethUsdPriceFeed);
		vm.stopBroadcast();

		return fundMe;
	}
}