##############
# 1. Guess   #
# 2. Divide  #
# 3. Average #
##############   
# G(n+1) = (1/2)(G(n) + (n/G(n))
   
    .data
sval:   .float  72673.88
sg1:    .float  850.0
s2:     .float  2.0

msg:    .asciiz "\nThe square root of 72673.88 is "

    .text
main:
    jal		print_msg	# jump to print_msg and save position to $ra
    nop                 #

    l.s     $f12, sval  # $f12 = 72673.88
    l.s     $f14, sg1   # $f13 = initial guess
    l.s     $f16, s2    # $f16 = 2
    jal		single_sqrt # jump to single_sqrt and save position to $ra
    nop                 #

    jal		exit	    # jump to exit and save position to $ra
    nop                 #

print_msg:
    la		$a0, msg	# print contents of msg
    li		$v0, 4		# 
    syscall             #
    jr		$ra         # jump to $ra


single_sqrt:
init_ssqrt:
    mov.s   $f0, $f12           # $f0 = 72673.88 <- n
    mov.s   $f10, $f12          # $f10 = n <- x
    div.s   $f2, $f10, $f16     # $f2 = (n/2) <- first guess <- i
    sub.s   $f4, $f4, $f4       # $f4 = 0

s_sqrt_loop:
    div.s   $f1, $f0, $f10      # $f1 = n/x
    add.s   $f3, $f10, $f1      # $f3 = x + (n/x) 
    div.s   $f8, $f6, $f16      # $f8 = (x + n/x)/2
    c.lt.s	$f4, $f2	        # if new guess = old guess, then print_s
    bc1t	s_sqrt_loop			# branch to s_sqrt_loop

print_s:
    mov.s   $f12, $f10
    li		$v0, 2		        # print float in $f12
    syscall                     #
    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# exit program
    syscall             # 

