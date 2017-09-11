# Micro-Coded-Processor
This repository contains VHDL (VHSIC Hardware Description Language) code used to build a micro coded instruction set processor. 

# Processor Hierarchy
- 9 Register Datapath
  - Register File
    - 9x16bit Registers
    - MuxA [9 to 1] - Selects Source A
    - MuxB [9 to 1] - Selects Source B
    - Decoder [4 to 9] - Selects Destination Register
  - Functional Unit
    - 16 bit shifter
      - 16x1bit One Position Shifters
    - ALU
      - Logic Unit
        - 16x1Bit Logic Unit
          - Mux [4 to 1]  -  Operation Picker
      - Arithmetic Unit
        - 16 Bit Ripple Adder
          - 16 x 1Bit Full Adder
      - Mux [2 to 1] Logic/Arithmetic Unit Picker
    - Mux [2 to 1] - Shifter/ALU Picker
  - MuxB - Selects Immediate Operand / Source B on B bus
  - MuxD - Selects Output from Functional Unit / Memory
  - MuxM - Selects Memory Address from PC / A Bus
  - Main Memory 
- Micro Programmed Control
  - PC
  - Branch Unit
    - Mux [8 to 1]
  - IR
  - MuxC[2 to 1]
  - Control Address Register
  - Control Memory

# Main Memory
Main Memory contains all of the instructions of our user program. An entry in Main Memory is 16 bits wide containing a 7 bit opcode, and three 3 bit encodings of registers - one for the destination register (DR) and one for each of the two source registers (SA, SB).
The example program contained in main memory is shown below. This is the program that will be tested on the processor. 


# Control Memory
Control Memory is an array of 28 bit wide entries. Each entry in control memory represents a state in a given state machine that implements a given instruction. For a micro coded solution control memory must be loaded with the correct entries in order to implement all of the desired instructions. The control memory for the required instructions is shown below
