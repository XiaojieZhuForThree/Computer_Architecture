	.data
nameinp:	.space		20			# store the name, weight, height
heightinp:	.word		0
weightinp:	.word		0
ans:		.double					# used to store the ans for print
compare1: 	.double		18.5			# the three thresholds for comparison
compare2:	.double		25
compare3:	.double		30

nameprompt:	.asciiz 	"What is your name? "							# prompt for name
heightprompt:	.asciiz 	"Please enter your height in inches: "					# prompt for height
weightprompt:	.asciiz 	"Now enter your weight in pounds (round to a whole number): "		# prompt for weight

ansoutput:	.asciiz		", your BMI is: "						# output BMI
case1: 		.asciiz		"\nThis is considered underweight."				# after comparision, decide which one is the right
case2:		.asciiz		"\nThis is a normal weight."					# description
case3: 		.asciiz		"\nThis is considered overweight."
case4:		.asciiz		"\nThis is considered obese."

	.text
collection:	
	li	$v0,	4									# prompt the user to input the name
	la 	$a0,	nameprompt
	syscall
		
	li 	$v0,	8									# save the name to nameinp
	la	$a0,	nameinp
	li	$a1,	20
	syscall
	
    	la 	$s0,	nameinp        
remove:												# in order to remove the \n
    	lb 	$a3,	0($s0)    									# get the index of first char at nameinp
    	addi 	$s0,	$s0,	1      								# Increase index by 1
    	bne 	$a3,	$zero,	remove     							# Loop until the end
    	beq 	$a1,	$s0,	getdata    							# if the length reaches the final, no action
    	subiu 	$s0,	$s0,	2     								# else, delete the \n
    	sb 	$zero, 	0($s0)    								# refill the blank with $0	

getdata:	
	li	$v0,	4							# ask for height
	la 	$a0,	heightprompt
	syscall
	
	li 	$v0,	5							# store the height
	syscall
	sw	$v0,	heightinp
	
	li	$v0,	4							# ask for weight
	la 	$a0,	weightprompt
	syscall
	
	li 	$v0,	5							# store the weight
	syscall
	sw	$v0,	weightinp

	
calcu:

	lw	$t1,	heightinp						# load height to $t1
	lw	$t2,	weightinp						# load weight to $t2
	
	mul 	$t1,	$t1,	$t1						# get height*height
	mul  	$t2,	$t2,	703						# get weight * 703
	
	mtc1 	$t1,	$f2							# move height to coprocessor register $f2
	cvt.d.w $f2 	$f2							# then convert to double precision value
	mtc1	$t2,	$f4							# move weight to coprocessor register $f2
	cvt.d.w $f4 	$f4							# then convert to double precision value
	
	div.d 	$f0,	$f4,	$f2						# perform the division process and get the BMI and store in $f0

returnBMI:	
	li	$v0,	4							# print the name, BMIoutput, and BMI value
	la	$a0,	nameinp
	syscall		
	
	li	$v0,	4		
	la	$a0,	ansoutput
	syscall	
				
	li	$v0,	3							# move BMI value from $f0 to $f12
	mov.d	$f12,	$f0
	syscall

compare:
	ldc1	$f2,	compare1						# load each threshold value to $f2, $f4, $6, respectively
	ldc1	$f4,	compare2		
	ldc1 	$f6,	compare3


Case1:	
	c.lt.d 	$f0,	$f2							# first compare BMI with 18.5, if bigger, jump to second case
	bc1f 	Case2
	
	li	$v0,	4		
	la	$a0,	case1							# else, print the first case statement
	syscall
	
	j	Exit								# and jump to exit
	
Case2:	
	c.lt.d 	$f0,	$f4							# if BMI>18.5, compare it with 25, if bigger, jump to third case
	bc1f 	Case3	
	
	li	$v0,	4		
	la	$a0,	case2							# else, print the second case statement
	syscall
	
	j	Exit								# then jump to exit

Case3:
	c.lt.d 	$f0,	$f6							# if BMI>25, compare it with 30, if bigger, jump to fourth case
	bc1f 	Case4
	
	li	$v0,	4							# else, print the third case statement
	la	$a0,	case3
	syscall
	
	j	Exit								# then jump to exit
	
Case4:
	li	$v0,	4							# finally, it means the BMI is greater than 30
	la	$a0,	case4							# print the fourth case statement
	syscall	

Exit:	
	li	$v0,	10							# end of the program
	syscall



# Examples:
# 1. underweight case 
# What is your name? Skinny
# Please enter your height in inches: 72
# Now enter your weight in pounds (round to a whole number): 100
# Skinny, your BMI is: 13.560956790123457
# This is considered underweight.
# -- program is finished running --

# 2. normal weight case
# What is your name? Normal
# Please enter your height in inches: 67
# Now enter your weight in pounds (round to a whole number): 135
# Normal, your BMI is: 21.14167966139452
# This is a normal weight.

# 3. overweight case
# What is your name? Heavy
# Please enter your height in inches: 65
# Now enter your weight in pounds (round to a whole number): 160
# Heavy, your BMI is: 26.622485207100592
# This is considered overweight.
# -- program is finished running --

# 4. obese case
# What is your name? Obese
# Please enter your height in inches: 70
# Now enter your weight in pounds (round to a whole number): 220
# Obese, your BMI is: 31.56326530612245
# This is considered obese.
# -- program is finished running --