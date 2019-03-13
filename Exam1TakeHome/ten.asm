
######################################### PROBLEM 10 #########################################

    .data
arr:    .word   0 : 12  # declare array 12 spaces long, all values init to 0

    .text
main:
    li		$t0, 0		# $t0 = 0 <- counter
    li		$t1, 26		# $t1 = 26 <- starting val for consecutive integers
    li		$t2, 12		# $t2 = 12 <- arr.len
    la		$t9, arr	# init t9 to base address of arr, arr[0] 
    
fill_array_loop:
    sw		$t1, 0($t9)		            # store value into arr[i] 
    addi	$t0, $t0, 1			        # inc counter
    addi	$t1, $t1, 1			        # inc value for next arr[i]
    addi	$t9, $t9, 4			        # increment offset of arr by 4, move to arr[i+1]
    blt		$t0, $t2, fill_array_loop	# if counter < arr.len then continue looping
                                        # else, we are done
    
exit:
    li		$v0, 10		# exit program
    syscall             #
    
    