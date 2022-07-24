// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Item Lot
 * @dev Store & retrieve Plant Lot Information
 */
contract ItemLot {

    enum LotStatus{ INPROD, HARVESTED }
    
    struct Lot {
        uint lot_number;
        LotStatus status;
        uint farm_id;
        uint start_datetime;
        uint harvest_datetime;
        uint harvested_quantity;
        uint unit_price;
    }

    uint256 lotCount = 0;
    mapping(uint => Lot) lots;

    mapping(uint => uint) lotByFarmCount;
    mapping(uint => mapping(uint => Lot)) lotByFarmMapping;

    function recordInit(uint _farm_id, uint _start_datetime) internal {

        lots[lotCount] = Lot(lotCount, LotStatus.INPROD ,_farm_id, _start_datetime, 0, 0, 0);
        lotByFarmMapping[_farm_id][lotByFarmCount[_farm_id]] = Lot(lotCount, LotStatus.INPROD ,_farm_id, _start_datetime, 0, 0, 0);
        lotCount += 1;
        lotByFarmCount[_farm_id] += 1;

    }

    function recordInitHarvested(uint _farm_id, uint _start_datetime, uint _harvest_datetime, uint _harvested_quantity, uint _unit_price) internal {

        lots[lotCount] = Lot(lotCount, LotStatus.HARVESTED ,_farm_id, _start_datetime, _harvest_datetime, _harvested_quantity, _unit_price);
        lotByFarmMapping[_farm_id][lotByFarmCount[_farm_id]] = Lot(lotCount, LotStatus.HARVESTED ,_farm_id, _start_datetime, _harvest_datetime, _harvested_quantity, _unit_price);
        lotCount += 1;
        lotByFarmCount[_farm_id] += 1;

    }


    function startNewLot(uint _farm_id) public returns(Lot memory){

        uint currentTime = block.timestamp;

        lots[lotCount] = Lot(lotCount, LotStatus.INPROD ,_farm_id, currentTime, 0, 0, 0);
        lotByFarmMapping[_farm_id][lotByFarmCount[_farm_id]] = Lot(lotCount, LotStatus.INPROD ,_farm_id, currentTime, 0, 0, 0);
        lotCount += 1;
        lotByFarmCount[_farm_id] += 1;

        return lots[lotCount-1];
    }

    function harvestLot(uint _lot_number, uint _harvested_quantity) public returns(Lot memory) {
        
        uint farmId = lots[_lot_number].farm_id;

        lots[_lot_number].harvest_datetime = block.timestamp;
        lots[_lot_number].status = LotStatus.HARVESTED;
        lots[_lot_number].harvested_quantity = _harvested_quantity;

        for(uint i=0; i<lotByFarmCount[farmId]; i++){
            if(lotByFarmMapping[farmId][i].lot_number == _lot_number){
                lotByFarmMapping[farmId][i].harvest_datetime = lots[_lot_number].harvest_datetime;
                lotByFarmMapping[farmId][i].status = LotStatus.HARVESTED;
                lotByFarmMapping[farmId][i].harvested_quantity = _harvested_quantity;
                break;
            }
        }

        return lots[_lot_number];
    }

    function setUnitPrice(uint _lot_number, uint _unit_price) public returns(Lot memory) {
        uint farmId = lots[_lot_number].farm_id;

        lots[_lot_number].unit_price = _unit_price;

        for(uint i=0; i<lotByFarmCount[farmId]; i++){
            if(lotByFarmMapping[farmId][i].lot_number == _lot_number){
                lotByFarmMapping[farmId][i].unit_price = _unit_price;
                break;
            }
        }

        return lots[_lot_number];
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
            if(uint(lots[i].status) == _q_status){
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
            if(uint(lotByFarmMapping[_farm_id][i].status) == _q_status){
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