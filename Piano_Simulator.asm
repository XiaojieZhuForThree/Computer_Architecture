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
key11:		.byte		'a'
key12:		.byte		'b'

	.text
	lui	$t0,	0xffff
IO: 	lw	$t1,	0($t0)
	andi	$t1,	$t1,	0x0001
	beq	$t1,	$zero,	IO
	lbu  	$t1, 	4($t0)

	
key:	lbu	$t2,	key1
	beq	$t1,	$t2, 	play1
	lbu	$t2,	key2
	beq	$t1,	$t2, 	play2
	lbu	$t2,	key3
	beq	$t1,	$t2, 	play3
	lbu	$t2,	key4
	beq	$t1,	$t2, 	play4
	lbu	$t2,	key5
	beq	$t1,	$t2, 	play5
	lbu	$t2,	key6
	beq	$t1,	$t2, 	play6
	lbu	$t2,	key7
	beq	$t1,	$t2, 	play7
	lbu	$t2,	key8
	beq	$t1,	$t2, 	play8
	lbu	$t2,	key9
	beq	$t1,	$t2, 	play9
	lbu	$t2,	key10
	beq	$t1,	$t2, 	play10
		
play1:	li	$v0,	31
	li	$a0, 	61
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play2:	li	$v0,	31
	li	$a0, 	62
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play3:	li	$v0,	31
	li	$a0, 	63
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play4:	li	$v0,	31
	li	$a0, 	64
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play5:	li	$v0,	31
	li	$a0, 	65
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play6:	li	$v0,	31
	li	$a0, 	66
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play7:	li	$v0,	31
	li	$a0, 	67
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play8:	li	$v0,	31
	li	$a0, 	68
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play9:	li	$v0,	31
	li	$a0, 	69
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play10:	li	$v0,	31
	li	$a0, 	70
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
