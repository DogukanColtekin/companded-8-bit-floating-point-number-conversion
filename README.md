# 8-bit Floating Point to Binary Conversion and Display on FPGA

This project implements a decoder that converts an 8-bit simplified floating point number into its binary equivalent, then displays the decimal value on four 7-segment LED displays of the Nexys3 FPGA board. The design is written in VHDL using mixed styles.



## Project Details

**VHDL Standard**: VHDL-93  
**Target FPGA**: Xilinx Spartan-6 (XC6LX16-CS324) on the Nexys3 board  
**Input**: 8-bit floating point number with 1 sign bit (fixed at 0), 3 exponent bits, and 4 mantissa bits  
**Output**: Decimal representation of the floating point value shown on four 7-segment displays  



## Overview

- Converts the 8-bit floating point input into an 11-bit binary number using the formula:  
  \[
  \text{Value} = (1 - 2 \times S) \times M \times 2^E
  \]  
  where \( S \) is the sign bit, \( M \) is the mantissa, and \( E \) is the exponent.

- Converts the 11-bit binary number to 4-digit BCD using the shift-and-add-3 algorithm.

- Displays the four decimal digits on multiplexed 7-segment displays via a dedicated driver.

- Uses a 7-bit counter running at 2 Hz to cycle through all possible floating point values.


## Features

**Floating Point Expansion** — Decodes 8-bit floating point number to binary.  
**Binary to BCD Conversion** — Efficient shift-and-add-3 algorithm.  
**7-Segment Display Interface** — Outputs to Nexys3’s four-digit 7-segment display using time multiplexing.  
**Structural and Dataflow VHDL** — Behavioral style is avoided as per lab requirements.  
**2 Hz Input Counter** — Automatically cycles through all 7-bit floating point combinations.


## Usage

1. Open the project in Xilinx ISE or your preferred VHDL environment.  
2. Add all VHDL source files, including your main design and the provided seven-segment driver.  
3. Assign pins using the provided constraints file or manually according to your Nexys3 board setup.  
4. Synthesize, implement, and generate the bitstream.  
5. Upload the bitstream to the Nexys3 board (Adept may be needed).  
6. Observe the 7-segment displays, which will cycle through and show all possible values of the 7-bit floating point input expanded to decimal.


## Notes

- The sign bit is fixed to 0 (positive numbers only) in this implementation.  
- The decimal point on the seven-segment display is not used and is turned off.  
- Multiplexing of the displays is handled by the provided driver component.  
- The 2 Hz counter ensures slow, observable cycling through all floating point values.
