
    .data
init_array:    .space 1024

    
    .text

main:

get_array:




################# MERGE-SORT FUNCTION #################
merge_sort:
    # Array size will be in $a0
    # Array address will be in $a1
    # Address of output array will be in $v0 


    ## TODO: check array size ##
    # will have an array of x integers
    # cut array in half, into two arrays:
    #   left_array and right_array
    # cut
    
separate:
    # length of array in $a0
    div		$a0, 2			# $a0 / 2
    mflo	$t2					# $t2 = floor($a0 / 2) 
    mfhi	$t3					# $t3 = $a0 mod 2 
    
    # split 


merge:
    ## merge algorithm:
    # 2 arrays
    # left and right;
    # 
    # if left > right
    #   place left into array index [i]
    # else
    #   place right into array index [i]
    # repeat till all values are placed




################# ATOI FUNCTION #################
atoi:
    # input is taken as string in $a0
    # breaks to expect, ' ', '\n', '0'
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