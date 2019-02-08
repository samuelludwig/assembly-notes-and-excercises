# Multiply two numbers
# Registers used:
#   $s0 = arg1
#   $s1 = arg2
#   $t0 = lower 32 of sum
#   $t1 = upper 32 of sum
#   $v0 = syscalls

    .data

    .text
main:
    add		$s0, $0, 0		# $s0 = $0 + 0  # clear registers
    add		$s1, $0, 0		# $s1 = $0 + 0
    add		$t0, $0, 0		# $t0 = $0 + 0
    add		$t1, $0, 0		# $t1 = $0 + 0
    add		$v0, $0, 0		# $v0 = $0 + 0
    
load_args:
    add		$s0, $0, 7		# load arg1
    add		$s1, $0, 10		# load arg2

multiply:
    mult	$s1, $s0		# $s1 * $s0 = Hi and Lo registers
    mflo	$t0				# copy Lo to $t0
    mfhi    $t1             # copy Hi to $t1

output:
    add		$a0, $0, $t0	# print lower 32 of sum
    li		$v0, 1		    # 
    syscall                 #

done:
    li		$v0, 10		# exit
    syscall             #
    
    