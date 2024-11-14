// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MockERC20} from "../src/mocks/MockERC20.sol";

import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract MockERC20Test is Test {
    MockERC20 public mockToken;
    uint256 public decimals;

    uint256 public constant BILLION = 1_000_000_000;
    uint256 public constant MILLION100 = 100_000_000;

    function setUp() public {
        mockToken = new MockERC20("Test", "TST");
        decimals = mockToken.decimals();
    }

    function test_CapSet() public {
        assertEq(mockToken.cap(), BILLION * 10 ** decimals);
        assertEq(
            mockToken.getLeftSupply(),
            (BILLION * 10 ** decimals - 100_000_000 * 10 ** decimals)
        );
    }

    function test_MintAboveCap() public {
        mockToken.mint(address(this), 9 * MILLION100 * 10 ** decimals);
        vm.expectRevert(
            abi.encodeWithSelector(
                ERC20Capped.ERC20ExceededCap.selector,
                BILLION * 10 ** decimals + 1,
                BILLION * 10 ** decimals
            )
        );
        mockToken.mint(address(this), 1);
    }
}
