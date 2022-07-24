// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./ItemLot.sol";


/**
 * @title Fish Lot
 * @dev Store & retrieve Fish Lot Information
 */
contract FishLot is ItemLot {

    constructor(){
       recordInit(1, 1654977600);
    }
    
}