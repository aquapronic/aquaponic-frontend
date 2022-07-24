// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Farm
 * @dev Store & retrieve Aquaponic farm information
 */
contract Farm {

    
    struct FarmUnit {
        uint id;
        string name;
        address owner;
        string plantType;
        string fishType;
    }

    constructor(){
        recordInit("Aquaponic Farm 1", "Basil", "Tilapia");
    }

    uint256 farmCount = 0;
    mapping(uint => FarmUnit) farms;

    function recordInit(string memory _name, string memory _plantType, string memory _fishType) internal{
       farmCount += 1;
       farms[farmCount] = FarmUnit(farmCount, _name, msg.sender, _plantType, _fishType);
    }

    function register(string memory _name, string memory _plantType, string memory _fishType) public returns(FarmUnit memory){
       farmCount += 1;
       farms[farmCount] = FarmUnit(farmCount, _name, msg.sender, _plantType, _fishType);
       return farms[farmCount];
    }


    function getById(uint _id) public view returns(FarmUnit memory) {
        return farms[_id];
    }

    function getAllMyFarms() public view returns(FarmUnit[] memory) {
        FarmUnit[] memory retBuffer = new FarmUnit[](farmCount);
        uint256 retCount = 0;
        for (uint i = 0; i < farmCount; i++) {
            if(farms[i+1].owner == msg.sender) {
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