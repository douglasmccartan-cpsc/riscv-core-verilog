# riscv-core-verilog
A RISC-V CPU core built from the ground up in Verilog, starting from logic gates.

**Status:** In progress. Building and verifying one mode at a time.

## About

I'm building this to better understand how a CPU works at the hardware level.

## Progress

- [x] AND gate + testbench
- [x] OR gate + testbench
- [x] 2-to-1 MUX + testbench
- [x] Full Adder + testbench
- [x] 4-bit Ripple Adder + testbench
- [x] 4-bit B selector + testbench
- [x] 4-bit add/sub unit + testbench
- [x] Parameterised N-bit register with enable and synchronous reset + testbench
- [ ] Counter
- [ ] ALU

## Repo structure

- `sim/basics/`: foundational logic modules built while learning Verilog and the toolchain
- `sim/alu/`: building components towards an ALU
- `sim/sequential/`: clocked modules (register, counter)

## How to run a simulation

From inside a modules folder:
```
  iverilog -o <name>_test <name>.v <name>_tb.v
  vvp <name>_test
  gtkwave waveform.vcd
```

Some modules instantiate others. In that case list every file needed, for example:
```
iverilog -o addsub_test addsub.v ripple_adder.v full_adder.v addsub_tb.v
```

## Design notes

- The subtraction component uses two's complement (invert B, add 1) reusing the ripple adder used for addition.

- In the 4-bit add/sub unit, `cout` is 0 when A < B and a subtraction has occurred. This indicates a borrow, which works for unsigned numbers. Signed numbers will need extra logic.
  
- The register resets synchronously, so reset is only checked on the clock edge, and reset takes priority over enable.

## Next steps

Counter, then the ALU and register file, working towards a simple RISC-V datapath.

## Future improvements

- Replace the first full adder in the ripple adder with a half adder as a small optimisation.
