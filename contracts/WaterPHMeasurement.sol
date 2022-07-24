// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./MeasurementRecord.sol";

/**
 * @title WaterPHMeasurement
 * @dev Store & retrieve Water PH Measurement
 */
contract WaterPHMeasurement is MeasurementRecord {

    // Should be kept between 6.4 - 7.4

    constructor() {
        // 17.07 3, 9, 15, 21
        recordInit(1, 71, 1658001600);
        recordInit(1, 70, 1658023200);
        recordInit(1, 70, 1658044800);
        recordInit(1, 70, 1658066400);
        // 18.07 3, 9, 15, 21
        recordInit(1, 69, 1658088000);
        recordInit(1, 70, 1658109600);
        recordInit(1, 69, 1658131200);
        recordInit(1, 68, 1658152800);
        // 19.07 3, 9, 15, 21
        recordInit(1, 68, 1658174400);
        recordInit(1, 66, 1658196000);
        recordInit(1, 66, 1658217600);
        recordInit(1, 65, 1658239200);
        // 20.07 3, 9, 15, 21
        recordInit(1, 64, 1658260800);
        recordInit(1, 72, 1658282400);
        recordInit(1, 71, 1658304000);
        recordInit(1, 71, 1658325600);
        // 21.07 3, 9, 15, 21
        recordInit(1, 71, 1658347200);
        recordInit(1, 70, 1658368800);
        recordInit(1, 70, 1658390400);
        recordInit(1, 70, 1658412000);
        // 22.07 3, 9, 15, 21
        recordInit(1, 70, 1658433600);
        recordInit(1, 69, 1658455200);
        recordInit(1, 69, 1658476800);
        recordInit(1, 68, 1658498400);
        // 23.07 3, 9, 15, 21
        recordInit(1, 67, 1658520000);
        recordInit(1, 75, 1658541600);
        recordInit(1, 75, 1658563200);
        recordInit(1, 74, 1658584800);
        
    }

    function recordInit(uint _farm_id, uint _value, uint _timestamp) internal {
        if(measurementCount[_farm_id] == 0){
            farmCount += 1;
        }
        measurements[_farm_id][measurementCount[_farm_id]] = Measurement(_timestamp, _value);
        measurementCount[_farm_id] += 1;
    }
}