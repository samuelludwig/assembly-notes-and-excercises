# Add two numbers and display the output
# Registers used:
#   $t1 = first number
#   $t2 = second number
#   $t0 = sum

    .data
    .text
main:
    addi	$t1, $0, 0		# clear registers
    addi	$t2, $0, 0		# 
    addi	$t0, $0, 0		# 
    
    li		$t1, 7		    # $t1 = 7
    li		$t2, 23		    # $t2 = 23
    add		$t0, $t1, $t2	# $t0 = $t1 + $t2
    
    move	$a0, $t0		# print sum
    li		$v0, 1		    # 
    syscall                 #

    li		$v0, 10		    # exit
    syscall                 #
    
    
    