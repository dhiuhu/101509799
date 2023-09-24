// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ArrayUsage.sol";

contract ArrayManipulation {
    using ArrayUtils for uint[];

    uint[] private data;

    function addValue(uint _value) public {
        data.push(_value);
    }

    function sortData() public {
        data.sort();
    }

    function removeDuplicates() public {
        data.removeDuplicates();
    }

    function getData() public view returns (uint[] memory) {
        return data;
    }
}
