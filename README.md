# FPGA Hardware Soundboard (SystemVerilog)

## Project Overview
This project is a hardware-native soundboard designed in **SystemVerilog** for the **Xilinx Artix-7 FPGA (Basys 3)**. Unlike microcontroller-based soundboards, this implementation uses a custom-built digital logic architecture to handle button conditioning, memory addressing, and audio synthesis via Pulse Width Modulation (PWM).

This project demonstrates core RTL design principles including:
* **Finite State Machines (FSM)** for deterministic control logic.
* **Asynchronous Signal Conditioning** (Debouncing) for mechanical inputs.
* **Digital-to-Analog Conversion (DAC)** through high-frequency PWM engines.
* **SoC Integration** by interfacing logic with Block RAM/ROM.

## Repository Structure
```text
Soundboard_FPGA/
├── rtl/
│   ├── top_level.sv        # System-level integration & I/O mapping
│   ├── debouncer.sv        # FSM-based button signal conditioning
│   ├── audio_fsm.sv        # State machine for track selection
│   └── pwm_engine.sv       # 8-bit PCM to PWM DAC logic
├── sim/
│   └── tb_top_level.sv     # Testbench for GTKWave/ModelSim verification
├── constraints/
│   └── basys3_master.xdc   # Xilinx Artix-7 pin constraints
├── assets/
│   └── sounds.mem          # Hexadecimal audio ROM data
└── scripts/
    └── mp3tomem.py         # Design collateral: Python audio converter
