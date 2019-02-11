    .data
    
    .text
main:
    li		$t0, 14		# $t0 = 14
    li		$t1, 3		# $t1 = 3
    
    div		$t0, $t1	# $t0 / $t1
    mflo	$t2			# $t2 = floor($t0 / $t1) 
    mfhi	$t3			# $t3 = $t0 mod $t1 
    
    move 	$a0, $t2	# $a0 = $t2
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 10		# $v0 = 10
    syscall