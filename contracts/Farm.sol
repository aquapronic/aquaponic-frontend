// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Farm
 * @dev Store & retrieve Aquaponic farm information
 */
contract Farm {

    
    struct FarmUnit {
        uint _id;
        string _name;
        address _owner;
        string _plantType;
        string _fishType;
    }

    uint256 farmCount = 0;
    mapping(uint => FarmUnit) farms;

    function register(string memory _name, string memory _plantType, string memory _fishType) public returns(uint, string memory, address, string memory, string memory){
       farmCount += 1;
       farms[farmCount] = FarmUnit(farmCount, _name, msg.sender, _plantType, _fishType);
       return (farms[farmCount]._id, farms[farmCount]._name, farms[farmCount]._owner, farms[farmCount]._plantType, farms[farmCount]._fishType);
    }

    function getById(uint _id) public view returns(uint, string memory, address, string memory, string memory) {
        return (farms[_id]._id, farms[farmCount]._name, farms[_id]._owner, farms[_id]._plantType, farms[_id]._fishType);
    }

    function getAllMyFarms() public view returns(FarmUnit[] memory) {
        FarmUnit[] memory retBuffer = new FarmUnit[](farmCount);
        uint256 retCount = 0;
        for (uint i = 0; i < farmCount; i++) {
            if(farms[i+1]._owner == msg.sender) {
                retBuffer[retCount] = farms[i+1];
                retCount += 1;
            }
        }

        FarmUnit[] memory ret = new FarmUnit[](retCount);
        for (uint i = 0; i < retCount; i++) {
            ret[i] = retBuffer[i];
        }

        return ret;
    }
    
}