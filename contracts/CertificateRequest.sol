// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Certificate Request
 * @dev Store & retrieve Certificate Request Information
 */
contract CertificateRequest {
    
    enum RequestStatus { WAITAPPROVE, REJECTED, APPROVED }

    struct Request {
        uint _id;
        RequestStatus _status;
        uint _farm_id;
        address _agriculturist_id;
        uint _request_datetime;
        uint _decision_datetime;
        address _approver;
    }

    uint256 requestCount = 0;
    mapping(uint => Request) requests;

    mapping(address => uint) requestByAgriculturistCount;
    mapping(address => mapping(uint => Request)) requestByAgriculturistMapping;


    function requestForCertificate(uint _farm_id) public returns(uint, RequestStatus, uint, uint){

        uint currentTime = block.timestamp;

        requests[requestCount] = Request(requestCount, RequestStatus.WAITAPPROVE ,_farm_id, msg.sender, currentTime, 0, address(0));
        requestByAgriculturistMapping[msg.sender][requestByAgriculturistCount[msg.sender]] = Request(requestCount, RequestStatus.WAITAPPROVE ,_farm_id, msg.sender, currentTime, 0, address(0));

        requestCount += 1;
        requestByAgriculturistCount[msg.sender] += 1;

        return (
            requests[requestCount-1]._id,
            requests[requestCount-1]._status,
            requests[requestCount-1]._farm_id,
            requests[requestCount-1]._request_datetime
        );
    }

    function rejectRequest(uint _request_id) public returns(uint, RequestStatus, uint, uint, address){
        uint currentTime = block.timestamp;

        requests[_request_id]._status = RequestStatus.REJECTED;
        requests[_request_id]._decision_datetime = currentTime;
        requests[_request_id]._approver = msg.sender;

        address agriculturistId = requests[_request_id]._agriculturist_id;

        for(uint i=0; i<requestByAgriculturistCount[agriculturistId]; i++){
            if(requestByAgriculturistMapping[agriculturistId][i]._id == _request_id){
                requestByAgriculturistMapping[agriculturistId][i]._status = RequestStatus.REJECTED;
                requestByAgriculturistMapping[agriculturistId][i]._decision_datetime = currentTime;
                requestByAgriculturistMapping[agriculturistId][i]._approver = msg.sender;
                break;
            }
        }

        return (
            requests[requestCount]._id,
            requests[requestCount]._status,
            requests[requestCount]._farm_id,
            requests[requestCount]._decision_datetime,
            requests[requestCount]._approver
        );
    }

    function approveRequest(uint _request_id) public returns(uint, RequestStatus, uint, uint, address){
        uint currentTime = block.timestamp;

        requests[_request_id]._status = RequestStatus.APPROVED;
        requests[_request_id]._decision_datetime = currentTime;
        requests[_request_id]._approver = msg.sender;

        address agriculturistId = requests[_request_id]._agriculturist_id;

        for(uint i=0; i<requestByAgriculturistCount[agriculturistId]; i++){
            if(requestByAgriculturistMapping[agriculturistId][i]._id == _request_id){
                requestByAgriculturistMapping[agriculturistId][i]._status = RequestStatus.APPROVED;
                requestByAgriculturistMapping[agriculturistId][i]._decision_datetime = currentTime;
                requestByAgriculturistMapping[agriculturistId][i]._approver = msg.sender;
                break;
            }
        }

        return (
            requests[requestCount]._id,
            requests[requestCount]._status,
            requests[requestCount]._farm_id,
            requests[requestCount]._decision_datetime,
            requests[requestCount]._approver
        );
    }

    function getById(uint _request_id) public view returns(Request memory){
        return requests[_request_id];
    }

    function getAllMyReqests() public view returns(Request[] memory){
        Request[] memory ret = new Request[](requestByAgriculturistCount[msg.sender]);

        for(uint i=0; i<requestByAgriculturistCount[msg.sender]; i++){
            ret[i] = requestByAgriculturistMapping[msg.sender][i];
        }

        return ret;
    }

    function getAllMyReqestsByStatus(uint _q_status) public view returns(Request[] memory){
        Request[] memory retBuffer = new Request[](requestByAgriculturistCount[msg.sender]);

        uint retBufferCount = 0;
        for(uint i=0; i<requestByAgriculturistCount[msg.sender]; i++){
            if(uint(requestByAgriculturistMapping[msg.sender][i]._status) == _q_status){
                retBuffer[retBufferCount] = requestByAgriculturistMapping[msg.sender][i];
                retBufferCount += 1;
            }
        }

        Request[] memory ret = new Request[](retBufferCount);

        for(uint i=0; i<retBufferCount; i++){
            ret[i] = retBuffer[i];
        }

        return ret;
    }   
}