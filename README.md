# Lab-3-4-Bit-Adder-with-7-Segment-Display

## Project Description
This project implements a 4-bit Carry Look-Ahead Adder (CLA) and displays the decimal result on the two rightmost digits of the Basys3 FPGA 7-segment display.

The design integrates:
- 4-bit CLA adder  
- Binary-to-BCD conversion  
- BCD-to-7-segment decoder  
- Two-digit multiplexed display driver  

The design was verified through simulation and implemented on the Basys3 FPGA board.


## Simulation Instructions
1. Open Vivado and create a new project.  
2. Add the source files:  
   - `adder4_cla.v`  
   - `bin5_to_bcd.v`  
   - `seven_seg_decoder.v`  
   - `seven_seg_mux.v`  
   - `adder7seg_top.v`  
3. Add the testbench:  
   - `tb_adder7seg_top.v`  
4. Run **Behavioral Simulation** to verify the correct decimal output for different input combinations.


## FPGA Implementation Instructions
1. Assign FPGA pins on the Basys3 board:  
   - **Inputs:**  
     - Operand A → `SW0–SW3`  
     - Operand B → `SW4–SW7`  
   - **Outputs:**  
     - Decimal sum (0–30) → Two rightmost 7-segment digits (`AN0`, `AN1`)  
     - Segments → (`CA–CG`) and decimal point (`DP`)  
2. Run **Synthesis → Implementation → Generate Bitstream** in Vivado.  
3. Program the Basys3 board using the generated bitstream.  
4. Verify functionality by toggling switches:  
   - Example: A=5, B=4 → Display shows `09`  
   - Example: A=9, B=9 → Display shows `18`  
   - Example: A=15, B=15 → Display shows `30`
