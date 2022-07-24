// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./MeasurementRecord.sol";

/**
 * @title WaterTempMeasurement
 * @dev Store & retrieve Water Temperature Measurement
 */
contract WaterTempMeasurement is MeasurementRecord {

    // Should be kept between 18.3 - 29.4

    constructor() {
        // W ----------------------------
        // 12.06 3, 9, 15, 21
        recordInit(1, 210, 1654977600);
        recordInit(1, 222, 1654999200);
        recordInit(1, 221, 1655020800);
        recordInit(1, 197, 1655042400);
        // 13.06 3, 9, 15, 21
        recordInit(1, 205, 1655064000);
        recordInit(1, 231, 1655085600);
        recordInit(1, 239, 1655107200);
        recordInit(1, 211, 1655128800);
        // 14.06 3, 9, 15, 21
        recordInit(1, 210, 1655150400);
        recordInit(1, 229, 1655172000);
        recordInit(1, 235, 1655193600);
        recordInit(1, 212, 1655215200);
        // 15.06 3, 9, 15, 21
        recordInit(1, 208, 1655236800);
        recordInit(1, 225, 1655258400);
        recordInit(1, 231, 1655280000);
        recordInit(1, 209, 1655301600);
        // 16.06 3, 9, 15, 21
        recordInit(1, 211, 1655323200);
        recordInit(1, 234, 1655344800);
        recordInit(1, 235, 1655366400);
        recordInit(1, 210, 1655388000);
        // 17.06 3, 9, 15, 21
        recordInit(1, 199, 1655409600);
        recordInit(1, 221, 1655431200);
        recordInit(1, 222, 1655452800);
        recordInit(1, 201, 1655474400);
        // 18.06 3, 9, 15, 21
        recordInit(1, 212, 1655496000);
        recordInit(1, 234, 1655517600);
        recordInit(1, 236, 1655539200);
        recordInit(1, 221, 1655560800);

        // W ----------------------------
        // 19.06 3, 9, 15, 21
        recordInit(1, 212, 1655582400);
        recordInit(1, 248, 1655604000);
        recordInit(1, 246, 1655625600);
        recordInit(1, 220, 1655647200);
        // 20.06 3, 9, 15, 21
        recordInit(1, 211, 1655668800);
        recordInit(1, 245, 1655690400);
        recordInit(1, 239, 1655712000);
        recordInit(1, 206, 1655733600);
        // 21.06 3, 9, 15, 21
        recordInit(1, 204, 1655755200);
        recordInit(1, 239, 1655776800);
        recordInit(1, 241, 1655798400);
        recordInit(1, 211, 1655820000);
        // 22.06 3, 9, 15, 21
        recordInit(1, 210, 1655841600);
        recordInit(1, 251, 1655863200);
        recordInit(1, 248, 1655884800);
        recordInit(1, 232, 1655906400);
        // 23.06 3, 9, 15, 21
        recordInit(1, 222, 1655928000);
        recordInit(1, 254, 1655949600);
        recordInit(1, 249, 1655971200);
        recordInit(1, 210, 1655992800);
        // 24.06 3, 9, 15, 21
        recordInit(1, 208, 1656014400);
        recordInit(1, 239, 1656036000);
        recordInit(1, 240, 1656057600);
        recordInit(1, 219, 1656079200);
        // 25.06 3, 9, 15, 21
        recordInit(1, 217, 1656100800);
        recordInit(1, 256, 1656122400);
        recordInit(1, 249, 1656144000);
        recordInit(1, 220, 1656165600);

        // W ----------------------------
        // 26.06 3, 9, 15, 21
        recordInit(1, 211, 1656187200);
        recordInit(1, 244, 1656208800);
        recordInit(1, 248, 1656230400);
        recordInit(1, 214, 1656252000);
        // 27.06 3, 9, 15, 21
        recordInit(1, 213, 1656273600);
        recordInit(1, 250, 1656295200);
        recordInit(1, 255, 1656316800);
        recordInit(1, 220, 1656338400);
        // 28.06 3, 9, 15, 21
        recordInit(1, 217, 1656360000);
        recordInit(1, 246, 1656381600);
        recordInit(1, 241, 1656403200);
        recordInit(1, 229, 1656424800);
        // 29.06 3, 9, 15, 21
        recordInit(1, 222, 1656446400);
        recordInit(1, 233, 1656468000);
        recordInit(1, 238, 1656489600);
        recordInit(1, 222, 1656511200);
        // 30.06 3, 9, 15, 21
        recordInit(1, 221, 1656532800);
        recordInit(1, 244, 1656554400);
        recordInit(1, 245, 1656576000);
        recordInit(1, 219, 1656597600);
        // 01.07 3, 9, 15, 21
        recordInit(1, 217, 1656619200);
        recordInit(1, 252, 1656640800);
        recordInit(1, 255, 1656662400);
        recordInit(1, 241, 1656684000);
        // 02.07 3, 9, 15, 21
        recordInit(1, 210, 1656705600);
        recordInit(1, 244, 1656727200);
        recordInit(1, 239, 1656748800);
        recordInit(1, 212, 1656770400);

        // W ----------------------------
        // 03.07 3, 9, 15, 21
        recordInit(1, 219, 1656792000);
        recordInit(1, 255, 1656813600);
        recordInit(1, 252, 1656835200);
        recordInit(1, 231, 1656856800);
        // 04.07 3, 9, 15, 21
        recordInit(1, 228, 1656878400);
        recordInit(1, 256, 1656900000);
        recordInit(1, 249, 1656921600);
        recordInit(1, 222, 1656943200);
        // 05.07 3, 9, 15, 21
        recordInit(1, 205, 1656964800);
        recordInit(1, 239, 1656986400);
        recordInit(1, 242, 1657008000);
        recordInit(1, 201, 1657029600);
        // 06.07 3, 9, 15, 21
        recordInit(1, 197, 1657051200);
        recordInit(1, 243, 1657072800);
        recordInit(1, 244, 1657094400);
        recordInit(1, 209, 1657116000);
        // 07.07 3, 9, 15, 21
        recordInit(1, 207, 1657137600);
        recordInit(1, 241, 1657159200);
        recordInit(1, 256, 1657180800);
        recordInit(1, 200, 1657202400);
        // 08.07 3, 9, 15, 21
        recordInit(1, 211, 1657224000);
        recordInit(1, 254, 1657245600);
        recordInit(1, 252, 1657267200);
        recordInit(1, 209, 1657288800);
        // 09.07 3, 9, 15, 21
        recordInit(1, 201, 1657310400);
        recordInit(1, 249, 1657332000);
        recordInit(1, 254, 1657353600);
        recordInit(1, 211, 1657375200);


        // W ----------------------------
        // 10.07 3, 9, 15, 21
        recordInit(1, 209, 1657396800);
        recordInit(1, 241, 1657418400);
        recordInit(1, 248, 1657440000);
        recordInit(1, 207, 1657461600);
        // 11.07 3, 9, 15, 21
        recordInit(1, 211, 1657483200);
        recordInit(1, 254, 1657504800);
        recordInit(1, 258, 1657526400);
        recordInit(1, 209, 1657548000);
        // 12.07 3, 9, 15, 21
        recordInit(1, 218, 1657569600);
        recordInit(1, 256, 1657591200);
        recordInit(1, 256, 1657612800);
        recordInit(1, 212, 1657634400);
        // 13.07 3, 9, 15, 21
        recordInit(1, 200, 1657656000);
        recordInit(1, 244, 1657677600);
        recordInit(1, 247, 1657699200);
        recordInit(1, 207, 1657720800);
        // 14.07 3, 9, 15, 21
        recordInit(1, 196, 1657742400);
        recordInit(1, 239, 1657764000);
        recordInit(1, 246, 1657785600);
        recordInit(1, 209, 1657807200);
        // 15.07 3, 9, 15, 21
        recordInit(1, 215, 1657828800);
        recordInit(1, 246, 1657850400);
        recordInit(1, 248, 1657872000);
        recordInit(1, 200, 1657893600);
        // 16.07 3, 9, 15, 21
        recordInit(1, 201, 1657915200);
        recordInit(1, 239, 1657936800);
        recordInit(1, 245, 1657958400);
        recordInit(1, 210, 1657980000);

        // W ----------------------------
        // 17.07 3, 9, 15, 21
        recordInit(1, 209, 1658001600);
        recordInit(1, 237, 1658023200);
        recordInit(1, 234, 1658044800);
        recordInit(1, 212, 1658066400);
        // 18.07 3, 9, 15, 21
        recordInit(1, 210, 1658088000);
        recordInit(1, 242, 1658109600);
        recordInit(1, 259, 1658131200);
        recordInit(1, 226, 1658152800);
        // 19.07 3, 9, 15, 21
        recordInit(1, 211, 1658174400);
        recordInit(1, 239, 1658196000);
        recordInit(1, 236, 1658217600);
        recordInit(1, 213, 1658239200);
        // 20.07 3, 9, 15, 21
        recordInit(1, 206, 1658260800);
        recordInit(1, 248, 1658282400);
        recordInit(1, 243, 1658304000);
        recordInit(1, 231, 1658325600);
        // 21.07 3, 9, 15, 21
        recordInit(1, 236, 1658347200);
        recordInit(1, 289, 1658368800);
        recordInit(1, 287, 1658390400);
        recordInit(1, 228, 1658412000);
        // 22.07 3, 9, 15, 21
        recordInit(1, 212, 1658433600);
        recordInit(1, 224, 1658455200);
        recordInit(1, 236, 1658476800);
        recordInit(1, 210, 1658498400);
        // 23.07 3, 9, 15, 21
        recordInit(1, 224, 1658520000);
        recordInit(1, 248, 1658541600);
        recordInit(1, 256, 1658563200);
        recordInit(1, 230, 1658584800);
        
    }

    function recordInit(uint _farm_id, uint _value, uint _timestamp) internal {
        if(measurementCount[_farm_id] == 0){
            farmCount += 1;
        }
        measurements[_farm_id][measurementCount[_farm_id]] = Measurement(_timestamp, _value);
        measurementCount[_farm_id] += 1;
    }
    
}