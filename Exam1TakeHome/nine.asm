    .data
arr:    .word  84, 31, 24, -4, 12, 76

    .text
main:

arr_plus_ten:
    la		$t0, arr		# $t0 = base address of arr
    li		$t8, 6		    # $t8 = arr length
    li		$t7, 0		    # counter, init to 0    

plus_loop:
    lw		$t1, 0($t0)	            # $t1 = arr[i]
    addi	$t1, $t1, 10	        # $t1 = $t1 + 10
    sw		$t1, 0($t0)	            # arr[i] = (arr[i] + 10)
    addi	$t0, $t0, 4		        # offset += 4 to get to next address 
    addi	$t7, $t7, 1		        # inc counter
    bgt		$t8, $t7, plus_loop	    # if counter > arr length then plus_done
    j		plus_done				# else jump to plus_done
    
plus_done:
add_array:
    la		$t0, arr		# $t0 = base address of arr
    li		$t8, 6		    # $t8 = arr length
    li		$t5, 0		    # $t5 = sum, init to 0
    li		$t7, 0		    # counter, init to 0

add_loop:
    lw		$t1, 0($t0)		    # $t1 = arr[i] 
    add		$t5, $t5, $t1		# $t5 = $t5 + $t1
    addi	$t0, $t0, 4			# increment base offset by 4
    addi	$t7, $t7, 1			# $t7 = $t7 + 1
    bgt		$t8, $t7, add_loop	# if counter > arr.len then add_done
    j		add_done			# jump to add_done
        
add_done:
move 	$a0, $t5		# $a0 = $t5
li		$v0, 1		    # print integer in $a0
syscall                 #


exit:
    li		$v0, 10		# exit program
    syscall             #
    