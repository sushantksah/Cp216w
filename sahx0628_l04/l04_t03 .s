/*
-------------------------------------------------------
list_demo.s
-------------------------------------------------------
Author:  David Brown
ID:      123456789
Email:   dbrown@wlu.ca
Date:    2023-07-31
-------------------------------------------------------
A simple list demo program. Traverses all elements of an integer list.
r0: temp storage of value in list
r2: address of start of list
r3: address of end of list
r4: count of total values in the list
r5: # of bytes in the lsit
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list

ldr r6, [r2] 		// Init. Min. Value in r6
ldr r7, [r2]  		// Init. Max Value in r7
add r2, r2, #4 		// Move to the second value within the list 

Loop:
cmp r2,r3			// Compares current address with the end of the list
bge _stop			// Stop at the end of the list

ldr r0, [r2], #4	// Load and Increment

cmp r0, r6 			// Compares new minimum with the current minimum
movlt r6, r0		// Updates if new minimum is smaller than current minimum
cmp r0, r7			// Compares new max with current max
movgt r7, r0 		// Updates if new max is larger than current max

b Loop				// Keeps Repeating untill all values are checked

_stop:
b _stop

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end