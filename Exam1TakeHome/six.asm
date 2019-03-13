
######################################### PROBLEM 6 #########################################

    .data
prompt:     .asciiz "Enter your name: "
hi_msg:     .asciiz "\nHi!! "
i_name:     .space  1024

    .text
main:

print_prompt:
    la		$a0, prompt		# print prompt
    li		$v0, 4		    # 
    syscall                 #

get_name:
    la		$a0, i_name		# read string and store at the address of i_name
    li		$a1, 64		    # we will read a max of 64 characters
    li		$v0, 8		    #
    syscall                 #

print_hi:
    la		$a0, hi_msg		# print hi_msg
    li		$v0, 4		    # 
    syscall                 #

print_name:
    la		$a0, i_name	    # print i_name
    li		$v0, 4		    # 
    syscall                 #

exit:
    li		$v0, 10		    # exit program
    syscall                 #