# HICAR25 - Assignment 3

## About
This repository contains the source code, testbench, and program data for Assignment 3 of the HICAR25 project.  
The objective is to simulate and verify the processor implementation using the provided testbench and program files.

## Repository Structure
```text
.
├── src/        # Processor implementation (RTL source files)
├── tb/         # Testbench and simulation harness
├── programs/   # Text and hex program files + Python script for generating/converting programs
└── README.md
```

### Folder Details

#### `src/`
Contains the RTL implementation of the processor.

#### `tb/`
Contains the full testbench environment used to simulate the processor.  

#### `programs/`
Contains:
- program text files  
- corresponding hex files used as memory/program input  
- a Python script that assists in generating or converting these program files into the required formats for simulation.

These files are consumed by the testbench during simulation to execute different instruction sequences on the processor.

## Running Simulations
Use Vivado to run the simulations for this assignment.
Follow the simulation workflow and instructions provided in the course materials (HICAR25)
