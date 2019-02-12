# calcAreaFP.asm
# Calculates the area of a circle, given its radius.
#
# Registers used:
#   $f0     - holds const pi
#   $f1     - holds radius
#   $f2     - value of x
#   $a0     - holds address of area message
#   $f12    - holds x during float-print syscall
 
    .data
pi:     .float  3.14    # const pi
radius: .float  14.17   # radius of circle
area:    .asciiz "the area is: "

    .text
main:
    l.s     $f0, pi         # load pi constant
    l.s     $f1, radius     # load radius constant

    mul.s   $f2, $f0, $f1   # x = pi * r    # all together: x = pi*(r^2)
    mul.s   $f2, $f2, $f1   # x = x * r     #
    
    la		$a0, area		# load message
    li		$v0, 4		    # print string
    syscall                 #
    
    mov.s   $f12, $f2       # move x into $f12
    li		$v0, 2		    # print float in $f12
    syscall                 #

    li		$v0, 10		    # exit
    syscall                 #


    