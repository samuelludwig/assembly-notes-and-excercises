    .data
radius:     .float  3.9
height:     .float  1.6
pi:         .float  3.141

    .text
main:

calc_surface_area:
    l.s     $f0, radius     # $f0 = radius
    l.s     $f2, pi         # $f3 = pi

    mul.s   $f4, $f0, $f0   # $f4 = radius^2
    mul.s   $f5, $f4, $f2   # $f5 = pi * radius^2

get_vol:
    l.s     $f1, height     # $f1 = height
    mul.s   $f12, $f5, $f1  # $f12 = (pi*r^2) * height

    li		$v0, 2		    # print float in $a0
    syscall                 #

exit:
    li		$v0, 10		    # exit program
    syscall                 #