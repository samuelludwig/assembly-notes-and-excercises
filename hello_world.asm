    .text

main:

    ## output the string "hello world" over console
    la $a0, hello_msg
    li $v0, 4
    syscall

    li $v0, 10
    syscall


    .data

hello_msg:  .asciiz "Hello World\n"