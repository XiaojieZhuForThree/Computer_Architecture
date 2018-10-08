	.data										# set up all the data
input:		.space		101							# save space for the input sentence, with max char for 100
message:	.asciiz  	"Input your sentence below(less than 100 characters): "	# messaged for the dialog box to prompt the user to input a sentence
output1:	.asciiz 	"\n\nyour input was: \n"				
output2:	.asciiz		"words: "
output3:	.asciiz		"characters: "
nword:		.word		0							# used to store the number of words
nchar:		.word		0							# used to store the number of characters
endmessage1:	.asciiz 	"Program ended. "
endmessage2:	.asciiz 	"Thank you for using, good bye!"			# used to end the program. 

	.text
prompt:									# used to open up the dialog and aske the user to 
	li	$v0,	54						# input some sentence
	la	$a0,	message
	la	$a1,	input
	li	$a2,	100						# set the maximum char num to 100
	syscall	
	
endinput:								# if the status is not OK, end the program
	bne	$a1,	$zero,	byebye	
	
prepare:								# load the necessary registers and save space for $s1 in the stack
	la	$a0,	input
	addi	$sp,	$sp,	-8
	sw	$ra	4($sp)						# save $ra in the stack
	sw	$s1,	0($sp)						# save $s1 for future use
	
	addi	$t3,	$zero,	32						# set $t3 to 32 to determine if the char is space 
	add	$s1,	$zero,	$zero						# $s1 is used to record the address of each character in the sentence.
	add	$v0,	$zero,	$zero						# used to store chars
	add	$v1,	$zero,	$zero						# used to store words
	
caller:										
	jal	determiner							# jump and link to the function determiner to count char and words

	subi	$v0,	$v0,	1						# when all characters are iterated, sub 1 from $v0 for "\0" 
	addi	$v1,	$v1,	1						# and add 1 for the initial word
	sw	$v0,	nchar							# store the numbers to nchar and nword
	sw	$v1,	nword	
	
output:											
	li	$v0,	4							# output the results
	la	$a0,	output1
	syscall
	
	la	$a0,	input
	syscall
	
	li	$v0,	4
	la	$a0,	output2
	syscall
	
	li	$v0,	1
	lw	$a0,	nword
	syscall
	
	li	$v0,	11
	li	$a0,	32
	syscall
	
	li	$v0,	4
	la	$a0,	output3
	syscall
	
	li	$v0,	1
	lw	$a0,	nchar
	syscall

stop:	
	lw	$ra,	4($sp)						# when the output finishes, restore the $s1 and $ra and reclaim the stack
	lw	$s1,	0($sp)						# then jump back to prompt
	addi 	$sp, 	$sp, 	8
	j	prompt
	
			
determiner:								# the function determiner determines 
	add	$t1,	$s1,	$a0					# if the next byte is valid, if not, jump back to $ra
	lbu	$t2,	0($t1)						# else, count the words and chars
	bne	$t2,	$zero,	crecord
	jr	$ra

crecord:								# first add 1 to char,then determin if the char is space, if yes,
	addi	$v0,	$v0,	1					# jump to word recorder(wrecord)
	beq	$t2,	$t3,	wrecord
	addi	$s1,	$s1,	1					# if not, add the byte address to 1, then
	j	determiner						# jump back to determiner.	
							
wrecord:								# if char is space, add 1 to word
	addi	$v1,	$v1,	1
	addi	$s1,	$s1,	1					# add byte address to 1, then 
	j	determiner						# jump back to determiner
	
byebye:										# if the user hit the cancel or doesn't input the proper sentence, 
	li	$v0,	59							# say goodbye and end the program.
	la 	$a0,	endmessage1
	la	$a1,	endmessage2
	syscall

Exit:
	li	$v0,	10
	syscall
	
# test sets:

# input; the rain in spain stays mainly in a plain
# results:
# your input was: 
# the rain in spain stays mainly in a plain
# words: 9 characters: 41
# -- program is finished running --

# input: As long as there are tests, there will be prayer in schools.
# results:
# your input was: 
# As long as there are tests, there will be prayer in schools.
# words: 12 characters: 60
# -- program is finished running --
