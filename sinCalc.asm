# sin_calc:     Takes in a floating-point number (x) and a degrees or radians
#               specification (s), and approximates it's sine-fucntion value.
#
# Registers used:
#   $t0     - Will hold x
#   $t1     - Will hold s
#   $t9     - Will hold final product
#
# Input expected:
#   - A floating-point number, directly followed by a character 'd', or 'r'.
#     A 'd' will indicate that the number is given in degrees.
#     An 'r' will indicate that the number is given in degrees.
#
#   - No whitespace is expected, an error code will be returned if it is encountered.
#
#
# Ouput expected:
#   - Will be provided in two registers, $v0 and $v1.
#
#   - If all input is valid, a single floating point value will be returned in $v0
#     and the value of 0 will be output in register $v1.
#
#   - If any input is invalid, a value of 0 will be returned in $v0, and a 
#     non-zero value will be returned in $v1.
#
#
# NOTES:    1 degree = pi/180 radians
#           We will be getting the approximate value of sine using the taylor series
#
# -------------------------------------------------------------------------------------- #

    .data
invalid_input:      .asciiz "ERROR: INVALID INPUT"
input:              .space  64

    .text
main:
    lw		$a0, input		# $a0 = input
    

sin_calc:   # args: ($f12 = float(x)), ($a0 = int(level of precision))
            # returns: approximation of sin(x) to the specified 
            # level of precision in register $v0

    move 	$t0, $f12		# $t0 = x
    move 	$t1, $a0		# $t1 = level of precision
    li		$t2, 0		    # $t2 = level of precision counter, begins at 0
    
    li		$t9, 0		    # intialize $t9 to 0
                            # $t9 will hold our product

    li		$t5, 0		    # initialize $t1 to 0
                            # $t1 will be the terms in the function
    
    move 	$t0, $t9		# first term; product += x

sin_calc_loop:
    # calc x^n
    # calc n!
    # calc (x^n)/(n!)
    # total -= (x^n)/(n!)
    # n += 2
    # if level of precision not reached, loop 

    # calc x^n #
    move 	$a0, $t0		# arg1 = x
    li		$a1, 3		    # $a1 = 3
    jal		exp				# jump to exp and save position to $ra
    nop

    move 	$t2, $v0		# move return value of exp into $t2
    
    # calc n! #
    li		$a0, 3		    # $a0 = 3
    jal		fact			# jump to fact and save position to $ra
    nop
    
    move 	$t3, $v0		# move return value of exp into $t3

    # Get value of term n and add (or subtract) it from the aggregated value #
    div.s   $t1, $t2, $t3   # divide x^n / y! and put it into $t1
    sub		$t9, $t9, $t1	# $t9 = $t9 - $t1
    

    

sin_calc_done:

fact:   # args: ($a0 = y)
# return (y!)

exp:    # args: ($f12 = float(x)), ($a1 = int(exp_val))
        # return (x)^(exp_val)
    move.s 	$f4, $f12		# $f0 = float(x)
    li.s    $f5, $f4        # $f1 = total, init to x
    move 	$t1, $a1		# $t1 = exponent value
    li		$t2, 0		    # $t2 = exponent counter
    
exp_loop:
    bge		$t2, $t1, exp_loop_done	# if $t2 >= $t1 then exp_loop_done
    mult.s  $f5, $f5, $f4
    addi	$t2, $t2, 1		# $t2 = $t2 + 1

exp_loop_done:
    move 	$f0, $f4		# move total into return register $f0 
    jr		$ra				# return to $ra
    

convert_to_radians:     # args: ($a0 = float(x))
# return (x) * (pi/180)

