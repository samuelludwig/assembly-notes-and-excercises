    .data
add_nums:   .word   31714, 52, 832, 1137, 9008, 8917, 754111, 5413, 7862, 121, 390
eod:        .word   0

    .text
main:
    la		$a0, add_nums		    # get size of add_nums 
    la		$a1, eod		        # 
    jal		get_word_arr_size		# 
    nop                             #

    

    li		$v0, 10		            # exit
    syscall                         #

get_word_arr_size:
# $a0 = location of array
# $a1 = location of next item after array
# returns amount of elements inside the array in $v0
    move 	$t0, $a0		# $t0 = $a0
    move 	$t1, $a1		# $t1 = $a1

    sub		$t2, $t1, $t0	# $t2 = difference of address locations
    srl     $v0, $t2, 2     # $v0 = difference of addresses divided by 4


add_num_arr:
# $a0 = address of array
# $a1 = number of elements in array
# calls add_32 for each element in an array, no value is returned
    move 	$t0, $a0		# $t0 = $a0
    move 	$t1, $a1		# $t1 = $a1

add_32:
# adds 32 to integer supplied in $a0 and prints the value, no value is returned
    addi	$a0, $a0, 32			# $a0 += 32

    li		$v0, 1		            # print integer in $a0
    syscall                         #

    li		$a0, 10		        # $a0 = 10 = newline in ASCII
    li		$v0, 11		            # print newline
    syscall                         #

    jr		$ra					    # jump to $ra
    
