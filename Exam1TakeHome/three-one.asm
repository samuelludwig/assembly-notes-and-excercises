    .data
stime:      .float  1438.0
sdivisor:   .float  42.8

newline:    .asciiz "\n"

dtime:      .double 1438.0
ddivisor:   .double 42.8

    .text
main:

float_div:
    l.s	$f0, stime		    # $t0 = 1438
    l.s	$f1, sdivisor	    # $f1 = 42.8

    div.s   $f12, $f0, $f1  # $f12 = 1438/42.8

    li		$v0, 2		    # $v0 = 2; print float
    syscall                 #

write_newline:
    la		$a0, newline	# load address of newline into $a0 and output it 
    li		$v0, 4		    # $v0 = 4
    syscall                 #

double_div:
    l.d	$f2, dtime		    # $t0 = 1438
    l.d	$f4, ddivisor	    # $f1 = 42.8

    div.d   $f12, $f2, $f4  # $f12 = 1438/42.8

    li		$v0, 3		    # $v0 = 3; print double
    syscall                 #

exit:
    li		$v0, 10		    # $v0 = 10; exit program
    syscall                 #
    