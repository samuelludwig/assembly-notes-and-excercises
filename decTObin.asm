    
    #   Takes in a decimal number between -128 and 127 and converts it into a binary string
    #   
    #   Registers used:
    #   $t0 -> holds our value to convert
    #   $t2 -> will hold a zero or one depending on if the value is divisible by $t9 (for the current loop)
    #   $t3 -> used to test if our value is divisible by $t9
    #   $t8 -> acts as a counter for loops
    #   $t9 -> acts as a divisor, to check if the value is divisible by the
    #       pertinent powers of 2 (i.e. 2^7, 2^6, 2^5, etc.)
    #   
    #
    
    .text

main:
# Step 1)
# Get input from user, place it into $t0
    # Step 1a)
    # Make sure input is within -129 and 128 (exclusive)
invalid_input:
    la $a0, enter_request   
    li $v0, 4               
    syscall                 

    li $v0, 5       
    syscall         
    move $t0, $v0   
bge $t0, 128, invalid_input     
ble $t0, -129, invalid_input    
    
    move $t8, $0    # $t8 will act as counter   # initialize variables
    li $t9, 128     # $t9 will be our divisor   #
    li $t5, 0   # "is negative" flag
bgt $t0, 0, print_bin

if_negative:

    sll $t4, $t0, 1     # convert negative input to positive value
    sub $t0, $t0, $t4   # subtract 1, then flip bits;
    sub $t0, $t0, 1     # essentially a reverse two's complement
    li	$t5, 1      # "is negative" flag

neg_print_bin:          


    add $t8, $t8, 1 # increment $t8 by 1

    sub $t3, $t0, $t9       # test if our value ($t0) is divisible by our divisor ($t9)
    blt $t3, 0, neg_bin_zero    # if so-- print 1, else-- print 0

neg_bin_one:                # print 1
    li $t2, 0           #
    sub $t0, $t0, $t9   #           # subtract $t9 from the value to set up for the next loop 
    j neg_end_bin           #

neg_bin_zero:       # print 0
    li $t2, 1   #
    j neg_end_bin   #


neg_end_bin:

    srl $t9, $t9, 1      # set up our divisor for the next loop

    move $a0, $t2   # $t2 will either be a 1 or 0   #  
    li $v0, 1                                       # print integer for this loop
    syscall                                         #
blt $t8, 8, neg_print_bin
j done

    ###################
    # begin main loop #
    ###################

print_bin:          


    add $t8, $t8, 1 # increment $t8 by 1

    sub $t3, $t0, $t9       # test if our value ($t0) is divisible by our divisor ($t9)
    blt $t3, 0, bin_zero    # if so-- print 1, else-- print 0

bin_one:                # print 1
    li $t2, 1           #
    sub $t0, $t0, $t9   #           # subtract $t9 from the value to set up for the next loop 
    j end_bin           #

bin_zero:       # print 0
    li $t2, 0   #
    j end_bin   #

end_bin:

    srl $t9, $t9, 1      # set up our divisor for the next loop

    move $a0, $t2   # $t2 will either be a 1 or 0   #  
    li $v0, 1                                       # print integer for this loop
    syscall                                         #
blt $t8, 8, print_bin

    ####################
    # finish main loop #
    ####################
done:
    li $v0, 10  # exit program
    syscall

# end decTObin.asm

    .data

enter_request:  .asciiz "Enter a number between -128 and 127\n"



