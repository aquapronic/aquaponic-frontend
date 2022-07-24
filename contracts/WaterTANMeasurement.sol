// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./MeasurementRecord.sol";

/**
 * @title WaterTANMeasurement
 * @dev Store & retrieve Water Total Ammonia Nitrogen Measurement
 */
contract WaterTANMeasurement is MeasurementRecord {


    // Should be less than 1ppm

    constructor() {
        // 17.07 3, 9, 15, 21
        recordInit(1, 64, 1658001600);
        recordInit(1, 70, 1658023200);
        recordInit(1, 72, 1658044800);
        recordInit(1, 73, 1658066400);
        // 18.07 3, 9, 15, 21
        recordInit(1, 74, 1658088000);
        recordInit(1, 78, 1658109600);
        recordInit(1, 79, 1658131200);
        recordInit(1, 80, 1658152800);
        // 19.07 3, 9, 15, 21
        recordInit(1, 80, 1658174400);
        recordInit(1, 52, 1658196000);
        recordInit(1, 58, 1658217600);
        recordInit(1, 59, 1658239200);
        // 20.07 3, 9, 15, 21
        recordInit(1, 61, 1658260800);
        recordInit(1, 64, 1658282400);
        recordInit(1, 66, 1658304000);
        recordInit(1, 67, 1658325600);
        // 21.07 3, 9, 15, 21
        recordInit(1, 66, 1658347200);
        recordInit(1, 69, 1658368800);
        recordInit(1, 72, 1658390400);
        recordInit(1, 71, 1658412000);
        // 22.07 3, 9, 15, 21
        recordInit(1, 74, 1658433600);
        recordInit(1, 79, 1658455200);
        recordInit(1, 81, 1658476800);
        recordInit(1, 80, 1658498400);
        // 23.07 3, 9, 15, 21
        recordInit(1, 84, 1658520000);
        recordInit(1, 51, 1658541600);
        recordInit(1, 54, 1658563200);
        recordInit(1, 55, 1658584800);
        
    }

    function recordInit(uint _farm_id, uint _value, uint _timestamp) internal {
        if(measurementCount[_farm_id] == 0){
            farmCount += 1;
        }
        measurements[_farm_id][measurementCount[_farm_id]] = Measurement(_timestamp, _value);
        measurementCount[_farm_id] += 1;
    }

 
}