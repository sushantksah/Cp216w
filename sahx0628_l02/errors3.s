/*
-------------------------------------------------------
errors3.s
-------------------------------------------------------
Author: Sushant Sah
ID: 169060628
Email: sahx0628@mylaurier.ca
Date: January 31st, 2025
-------------------------------------------------------
Copies contents of one vector to another.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

.text // code section
// Copy contents of first element of Vec1 to Vec2
ldr r0, =Vec1
ldr r1, =Vec2
ldr r2, [r0]
str r2, [r1]
// Copy contents of second element of Vec1 to Vec2
add r0, r0, #4 // Error: increment was 2, changed to 4
add r1, r1, #4 // Error: increment was 2, changed to 4
ldr r2, [r0]
str r2, [r1]
// Copy contents of second element of Vec1 to Vec2
add r1, r0, #4  // Should be r0, not r1.
add r1, r1, #4
ldr r2, [r0]
str r2, [r1] // Should be r1, not r2.
// End program
_stop:
b _stop

.data // Initialized data section
Vec1:
.word 1, 2, 3
.bss // Uninitialized data section
Vec2:
.word 12 // Should be 12 bytes, not 6.

.end