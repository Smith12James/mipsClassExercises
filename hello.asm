# hello.asm -- "Hello World" Program
# Registers used:


.data
hello_msg: .asciiz "Hello World!"

.text
main:
la $a0, hello_msg # load address of hello_msg into $a0
li $v0, 4
syscall
li $v0, 10 # 10 is the exit syscall
syscall
