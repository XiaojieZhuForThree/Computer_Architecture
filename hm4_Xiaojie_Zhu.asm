	.data
fileName:	.asciiz		"homework4.txt"
textmessage:	.asciiz		"The quick brown fox jumps over the lazy dog."
inputBuffer:	.space		100
parityBuffer:	.space		100
outputOK:	.asciiz		"The data is intact."
outputCorrupt:	.asciiz		"The data has been corrupted!"

	.text
open_file:	li	$v0,	13			# created a new file named "homework4.txt"
		la	$a0,	fileName
		li	$a1,	1
		li	$a2,	0
		syscall
		move	$s6,	$v0

write_file:	li	$v0,	15			# write the sentence "The quick brown fox jumps over the lazy dog."
		move	$a0,	$s6			# to the newly created txt file.
		la	$a1,	textmessage
		li	$a2,	44
		syscall

exit_file:	li	$v0,	16			# exit the file
		move	$a0,	$s6
		syscall

open_created:	li	$v0,	13			# open the created file
		la	$a0,	fileName
		li	$a1,	0
		li	$a2,	0
		syscall
		move	$s6,	$v0
		
read_file:	li	$v0,	14			# and read the contents of the txt to the inputBuffer
		move	$a0,	$s6
		la	$a1,	inputBuffer
		li	$a2,	100
		syscall

exit_it:	li	$v0,	16			# after reading the contents, close the file safely
		move	$a0,	$s6
		syscall

getReady:						# load both the inputBuffer and the parityBuffer
		la	$t0,	inputBuffer	
		la	$t1,	parityBuffer
		li	$s7,	2			# set 2 as a dividend for checking the odd/even
		addi	$s2,	$zero,	7		# used to count the number of loops executed	
			

circle:		lbu	$t2,	0($t0)			# determine each byte in the inputBuffer for parity, 
		beq	$t2,	$zero,	checkReady	# when reaching the end, start checking the parity
		
setParity:
		add	$s1,	$zero,	$zero		# used to record the number of 1s
		add	$s0,	$t2,	$zero		# copy the byte to $s0
		add	$s3,	$zero,	$zero		# set up a counter

count:		
		beq 	$s3,	$s2,	checkOdds	# traverse each bit of the byte to determine if it's 1 or 0, and 
		andi	$s4,	$s0,	1		# record the number of 1s.
		add	$s1,	$s1,	$s4
		addi	$s3,	$s3,	1
		srl	$s0,	$s0,	1
		j 	count				# keep the loop until after 7 times.
		
			
checkOdds:						
		divu	$s1,	$s7			# divide the number of 1s by 2  
		mfhi	$s6
		bne	$s6,	$zero,	addnumber	# and ch if the remainder is 1 or 0
		addi	$s0,	$t2,	0		
		j	writeBuffer
		

addnumber:
		addi	$s0,	$t2,	128		# if 1, add 1 to the 7th bit, else don't change
				 	   		
writeBuffer:
		sb	$s0,	0($t1)			# store the 8-bit data to the new buffer after adding parity
		
addOne:	
		addi	$t0,	$t0,	1
		addi	$t1,	$t1,	1
		j	circle										

checkReady:						# after set all the parity and store it to the new data, check if
		la	$t1,	parityBuffer		# the parity is correct
		addi	$s2,	$zero,	8		# used to count the number of loops executed for each byte
			
		
checkParity:					
		lbu	$t2,	($t1)			# check the parity byte by byte
		beq	$t2,	$zero,	okay		# when reaching the finally loop, means the data is good

checkBegins:
		add	$s1,	$zero,	$zero		# used to record the number of 1s
		add	$s0,	$t2,	$zero		# copy the byte to $s0
		add	$s3,	$zero,	$zero		# set up a counter

countOne:		
		beq 	$s3,	$s2,	checkValid	# when reach 8 loops, determine the odd/even of the 1s
		andi	$s4,	$s0,	1
		add	$s1,	$s1,	$s4
		addi	$s3,	$s3,	1
		srl	$s0,	$s0,	1
		j 	countOne	

checkValid:						# if the 1s are odd, means the data has been compromised, otherwise
		divu	$s1,	$s7			# the data is good
		mfhi	$s6
		bne	$s6,	$zero,	corrupted
		addi	$t1,	$t1, 	1
		j	checkParity	

okay:		li	$v0,	4			# used to output the results
		la	$a0,	outputOK
		syscall
		j	Exit

corrupted:	li	$v0,	4
		la	$a0,	outputCorrupt
		syscall

Exit:							# used to exit the file
		li	$v0,	10
		syscall
		
# TestRuns:
# 1. First, do not manually set the breakpoint and run the program:
# The data is intact.
# -- program is finished running --	

# 2. Second, we set a breakpoint at checkReady(line 88). Then change the data manually, in my case, 
# I changed the data 0xe874a072 to 0xf874a072, which will change the number of 1s, and thus the program will print:
#  The data has been corrupted!
# -- program is finished running --
