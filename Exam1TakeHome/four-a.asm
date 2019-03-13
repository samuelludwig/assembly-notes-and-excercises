
######################################### PROBLEM 4A #########################################    
    
    .data   
    .text
main:
    li		$t1, 14		    # $t1 = 14
    addi	$t0, $t1, 33	# $t0 = 14 + 33
    
    li		$t3, 57		    # $t3 = 57
    addi	$t2, $t3, -29	# $t2 = 57 - 29

    mult	$t0, $t2		# $t0 * $t2 = Hi and Lo registers
    mflo	$a0				# copy Lo to $a0
    
    li		$v0, 1		    # print integer in $a0
    syscall                 #

    li		$v0, 10		    # exit program
    syscall                 #
    
    