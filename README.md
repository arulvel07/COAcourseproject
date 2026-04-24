# Design of a Simple Multi-Cycle CPU using Verilog

## Overview
This project implements a 16-bit multi-cycle CPU using Verilog HDL.
The CPU executes instructions in four stages: Fetch, Decode, Execute, and Writeback, controlled by a Finite State Machine (FSM).

## Features
- 16-bit custom Instruction Set Architecture (ISA)
- 8 general-purpose registers (R0–R7)
- Instructions: ADD, SUB, AND, OR, MOV, LOADI, NOP
- 4-stage multi-cycle execution
- Simulation using Icarus Verilog
- Waveform visualization using GTKWave

## File Structure
alu.v
register_file.v
control_unit.v
pc.v
instruction_memory.v
fsm.v
cpu_top.v
cpu_tb.v

## Requirements
- Icarus Verilog
- GTKWave

## Install (Ubuntu/Debian)
sudo apt-get install -y iverilog gtkwave

## How to Run

1. Compile
iverilog -o cpu_sim alu.v register_file.v control_unit.v pc.v instruction_memory.v fsm.v cpu_top.v cpu_tb.v

2. Run Simulation
vvp cpu_sim

3. View Waveforms
gtkwave cpu_dump.vcd

## Expected Output
Registers update correctly after each instruction.

Example:
Time=16  R1=5   R2=0   R3=0
Time=32  R1=5   R2=3   R3=0
Time=48  R1=8   R2=3   R3=0
Simulation complete.

## Notes
- Each instruction takes 4 clock cycles
- FSM controls execution stages
- ALU is combinational, registers are sequential

## Authors
- Dharmendra R (cs24i1070)
- Arulvel V (cs24i1027)
- Anbuchezhiyan A (cs24i1069)