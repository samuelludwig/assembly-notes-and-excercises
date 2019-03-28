
######################################### PROBLEM 8 #########################################

# G(n+1) = (1/2)(G(n) + (a/G(n))
   
    .data
sval:   .double  72673.88    # <- x
sg1:    .double  850.0       # <- initial guess
s1ovr2: .double  0.5         # <- (1/2) coefficient

msg:    .asciiz "\nThe square root of 72673.88 is "

    .text
main:
    jal		print_msg	    # jump to print_msg and save position to $ra
    nop                     #

    l.d     $f12, sval      # $f12 = 72673.88 <- x
    l.d     $f14, sg1       # $f13 = initial guess
    l.d     $f16, s1ovr2    # $f16 = 0.5 <- (1/2) coefficient
    jal		sqrt            # jump to single_sqrt and save position to $ra
    nop                     #

    jal		exit	        # jump to exit and save position to $ra
    nop                     #

print_msg:
    la		$a0, msg	    # print contents of msg
    li		$v0, 4		    # 
    syscall                 #
    
    jr		$ra             # jump to $ra


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

print_s:
    mov.d   $f12, $f10          # load root into argument register $f12
    li		$v0, 3		        # print float in $f12
    syscall                     #
    
    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# exit program
    syscall             # 

