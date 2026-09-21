# riscv-core-verilog
Building toward a RISC-V CPU core in verilog.

## About

This is a project in early development. Starting with basic logic modules to learn Verilog, the simulation toolchain (Icarus Verilog + GTKWave) and bash. This is being built toward the goal of a working RISC-V core.

## Progress

- AND gate + testbench
- OR gate + testbench
- 2-to-1 MUX + testbench
- Full Adder + testbench

## Repo structure

sim/basics/ - foundational logic modules built while learning Verilog and the toolchain

## How to run a simulation

From inside a modules folder:
```
  iverilog -o <name>_test <name>.v <name>_tb.v
  vvp <name>_test
  gtkwave waveform.vcd
```

## Next steps

Continuing to build up modules in Verilog with testbenches, adder, register, ALU.
