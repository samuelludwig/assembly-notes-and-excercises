


    .text
main:
    li		$v0, 5		# read integer (n)
    syscall

    move 	$a0, $v0		# $a0 = n
    jal		fib				# jump to fib and save position to $ra
    nop

    move 	$a0, $v0	# $a0 = $v0
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 10		# $v0 = 10
    syscall

fib:
    # init
    sub		$a0, $a0, 4		# $a0 = $a0 - 4
    add		$t0, $0, 1		# $t0 = 1
    add		$t1, $0, 2		# $t1 = 2
    add		$t2, $0, 3		# $t2 = 3

loop:
    move 	$t0, $t1		# $t0 = $t1
    move 	$t1, $t2		# $t1 = $t2
    add 	$t2, $t0, $t1	# $t2 = $t0 + $t1
    sub		$a0, $a0, 1		# $a0 = $a0 - 1
    

    bgt		$a0, 0, loop	# if $a0 > 0 then go back to loop
    add		$v0, $0, $t2	# $v0 = $0 + $t2
    jr		$ra				# jump to $ra
