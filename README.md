# LFSR
Linear Feedback Shift Register  Introduction: -  What is LFSR?  - The LFSR is a shift register that has some of its outputs together in exclusive-OR or exclusive-NOR configurations to form a feedback path. - The initial content of the shift register is referred to as seed. (Note: any value can be a seed except all 0’s to avoid lookup state). - Lookup state is the state in which shift register values are zeros all the time while shifting and xoring). - Feedbacks can be comprising of XOR gates or XNOR gates
LFSR Applications
1)	Pattern Generators
2)	Encryption
3)	Compression
4)	CRC
5)	Pseudo-Random Bit Sequences (PRBS)



LFSR Specification and Operation:
1.	Initialize the shift registers using Asynchronous Reset with seed 
2.	Allow the LFSR to operate for 8 cycles (LFSR Mode) then stop and shift out the content of the 4 registers through OUT signal (R3 > R2 > R1 > R0 > OUT) (Shift Mode).
3.	Counter is responsible for counting to 8 then flag a signal to stop the LFSR.
4.	Valid signal is high when the output is valid, otherwise low.
5.	All outputs are registered.


