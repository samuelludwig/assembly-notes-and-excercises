    .data

    .text

main:

define_e:
    # args: ($f12 = level of precision)
    # return: ($f0 = approximation of e)
    # e = 1 + x + ((x^2)/2!) + ((x^3)/3!)
    move.s  $f3, $f12       # init $f3 to level of precision
    li.s    $f4, 

e_loop:

e_loop_done:
    jr		$ra					# jump to $ra
    

exp:    # args: ($f12 = float(x)), ($a1 = int(exp_val))
        # return (x)^(exp_val)
    move.s 	$f4, $f12		# $f0 = float(x)
    move.s  $f5, $f4        # $f1 = total, init to x
    move 	$t1, $a1		# $t1 = exponent value
    li		$t2, 0		    # $t2 = exponent counter
    
exp_loop:
    bge		$t2, $t1, exp_loop_done	# if $t2 >= $t1 then exp_loop_done
    mult.s  $f5, $f5, $f4
    addi	$t2, $t2, 1		# $t2 = $t2 + 1

exp_loop_done:
    move 	$f0, $f4		# move total into return register $f0 
    jr		$ra				# return to $ra


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