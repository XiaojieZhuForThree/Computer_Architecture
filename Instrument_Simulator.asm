.data
input:		.asciiz		"Please select the instrument you want to play: 1. Piano, 2. Organ, 3. Guitar, 4. Pipe"
buffer:		.space		1
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
key11:		.byte		'-'
key12:		.byte		'='
key13:		.byte		'q'
key14:		.byte		'w'
key15:		.byte		'e'
key16:		.byte		'r'
key17:		.byte		't'
key18:		.byte		'y'
key19:		.byte		'u'
key20:		.byte		'i'
key21:		.byte		'o'
key22:		.byte		'p'
key23:		.byte		'['
key24:		.byte		']'
	.text
Input:	li	$v0,	51						# input the instrument
	la	$a0,	input
	la	$a1,	buffer
	li	$a2,	100						# set the maximum char num to 100
	syscall
		
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
	lbu	$t2,	key11
	beq	$t1,	$t2, 	play11
	lbu	$t2,	key12
	beq	$t1,	$t2, 	play12	
	lbu	$t2,	key13
	beq	$t1,	$t2, 	play13	
	lbu	$t2,	key14
	beq	$t1,	$t2, 	play14	
	lbu	$t2,	key15
	beq	$t1,	$t2, 	play15	
	lbu	$t2,	key16
	beq	$t1,	$t2, 	play16	
	lbu	$t2,	key17
	beq	$t1,	$t2, 	play17	
	lbu	$t2,	key18
	beq	$t1,	$t2, 	play18	
	lbu	$t2,	key19
	beq	$t1,	$t2, 	play19	
	lbu	$t2,	key20
	beq	$t1,	$t2, 	play20	
	lbu	$t2,	key21
	beq	$t1,	$t2, 	play21	
	lbu	$t2,	key22
	beq	$t1,	$t2, 	play22	
	lbu	$t2,	key23
	beq	$t1,	$t2, 	play23
	lbu	$t2,	key24
	beq	$t1,	$t2, 	play24	
	j	IO
		
play1:	li	$v0,	31
	li	$a0, 	60
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play2:	li	$v0,	31
	li	$a0, 	61
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play3:	li	$v0,	31
	li	$a0, 	62
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play4:	li	$v0,	31
	li	$a0, 	63
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play5:	li	$v0,	31
	li	$a0, 	64
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play6:	li	$v0,	31
	li	$a0, 	65
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play7:	li	$v0,	31
	li	$a0, 	66
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play8:	li	$v0,	31
	li	$a0, 	67
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play9:	li	$v0,	31
	li	$a0, 	68
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO

play10:	li	$v0,	31
	li	$a0, 	69
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play11:	li	$v0,	31
	li	$a0, 	70
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play12:	li	$v0,	31
	li	$a0, 	71
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play13:	li	$v0,	31
	li	$a0, 	72
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play14:	li	$v0,	31
	li	$a0, 	73
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play15:	li	$v0,	31
	li	$a0, 	74
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play16:	li	$v0,	31
	li	$a0, 	75
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play17:	li	$v0,	31
	li	$a0, 	76
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play18:	li	$v0,	31
	li	$a0, 	77
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play19:	li	$v0,	31
	li	$a0, 	78
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play20:	li	$v0,	31
	li	$a0, 	79
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play21:	li	$v0,	31
	li	$a0, 	80
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play22:	li	$v0,	31
	li	$a0, 	81
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play23:	li	$v0,	31
	li	$a0, 	82
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
	
play24:	li	$v0,	31
	li	$a0, 	83
	li	$a1,	1000
	li	$a2,	0
	li	$a3,	127
	syscall
	j 	IO
