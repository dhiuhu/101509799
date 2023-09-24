// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ArrayUtils {
    function sort(uint[] storage data) internal {
        if (data.length <= 1) return;
        
        for (uint i = 0; i < data.length - 1; i++) {
            for (uint j = i + 1; j < data.length; j++) {
                if (data[i] > data[j]) {
                    (data[i], data[j]) = (data[j], data[i]); // Swap elements
                }
            }
        }
    }

    function removeDuplicates(uint[] storage data) internal {
        if (data.length <= 1) return;

        uint256 lastIndex = 0;
        for (uint256 i = 1; i < data.length; i++) {
            bool isDuplicate = false;
            for (uint256 j = 0; j <= lastIndex; j++) {
                if (data[i] == data[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                lastIndex++;
                data[lastIndex] = data[i];
            }
        }
       
    }
}
