# riscv-core-verilog
Building toward a RISC-V CPU core in verilog.

## About

This is a project in early development. Starting with basic logic modules to learn Verilog, the simulation toolchain (Icarus Verilog + GTKWave) and bash. This is being built toward the goal of a working RISC-V core.

## Progress

- AND gate + testbench
- OR gate + testbench
- 2-to-1 MUX + testbench
- Full Adder + testbench
- 4-bit Ripple Adder + testbench
- 4-bit b selector + testbench
- 4-bit add/sub unit + testbench

## Repo structure

sim/basics/ - foundational logic modules built while learning Verilog and the toolchain
sim/alu/ - build of components with an ALU as an end goal

## How to run a simulation

From inside a modules folder:
```
  iverilog -o <name>_test <name>.v <name>_tb.v
  vvp <name>_test
  gtkwave waveform.vcd
```
Note: some units require adding in other modules. In this case add all modules needed as:
```
<name>.v
```

## Next steps

Continuing to build up modules in Verilog with testbenches, register, ALU.

## Design notes

- The subtraction component uses two's compliment (invert B, add 1) reusing the ripple adder used for addition.

- The 4-bit add/ sub unit currently has a cout signal of 0 when A < B and a subtraction has occurred, this indicates a borrow. The circuit will need extra logic in the future for signed numbers but for unsigned numbers the borrow works fine.

## Future improvements

- Build a half adder and replace the first full adder in the ripple adder as a small optimisation.
