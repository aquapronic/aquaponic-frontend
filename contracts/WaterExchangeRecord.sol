// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title WaterExchangeRecord
 * @dev Store & retrieve fish tank water exchange information
 */
contract WaterExchangeRecord {


    
    struct ExchangeRecord {
        uint id;
        uint farm_id;
        uint timestamp;
    }

    uint256 exchangeRecordCount = 0;
    mapping(uint => uint) exchangeRecordByFarmCount;
    mapping(uint => mapping(uint => ExchangeRecord)) exchangeRecordByFarmMapping;

    constructor(){
        recordInit(1, 1655629200);
        recordInit(1, 1656234000);
        recordInit(1, 1656838800);
        recordInit(1, 1657357200);
        recordInit(1, 1657875600);
        recordInit(1, 1658174400);
        recordInit(1, 1658520000);
    }

    function recordInit(uint _farm_id, uint _timestamp) internal{
        exchangeRecordByFarmMapping[_farm_id][ exchangeRecordByFarmCount[_farm_id] ] =
            ExchangeRecord(exchangeRecordCount, _farm_id, _timestamp);

        exchangeRecordCount += 1;
        exchangeRecordByFarmCount[_farm_id] += 1;
    }


    function exchangeWater(uint _farm_id) public returns(ExchangeRecord memory){
        exchangeRecordByFarmMapping[_farm_id][ exchangeRecordByFarmCount[_farm_id] ] =
            ExchangeRecord(exchangeRecordCount, _farm_id, block.timestamp);

        exchangeRecordCount += 1;
        exchangeRecordByFarmCount[_farm_id] += 1;

        return exchangeRecordByFarmMapping[_farm_id][ exchangeRecordByFarmCount[_farm_id] - 1];
    }


    function getByFarmIdSince(uint _farm_id, uint _since_timestamp) public view returns(ExchangeRecord[] memory){
        ExchangeRecord[] memory retBuffer = new ExchangeRecord[]( exchangeRecordByFarmCount[_farm_id] );

        uint retBufferCount = 0;
        for(uint i=0; i<exchangeRecordByFarmCount[_farm_id]; i++){
            if(exchangeRecordByFarmMapping[_farm_id][i].timestamp < _since_timestamp){
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
            if(exchangeRecordByFarmMapping[_farm_id][i].timestamp < _from_timestamp){
                continue;
            } else if (exchangeRecordByFarmMapping[_farm_id][i].timestamp > _to_timestamp) {
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