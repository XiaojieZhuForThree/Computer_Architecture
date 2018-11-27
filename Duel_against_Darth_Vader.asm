	.data
greeting:	.asciiz		""
input:		.asciiz		"Welcome to the arena! \nPlease select the character you want to play: 1. Luke Skywalker, 2. Iron Man, 3. Harry Potter, 4. Darth Vader"
buffer:		.space		2

outputS:	.asciiz		"You have selected Luke Skywalker."
outputI:	.asciiz		"You have selected Iron Man."
outputP:	.asciiz		"You have selected Harry Potter."
outputV:	.asciiz		"You have selected Darth Vader."
output2:	.asciiz		" Let's begin!"

wrong:		.asciiz		"Invalid input, "
goback:		.asciiz		"please select a character."

noValue:	.asciiz		"You didn't pick a character, "
return:		.asciiz		"please select one."

endOutput:	.asciiz		"I hope you enjoy the game, "
endOutput2:	.asciiz		"bye!"

Skywalker:	.byte		1
Iron:		.byte		2
Potter:		.byte		3
Vader:		.byte		4

key1:		.byte 		'1'
key2:		.byte		'2'
key3:		.byte	 	'3'
key4:		.byte 		'4'

keyHit:		.byte		'a'
keyDodge:	.byte		'd'
keySuper:	.byte		's'


Vader1:		.asciiz		"\n                       .-."
Vader2:		.asciiz		"\n                      |_:_|"
Vader3:		.asciiz		"\n                     /(_Y_)\\"
Vader4:		.asciiz		"\n.                   ( \/M\/ )"
Vader5:		.asciiz		"\n '.               _.'-/'-'\-'._"
Vader6:		.asciiz		"\n   ':           _/.--'[[[[]'--.\\_"
Vader7:		.asciiz		"\n     ':        /_'  : |::| :    .\\"
Vader8:		.asciiz		"\n       ':     //   ./ |oUU| \.'  :\\"
Vader9:		.asciiz		"\n         ':  _:'..' \_|___|_/ :   :|"
Vader10:	.asciiz		"\n           ':.  .'  |_[___]_|  :.':\\"
Vader11:	.asciiz		"\n            [::\ |  :  | |  :   ; : \\"
Vader12:	.asciiz		"\n             '-'   \/'.| |.' \  .;.' |"
Vader13:	.asciiz		"\n             |\_    \  '-'   :       |"
Vader14:	.asciiz		"\n             |  \    \ .:    :   |   |"
Vader15:	.asciiz		"\n             |   \    | '.   :    \  |"
Vader16:	.asciiz		"\n             /       \   :. .;       |"
Vader17:	.asciiz		"\n            /     |   |  :__/     :  \\"
Vader18:	.asciiz		"\n           |  |   |    \:   | \   |   ||"
Vader19:	.asciiz		"\n          /    \  : :  |:   /  |__|   /|"
Vader20:	.asciiz		"\n          |     : : :_/_|  /'._\  '--|_\\"
Vader21:	.asciiz		"\n          /___.-/_|-'   \  \_"
Vader22:	.asciiz		"\n                         '-'"


Yoda1:		.asciiz		 "\n                    ____"
Yoda2:		.asciiz		 "\n                 _.' :  `._"
Yoda3:		.asciiz		 "\n             .-.'`.  ;   .'`.-."
Yoda4:		.asciiz		 "\n    __      / : ___\ ;  /___ ; \      __"
Yoda5:		.asciiz		 "\n  ,'_   --.:__; .-. ;: : .-. :__;.--   _`,"
Yoda6:		.asciiz		 "\n  :  `.t  --..  <@.`;_   ,@>` ..--  j.  `;"
Yoda7:		.asciiz		 "\n       `:-.._J '-.-'L__ `-- ' L_..-;'"
Yoda8:		.asciiz		 "\n          -.__ ;  .-    -.  : __.- "
Yoda9:		.asciiz		 "\n             L ' /.------.\ ' J"
Yoda10:		.asciiz		 "\n               -.    --    .- "
Yoda11:		.asciiz		 "\n             __.l -:_JL_;- ;.__"
Yoda12:		.asciiz		 "\n          .-j/'.;  ;""""  / .'\"-."
Yoda13:		.asciiz		 "\n        .' /:`.  -.:     .-  .';  `."
Yoda14:		.asciiz		 "\n     .-   / ;   -.  -..-  .-   :     -."
Yoda15:		.asciiz		 "\n  .+ -.  : :       -.__.-       ;-._   \_"
Yoda16:		.asciiz		 "\n  ; \  `.; ;                    : :  +. ;"
Yoda17:		.asciiz		 "\n  :  ;   ; ;                    : ;  : \:"
Yoda18:		.asciiz		 "\n : `. -; ;  ;                  :  ;   ,/;"
Yoda19:		.asciiz		 "\n  ;    -: ;  :                ;  : .- '  :"
Yoda20:		.asciiz		 "\n  :\     \  : ;             : \.-       :"
Yoda21:		.asciiz		 "\n   ;`.    \  ; :            ;. _..--  / ;"
Yoda22:		.asciiz		 "\n   :   -.   -:  ;          :/.       .'  :"
Yoda23:		.asciiz		 "\n     \       .-`.\        /t-     :-+.   :"
Yoda24:		.asciiz		 "\n      `.  .-     `l    __/ /`. :  ; ; \  ;"
Yoda25:		.asciiz		 "\n        \   .-  .- -.-   .  . j \  /   ;/"
Yoda26:		.asciiz		 "\n         \ / .-    /.     . .  ;_:     ;"
Yoda27:		.asciiz		 "\n          :-  -.`./-.      /    `.___. "
Yoda28:		.asciiz		 "\n                \ `t  ._  /  --- :F_P:"
Yoda29:		.asciiz		 "\n                  -.t-._: "

HP:		.word 	100
dodge:		.word	3
youHit:		.word	5
enemyHit:	.word	8
superHit:	.word	8
superHitTimes:	.word	4

	.text
initial:	
		li	$v0,	51						# input the character
		la	$a0,	input
		syscall
		
pick:	
		li	$t7,	2	
		beq	$a1,	$t7,	endProgram
		li	$t7,	3	
		beq	$a1,	$t7,	repick
		li	$t7,	1
		beq	$a1,	$t7,	invalid
		j	prep

	
repick:		li	$v0,	59
		la	$a0,	noValue
		la	$a1,	return
		syscall
		j	initial


invalid:	li	$v0,	59
		la	$a0,	wrong
		la	$a1,	goback
		syscall
		j	initial
		
	
prep:		lb	$t5,	Skywalker
		beq	$a0,	$t5,	pickS	
		lb	$t5,	Iron
		beq	$a0,	$t5,	pickI
		lb	$t5,	Potter
		beq	$a0,	$t5,	pickP	
		lb	$t5,	Vader
		beq	$a0,	$t5,	pickV
		j	invalid

pickS:	
		add	$t4,	$zero,	$zero
		li	$v0,	59
		la	$a0,	outputS
		la	$a1,	output2
		syscall
		j	start
	
pickI:	
		addi	$t4,	$zero,	16
		li	$v0,	59
		la	$a0,	outputI
		la	$a1,	output2
		syscall
		j	start

	
pickP:	
		addi	$t4,	$zero,	24
		li	$v0,	59
		la	$a0,	outputP
		la	$a1,	output2
		syscall
		j	start
	
pickV:	
		addi	$t4,	$zero,	72
		li	$v0,	59
		la	$a0,	outputV
		la	$a1,	output2
		syscall
		j	start

start:		li	$v0,	4
		la	$a0,	Vader1
		syscall
		
		li	$v0,	4
		la	$a0,	Vader2
		syscall
		
		li	$v0,	4
		la	$a0,	Vader3
		syscall
		
		li	$v0,	4
		la	$a0,	Vader4
		syscall
		
		li	$v0,	4
		la	$a0,	Vader5
		syscall
		
		li	$v0,	4
		la	$a0,	Vader6
		syscall
		
		li	$v0,	4
		la	$a0,	Vader7
		syscall
		
		li	$v0,	4
		la	$a0,	Vader8
		syscall
		
		li	$v0,	4
		la	$a0,	Vader9
		syscall
		
		li	$v0,	4
		la	$a0,	Vader10
		syscall
		
		li	$v0,	4
		la	$a0,	Vader11
		syscall
		
		li	$v0,	4
		la	$a0,	Vader12
		syscall
		
		li	$v0,	4
		la	$a0,	Vader13
		syscall
		
		li	$v0,	4
		la	$a0,	Vader14
		syscall
		
		li	$v0,	4
		la	$a0,	Vader15
		syscall
		
		li	$v0,	4
		la	$a0,	Vader16
		syscall
		
		li	$v0,	4
		la	$a0,	Vader17
		syscall
		
		li	$v0,	4
		la	$a0,	Vader18
		syscall
		
		li	$v0,	4
		la	$a0,	Vader19
		syscall
		
		li	$v0,	4
		la	$a0,	Vader20
		syscall
		
		li	$v0,	4
		la	$a0,	Vader21
		syscall
		
		li	$v0,	4
		la	$a0,	Vader22
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda1
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda2
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda3
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda4
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda5
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda6
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda7
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda8
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda9
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda10
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda11
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda12
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda13
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda14
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda15
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda16
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda17
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda18
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda19
		syscall

		li	$v0,	4
		la	$a0,	Yoda20
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda21
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda22
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda23
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda24
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda25
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda26
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda27
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda28
		syscall
		
		li	$v0,	4
		la	$a0,	Yoda29
		syscall
				
		

endProgram:	li	$v0,	59
		la	$a0,	endOutput
		la	$a1,	endOutput2
		syscall
	
		li	$v0,	10
		syscall
