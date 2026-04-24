# Design of a Simple Multi-Cycle CPU using Verilog

A 16-bit multi-cycle CPU implemented in Verilog HDL, simulated using Icarus Verilog and visualized with GTKWave.

---

## Overview

This project builds a simple CPU from scratch to demonstrate how instructions execute at the hardware level. Each instruction goes through four stages — Fetch, Decode, Execute, and Writeback — controlled by a Finite State Machine (FSM). The design is intentionally minimal so every signal and data path can be traced and understood.

---

## Features

- 16-bit custom Instruction Set Architecture (ISA)
- 8 general-purpose registers (R0–R7)
- Supported instructions: `ADD`, `SUB`, `AND`, `OR`, `MOV`, `LOADI`, `NOP`
- 4-stage FSM-based multi-cycle execution
- Simulation via Icarus Verilog
- Waveform visualization via GTKWave

---

## File Structure

| File | Description |
|------|-------------|
| `alu.v` | Combinational ALU |
| `register_file.v` | 8×16-bit register file |
| `control_unit.v` | Opcode decoder and control signal generator |
| `pc.v` | 8-bit Program Counter |
| `instruction_memory.v` | ROM-style instruction memory (256 entries) |
| `fsm.v` | 4-state FSM controller |
| `cpu_top.v` | Top-level module |
| `cpu_tb.v` | Testbench with VCD dump |

---

## Requirements

- [Verilog](http://iverilog.icarus.com/)
- [GTKWave](http://gtkwave.sourceforge.net/)

### Install (Ubuntu/Debian)

```bash
sudo apt-get install -y iverilog gtkwave
```

---

## How to Run

**1. Compile**

```bash
iverilog -o cpu_sim alu.v register_file.v control_unit.v pc.v instruction_memory.v fsm.v cpu_top.v cpu_tb.v
```

**2. Simulate**

```bash
vvp cpu_sim
```

**3. View Waveforms**

```bash
gtkwave cpu_dump.vcd
```

In GTKWave, add signals `clk`, `state`, `IR`, `PC`, `alu_result`, and `reg_write` to trace execution cycle by cycle.

---

## Expected Output
Time=16  R1=5   R2=0   R3=0
Time=32  R1=5   R2=3   R3=0
Time=48  R1=8   R2=3   R3=0
Simulation complete.

---

## ISA Reference

| Opcode | Mnemonic | Operation |
|--------|----------|-----------|
| `0001` | ADD | Rd = Rd + Rs |
| `0010` | SUB | Rd = Rd - Rs |
| `0011` | AND | Rd = Rd & Rs |
| `0100` | OR | Rd = Rd \| Rs |
| `0101` | MOV | Rd = Rs |
| `0110` | LOADI | Rd = Immediate |
| `0000` | NOP | No operation |

---

## Notes

- Each instruction takes exactly 4 clock cycles
- ALU is combinational; registers and PC are sequential
- FSM cycles: `FETCH → DECODE → EXECUTE → WRITEBACK`

---

## Authors

| Name | Roll No |
|------|---------|
| Dharmendra R | cs24i1070 |
| Arulvel V | cs24i1027 |
| Anbuchezhiyan A | cs24i1069 |