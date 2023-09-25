// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for the TargetContract
interface TargetContractInterface {
    function setValue(uint256 _newValue) external;
    function getValue() external view returns (uint256);
}

// TargetContract, which will be called via delegate calls
contract TargetContract is TargetContractInterface {
    uint256 private value;

    function setValue(uint256 _newValue) external override {
        value = _newValue;
    }

    function getValue() external view override returns (uint256) {
        return value;
    }
}

// CallerContract that delegates calls to TargetContract
contract CallerContract {
    address public targetContractAddress;
    TargetContractInterface public targetContract;

    constructor(address _targetContractAddress) {
        targetContractAddress = _targetContractAddress;
        targetContract = TargetContractInterface(_targetContractAddress);
    }

    function updateValue(uint256 _newValue) public {
        // Delegate call to the target contract's setValue function
        (bool success, ) = targetContractAddress.delegatecall(
            abi.encodeWithSignature("setValue(uint256)", _newValue)
        );
        require(success, "Delegate call failed");
    }

    function getValue() public view returns (uint256) {
        // Call the target contract's getValue function
        return targetContract.getValue();
    }
}
