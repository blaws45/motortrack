Group 39: Motortrack Application

Motortrack is a blockchain-based vehicle history tracker application which is designed to authenticate odometer reading and prevent frauds to buyers and sellers. Using the vehicle’s VIN (Vehicle Identification Number), buyers can securely check a car's mileage/odometer history and authenticate the vehicle. 

Steps of the application

When a buyer enters a VIN: 
If the VIN is not already registered, they can create a new vehicle to be recorded in the system. 
This requires vehicle ‘make’, ‘model’, ‘colour’ and ‘odometer’ to be stored within the system	
If the VIN is already registered, they must enter the last/ most current odometer reading for authentication. 
  
Motortrack will then compare the new odometer reading with the previously recorded value.
 - Through the VIN identification, if the current reading is lower than the last recorded value, the system flags the vehicle as fraudulent due to suspected odometer rollback.
  - If the current reading is higher or equal, the vehicle is considered authentic, and the odometer update is securely logged on the blockchain.
  - Through the Motortrack application owner/buyer/seller can also update the latest odometer reading for future verifications. 

<img width="959" alt="Screenshot 2025-05-24 at 12 53 44 PM" src="https://github.com/user-attachments/assets/9f7e4148-a5f4-44ff-a1ab-475b3ce61cc9" />

The technology used to create the application were: 
  -	Front-End: HTML and CSS for the application structure and design 
  -	Back-End: Smart contracts written in Solidity
  -	Business Process Modelling: Interaction and function between different stakeholders and the application


Team Members: 
  -	Manan Bagga (N11282053) – BPM, Vehicle Search and Vehicle not found functionality
  -	Bryn Law Smith (N11542837) – Smart Contract for register vehicle function, Update vehicle, Vehicle forged and update
  -	Arham Hussain (N11633549) – Smart Contract for vehicle found and update vehicle, HTML and CSS for all pages

The application ensures transparency, builds trust between buyers and sellers, and protects against fraudulent vehicle practices.
