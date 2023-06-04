pragma solidity >=0.8.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Balloons is ERC20 {
    constructor() ERC20("Balloons", "BAL") {
        _mint(msg.sender, 1000 ether);
    }

    event ApproveDeposit(address owner, address spender, uint256 value);
    
    // override the approve functino to emit an event
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        emit ApproveDeposit(_msgSender(), spender, amount);
        return true;
    }
}
