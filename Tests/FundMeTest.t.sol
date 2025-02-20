//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import  {Test} from 'forge/std/Test.sol';
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from '../script/deployFundMe.s.sol';


contract FundMeTest is Test {
	FundeMe fundMe;


	function setUp() external {
		//fundMe = new fundMe(0x6954145664456645456544655456);
		DeployFundMe deployFundMe = new DeployFundMe();
		fundMe = DeployFundMe.run();
	}


	function testMinimumDollarIsFive() public {
		assertEq (fundMe.MINIMUM_USD(),5e18);
	}

	function testOwnerIsMsgSender() public {
		assertEq(fundMe.i_owner(), msg.sender);
	}


	function testPriceFeedVersionIsAccurate() public {
		uint256 version = fundMe.version();
		assertEq(version,4);
	}
}