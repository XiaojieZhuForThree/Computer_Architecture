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
		la	$t0,	txtBuffer
		la	$t1,	anotherBuffer
		li	$s7,	2
		addi	$t7,	$zero,	1
		li	$t6,	128		

loop:		lbu	$t2,	($t0)
		bne	$t2,	$0,	setParity
		
move:	
		addi	$t0,	$t0,	1
		addi	$t1,	$t1,	1
		j	loop
		
setParity:
		add	$s1,	$zero,	$zero		# used to record the number of 1s
		add	$s0,	$t2,	$zero		# copy the byte to $s0
		addi	$s2,	$zero,	7		# used to count the number of loops executed
		add	$s3,	$zero,	$zero		# set up a counter
		addi	$s4,	$zero,	1		# set up a checker
		sb	$t2,	($t1)
		
count:		
		beq 	$s3,	$s2,	checkodds
		andi	$s5,	$s0,	1
		add	$s1,	$s1,	$s5
		addi	$s3,	$s3,	1
		srl	$s0,	$s0,	1
			
checkodds:	
		divu	$s1,	$s7
		mfhi	$s6
		beq	$s6,	$t7,	addnumber
		j	setParity

addnumber:
		add	$t2,	$t2,	$t6
		j	setParity		 	   
		
				
outer:		
