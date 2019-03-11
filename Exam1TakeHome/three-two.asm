    .data
sarg_1: .float  14.9
sarg_2: .float  3.89
sarg_3: .float  2.4

newline:    .asciiz "\n"

darg_1: .double 14.9
darg_2: .double 3.89
darg_3: .double 2.4

    .text
main:

float_math:
    l.s		$f1, sarg_1		# $f1 = 14.9
    l.s		$f2, sarg_2		# $f2 = 3.89
    l.s		$f3, sarg_3		# $f3 = 2.4
    
    add.s   $f0, $f1, $f2   # $f0 = 14.9 + 3.89
    mul.s   $f12, $f0, $f3  # $f12 = (14.9 + 3.89) * 2.4

    li		$v0, 2		    # $v0 = 2; print float
    syscall                 #

write_newline:
    la		$a0, newline	# load address of newline into $a0 and output it 
    li		$v0, 4		    # $v0 = 4
    syscall                 #

double_math:
    l.d		$f2, darg_1		# $f2 = 14.9
    l.d		$f4, darg_2		# $f4 = 3.89
    l.d		$f6, darg_3		# $f6 = 2.4
    
    add.d   $f0, $f2, $f4   # $f2 = 14.9 + 3.89
    mul.d   $f12, $f0, $f6  # $f12 = (14.9 + 3.89) * 2.4

    li		$v0, 3		    # $v0 = 3; print double
    syscall                 #

exit:
    li		$v0, 10		    # exit program
    syscall                 #