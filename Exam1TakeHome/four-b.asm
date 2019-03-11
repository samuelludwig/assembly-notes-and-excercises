    .data
is_msg:     .asciiz "the product is "

    .text
main:

print_msg:
    la		$a0, is_msg	# point $a0 to is_msg 
    li		$v0, 4		# print string in $a0
    syscall             #

print_prod:
    li		$t0, 34		# $t0 = 34
    li		$t1, 87		# $t1 = 87
    li		$t2, 5		# $t2 = 5
    
    mult	$t0, $t1	# $t0 * $t1 = Hi and Lo registers
    mflo	$t3			# copy Lo to $t3
    
    mult	$t2, $t3	# $t2 * $t3 = Hi and Lo registers
    mflo	$a0			# copy Lo to $a0
    
    li		$v0, 1		# print integer in $a0
    syscall             #

exit:
    li		$v0, 10		# exit program
    syscall             #