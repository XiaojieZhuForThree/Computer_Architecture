	.data
fileName:	.asciiz		"homework4.txt"
txtBuffer:	.asciiz		"The quick brown fox jumps over the lazy dog."
inputBuffer:	.space		100
anotherBuffer:	.space		100

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

buffer_Loop:	
