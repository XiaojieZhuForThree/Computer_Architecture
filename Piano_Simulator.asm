	.data
input:		.asciiz		"Please select the instrument you want to play"
output1:	.asciiz		"You have selected to play the "
output2:	.asciiz		"Please connect the Keyboard Simulator"
key1:		.byte 		'1'
key2:		.byte		'2'
key3:		.byte	 	'3'
key4:		.byte 		'4'
key5:		.byte 		'5'
key6:		.byte		'6'
key7:		.byte 		'7'
key8:		.byte 		'8'
key9:		.byte		'9'
key10:		.byte 		'0'


	.text
IO: 	li 	$t0, 	0xffff0000
	beqz	$t0,	IO
	lw 	$t1, 	0xffff0004

	
key:	lbu	$t2,	key1
	beq	$t1,	$t2, 	play1
	addi	$t0,	$t0,	1
	b 	IO
	
play1:	li	$v0,	31
	li	$a0, 	70
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	addi	$t0,	$t0,	1
	b 	IO
