/*
-------------------------------------------------------
errors1.s
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
ldr r3, =A // Syntax Fix: Removed semi colon, as = is needed.
ldr r0, [r3]
ldr r3, B // Syntax Fix: Doesn't need colon.
ldr r1, [r3]
add r2, r1, r0 // Syntax Fix: No square brackets around r0.
// Copy data to memory
ldr r3, =Result // Assign address of Result to r3
str r2, [r3] // Store contents of r2 to address in r3
// End program
_stop:
b _stop

.data      // Initialized data section
A:
.word 4
B:
.word 8
.bss     // Uninitialized data section
Result:
.space 4 // Set aside 4 bytes for result

.end