/*
-------------------------------------------------------
l05_t01.s
-------------------------------------------------------
Author: Sushant Sah
ID: 169060628
Email: sahx0628@mylaurier.ca
Date:    2025-02-28
-------------------------------------------------------
Does a running total of an integer list.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r1, =Data    // Store address of start of list
ldr    r2, =_Data   // Store address of end of list
bl     list_total   // Call subroutine - total returned in r0

_stop:
b      _stop

//-------------------------------------------------------
list_total:
/*
-------------------------------------------------------
Totals values in a list.
Equivalent of: int total(*start, *end)
-------------------------------------------------------
Parameters:
  r1 - start address of list
  r2 - end address of list
Uses:
  r3 - temporary value
Returns:
  r0 - total of values in list
-------------------------------------------------------
*/

// your code here
mov r0, #0 // Intialize r0 as total 


Loop: 
	cmp r1, r2 // Compare address with end address
	beq loopEnd // If end, exit. 
	
	ldr r3, [r1], #4 // Load value from list, increment address (+4)
	add r0, r0, r3 // Add value to total stored in r0
	
	b loop // Repeat Loop
	
loopEnd: 
	bx lr // return with total stored in r0


.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end