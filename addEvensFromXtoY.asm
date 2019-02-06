# naive approach

main:   
    li  	$t0, 0		# $t0 = 0 <- sum holder
    li		$t1, 2		# $t1 = 0 <- incrementer (X)
    li		$t2, 301	# $t2 = 43 <- limit (Y)
    
add_loop:
    add		$t0, $t1, $t0		# $t0 = $t1 + $t0
    addi	$t1, $t1, 2		    # $t1+=2
    bge		$t2, $t1, add_loop	# if $t2 <= $t1 then add_loop
      
done:
    li		$v0, 10		# $v0 = 10
    syscall
    