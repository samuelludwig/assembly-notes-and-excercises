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