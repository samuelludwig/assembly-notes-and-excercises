# 
#
#
#
#

    .data
test1:  .float 3.2

    .text
main:
    l.s     $f12, test1 # load 3.2 into $f12
    li		$v0, 2		# print float
    syscall             #

    li		$v0, 10		# $v0 = 10
    syscall             #
       