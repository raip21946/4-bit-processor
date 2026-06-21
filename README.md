# Design and Simulation of 4-bit Processor

## Overview
This project implements a simple 4-bit processor using Verilog HDL. The processor consists of a Program Counter, Instruction Memory, Control Unit, Register File, ALU, and Data Memory.

## Features
- 4-bit datapath
- Custom instruction set
- Arithmetic operations:
  - ADD
  - SUB
- Logical operations:
  - AND
  - OR
  - XOR
  - NOT
- Program Counter
- Register File with four registers
- Data Memory
- Fetch → Decode → Execute architecture
- Behavioral simulation using Xilinx Vivado

## Tools Used
- Verilog HDL
- Xilinx Vivado
- XSim Simulator

## Instruction Set

| Opcode | Operation |
|---------|----------|
|000|ADD|
|001|SUB|
|010|AND|
|011|OR|
|100|XOR|
|101|NOT|
|110|LOAD|
|111|STORE|

## Simulation Output

```
ADD : 5 + 3 = 8
SUB : 11 - 3 = 8
AND : 8 & 3 = 0
OR  : 0 | 3 = 3
XOR : 3 ^ 3 = 0
NOT : ~0 = 15
```

## Author

Priyanshu Rai
