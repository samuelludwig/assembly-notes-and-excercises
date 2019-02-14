#
#
#
# Write a MIPS assembly language program that asks the user for 20 numbers, bubblesorts them, and then prints them out in ascending order.
#
#
#
# 
    .data
int_array:      .space 80       # declare 80 bytes of storage to hold 20 integers
input:          .space 1024

    .text
main:
    li		$t9, 0		        # will be counter for numbers taken in 
    la		$s0, int_array	    # load base address of array into register $s0
    li		$s2, 4              # load 4 into $s2 for calculating offsets
    ## begin atoi algorithm
    la		$a0, input	 
    li		$a1, 1024		             
    li		$v0, 8		                # take in string of numbers
    syscall
    la		$t0, input		            # load the address of the string into $t0 --> $t0 = string S
    li 	    $t2, 0	                    # $t2 = 0, will be D
    addu    $t9, $t9, 1                 # inc counter
sum_loop:
    lb      $t1, ($t0)                  # load the byte at address S into $t1, 
    addu    $t0, $t0, 1                 # and increment the value at S.
    blt		$t1, 48, end_sum_loop	    # if $t1 != 0-9, branch out of loop. (ASCII code for '0' is 48)
    mul     $t2, $t2, 10                # t2 *= 10.
    sub		$t1, $t1, '0'		        # $t1 -= '0'.
    add		$t2, $t2, $t1		        # $t2 += $t1. 
    b		sum_loop			        # and repeat the loop.
end_sum_loop:
    sw		$t2, ($s0)		# store the first number into the first spot in the array
  
next_sum:  
    addu    $t9, $t9, 1                 # inc counter
    addu    $s0, $s0, 4     # point $s0 to the next spot in the array  
    addu    $t0, $t0, 1     # point to the start of the next number in the string
    li 	    $t2, 0	                    # $t2 = 0, will be D
    
next_sum_loop:
    lb      $t1, ($t0)                  # load the byte at address S into $t1, 
    addu    $t0, $t0, 1                 # and increment the value at S.
    blt		$t1, 48, end_next_sum_loop	    # if $t1 != 0-9, branch out of loop. (ASCII code for '0' is 48)
    mul     $t2, $t2, 10                # t2 *= 10.
    sub		$t1, $t1, '0'		        # $t1 -= '0'.
    add		$t2, $t2, $t1		        # $t2 += $t1.
    b		next_sum_loop			        # and repeat the loop.
end_next_sum_loop: 
    blt $t9, 20, next_sum   # break when counter == 20

end_next_sum:
### end intake of numbers

###################################################################################################################
bubblesort:
    bgt		offset($s0), offset+4($s0), greater	# if offset($s0) > offset+4($s0) then swap
    blt		offset($s0), offset+4($s0), less	# if offset($s0) > offset+4($s0) then move to next value
greater:
                                            ## begin swap algorithm  
    move 	$t1, offset($t0)		        # 1. set a register to hold the value of the left integer in the array
    move 	offset($t0), offset+4($t0) 	    # 2. move the value of the right integer into the left integer   
    move 	offset+4($t0), $t1		        # 3. move the value in the register to the right integer
                                            ## end swap algorithm
    addu    offset, offset, 4       # add 4 to offset to move to next value
    j		bubblesort				# jump to bubblesort
less:
    addu    offset, offset, 4       # add 4 to offset to move to next value
    j		bubblesort				# jump to bubblesort
end_bubblesort:
###################################################################################################################

###################################################################################################################

print_out:



done:
    li		$v0, 10     # exit program 
    syscall




# Bubblesort algorithm:
#   In loop:
#       Step 1. 