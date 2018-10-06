	.data
name:	.space	20

a:	.word	0 	#input variables : a, b, c
b:	.word	0
c:	.word	0

o1:	.word	0	#output variables: o1, o2, o3
o2:	.word	0
o3:	.word	0

msg:	.asciiz 	"Please input your name here: "					# prompt for name
prompt:	.asciiz 	"Please input an integer between 1 to 100 here: "		# prompt for input
output: .asciiz 	"Your outputs are: "						# result message


	.text
main:
	li	$v0,	4			# prompts the user to input name
	la 	$a0,	msg
	syscall
	
	li 	$v0,	8			# logs the input info and load it to $a0, which will then save it to the reserved memory(name)
	la	$a0,	name
	li	$a1,	20
	syscall
	
	li	$v0,	4			# prompts the user to input an integer(3 times)
	la	$a0,	prompt
	syscall
	
	li	$v0,	5			# stores the input to memory addressed by variables(3 times, a, b, c respectively)
	syscall
	sw	$v0,	a

	li	$v0,	4
	la	$a0,	prompt
	syscall
	
	li	$v0,	5
	syscall
	sw	$v0,	b
	
	li	$v0,	4
	la	$a0,	prompt
	syscall
	
	li	$v0,	5
	syscall
	sw	$v0,	c
	
	lw	$t1,	a		# performs "ans1 = a + b + c" calculation and stores the result to o1
	lw	$t2,	b
	lw	$t3,	c
	add 	$t1, $t1, $t2
	add	$t1, $t1, $t3
	sw	$t1,	o1
	
	lw	$t1,	a		# performs "ans2 = c + b - a" calculation and stores the result to o2
	lw	$t2,	b
	lw	$t3,	c
	add 	$t3, $t2, $t3
	sub 	$t3, $t3, $t1
	sw	$t3,	o2
	
	lw	$t1,	a		# performs "ans3 = (a + 2) + (b - 5) - (c ¨C 1)" calculation and stores the result to o3
	lw	$t2,	b
	lw	$t3,	c
	addi	$t1, $t1, 2
	subi	$t2, $t2, 5
	subi	$t3, $t3, 1
	add 	$t1, $t1, $t2
	sub 	$t1, $t1, $t3
	sw	$t1,	o3
	
	li	$v0,	4		# print the user's name
	la 	$a0,	name
	syscall
	
	li	$v0,	4		# print output message
	la 	$a0,	output
	syscall
	
	li	$v0,	1		# print ans1
	lw	$a0,	o1
	syscall	
	
	li	$v0,	11		# print space
	li	$a0,	32
	syscall
	
	li	$v0,	1		# print ans2
	lw	$a0,	o2
	syscall
	
	li	$v0,	11		# print space
	li	$a0,	32
	syscall
	
	li	$v0,	1		# print ans3
	lw	$a0,	o3
	syscall
	
	
exit:					
	li	$v0,	10		# terminate the program
	syscall

						
# comments: 2 test sets:

# Test set 1:
# Please input your name here: Jason
# Please input an integer between 1 to 100 here: 35
# Please input an integer between 1 to 100 here: 23
# Please input an integer between 1 to 100 here: 30
# Jason
# Your outputs are: 88 18 26
# -- program is finished running --	

	
# Test set 2:
# Please input your name here: MaryCatherine
# Please input an integer between 1 to 100 here: 17
# Please input an integer between 1 to 100 here: 18
# Please input an integer between 1 to 100 here: 99
# MaryCatherine
# Your outputs are: 134 100 -66
# -- program is finished running --	
