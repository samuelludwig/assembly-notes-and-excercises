    .data
pi:     .float  3.14
radius: .float  14.17
fzero:  .float  0.0
pie:    .asciiz "the pie area is: "

    .text
main:
    l.s     $f0, pi         # load pi constant
    l.s     $f1, radius     # load radius constant
    la		$t0, pie		# load message address to $t0

    mul.s   $f2, $f0, $f1   # x = pi * r
    mul.s   $f2, $f2, $f1   # x = x * r
                            # all together: x = pi*(r^2)
    
    la		$a0, pie		# load message
    li		$v0, 4		    # print string
    syscall                 #
    
    l.s     $f4, fzero
    add.s   $f12, $f2, $f4

    li		$v0, 2		# $v0 = 2
    syscall

    li		$v0, 10		    # exit
    syscall


    