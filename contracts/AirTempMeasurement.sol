// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./MeasurementRecord.sol";


/**
 * @title AirTempMeasurement
 * @dev Store & retrieve Air Temperature Measurement
 */
contract AirTempMeasurement is MeasurementRecord {

    // Should be kept between 18.3 - 29.4

    constructor() {
        // 17.07 3, 9, 15, 21
        recordInit(1, 284, 1658001600);
        recordInit(1, 297, 1658023200);
        recordInit(1, 299, 1658044800);
        recordInit(1, 282, 1658066400);
        // 18.07 3, 9, 15, 21
        recordInit(1, 279, 1658088000);
        recordInit(1, 287, 1658109600);
        recordInit(1, 291, 1658131200);
        recordInit(1, 277, 1658152800);
        // 19.07 3, 9, 15, 21
        recordInit(1, 272, 1658174400);
        recordInit(1, 291, 1658196000);
        recordInit(1, 302, 1658217600);
        recordInit(1, 279, 1658239200);
        // 20.07 3, 9, 15, 21
        recordInit(1, 269, 1658260800);
        recordInit(1, 284, 1658282400);
        recordInit(1, 277, 1658304000);
        recordInit(1, 262, 1658325600);
        // 21.07 3, 9, 15, 21
        recordInit(1, 271, 1658347200);
        recordInit(1, 304, 1658368800);
        recordInit(1, 304, 1658390400);
        recordInit(1, 282, 1658412000);
        // 22.07 3, 9, 15, 21
        recordInit(1, 279, 1658433600);
        recordInit(1, 297, 1658455200);
        recordInit(1, 292, 1658476800);
        recordInit(1, 273, 1658498400);
        // 23.07 3, 9, 15, 21
        recordInit(1, 280, 1658520000);
        recordInit(1, 296, 1658541600);
        recordInit(1, 298, 1658563200);
        recordInit(1, 274, 1658584800);
        
    }

    function recordInit(uint _farm_id, uint _value, uint _timestamp) internal {
        if(measurementCount[_farm_id] == 0){
            farmCount += 1;
        }
        measurements[_farm_id][measurementCount[_farm_id]] = Measurement(_timestamp, _value);
        measurementCount[_farm_id] += 1;
    }
}