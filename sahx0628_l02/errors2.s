/*
-------------------------------------------------------
l02_t02.s
-------------------------------------------------------
Author: Sushant Sah
ID: 169060628
Email: sahx0628@mylaurier.ca
Date: January 31st, 2025
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Copy data from memory to registers
ldr r3, =First
ldr r0, [r3]
ldr r3, =Second
ldr r1, [r3]

// Perform arithmetic and store results in memory
add r2, r0, r1
ldr r3, =Total
str r2, [r3] // Syntax Fix: When storing, address register needs brackets.

// Subtract Second from First
sub r2, r0, r1
ldr r3, =Diff // Syntax Fix: "Difff" had an extra F and should be "Diff"
str r2, [r3] // Syntax Fix: Same issue as prior, needs brackets.
// End program
_stop:
b _stop

.data // Initialized data section
First:
.word 4
Second:
.word 8
.bss // Uninitialized data section
Total:
.space 4 // Set aside 4 bytes for total
Diff:
.space 4 // ERROR: Should be 4 bytes, and not 2.

.end