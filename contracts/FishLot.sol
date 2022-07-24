// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Fish Lot
 * @dev Store & retrieve Fish Lot Information
 */
contract FishLot {

    enum LotStatus{ INPROD, HARVESTED }
    
    struct Lot {
        uint _lot_number;
        LotStatus _status;
        uint _farm_id;
        uint _start_datetime;
        uint _harvest_datetime;
        uint _harvested_quantity;
        uint _unit_price;
    }

    uint256 lotCount = 0;
    mapping(uint => Lot) lots;

    mapping(uint => uint) lotByFarmCount;
    mapping(uint => mapping(uint => Lot)) lotByFarmMapping;


    function startNewLot(uint _farm_id) public returns(uint, LotStatus, uint, uint){

        uint currentTime = block.timestamp;

        lots[lotCount] = Lot(lotCount, LotStatus.INPROD ,_farm_id, currentTime, 0, 0, 0);
        lotByFarmMapping[_farm_id][lotByFarmCount[_farm_id]] = Lot(lotCount, LotStatus.INPROD ,_farm_id, currentTime, 0, 0, 0);
        lotCount += 1;
        lotByFarmCount[_farm_id] += 1;

        return (
            lots[lotCount-1]._lot_number,
            lots[lotCount-1]._status,
            lots[lotCount-1]._farm_id,
            lots[lotCount-1]._start_datetime
        );
    }

    function harvestLot(uint _lot_number, uint _harvested_quantity) public returns(uint, LotStatus, uint, uint, uint) {
        
        uint farmId = lots[_lot_number]._farm_id;

        lots[_lot_number]._harvest_datetime = block.timestamp;
        lots[_lot_number]._status = LotStatus.HARVESTED;
        lots[_lot_number]._harvested_quantity = _harvested_quantity;

        for(uint i=0; i<lotByFarmCount[farmId]; i++){
            if(lotByFarmMapping[farmId][i]._lot_number == _lot_number){
                lotByFarmMapping[farmId][i]._harvest_datetime = lots[_lot_number]._harvest_datetime;
                lotByFarmMapping[farmId][i]._status = LotStatus.HARVESTED;
                lotByFarmMapping[farmId][i]._harvested_quantity = _harvested_quantity;
                break;
            }
        }

        return (
            lots[_lot_number]._lot_number,
            lots[_lot_number]._status,
            lots[_lot_number]._farm_id,
            lots[_lot_number]._harvest_datetime,
            lots[_lot_number]._harvested_quantity
        );
    }

    function setUnitPrice(uint _lot_number, uint _unit_price) public returns(uint, LotStatus, uint, uint) {
        uint farmId = lots[_lot_number]._farm_id;

        lots[_lot_number]._unit_price = _unit_price;

        for(uint i=0; i<lotByFarmCount[farmId]; i++){
            if(lotByFarmMapping[farmId][i]._lot_number == _lot_number){
                lotByFarmMapping[farmId][i]._unit_price = _unit_price;
                break;
            }
        }

        return (
            lots[_lot_number]._lot_number,
            lots[_lot_number]._status,
            lots[_lot_number]._farm_id,
            lots[_lot_number]._unit_price
        );
    }


    function getById(uint _lot_number) public view returns(Lot memory){
        return lots[_lot_number];
    }

    function getByFarmId(uint _farm_id) public view returns(Lot[] memory){
        Lot[] memory ret = new Lot[](lotByFarmCount[_farm_id]);

        for(uint i=0; i<lotByFarmCount[_farm_id]; i++){
            ret[i] = lotByFarmMapping[_farm_id][i];
        }

        return ret;
    }

    function getByStatus(uint _q_status) public view returns(Lot[] memory){
        Lot[] memory retBuffer = new Lot[](lotCount);

        uint retBufferCount = 0;
        for(uint i=0; i<lotCount; i++){
            if(uint(lots[i]._status) == _q_status){
                retBuffer[retBufferCount] = lots[i];
                retBufferCount += 1;
            }
        }

        Lot[] memory ret = new Lot[](retBufferCount);

         for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }

    function getByFarmIdByStatus(uint _farm_id, uint _q_status) public view returns(Lot[] memory){
        Lot[] memory retBuffer = new Lot[](lotByFarmCount[_farm_id]);

        uint retBufferCount = 0;
        for(uint i=0; i<lotByFarmCount[_farm_id]; i++){
            if(uint(lotByFarmMapping[_farm_id][i]._status) == _q_status){
                retBuffer[retBufferCount] = lotByFarmMapping[_farm_id][i];
                retBufferCount += 1;
            }
        }
        

        Lot[] memory ret = new Lot[](retBufferCount);

         for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }

    
    
}