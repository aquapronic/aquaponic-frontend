// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Certificate
 * @dev Store & retrieve Certificate Information
 */
contract Certificate {

    enum CertificateUnitStatus { ACTIVE, INACTIVE }

    struct CertificateUnit {
        uint id;
        CertificateUnitStatus status;
        uint referenced_request_id;
        uint farm_id;
        address agriculturist_id;
        uint issue_datetime;
        address issuer;
    }

    uint256 certificateCount = 0;
    mapping(uint => CertificateUnit) certificates;

    mapping(uint => uint) certificateByFarmIdCount;
    mapping(uint => mapping(uint => CertificateUnit)) certificateByFarmIdMapping;

    mapping(address => uint) certificateByAgriculturistCount;
    mapping(address => mapping(uint => CertificateUnit)) certificateByAgriculturistMapping;



    function issueNewCertificate(uint _referenced_request_id, uint _farm_id, address _agriculturist_id) 
        public 
        returns(CertificateUnit memory) 
    {

        uint currentTime = block.timestamp;

        certificates[certificateCount] = 
            CertificateUnit(certificateCount, CertificateUnitStatus.ACTIVE, _referenced_request_id, _farm_id, _agriculturist_id, currentTime, msg.sender);

        certificateByAgriculturistMapping[_agriculturist_id][certificateByAgriculturistCount[_agriculturist_id]] = certificates[certificateCount];
        certificateByFarmIdMapping[_farm_id][certificateByFarmIdCount[_farm_id]] = certificates[certificateCount];

        certificateCount += 1;
        certificateByAgriculturistCount[_agriculturist_id] += 1;
        certificateByFarmIdCount[_farm_id] += 1;

        return certificates[certificateCount-1];
    }

    function getById(uint _id) public view returns(CertificateUnit memory) {
        return certificates[_id];
    }

    function getAllMyCertificate() public view returns(CertificateUnit[] memory){
        CertificateUnit[] memory ret = new CertificateUnit[](certificateByAgriculturistCount[msg.sender]);

        for(uint i=0; i<certificateByAgriculturistCount[msg.sender]; i++){
            ret[i] = certificateByAgriculturistMapping[msg.sender][i];
        }

        return ret;
    } 


   
}