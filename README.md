# Micro-Coded-Processor
This repository contains VHDL (VHSIC Hardware Description Language) code used to build a micro coded instruction set processor. 
The processor is based on the design contained in the textbook *Logic and Computer Design Fundamentals by M Morris Mano & Charles R. Kime*. 

The block level schematic for the processor is shown below.
![Block Diagram of Processor](/images/processorSchematic.png?raw=true "Block Diagram of Procsessor")

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


![Main Memory Contents](/images/memory.png?raw=true "Main Memory Contents")


# Control Memory
Control Memory is an array of 28 bit wide entries. Each entry in control memory represents a state in a given state machine that implements a given instruction. For a micro coded solution control memory must be loaded with the correct entries in order to implement all of the desired instructions. The control memory for the required instructions is shown below


![Control Memory Contents](/images/controlmem1.png?raw=true "Control Memory Contents")
![Control Memory Contents](/images/controlmem2.png?raw=true "Control Memory Contents")


# Functional Unit Encodings
In order for the processor to make use of the functional unit (for performing arithmetic, logic and shifting operations), the encodings of the desired operations are defined as follows.

![Functional Unit Encodings](/images/functionalUnitEncodings.png?raw=true "Functional Unit Encodings")


# Running a Test Program
In order to test the functionality of the processor, a simple test program was inserted into the main memory and the results of each operation were inspected to ensure the results were correct.

## Part 1
![Test Program 1](/images/1.png?raw=true "Test Program 1")

All instructions take a minimum of three clock cycles to be performed as they must ***fetch*** the instruction, ***decode*** the instruction and ***execute*** the instruction, each of which take one clock cycle each. However some instructions may take more than this depending on how many micro-operations are required to implement the instruction. 

**1. Unconditional Branch (contained in control memory 9) -  branches to start of user program (main memory 8).**
```
Branch + 8
```

**2. Load immediate value instruction (contained in control memory 8).**
```
Mov r0, #3` 
```

**3. Load value contained at memory address 3 into register 1.** 
```
Ldr r1, [r0]
```

Note upon fetching the instruction, the Program Counter ***(PC)*** is automatically incremented and the Instruction Latch ***(IL)*** bit is set which results in the instruction register ***(IR)*** latching the new value of the program counter. The decoding stage places the opcode into the control address register ***(CAR)*** and does **not** update the register file. 

Finally the instruction is executed and the Next Address ***(NA)*** in control memory points to control memory location zero (the location of the fetch next instruction micro operation), MuxC and MuxS are set accordingly to ensure this address is then placed into the CAR.

This fetch, decode and execute procedure is repeated for all instructions. 

## Part 2
![Test Program 2](/images/2.png?raw=true "Test Program 2")

**4. Add the contents of r0 and r1 together and store the result in r2. [3 + 6 = 9 = 1001]**
```
Add r2, r0, r1
```
 
**5. Increment the value contained in r2 and store the result in r3. [9++ = 10 = 1010]**
```
Inc r3, r2
```

**6. Logical NOT the value contained in r3 and store the result in r4. [!(000..1010) = (111..0101)]**
```
Not r4, r3 
```

This shows the processor making use of the functional unit in order to perform some arithmetic and logic operations on the values contained in the registers. The instruction contained at the memory address pointed to by the program counter is fetched, the opcode is then decoded and placed in the ***CAR***. The ***CAR*** then points into control memory to the implementation of the desired instruction. These entries in control memory contain the relevant FS encodings for their respective operations. The 5 bit FS code is then used to control the functional unit resulting in the desired operations being performed. The control memory also contains all of the required signals to instruct the datapath to ensure the correct values are present on the A and B ports for the relevant instructions.

The Source A, Source B and Destination registers are all specified in the instruction contained in main memory. As discussed, when this instruction is decoded, the opcode is placed into the CAR, however the encoding for each of the source and destination registers are also decoded. These signals are then used to drive the datapath during the execute stage resulting in the correct registers being used as source registers and destination registers. 

## Part 3
![Test Program 3](/images/3.png?raw=true "Test Program 3")

**7. Branch by 2 if zero is set**
```
BZ +2
```
- The conditional branch based on the Z flag is implemented starting at control memory 10.
- Mux S is used in order to allow the Z flag to be used as the logic input to the CAR. Thus if the Z flag is 1, the next address will be taken by the CAR as opposed to the default increment.
- Mux C is used to specify the source of the next address to be conditionally taken by the CAR and is set to 0 meaning the next address input will come from the control memory as opposed to the opcode.
- The next address of the control memory entry for BZ is that of an unconditional branch. 
  - This means that if the condition selected by Mux S is true, the next micro operation will be an unconditional branch by the offset  specified by a concatenation of the 6 bits, 3 from port A and port B respectively.
  - Otherwise, the CAR will auto increment and the micro operation at the auto incremented address is essentially an unconditional branch to the instruction fetch control memory address, meaning the next sequential instruction will be fetched and no branch will have been taken by the program counter.
- As the result of the previous operation was non-zero this branch will not be taken and thus the CAR will increment and proceed to fetch the next sequential instruction pointed to by the program counter.

**8. Add with immediate operand results in storing (r2 + 4) in r5. [9 + 4 = 13 = 1101]**
```
Adi r5, r2, #4
```

## Part 4
![Test Program 4](/images/4.png?raw=true "Test Program 4")

**9. Branch by 1 (B skip) - This is done to skip over the code that was to be executed if the conditional branch was taken.**
```
B + 1

```

**10. Move 3 into r6 to be used in the next operation.**
```
Mov r3, #6
```


## Part 5
![Test Program 5](/images/5.png?raw=true "Test Program 5")

**11. Shift r5 to the right by the number of times contained in r6.	[Sr 1101, 3 = 0110 ⇒ 0011 ⇒ 0001]**
```
Sr  r5, r6
```
The shift operation by an arbitrary number of bits is implemented using a micro-coded solution. The temporary register (R8) is used to maintain a counter of how many times the source register has been shifted. After each iteration of the shift, this counter is decremented. After each shift operation the value of the counter is examined and the micro-code branches to instruction fetch if the Z flag is set. Otherwise the micro code branches backwards three positions in order to repeat this process. 

## Part 6
![Test Program 6](/images/6.png?raw=true "Test Program 6")

Finally the value of the counter reaches zero after three iterations and the microcode branches and fetches the next instruction from main memory. 

**12. Place the value of 7 into R7 (No significance)**
```
Mov r7, #7
```

13 → inf: Repeatedly perform an unconditional branch backwards by one position (intentionally hang processor).
```
loop b loop
```


