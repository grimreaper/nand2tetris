// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// set R2 to 0
@0
D=A
@R2
M=D

// while r1 is non-zero
(DOLOOP)
@R1
D=M
@END
D; JEQ

// add r0 to r2
(DOADD)
@R0
D=M
@R2
D=D+M
M=D

// we did it once: r1 = r1 -1
@R1
D=M-1
M=D

@DOLOOP
0; JMP

// infinite loop to end the program
(END)
@END
0;JMP
