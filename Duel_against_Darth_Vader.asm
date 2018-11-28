	.data
greeting:	.asciiz		""
input:		.asciiz		"Welcome to the galaxy! \nPlease select the character you want to play: 1. Yoda, 2. Darth Vader"
buffer:		.space		2

outputY:	.asciiz		"You have selected Yoda."
outputYm:	.asciiz		"Master Yoda, it's your turn! \nWhat do you want to do: 1. Attack, 2. Use the force, 3. Recover"
outputV:	.asciiz		"You have selected Darth Vader."
outputVm:	.asciiz		"Lord Vader, it's your turn! \nWhat do you want to do: 1. Attack, 2. Use the dark force, 3. Recover"
output2:	.asciiz		" Let's begin!"

wrong:		.asciiz		"Invalid input, "
used:		.asciiz		"You can no longer use the force anymore, "
usedAgain:	.asciiz		"You can no longer use the heal anymore, "
goback:		.asciiz		"please select a character."
goback2:	.asciiz		"please select a move."
goback3:	.asciiz		"please select another move"

noValue:	.asciiz		"You didn't pick a character, "
return:		.asciiz		"please select one."

endOutput:	.asciiz		"I hope you enjoy the game, "
endOutput2:	.asciiz		"may the force be with you!"

Yoda:		.byte		1
Vader:		.byte		2

keyHit:		.byte		1
keySuper:	.byte		2
keyRecover:	.byte		3

YodaHit:	.asciiz		"\nMaster Yoda striked Darth Vader, causing damage: "
YodaSuper:	.asciiz		"\nMaster Yoda striked Darth Vader with the force, causing damage: "
YodaHeal:	.asciiz		"\nMaster Yoda healed himseilf, HP increases by: "

VaderHit:	.asciiz		"\nLord Vader striked Yoda, causing damage: "
VaderSuper:	.asciiz		"\nLord Vader striked Yoda with the dark force, causing damage: "
VaderHeal:	.asciiz		"\nLord Vader healed himseilf, HP increases by: "

Divider1:	.asciiz		"\n##################################################################"
Divider2:	.asciiz		"\n------------------------------------------------------------------"

VaderHp:	.asciiz		"\nLord Vader has HP remaining: "
VaderNoF:	.asciiz		", force slot remaing: "
VaderNoH:	.asciiz		", healing slot remaing: "
YodaHp:		.asciiz		"\nMaster Yoda has HP remaining: "
YodaNoF:	.asciiz		", force slot remaing: "
YodaNoH:	.asciiz		", healing slot remaing: "

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
Yoda11:		.asciiz		 "\n                 l -:_JL_;"
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

YodaWin1:	.asciiz 	"\nCongratulations Master Yoda,"
YodaWin2:	.asciiz		" you brought balance to the force."
YodaLose1:	.asciiz		"\nI'm sorry Master Yoda,"
YodaLose2:	.asciiz		" you are defeated by Lord Vader."
VaderWin1:	.asciiz		"Congratulations Lord Vader,"
VaderWin2:	.asciiz		" you defended the honor of the Empire!"
VaderLose1:	.asciiz		"I'm sorry Lord Vader,"
VaderLose2:	.asciiz		" you failed and disappointed the Emperor!"


	.text
initial:	
		li	$s4,	100			# Yoda's HP
		li	$s5,	100			# Vader's HP
		li	$t3,	3			# Yoda's force slot
		li	$t4,	3			# Vader's force slot
		li	$t0,	3			# Yoda's heal slot
		li	$t1,	3			# Vader's heal slot
		
prompt:		li	$v0,	51			# input the character
		la	$a0,	input
		syscall
		
pick:	
		li	$t7,	-2	
		beq	$a1,	$t7,	endProgram
		li	$t7,	-3	
		beq	$a1,	$t7,	repick
		li	$t7,	-1
		beq	$a1,	$t7,	invalid
		j	log

	
repick:		li	$v0,	59
		la	$a0,	noValue
		la	$a1,	return
		syscall
		j	prompt


invalid:	li	$v0,	59
		la	$a0,	wrong
		la	$a1,	goback
		syscall
		j	prompt
		
log:		
		add	$s0,	$a0,	$zero
		add	$s1,	$a0,	$zero	
prep:				
		lb	$t5,	Yoda
		beq	$s0,	$t5,	pickY	
		lb	$t5,	Vader
		beq	$s0,	$t5,	pickV
		j	invalid

pickY:	
		li	$v0,	59
		la	$a0,	outputY
		la	$a1,	output2
		syscall
		j	start
		
pickV:	
		li	$v0,	59
		la	$a0,	outputV
		la	$a1,	output2
		syscall
		j	start

start:
		addi	$s7,	$zero,	1
		add	$t2,	$zero,	$zero
		
determine:
		ble	$s4,	0,	VaderWin
		ble	$s5,	0,	YodaWin
		
		bne	$s0,	1,	pickVm
		la	$a0,	outputYm
		j	determiner
		
pickVm:		la	$a0,	outputVm

determiner:	
		bne	$s7,	$zero,	yourMove		

enemyMove:	
		addi	$s7,	$zero,	1
		jal	enemyRan
		addi	$a0,	$a0,	1
		j	whatYouDo
		
enemyRan:
		li	$v0,	42
		li	$a0,	50
		li	$a1,	3
		syscall		
		jr 	$ra						
						
yourMove:	
		add	$s7,	$zero,	$zero

movePrompt:			
		li	$v0,	51
		syscall

validOrNot:
		li	$t7,	-2	
		beq	$a1,	$t7,	endProgram
		li	$t7,	-3	
		beq	$a1,	$t7,	reEnter
		li	$t7,	-1
		beq	$a1,	$t7,	noSuch
		j	whatYouDo

reEnter:
		li	$v0,	59
		la	$a0,	noValue
		la	$a1,	return
		syscall
		addi	$s7,	$zero,	1
		j	determine

noSuch:
		li	$v0,	59
		la	$a0,	wrong
		la	$a1,	goback2
		syscall
		addi	$s7,	$zero,	1
		j	determine	

usedUp:
		li	$v0,	59
		la	$a0,	used
		la	$a1,	goback3	
		syscall
		addi	$s7,	$zero,	1
		j	determine	

usedUpAgain:
		li	$v0,	59
		la	$a0,	usedAgain
		la	$a1,	goback3	
		syscall
		addi	$s7,	$zero,	1
		j	determine	

whatYouDo:	
		lb	$t5,	keyHit
		beq	$a0,	$t5,	Hit	
		lb	$t5,	keySuper
		beq	$a0,	$t5,	whichOne
		lb	$t5,	keyRecover
		beq	$a0,	$t5,	healWhich
		j	noSuch		
		
Hit:
		jal	generateRandom
		addi	$s3,	$a0,	1
		
determine2:
		bne	$s1,	1,	hitV
		li	$s1,	2
		sub	$s5,	$s5,	$s3
		li	$v0,	4
		la	$a0,	YodaHit
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		j	print
		
hitV:
		li	$s1,	1
		sub	$s4,	$s4,	$s3
		li	$v0,	4
		la	$a0,	VaderHit
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall

		j	print

whichOne:	
		bne	$s7,	0,	goE
		bne	$s0,	1,	seeV
		beq	$t3,	0,	usedUp	
		j	Super
seeV:
		beq	$t4,	0,	usedUp
		j	Super

goE:
		bne	$s0,	1,	backV
		bne	$t3,	0,	Super			
		j 	enemyMove
backV:	
		bne	$t3,	0,	Super
		j	enemyMove

Super:		
		jal	generateRandom
		addi	$s3,	$a0,	1
		addi	$s3,	$s3,	10
		j	determine3
					
determine3:
		bne	$s1,	1,	superV
		sub	$s5,	$s5,	$s3
		li	$v0,	4
		la	$a0,	YodaSuper
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		li	$s1,	2
		subi	$t3,	$t3,	1
		j	print
superV:
		sub	$s4,	$s4,	$s3
		li	$v0,	4
		la	$a0,	VaderSuper
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		li	$s1,	1
		subi	$t4,	$t4,	1
		j	print

healWhich:	
		bne	$s7,	0,	determineE
		bne	$s0,	1,	noV
		beq	$t0,	0,	usedUpAgain	
		j	Recover
noV:
		beq	$t1,	0,	usedUpAgain
		j	Recover

determineE:
		bne	$s0,	1,	gbackV
		bne	$t0,	0,	Recover			
		j 	enemyMove
gbackV:	
		bne	$t1,	0,	Recover
		j	enemyMove
Recover:
		jal	generateRandom
		addi	$s3,	$a0,	1


determine4:
		bne	$s1,	1,	healV
		add	$s4,	$s4,	$s3
		jal	healthdeterminerY
		li	$v0,	4
		la	$a0,	YodaHeal
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		li	$s1,	2
		subi	$t0,	$t0,	1
		j	print

healthdeterminerY:
		bgt	$s4,	100,	resetY
		jr	$ra

resetY:
		addi	$s4,	$zero,	100
		jr	$ra

healV:
		add	$s5,	$s5,	$s3
		jal	healthdeterminerV
		li	$v0,	4
		la	$a0,	VaderHeal
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		li	$s1,	1
		subi	$t1,	$t1,	1		
		j	print

healthdeterminerV:
		bgt	$s5,	100,	resetV
		jr	$ra

resetV:
		addi	$s5,	$zero,	100
		jr	$ra

		
generateRandom:
		li	$v0,	42
		li	$a0,	20
		li	$a1,	10
		syscall
		jr	$ra

print:		
		li	$v0,	4
		la	$a0,	Divider1
		syscall
		li	$v0,	4
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
		la	$a0,	VaderHp
		syscall
		
		li	$v0,	1
		add	$a0,	$zero,	$s5
		syscall
		
		li	$v0,	4
		la	$a0,	VaderNoF
		syscall
		
		li	$v0,	1
		add	$a0,	$zero,	$t4
		syscall

		li	$v0,	4
		la	$a0,	VaderNoH
		syscall
		
		li	$v0,	1
		add	$a0,	$zero,	$t1
		syscall


		li	$v0,	4
		la	$a0,	Divider2
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
		la	$a0,	YodaHp
		syscall
		
		li	$v0,	1
		add	$a0,	$zero,	$s4
		syscall
		
		li	$v0,	4
		la	$a0,	YodaNoF
		syscall
		
		li	$v0,	1
		add	$a0,	$zero,	$t3
		syscall
		
		li	$v0,	4
		la	$a0,	YodaNoH
		syscall
		
		li	$v0,	1
		add	$a0,	$zero,	$t0
		syscall
								
		li	$v0,	4
		la	$a0,	Divider1
		syscall		
		j	determine
		

VaderWin:
		bne	$s0,	1,	win1
		j	lose1
		
win1:		li	$v0,	59
		la	$a0,	VaderWin1
		la	$a1,	VaderWin2
		syscall
		j	endProgram	

lose1:		
		li	$v0,	59
		la	$a0,	YodaLose1
		la	$a1,	YodaLose2
		syscall
		j	endProgram
						
												
YodaWin:
		bne	$s0,	2,	win2
		j	lose2

win2:
		li	$v0,	59
		la	$a0,	YodaWin1
		la	$a1,	YodaWin2
		syscall
		j	endProgram	

lose2:		
		li	$v0,	59
		la	$a0,	VaderLose1
		la	$a1,	VaderLose2
		syscall
		j	endProgram
		
						
endProgram:	li	$v0,	59
		la	$a0,	endOutput
		la	$a1,	endOutput2
		syscall
	
		li	$v0,	10
		syscall
