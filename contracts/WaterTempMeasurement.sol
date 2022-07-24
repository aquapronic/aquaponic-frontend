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