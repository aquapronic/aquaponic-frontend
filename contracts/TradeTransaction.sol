// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title TradeTransaction
 * @dev Store & retrieve Trade transaction Information
 */
contract TradeTransaction {

    struct Transaction {
        uint _id;
        address _buyer_id;
        address _agriculturist_id;
        uint _lot_number;
        uint _quantity_purchased;
        uint _value;
        uint _timestamp;
    }

    uint256 transactionCount = 0;
    mapping(uint => Transaction) transactions;

    mapping(uint => uint) transactionByLotNumberCount;
    mapping(uint => mapping(uint => Transaction)) transactionByLotNumberMapping;

    mapping(address => uint) transactionByAgriculturistCount;
    mapping(address => mapping(uint => Transaction)) transactionByAgriculturistMapping;



    function create(address _agriculturist_id, uint _lot_number, uint _quantity_purchased, uint _value) 
        public 
        returns(uint, address, address, uint, uint, uint, uint) 
    {

        uint currentTime = block.timestamp;

        transactions[transactionCount] = 
            Transaction(transactionCount, msg.sender, _agriculturist_id, _lot_number, _quantity_purchased, _value, currentTime);

        transactionByLotNumberMapping[_lot_number][transactionByLotNumberCount[_lot_number]] = transactions[transactionCount];

        uint tempCount = transactionByAgriculturistCount[_agriculturist_id];
        transactionByAgriculturistMapping[_agriculturist_id][tempCount] = transactions[transactionCount] ;

        transactionCount += 1;
        transactionByLotNumberCount[_lot_number] += 1;
        transactionByAgriculturistCount[_agriculturist_id] += 1;



        return (
            transactions[transactionCount-1]._id,
            transactions[transactionCount-1]._buyer_id,
            transactions[transactionCount-1]._agriculturist_id,
            transactions[transactionCount-1]._lot_number,
            transactions[transactionCount-1]._quantity_purchased,
            transactions[transactionCount-1]._value,
            transactions[transactionCount-1]._timestamp
        );
    }

    function getById(uint _id) public view returns(Transaction memory) {
        return transactions[_id];
    }

    function getByLotNumber(uint _lot_number) public view returns(Transaction[] memory){
        Transaction[] memory ret = new Transaction[](transactionByLotNumberCount[_lot_number]);

        for(uint i=0; i<transactionByLotNumberCount[_lot_number]; i++){
            ret[i] = transactionByLotNumberMapping[_lot_number][i];
        }

        return ret;
    } 

    function getByAgriculturistId(address _agriculturist_id) public view returns(Transaction[] memory){
        Transaction[] memory ret = new Transaction[](transactionByAgriculturistCount[_agriculturist_id]);

        for(uint i=0; i<transactionByAgriculturistCount[_agriculturist_id]; i++){
            ret[i] = transactionByAgriculturistMapping[_agriculturist_id][i];
        }

        return ret;
    } 
}