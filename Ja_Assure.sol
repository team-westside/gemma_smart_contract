// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract jaAssure{
     uint256 constant MAX_OBJECTS = 1000;
    
    mapping(address => mapping(uint256 => Object)) public objectOwners;
    
    struct Object {
        uint256 objectId;
        string objectData;
    }
    
    function registerObject(uint256 _objectId, string memory _objectData) public {
        // Create a new Object struct
        Object memory newObject = Object(_objectId, _objectData);
        
        // Map the Object to the sender's address
        objectOwners[msg.sender][_objectId] = newObject;
    }
    
    function getObjectData() public view returns (Object[] memory) {
        // Get the total number of objects registered to the sender's address
        uint256 objectCount = 0;
        for (uint256 i = 0; i < MAX_OBJECTS; i++) {
            if (objectOwners[msg.sender][i].objectId != 0) {
                objectCount++;
            }
        }
        
        // Create an array to hold the objects
        Object[] memory objects = new Object[](objectCount);
        
        // Add each object to the array
        uint256 index = 0;
        for (uint256 i = 0; i < MAX_OBJECTS; i++) {
            if (objectOwners[msg.sender][i].objectId != 0) {
                objects[index] = objectOwners[msg.sender][i];
                index++;
            }
        }
        
        // Return the array of objects
        return objects;
    }

    

}