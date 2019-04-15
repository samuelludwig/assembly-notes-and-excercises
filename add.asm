# Samuel Ludwig
# adds 20 & 19
	.data
sum: 	.word	0

	.text
main:
	li		$t1, 20			# $t1 = 6
	addi	$t0, $t1, 19	# $t0 = $t1 + 12

	sw		$t0, sum		# $t0 -> sum
	
	li	$v0, 10				# exit
	syscall