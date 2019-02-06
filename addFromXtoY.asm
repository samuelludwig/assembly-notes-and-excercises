
main:   
    li  	$t0, 0		# $t0 = 0 <- sum holder
    li		$t1, 0		# $t1 = 0 <- incrementer
    li		$t2, 43		# $t2 = 43 <- limit
    
add_loop:
    add		$t0, $t1, $t0		# $t0 = $t1 + $t0
    addi	$t1, $t1, 1		    # $t1++
    bge		$t2, $t1, add_loop	# if $t2 <= $t1 then add_loop
      
done:
    li		$v0, 10		# $v0 = 10
    syscall
    