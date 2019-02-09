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

    li      $v0, 10
    syscall

fib_write:
    move 	$t5, $a1		# initialize $t5 to the address of fib_arr
    addi	$t2, $0, 1		# fib(n - 1) = 1
    addi	$t3, $0, 1		# fib(n - 2) = 1
    addi	$t4, $0, 2		# initialize n to 2, as we defined the first two entries already

    sw		$t2, 0($t5)		# fib_arr[0] = 1
    addi	$t5, $t5, 4	    # point to the next open spot in the array
    sw		$t3, 4($t5)		# fib_arr[0] = 1 
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
    jr		$ra					# jump to $ra


# Print out the first x items of an int array
# Registers used:
#   $a0     - value of x
#   $a1     - address of array
#   $t0     - n
#   $t1     - address of array + offset
print_int_array:


print_loop:
    bge		$t0, $a0, print_int_array_done	# loop while n < x

    addi	$t1, $t1, 4			# point to the next spot in the array
    
    

print_int_array_done:
    jr		$ra					# jump to $ra
    


    