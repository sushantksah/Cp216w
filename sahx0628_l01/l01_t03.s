/*
-------------------------------------------------------
l01.s
Assign to and add contents of registers.
-------------------------------------------------------
Author:  Sushant Sah
ID:      169060628
Email:   sahx0628@mylaurier.ca
Date:    2025-01-17
-------------------------------------------------------
*/
.org    0x1000  // Start at memory location 1000
.text           // Code section
.global _start
_start:

mov r0, #9       // Store decimal 9 in register r0
mov r1, #0xE     // Store hex E (decimal 14) in register r1
mov r3, #8		 // Store the decimal 8 in register 3 (r4)
mov r4, #4 		 // Store the decimal 8 in register 4 (r4)

add r2, r1, r0  // Add the contents of r0 and r1 and put result in r2
add r3, r3, r3 // Add the contents of r3 to itself, put the result in r3
add r4, r4, #5 // Add the contents of r4 to the immidiate #5, put the result in r4
// End program
_stop:
b   _stop

.end