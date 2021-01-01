// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// while true:
// if kbd is 0, fill black (-1)
// else fill white (0)

(START)
@KBD // get kbd value
D=M
@WHITE
D; JEQ 

(BLACK)
@0 // pattern to fill
D=!A // -1
@R1
M=D
// write return address
@START
D=M
@R0
M=D
@DOFILL // go to subroutine
0; JMP

(WHITE)

@0 // pattern to fill
@R1
M=D
// write return address
@START
D=M
@R0
M=D
@DOFILL // go to subroutine
0; JMP



// subroutine: do fill of color
// in: r0 is return addr
// in: r1 is screen pattern
// clobber: count_left is count left
// clobber: current_addr is current location
// start at SCREEN and write pattern to screen to fill
(DOFILL)
	// init clobber data
	@SCREEN
	D=A
	@current_addr 
	M=D
	@8192 // number of blits to write
	D=A
	@count_left // store it here
	M=D

	(FILLLOOP) // subroutine jumps back until done
	@R1 // write one 
	D=M
	@current_addr // write one
	A=M
	M=D
	@current_addr // add 1 to current addr
	D=M
	D=D+1
	M=D

	@count_left // subtract one from count
	M=M-1 
	// check if we're done
	D=M
	@R0 // if so, jump to M[R0]
	A=M
	D; JEQ

	// if not, continue filling
	@FILLLOOP
	0; JMP

// end
(END)
@END
0; JMP


