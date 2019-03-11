    .data
    .text   
main:
    addi	$t1, $0, 872	# $t1 = 0 + 872
    addi	$t1, $t1, 37	# $t1 += 37
    addi	$a0, $t1, 81	# $a0 = $t1 + 81

    li		$v0, 1		    # $v0 = 1; print integer
    syscall                 #

    li		$v0, 10		    # $v0 = 10; exit
    syscall                 #
    