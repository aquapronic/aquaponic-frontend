// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./ItemLot.sol";


/**
 * @title Plant Lot
 * @dev Store & retrieve Plant Lot Information
 */
contract PlantLot is ItemLot {

   constructor(){
       recordInitHarvested(1, 1654977600, 1657980000, 300, 225);
       recordInit(1, 1658001600);
   }
    
}