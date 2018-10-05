# add2.asm-- A program that computes and prints the sum 
#   of two numbers specified at runtime by the user. 
# Registers used: 
#   $t0 - used to hold the first number. 
#   $t1 - used to hold the second number. 
#   $t2 - used to hold the sum of the $t1 and $t2
#   $v0 - syscall parameter

main:
    
    ##  Get the first number from user and put it into $t0
    li $v0, 5
    syscall
    move $t0, $v0 
    
    ##  Get the second number from user and put it into $t1
    li $v0, 5
    syscall
    move $t1, $v0

    add $t2, $t1, $t0   # compute the sum
    move $a0, $t2

    ## Print out $t2
    li $v0, 1 
    syscall     # print whats in $a0

    li $v0, 10  # exit program
    syscall
