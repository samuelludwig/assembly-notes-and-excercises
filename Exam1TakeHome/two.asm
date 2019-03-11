    .data
    .text   
main:
    li		$t5, 35		# $t5 = 35
    li		$t6, 88		# $t6 = 88
    li		$t7, 232    # $t7 = 232

    addi	$t1, $0, 536	# $t1 = 0 + 872
    sub	    $t1, $t1, $t5	# $t1 -= 35
    sub	    $t1, $t1, $t6	# $t1 = $t1 - 88
    sub		$a0, $t1, $t7	# $a0 = $t1 - $t7
    

    li		$v0, 1		    # $v0 = 1; print integer
    syscall                 #

    li		$v0, 10		    # $v0 = 10; exit
    syscall                 #