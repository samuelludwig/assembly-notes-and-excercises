## palindrome_string.asm -- reads a line of text and tests if 
##      it is a palindrome.
## Register usage:
##  $t1     - A.
##  $t2     - B.
##  $t3     - the character at address A.
##  $t4     - the character at address B.
##  $v0     - syscall parameter / return values.
##  $a0     - syscall parameters.
##  $a1     - syscall parameters.

    .data
string_space: .space 1024       # set aside 1024 bytes for string
confirmed: .asciiz " is a palindrome\n"
failed: .asciiz " is a not palindrome\n"

    .text
main:
                                # SPIM starts by jumping to main.
                                ## read the string S:
    la      $a0, string_space 
    li      $a1, 1024
    li	    $v0, 8              # load "read_string" code into $v0.
    syscall

    la      $t1, string_space   # A = S.

    la      $t2, string_space       ## we need to move B to the end
length_loop:                        #       of the string:
    lb      $t3, ($t2)              # load byte at B into $t3.
    beqz    $t3, end_length_loop    # if $t3 == 0, branch out of loop.
    addu    $t2, $t2, 1             # otherwise, increment B,
    b       length_loop             #       and repeat.
end_length_loop:

remove_newline:
    subu	$t2, $t2, 1	                # subtract 1 to move B back past
                                        #   the '\0'.
    bne		$t2, 10, end_remove_newline	    # if $t2 != '\n' then skip to end, else remove '\n',
    subu    $t2, $t2, 1                     # else remove '\n'.    
end_remove_newline:


transform_loop:     # loop to turn the string into something that can be parsed without minding spaces and punctuation

# 0. create counter to keep track of new string length
# 1. point to first byte of the string, we'll call it 'D'
# 2. create variable 'C', set it to 'D'
# 3. if C is a letter or a number, call to_lower_case, 
#   then, set the value in D's address to the value in C's
#   then, increment C and D by 1
#   else, increment C by 1
#   repeat until string terminates





end_transform_loop: # end loop to turn the string into something that can be parsed without minding spaces and punctuation


test_loop:
    bge		$t1, $t2, is_palin	# if A >= B, it's a palindrome.

    lb		$t3, ($t1)		    # load the byte at address A into $t3,
    lb		$t4, ($t2)		    # load the byte at address B into $t4.
    bne		$t3, $t4, not_palin	# if $t3 != $t4, not a palindrome.
                                # Otherwise,
    addu    $t1, $t1, 1         #   increment A,
    subu    $t2, $t2, 1         #   decrement B,
    b		test_loop			#   and repeat the loop.
end_test_loop:

is_palin:
                                ## print the string
    la		$a0, string_space
    li		$v0, 4 
    syscall

    la		$a0, confirmed 
    li		$v0, 4 
    syscall

    j		end				# jump to end
    
end_is_palin:       


not_palin:
                                ## print the string
    la		$a0, string_space
    li		$v0, 4 
    syscall

    la		$a0, failed 
    li		$v0, 4 
    syscall

    j		end				# jump to end
end_not_palin:       

to_lower_case:
    # ASCII upper case letters are 65-90 (inclusive)
    # Step one: make sure the character is in that range
    bgt		character, 90, end_to_lower_case
    blt		character, 65, end_to_lower_case

    sub		character, character, 0x20		# subtract the ASCII character by hex 20, transforming it into its lowercase counterpart
    
end_to_lower_case:




end:
    li		$v0, 10
    syscall
