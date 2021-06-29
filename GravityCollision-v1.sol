// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.1.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.1.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.1.0/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts@4.1.0/access/Ownable.sol";

contract GravityCollision is ERC20, ERC20Burnable, ERC20Snapshot, Ownable {
    constructor() ERC20("Gravity Collision", "GRAV-C") {
        _mint(msg.sender, 100000000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
