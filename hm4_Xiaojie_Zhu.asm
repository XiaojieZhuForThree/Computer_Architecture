	.data
fileName:	.asciiz		"homework4.txt"
txtBuffer:	.asciiz		"The quick brown fox jumps over the lazy dog."
inputBuffer:	.space		100
anotherBuffer:	.space		100
outputOK:	.asciiz		"The data is OK."
outputCorrupt:	.asciiz		"The data has been corrupted!"

	.text
open_file:	li	$v0,	13
		la	$a0,	fileName
		li	$a1,	1
		li	$a2,	0
		syscall
		move	$s6,	$v0

write_file:	li	$v0,	15
		move	$a0,	$s6
		la	$a1,	txtBuffer
		li	$a2,	44
		syscall

exit_file:	li	$v0,	16
		move	$a0,	$s6
		syscall

open_created:	li	$v0,	13
		la	$a0,	fileName
		li	$a1,	0
		li	$a2,	0
		syscall
		move	$s6,	$v0
		
read_file:	li	$v0,	14
		move	$a0,	$s6
		la	$a1,	inputBuffer
		li	$a2,	100
		syscall

exit_it:	li	$v0,	16
		move	$a0,	$s6
		syscall

getReady:	
		la	$t0,	inputBuffer
		la	$t1,	anotherBuffer
		li	$s7,	2
		addi	$s2,	$zero,	7		# used to count the number of loops executed		

loop:		lbu	$t2,	0($t0)
		bne	$t2,	$zero,	setParity
		j	checkParity
addOne:	
		addi	$t0,	$t0,	1
		addi	$t1,	$t1,	1
		j	loop
		
setParity:
		add	$s1,	$zero,	$zero		# used to record the number of 1s
		add	$s0,	$t2,	$zero		# copy the byte to $s0
		add	$s3,	$zero,	$zero		# set up a counter

count:		
		beq 	$s3,	$s2,	checkodds
		andi	$s4,	$s0,	1
		add	$s1,	$s1,	$s4
		addi	$s3,	$s3,	1
		srl	$s0,	$s0,	1
		j 	count	
checkodds:	
		divu	$s1,	$s7
		mfhi	$s6
		bne	$s6,	$zero,	addnumber
		addi	$s0,	$t2,	0
		j	writeBuffer

addnumber:
		addi	$s0,	$t2,	128		 	   
		
writeBuffer:
		sb	$s0,	0($t1)			# store the 8-bit data to the new buffer after adding parity
		j	addOne								

checkReady:	
		la	$t1,	anotherBuffer
		addi	$s2,	$zero,	7		# used to count the number of loops executed	

setBreakPoint:
		

checkParity:	
		lbu	$t2,	($t1)
		beq	$t2,	$zero,	okay
		j	checkBegins

checkBegins:
		add	$s1,	$zero,	$zero		# used to record the number of 1s
		add	$s0,	$t2,	$zero		# copy the byte to $s0
		add	$s3,	$zero,	$zero		# set up a counter

checkOne:		
		beq 	$s3,	$s2,	checkValid
		andi	$s4,	$s0,	1
		add	$s1,	$s1,	$s4
		addi	$s3,	$s3,	1
		srl	$s0,	$s0,	1
		j 	count	
checkValid:	
		divu	$s1,	$s7
		mfhi	$s6
		bne	$s6,	$zero,	corrupted
		addi	$t1,	$t1, 	1
		j	checkParity	

okay:		li	$v0,	4
		la	$a0,	outputOK
		syscall
		j	Exit

corrupted:	li	$v0,	4
		la	$a0,	outputCorrupt
		syscall

Exit:	
		li	$v0,	10
		syscall
		
# TestRuns:
# 1. First, do not manually set the breakpoint and run the program:
# The data is OK.
# -- program is finished running --	

# 2. Second, 		
