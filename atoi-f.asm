
    .text
main:
    la		$a0, input	 
    li		$a1, 1024	    # space = 1024 bytes 
    li		$v0, 8		
    syscall

    jal		atoi		    # jump to atoi and save position to $ra
    nop

    move	$a0, $v0	    # $a0 = return value from atoi
    li		$v0, 1
    syscall

    li		$v0, 10		    # $v0 = 10
    syscall


atoi:
    # input is taken as string in $a0
    # breaks to expect, ' ', '\n', '\0'
    # Respect sign of number
    # Valid characters: -, 0-9, (break chars)
    # Error to expect, invalid characters
    # If input is invalid output = 0

    # Output will be in $v0

    add		$t0, $0, 0		# $t0 will be sum 'S'
    add		$t1, $0, 1		# $t1 will be the 'sign' (defaults positive)
    add		$t2, $0, 0		# $t2 will be the pointer to each digit in the string
    add		$t3, $0, 10		# $t3 = 10
    add		$t5, $0, 0		# $t5 will act as overflow flag
    add		$v0, $0, 0		# $v0 will store output
    
    ## sign check ##
    lb		$t2, ($a0)
    beq		$t2, '-', atoi_negative	    # if    t2 == '-' then atoi_negative
    j		atoi_sum_loop				# jump to atoi_sum_loop
    
atoi_negative:
    li		$t1, -1		    # $t1 = -1
    add		$a0, $a0, 1		# increment $a0 by 1 to point to the next digit

atoi_sum_loop:

    lb		$t2, ($a0)		# load character

    ## break check here ##
    beq		$t2, ' ', atoi_return	# if $t2 == ' ' then atoi_return
    beq		$t2, '\n', atoi_return	# if $t2 == '\n' then atoi_return

    ## check for invalid character ##
    blt		$t2, '0', atoi_invalid_return	# if $t2 < '0' then atoi_invalid_return
    bgt		$t2, '9', atoi_invalid_return	# if $t2 > '9' then atoi_invalid_return

    mult	$t0, $t3		# multiply S by 10
    mflo	$t0				# 
    mfhi    $t5             # check for overflow
    bnez	$t5, atoi_invalid_return	# if $t5 > 0 then overflow

    sub		$t2, $t2, '0'	# turn $t2 into the correct number value

    add		$t0, $t0, $t2	# add the digit to S
    add		$a0, $a0, 1		# increment $a0 by 1 to point to the next digit
    j       atoi_sum_loop

atoi_return:
    mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
    mflo	$v0					# copy Lo to $v0
    jr		$ra					# jump to $ra

atoi_invalid_return:
    li		$v0, 0		        # $v0 = 0
    jr		$ra					# jump to $ra
    
    .data
input: .space 1024
    
    
    
     
    
    
    
    
    
