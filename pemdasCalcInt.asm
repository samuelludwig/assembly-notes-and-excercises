# pemdasCalcInt:    Accepts a variable-length sequence (max 1024 bytes) of (valid) 
#                   integer and character values which make up a mathematical equation, 
#                   then computes, and outputs the product of that equation.
#
# Registers used:
#   $t0     - final product
#   
#   
#
# Inputs expected:
#   Right and left paren: '(', ')'
#   Arithmetic operators: '-', '+', '*', '/'
#   ASCII values for 0-9: '0', '1', '2',...
#   Whitespace will be ignored.
#
# Output expected:
#   If all input is valid, output will be in the form of a single signed integer value.
#   If any output is invalid, an error message will be returned.

    .data
input:      .space  1024
inputQuery: .asciiz "Enter equation: "
inputError: .asciiz "ERROR: INPUT INVALID"

    .text
main:
    la		$a0, input		# 
    jal		pemdasCalc		# jump to pemdasCalc and save position to $ra
    nop

pemdas_calc:
    move	$t9, $a0	    # move address of input into $t9

    jr		$ra				# jump to $ra
    
    
    