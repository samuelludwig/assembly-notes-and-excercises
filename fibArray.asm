# Puts the first x amount of numbers of the fibonacci sequence into an array
# Registers used:
#   $a0     - value of x
#   $a1     - address of array
#   $t1     - fib(n)
#   $t2     - fib(n - 1)
#   $t3     - fib(n - 2)
#   $t4     - value of n
#   $t5     - address of array + offset

    .data
fib_arr:  .space 1024

    .text
main:
    li      $a0, 10         # x
    la		$a1, fib_arr	# output of fib will go into fib_arr 
    jal		fib_write		# jump to fib_write and save position to $ra
    nop                     #
    
    li		$a0, 10		    # x
    la		$a1, fib_arr	# printing x values from fib_arr
    jal		print_int_array	# jump to print_int_array and save position to $ra
    nop                     #

    li      $v0, 10         # exit program
    syscall                 #

fib_write:
    move 	$t5, $a1		# initialize $t5 to the address of fib_arr
    addi	$t2, $0, 1		# fib(n - 1) = 1
    addi	$t3, $0, 1		# fib(n - 2) = 1
    addi	$t4, $0, 2		# initialize n to 2, as we defined the first two entries already

    sw		$t2, 0($t5)		# fib_arr[0] = 1
    addi	$t5, $t5, 4	    # point to the next open spot in the array
    sw		$t3, 0($t5)		# fib_arr[1] = 1 
    addi	$t5, $t5, 4	    # point to the next open spot in the array   

write_loop:
    bge		$t4, $a0, fib_write_done	# loop while n < x
    add		$t1, $t2, $t3		        # fib(n) = fib(n - 1) + fib(n - 2)
    sw		$t1, 0($t5)		            # put fib(n) into the array 
    addi	$t5, $t5, 4			        # point to the next open spot in the array
    
    move 	$t3, $t2		            # fib(n - 2) = fib(n - 1)
    move 	$t2, $t1		            # fib(n - 1) = fib(n)
    addi	$t4, $t4, 1			        # n++
    
    j		write_loop				    # jump back to top of write_loop
    
fib_write_done:
    jr		$ra					        # jump to $ra


# Print out the first x items of an int array
# Registers used:
#   $a0     - value of x
#   $a1     - address of array
#   $t0     - n
#   $t1     - address of array + offset
#   $t5     - preserves value of $a0
print_int_array:
    move 	$t5, $a0		    # preserve $a0
    addi	$t0, $0, 0			# initialize n to 0
    move 	$t1, $a1		    # initialize $t1 to $a1

print_loop:
    bge		$t0, $t5, print_int_array_done	# loop while n < x
    lw		$a0, 0($t1)		                # put arr[i] into $a0 

    li		$v0, 1		        # print what's in $a0 (arr[i])
    syscall                     #

    li		$a0, 32		        # print a space character between each number
    li		$v0, 11		        # 
    syscall                     #
    
    addi	$t1, $t1, 4			# point to the next spot in the array
    addi	$t0, $t0, 1			# n++
    
    j		print_loop			# jump to print_loop

print_int_array_done:
    move 	$a0, $t5		    # restore $a0
    jr		$ra					# jump to $ra
    


    