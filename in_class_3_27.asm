    .data
fib_arr:    .word   0
sqrt_arg:   .double 172.39
init_guess: .double 21.0
coeff:      .double 0.5

    .text
main:
    li		$a0, 12		    # get_fib(12)
    la		$a1, fib_arr	# 
    jal		get_fib			# 
    nop                     #

    l.d     $f12, sqrt_arg      # sqrt(172.39, 21.0, 0.5)
    l.d     $f14, init_guess    #
    l.d     $f16, coeff         #
    jal		sqrt				# 
    nop                         #

    mov.d 	$f12, $f0		# print result of sqrt(172.39, 21.0, 0.5) 
    li		$v0, 3		    # 
    syscall                 #

    j		exit			# jump to exit

### SQUARE ROOT FUNCTION ###
# $f12 = x (double > 0)
# $f14 = initial_guess
# $f16 = constant 0.5
# Returns in $f0 => square root of x
sqrt:
    mov.d   $f0, $f12           # $f0 = x
    mov.d   $f2, $f16           # $f2 = (0.5)
    mov.d   $f10, $f14          # $f10 = initial guess, G(0) <- old_guess
    sub.d   $f8, $f8, $f8       # init $f8 to 0 <- will be our new guess

sqrt_loop:
    div.d   $f6, $f0, $f10      # $f6 = (a/old_guess)
    add.d   $f4, $f10, $f6      # $f4 = (old_guess + (a/old_guess))
    mul.d   $f8, $f2, $f4       # new_guess = (0.5) * (old_guess + (a/old_guess))
    
    c.eq.d	$f8, $f10	        # if new_guess == old_guess, then proceed to print_s
    mov.d   $f10, $f8           # else: old_guess = new_guess,
    bc1f    sqrt_loop			# and branch back to s_sqrt_loop

sqrt_end:
    mov.d   $f0, $f8            # $f0 = sqrt
    jr		$ra					# jump to $ra
     


### FIB_GET FUNCTION ###
# $a0 = x (int > 2)
# $a1 = address of array (int)
# Returns nothing => stores first x fibbonacci numbers at address of array
get_fib:
    move 	$t0, $a0		# $t0 = x
    move 	$t1, $a1		# $t1 = address of array
    li		$t2, 1		    # $t2 = fib(n-1)
    li		$t3, 1		    # $t3 = fib(n)
    li		$t4, 2		    # $t4 = counter, init to two, because we automatically store the first 2 numbers

    sw		$t3, 0($t1)		# store first fib(n) -> 1 at address[0]
    addi	$t1, $t1, 4		# increment $t1 by 4, moving to next word in array
    sw		$t2, 0($t1)		# store second 1 at address[1]

fib_loop:
    addi	$t1, $t1, 4		    # increment $t1 by 4, moving to next word in array
    add		$t5, $t3, $t2	    # $t5 = fib(n) + fib(n-1)
    move 	$t2, $t3		    # fib(n-1) = fib(n)
    move 	$t3, $t5		    # fib(n) = $t5
    sw		$t5, 0($t1)		    # store next fib value at array[i]
    addi	$t4, $t4, 1		    # increment counter by 1
    blt		$t4, $t0, fib_loop	# if counter < x then go back to loop

fib_done:
    jr		$ra					# jump to $ra

### EXIT ###
exit:
    li		$v0, 10		# exit program
    syscall