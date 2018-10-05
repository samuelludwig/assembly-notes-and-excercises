        
    .text

main:

    la		$a0, input	 
    li		$a1, 1024		            # $a1 =1024 
    li		$v0, 8		
    syscall

    la		$t0, input                  # $t0 = string S

    li 	    $t2, 0	                    # $t2 = 0, will be D

sum_loop:
    lb      $t1, ($t0)                  # load the byte at address S into $t1, 
    addu    $t0, $t0, 1                 # and increment the value at S.

    beq		$t1, 10, end_sum_loop	    # if $t1 == \n, branch out of loop.

    mul     $t2, $t2, 10                # t2 *= 10.

    sub		$t1, $t1, '0'		        # $t1 -= '0'.
    add		$t2, $t2, $t1		        # $t2 += $t1.
    
    b		sum_loop			        # and repeat the loop.
end_sum_loop:

output:
    move 	$a0, $t2
    li		$v0, 1	                    # $v0 = 1
    syscall

    li		$v0, 10	                    # $v0 = 10 
syscall

    .data
input: .space 1024                      # input == S