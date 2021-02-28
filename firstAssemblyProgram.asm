# Program to take 3 integers and display the sum, the lowest number, and the largest number

.data
firstNum: .word
secondNum: .word
thirdNum: .word

# prompts

mainPrompt: .asciiz "Enter three numbers: "
firstPrompt: .asciiz "First number: "
secondPrompt: .asciiz "Second number: "
thirdPrompt: .asciiz "Third number: "
resultPrompt: .asciiz "++++++++++ Results ++++++++++"
sumPrompt: .asciiz "Sum = "
smallestPrompt: .asciiz "Smallest = "
largestPrompt: .asciiz "Largest = "
contPrompt: .asciiz "Do you want to continue? (1 = no , 0 = yes):"
newline: .asciiz "\n"
exit_message: 	.asciiz	"Thank You. Goodbye!"

.text

main:

# print "Enter three niumbers: "

addi $v0, $0, 4 # System call 4 is for printing a string
la $a0, newline # address of areaIs string is in $a0
syscall

addi $v0, $0, 4
la $a0, mainPrompt
syscall

promptNumbers:

addi $v0, $0, 4
la $a0, newline
syscall

# print "First Number: "

addi $v0, $0, 4
la $a0, firstPrompt
syscall

addi $v0, $0, 5
syscall
add $8, $0, $v0

addi $v0, $0, 4 
la $a0, newline 
syscall

# Second Number

addi $v0, $0, 4
la $a0, secondPrompt
syscall

addi $v0, $0, 5
syscall
add $9, $0, $v0

addi $v0, $0, 4 
la $a0, newline 
syscall

# third number

addi $v0, $0, 4
la $a0, thirdPrompt
syscall

addi $v0, $0, 5
syscall
add $10, $0, $v0

addi $v0, $0, 4 
la $a0, newline 
syscall

# Results

addi $v0, $0, 4
la $a0, resultPrompt
syscall

addi $v0, $0, 4 
la $a0, newline 
syscall

# Result of Sum

addi $v0, $0, 4
la $a0, sumPrompt
syscall

# calculate for the sum

add $11, $8, $9
add $12, $10, $11

# print sum of all 3 numbers

addi $v0, $0, 1
add $a0, $0, $12
syscall

addi $v0, $0, 4
la $a0, newline
syscall

bgt $t1, $t0, middleGreater  	
bgt $t2, $t0, lastGreatest

move $s0, $t0
    	
blt $t1, $t2, middle_smallest
j last_smallest

middleGreater:  	
bgt $t2, $t1, lastGreatest

move $s0, $t1
    	
blt $t0, $t2, first_smallest
j last_smallest
    	
    	
lastGreatest:
move $s0, $t2    	
blt $t1, $t0, middle_smallest

first_smallest:
move $s1, $t0
j print_extremes
    	
middle_smallest:
move $s1, $t1
j print_extremes
    	
last_smallest:
move $s1, $t2
    	
print_extremes:
li $v0, 4
la $a0, smallestPrompt
syscall

li $v0,1
la $a0, ($s1)
syscall

li $v0, 4
la $a0, newline
syscall
    	
li $v0, 4
la $a0, largestPrompt
syscall

li $v0,1
la $a0, ($s0)
syscall

li $v0, 4
la $a0, newline
syscall
    	
li $v0, 4
la $a0, contPrompt
syscall

li $v0, 5
syscall
move $s2, $v0

beq $s2, $zero, promptNumbers

li $v0, 4
la $a0, exit_message
syscall
li $v0, 10
syscall