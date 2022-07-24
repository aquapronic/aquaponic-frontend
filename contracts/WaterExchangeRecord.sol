// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title WaterExchangeRecord
 * @dev Store & retrieve fish tank water exchange information
 */
contract WaterExchangeRecord {
    
    struct ExchangeRecord {
        uint _id;
        uint _farm_id;
        uint _timestamp;
    }

    uint256 exchangeRecordCount = 0;
    mapping(uint => uint) exchangeRecordByFarmCount;
    mapping(uint => mapping(uint => ExchangeRecord)) exchangeRecordByFarmMapping;


    function exchangeWater(uint _farm_id) public returns(uint, uint, uint){
        exchangeRecordByFarmMapping[_farm_id][ exchangeRecordByFarmCount[_farm_id] ] =
            ExchangeRecord(exchangeRecordCount, _farm_id, block.timestamp);

        exchangeRecordCount += 1;
        exchangeRecordByFarmCount[_farm_id] += 1;

        ExchangeRecord memory er = exchangeRecordByFarmMapping[_farm_id][ exchangeRecordByFarmCount[_farm_id] - 1];

        return (
            er._id,
            er._farm_id,
            er._timestamp
        );
    }


    function getByFarmIdSince(uint _farm_id, uint _since_timestamp) public view returns(ExchangeRecord[] memory){
        ExchangeRecord[] memory retBuffer = new ExchangeRecord[]( exchangeRecordByFarmCount[_farm_id] );

        uint retBufferCount = 0;
        for(uint i=0; i<exchangeRecordByFarmCount[_farm_id]; i++){
            if(exchangeRecordByFarmMapping[_farm_id][i]._timestamp < _since_timestamp){
                continue;
            } else {
                retBuffer[retBufferCount] = exchangeRecordByFarmMapping[_farm_id][i];
                retBufferCount += 1;
            }
        }

        ExchangeRecord[] memory ret = new ExchangeRecord[]( retBufferCount );
        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }

    function getByFarmIdInAPeriod(uint _farm_id, uint _from_timestamp, uint _to_timestamp) public view returns(ExchangeRecord[] memory){
        ExchangeRecord[] memory retBuffer = new ExchangeRecord[]( exchangeRecordByFarmCount[_farm_id] );

        uint retBufferCount = 0;
        for(uint i=0; i<exchangeRecordByFarmCount[_farm_id]; i++){
            if(exchangeRecordByFarmMapping[_farm_id][i]._timestamp < _from_timestamp){
                continue;
            } else if (exchangeRecordByFarmMapping[_farm_id][i]._timestamp > _to_timestamp) {
                break;
            } else {
                retBuffer[retBufferCount] = exchangeRecordByFarmMapping[_farm_id][i];
                retBufferCount += 1;
            }
        }

        ExchangeRecord[] memory ret = new ExchangeRecord[]( retBufferCount );
        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }
}