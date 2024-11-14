// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MockERC20 is ERC20Capped {
    constructor(
        string memory name,
        string memory symbol
    ) ERC20(name, symbol) ERC20Capped(1_000_000_000 * 10 ** decimals()) {
        _mint(msg.sender, 100_000_000 * 10 ** decimals());
    }

    function mint(address _to, uint256 _amount) external {
        _mint(_to, _amount);
    }

    function getLeftSupply() external view returns (uint256) {
        return cap() - totalSupply();
    }
}
