# floatingPoint.asm 
# Prints out a floating point value from .data
#
# Registers used:
#   $f12    - holds value of float that is to be printed
#   $v0     - syscall codes


    .data
test1:  .float 3.2      # floating-point number (x)

    .text
main:
    l.s     $f12, test1 # load x into $f12
    li		$v0, 2		# print float in $f12
    syscall             #

    li		$v0, 10		# exit
    syscall             #
       