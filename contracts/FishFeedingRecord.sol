// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title FishFeedingRecord
 * @dev Store & retrieve Fish feeding record Information
 */
contract FishFeedingRecord {
    
    struct FeedRecord {
        uint id;
        uint farm_id;
        string formula;
        uint quantity;
        uint timestamp;
    }

    uint256 feedRecordCount = 0;
    mapping(uint => uint) feedRecordByFarmCount;
    mapping(uint => mapping(uint => FeedRecord)) feedRecordByFarmMapping;


    function feedFish(uint _farm_id, string memory _formula, uint _quantity) public returns(FeedRecord memory){
        feedRecordByFarmMapping[_farm_id][ feedRecordByFarmCount[_farm_id] ] =
            FeedRecord(feedRecordCount, _farm_id ,_formula, _quantity, block.timestamp);

        feedRecordCount += 1;
        feedRecordByFarmCount[_farm_id] += 1;

        return feedRecordByFarmMapping[_farm_id][ feedRecordByFarmCount[_farm_id] - 1];
    }


    function getByFarmIdSince(uint _farm_id, uint _since_timestamp) public view returns(FeedRecord[] memory){
        FeedRecord[] memory retBuffer = new FeedRecord[]( feedRecordByFarmCount[_farm_id] );

        uint retBufferCount = 0;
        for(uint i=0; i<feedRecordByFarmCount[_farm_id]; i++){
            if(feedRecordByFarmMapping[_farm_id][i].timestamp < _since_timestamp){
                continue;
            } else {
                retBuffer[retBufferCount] = feedRecordByFarmMapping[_farm_id][i];
                retBufferCount += 1;
            }
        }

        FeedRecord[] memory ret = new FeedRecord[]( retBufferCount );
        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }

    function getByFarmIdInAPeriod(uint _farm_id, uint _from_timestamp, uint _to_timestamp) public view returns(FeedRecord[] memory){
        FeedRecord[] memory retBuffer = new FeedRecord[]( feedRecordByFarmCount[_farm_id] );

        uint retBufferCount = 0;
        for(uint i=0; i<feedRecordByFarmCount[_farm_id]; i++){
            if(feedRecordByFarmMapping[_farm_id][i].timestamp < _from_timestamp){
                continue;
            } else if (feedRecordByFarmMapping[_farm_id][i].timestamp > _to_timestamp) {
                break;
            } else {
                retBuffer[retBufferCount] = feedRecordByFarmMapping[_farm_id][i];
                retBufferCount += 1;
            }
        }

        FeedRecord[] memory ret = new FeedRecord[]( retBufferCount );
        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }
}