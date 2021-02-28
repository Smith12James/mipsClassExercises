.data

	startMessage: .asciiz "This program will take 4 ints and add the first two, add the second two, then minus the two results and put them into field 'f'"
	firstPrompt: .asciiz "Enter the first integer: "
	secondPrompt: .asciiz "Enter the second integer: "
	thirdPrompt: .asciiz "Enter the third integer: "
	fourthPrompt: .asciiz "Enter the fourth integer: "
	totalPrompt: .asciiz "The total: "
	exitPrompt: .asciiz "Thank you! Goodbye!"
	newline: .asciiz "\n"
	
.text

main:

# f = (g + h) - (i + j);

addi $v0, $0, 4 # System call 4 is for printing a string
la $a0, newline # address of areaIs string is in $a0
syscall

# prompt program start

addi $v0, $0, 4
la $a0, startMessage
syscall

addi $v0, $0, 4
la $a0, newline
syscall

# First prompt

addi $v0, $0, 4
la $a0, firstPrompt
syscall

addi $v0, $0, 5
syscall
add $8, $0, $v0

# Second prompt

addi $v0, $0, 4
la $a0, secondPrompt
syscall

addi $v0, $0, 5
syscall
add $9, $0, $v0

# Third prompt

addi $v0, $0, 4
la $a0, thirdPrompt
syscall

addi $v0, $0, 5
syscall
add $10, $0, $v0

# Fourth prompt

addi $v0, $0, 4
la $a0, fourthPrompt
syscall

addi $v0, $0, 5
syscall
add $11, $0, $v0

add $t0, $8, $9
add $t1, $10, $11
sub $s0, $t0, $t1


# Total prompt

li $v0, 4
la $a0, totalPrompt
syscall

li $v0,1
la $a0, ($s0)
syscall

addi $v0, $0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, exitPrompt
syscall

li $v0, 10
syscall