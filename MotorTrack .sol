// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IRegisterVehicle {
    function getVehicleByVin(string memory _vin) external view returns (
        string memory, string memory, string memory, string memory, uint256
    );
}

contract RegisterVehicle {
    struct Vehicle {
        string make;
        string model;
        string colour;
        string vin;
        uint256 odometer;
    }

    mapping(string => Vehicle[]) private vehiclesByVin;
    uint256 public vehicleCount;

    event VehicleRegistered(string make, string model, string colour, string vin, uint256 odometer);
    function updateVehicle(
        string memory _vin,
        string memory _make,
        string memory _model,
        string memory _colour,
        uint256 _odometer
    ) public {
        require(bytes(_vin).length > 0, "VIN required");

        Vehicle memory newVersion = Vehicle(_make, _model, _colour, _vin, _odometer);
        vehiclesByVin[_vin].push(newVersion);

        emit VehicleRegistered(_make, _model, _colour, _vin, _odometer);
    }
    function createVehicle(
        string memory _make,
        string memory _model,
        string memory _colour,
        string memory _vin,
        uint256 _odometer
    ) public {
        require(bytes(_vin).length > 0, "VIN cannot be empty");

        vehiclesByVin[_vin].push(Vehicle(_make, _model, _colour, _vin, _odometer));
        vehicleCount++;

        emit VehicleRegistered(_make, _model, _colour, _vin, _odometer);
    }

    function getVehicleByVin(string memory _vin) public view returns (
        string memory, string memory, string memory, string memory, uint256
    ) {
        Vehicle[] memory history = vehiclesByVin[_vin];
        require(history.length > 0, "Vehicle not found");
        Vehicle memory latest = history[history.length - 1];
        return (latest.make, latest.model, latest.colour, latest.vin, latest.odometer);
    }
}

contract VerifyVehicle {
    IRegisterVehicle public registerVehicleContract;
    address public owner;

    constructor(address _registerVehicleAddress) payable {
        registerVehicleContract = IRegisterVehicle(_registerVehicleAddress);
        owner = msg.sender;
    }

    // Accept plain ETH transfers
    receive() external payable {}

    fallback() external payable {}

    // View and payable vehicle verification
    function fetchVehicleDetails(string memory _vin, uint256 inputOdemeter) public view returns (
        string memory make,
        string memory model,
        string memory colour,
        uint256 odometer,
        bool fraud
    ) {
        // Optional fee check (can be adjusted or removed)

        try registerVehicleContract.getVehicleByVin(_vin) returns (
            string memory _make,
            string memory _model,
            string memory _colour,
            string memory, // vin (ignored)
            uint256 _odometer
        ) {
            bool isFraud = (_odometer > inputOdemeter);
            return (_make, _model, _colour, _odometer, isFraud);
        } catch {
            revert("Vehicle not found. Please register it first.");
        }
    }
}