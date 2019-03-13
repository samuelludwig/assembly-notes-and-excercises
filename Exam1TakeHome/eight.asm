##############
# 1. Guess   #
# 2. Divide  #
# 3. Average #
##############   
# G(n+1) = (1/2)(G(n) + (a/G(n))
   
    .data
sval:   .float  72673.88    # <- a
sg1:    .float  850.0       # <- initial guess
s1ovr2: .float  0.5         # <- (1/2) coefficient

msg:    .asciiz "\nThe square root of 72673.88 is "

    .text
main:
    jal		print_msg	    # jump to print_msg and save position to $ra
    nop                     #

    l.s     $f12, sval      # $f12 = 72673.88 <- a
    l.s     $f14, sg1       # $f13 = initial guess
    l.s     $f16, s1ovr2    # $f16 = 0.5 <- (1/2) coefficient
    jal		single_sqrt     # jump to single_sqrt and save position to $ra
    nop                     #

    jal		exit	        # jump to exit and save position to $ra
    nop                     #

print_msg:
    la		$a0, msg	    # print contents of msg
    li		$v0, 4		    # 
    syscall                 #
    
    jr		$ra             # jump to $ra


single_sqrt:
    mov.s   $f0, $f12           # $f0 = 72673.88 <- a
    mov.s   $f1, $f16           # $f1 = (0.5)
    mov.s   $f10, $f14          # $f10 = 850.0 <- initial guess, G(0) <- old_guess
    sub.s   $f11, $f11, $f11    # init $f11 to 0 <- will be our new guess

s_sqrt_loop:
    div.s   $f3, $f0, $f10      # $f3 = (a/old_guess)
    add.s   $f4, $f10, $f3      # $f4 = (old_guess + (a/old_guess))
    mul.s   $f11, $f1, $f4      # new_guess = (0.5) * (old_guess + (a/old_guess))
    
    c.eq.s	$f11, $f10	        # if new_guess == old_guess, then proceed to print_s
    mov.s   $f10, $f11          # else: old_guess = new_guess,
    bc1f	s_sqrt_loop			# and branch back to s_sqrt_loop

print_s:
    mov.s   $f12, $f10          # load root into argument register $f12
    li		$v0, 2		        # print float in $f12
    syscall                     #
    
    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# exit program
    syscall             # 

