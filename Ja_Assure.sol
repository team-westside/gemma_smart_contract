// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract HashStorage {

    mapping (address => bool) private hasRegistered;
    mapping(bytes32 => string) private hashToString;



    
    function checkUserRegistration() public view returns(bool){
        return hasRegistered[msg.sender];
    }

    function registerUser() public {
        if (!hasRegistered[msg.sender]){
            hasRegistered[msg.sender] = true;
        }
    }

    function storeString(string memory input) public returns (bytes32) {
        bytes32 txHash = keccak256(abi.encodePacked(input, block.timestamp, msg.sender));
        hashToString[txHash] = input;
        return txHash;
    }

    function getString(bytes32 txHash) public view returns (string memory) {
        return hashToString[txHash];
    }






} 
