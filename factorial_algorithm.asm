fact:   # args: ($a0 = y)
        # return ($v0 = y!)
    # int sum = y;
    # for (int i = y-1; i > 0; i--) {
    #   sum *= i;
    # }
    # return sum; 
    move 	$t0, $a0		# $t0 = y
    move 	$t1, $t0		# $t1 = sum, init to value of y
    subi	$t2, $t0, 1	    # $t2 = i, init to value of (y-1)

fact_loop:
    ble		$t2, 0, fact_loop_done	# if i <= 0 then jump to end of loop
    
    mult	$t1, $t2			    # sum *= i
    mflo	$t1					    # 
    
    subi	$t2, $t2, 1			    # i--    
    j		fact_loop			    # jump back to top
    
fact_loop_done:
    move 	$v0, $t1		# load sum into $v0 and return
    jr		$ra				# jump to $ra