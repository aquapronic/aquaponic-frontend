// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title MeasurementRecord
 * @dev Store & retrieve MeasurementRecord Measurement
 */
contract MeasurementRecord {

    
    struct Measurement {
        uint _timestamp;
        uint _value;
    }

    uint256 farmCount = 0;
    mapping(uint => uint) measurementCount;
    mapping(uint => mapping(uint => Measurement)) measurements;

    function record(uint _farm_id, uint _value) public returns(uint, uint, uint){
        if(measurementCount[_farm_id] == 0){
            farmCount += 1;
        }
        measurements[_farm_id][measurementCount[_farm_id]] = Measurement(block.timestamp, _value);
        measurementCount[_farm_id] += 1;
        return (
            _farm_id,
            measurements[_farm_id][measurementCount[_farm_id]-1]._timestamp,
            measurements[_farm_id][measurementCount[_farm_id]-1]._value
        );
    }

    function getAllMeasurementForAFarm(uint _farm_id) public view returns (Measurement[] memory){
        Measurement[] memory ret = new Measurement[](measurementCount[_farm_id]);

        for(uint i=0; i<measurementCount[_farm_id]; i++){
            ret[i] = measurements[_farm_id][i];
        }

        return ret;
    }

    function getAllMeasurementForAFarmSince(uint _farm_id, uint _since_timestamp) public view returns (Measurement[] memory){
        Measurement[] memory retBuffer = new Measurement[](measurementCount[_farm_id]);

        uint retBufferCount = 0;
        for(uint i=0; i<measurementCount[_farm_id]; i++){
            if(measurements[_farm_id][i]._timestamp < _since_timestamp){
                continue;
            } else {
                retBuffer[retBufferCount] = measurements[_farm_id][i];
                retBufferCount += 1;
            }
        }

        Measurement[] memory ret = new Measurement[](retBufferCount);

        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }

    function getAllMeasurementForAFarmInAPeriod(uint _farm_id, uint _from_timestamp, uint _to_timestamp) public view returns (Measurement[] memory){
        Measurement[] memory retBuffer = new Measurement[](measurementCount[_farm_id]);

        uint retBufferCount = 0;
        for(uint i=0; i<measurementCount[_farm_id]; i++){
            if(measurements[_farm_id][i]._timestamp < _from_timestamp){
                continue;
            } else if(measurements[_farm_id][i]._timestamp > _to_timestamp){
                break;
            } else {
                retBuffer[retBufferCount] = measurements[_farm_id][i];
                retBufferCount += 1;
            }
        }

        Measurement[] memory ret = new Measurement[](retBufferCount);

        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }
    
}