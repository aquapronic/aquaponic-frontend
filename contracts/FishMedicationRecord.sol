// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title FishMedicationRecord
 * @dev Store & retrieve Fish medication record Information
 */
contract FishMedicationRecord {
    
    struct MedicationRecord {
        uint _id;
        uint _farm_id;
        string _formula;
        uint _quantity;
        uint _timestamp;
    }

    uint256 medicationRecordCount = 0;
    mapping(uint => uint) medicationRecordByFarmCount;
    mapping(uint => mapping(uint => MedicationRecord)) medicationRecordByFarmMapping;


    function medicateFish(uint _farm_id, string memory _formula, uint _quantity) public returns(uint, uint, string memory, uint, uint){
        medicationRecordByFarmMapping[_farm_id][ medicationRecordByFarmCount[_farm_id] ] =
            MedicationRecord(medicationRecordCount, _farm_id ,_formula, _quantity, block.timestamp);

        medicationRecordCount += 1;
        medicationRecordByFarmCount[_farm_id] += 1;

        MedicationRecord memory m = medicationRecordByFarmMapping[_farm_id][ medicationRecordByFarmCount[_farm_id] - 1];

        return (
            m._id,
            m._farm_id,
            m._formula,
            m._quantity,
            m._timestamp
        );
    }


    function getByFarmIdSince(uint _farm_id, uint _since_timestamp) public view returns(MedicationRecord[] memory){
        MedicationRecord[] memory retBuffer = new MedicationRecord[]( medicationRecordByFarmCount[_farm_id] );

        uint retBufferCount = 0;
        for(uint i=0; i<medicationRecordByFarmCount[_farm_id]; i++){
            if(medicationRecordByFarmMapping[_farm_id][i]._timestamp < _since_timestamp){
                continue;
            } else {
                retBuffer[retBufferCount] = medicationRecordByFarmMapping[_farm_id][i];
                retBufferCount += 1;
            }
        }

        MedicationRecord[] memory ret = new MedicationRecord[]( retBufferCount );
        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }

    function getByFarmIdInAPeriod(uint _farm_id, uint _from_timestamp, uint _to_timestamp) public view returns(MedicationRecord[] memory){
        MedicationRecord[] memory retBuffer = new MedicationRecord[]( medicationRecordByFarmCount[_farm_id] );

        uint retBufferCount = 0;
        for(uint i=0; i<medicationRecordByFarmCount[_farm_id]; i++){
            if(medicationRecordByFarmMapping[_farm_id][i]._timestamp < _from_timestamp){
                continue;
            } else if (medicationRecordByFarmMapping[_farm_id][i]._timestamp > _to_timestamp) {
                break;
            } else {
                retBuffer[retBufferCount] = medicationRecordByFarmMapping[_farm_id][i];
                retBufferCount += 1;
            }
        }

        MedicationRecord[] memory ret = new MedicationRecord[]( retBufferCount );
        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }
}