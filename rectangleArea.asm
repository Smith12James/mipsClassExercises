# Program to calculate the Rectangle's area

.data
width: .word
height: .word
area: .word

widthPrompt: .asciiz "Enter width (integer)=\n"
heightPrompt: .asciiz "Enter height (integer)=\n"
areaIs: .asciiz "Rectangle's area is = "
perimeterPrompt: .asciiz "The Rectangle's perimeter is: "
newline: .asciiz "\n"

.text
main:
# print the prompt for width

addi $v0, $0, 4 # system call 4 is for printing a string
la $a0, widthPrompt # address of weightPrompt is in $a0
syscall # print the string

# Read the width

addi $v0, $0, 5 # system call 5 is for reading an integer
syscall 
add $8, $0, $v0 # copy the width into $8

# print the prompt for height

addi $v0, $0, 4 # system call 4 is for printing a string
la $a0, heightPrompt # address of heightPrompt is in $a0
syscall # print the string

# Read the height

addi $v0, $0, 5
syscall
add $9, $0, $v0

# Calculate the area

mult $8, $9
mflo $10 # bring the product into the register $10 (assume hi not needed)

# Calculate the perimeter

add $t0, $8, $8
add $t1, $9, $9
add $11, $t0, $t1

# print a new line

addi $v0, $0, 4 # System call 4 is for printing a string
la $a0, newline # address of areaIs string is in $a0
syscall

# print the "Rectangle's area = "

addi $v0, $0, 4 # System call 4 is for printing a string
la $a0, areaIs # address of areaIs string is in $a0
syscall

# print the calculated area (in $10)

addi $v0, $0, 1 # system call 1 is for printing an integer
add $a0, $0, $10 # bring the area value from $10 into $a0
syscall

# print a new line

addi $v0, $0, 4 # System call 4 is for printing a string
la $a0, newline # address of areaIs string is in $a0
syscall

# print "The Rectangle's perimeter is: "

addi $v0, $0, 4 # system call 4 is for printing a string
la $a0, perimeterPrompt # address of perimeter is in $a0
syscall # print the string

# print rectangle's perimeter calculations

addi $v0, $0, 1 # system call 1 is for printing an integer
add $a0, $0, $11 # bring the area value from $10 into $a0
syscall

# print a new line

addi $v0, $0, 4 # System call 4 is for printing a string
la $a0, newline # address of areaIs string is in $a0
syscall

# exit from the program
exit:
ori $v0, $0, 10 # system call code 10 for exit
syscall
