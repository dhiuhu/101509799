// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataProcessor {
    address public owner;
    uint256[] public data;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this operation");
        _;
    }

    function addData(uint256 _value) public onlyOwner {
        data.push(_value);
    }

    function getData() public view returns (uint256[] memory) {
        return data;
    }

    function removeDuplicates() public onlyOwner {
        uint256 length = data.length;
        if (length <= 1) return;

        for (uint256 i = 0; i < length - 1; i++) {
            for (uint256 j = i + 1; j < length; j++) {
                if (data[i] == data[j]) {
                    // Shift elements to fill the gap
                    for (uint256 k = j; k < length - 1; k++) {
                        data[k] = data[k + 1];
                    }
                    length--; // Reduce the length
                    j--; // Check the same index again
                }
            }
        }
        // Resize the array to remove duplicates
        uint256[] memory newData = new uint256[](length);
        for (uint256 i = 0; i < length; i++) {
            newData[i] = data[i];
        }
        data = newData;
    }

    function sortData() public onlyOwner {
        uint256 length = data.length;
        if (length <= 1) return;

        for (uint256 i = 0; i < length - 1; i++) {
            for (uint256 j = i + 1; j < length; j++) {
                if (data[i] > data[j]) {
                    // Swap elements
                    uint256 temp = data[i];
                    data[i] = data[j];
                    data[j] = temp;
                }
            }
        }
    }
}
