# adds 6 & 12
main:
	li		$t1, 6			# $t1 = 6
	addi	$t0, $t1, 12	# $t0 = $t1 + 12

	li	$v0, 10
	syscall