/*
-------------------------------------------------------
sahx0628_A2.s
-------------------------------------------------------
Author: Sushant Sah
ID: 169060628
Email: sahx0628@mylaurier.ca
Date: 2/28/2025
-------------------------------------------------------
Assignment 2 Code Submission
-------------------------------------------------------
*/
.org 0x1000
.text      

.global _start
_start:

// Loading Registers
ldr r1, =Data // Data point to be incremented 
ldr r2, =lastData // Last value in data 
ldr r3, =0x00001500 // location in which we want to start storing
ldr r5, =ASCII_table // address of the ASCII table

// Loop comparing the two tables/lists until they reach the end
Loop:
	cmp r1, r2 // Compares r1 (which holds the current data point) to r2 (End of the data)
	beq _stop // stops the loop if the end of the data is reached 
	
	ldr r4, [r1], #4 // loops through data and puts it in r4, then increments by 4 bytes
	ldrb r6, [r5, r4] // Load the ASCII converted byte from the table into r6
	strb r6, [r3], #1 // Store the data from r6 into r3, incrementing r3 by 1 so the next byte can be stored. 
	
	b Loop // Continue looping

// called to end the loop
_stop:
b _stop

.data
.align
Data:
	.word 0xA, 0xB, 0xC, 0x1, 0x2, 0x4, 0x9, 0x3
	.word 0xD, 0xF, 0xE, 0x7, 0x5, 0x6, 0x8, 0x0
lastData:

ASCII_table:
    .byte 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 
    .byte 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46 
	
endTable: 

.end