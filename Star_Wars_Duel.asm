#######################################################################################################################
# # This is a small game with star wars background                                                                    #
# # you can choose to play Darth Vader or Master Yoda, and the computer will choose the other one                     #     
# # your goal is to use your character to defeat the computer's character.                                            #
#                                                                                                                     #
# # before running the program, please enlarge the Run I/O to fullest scale, for the game includes some ASCII arts    #
# # each character has unlimited strike times, 3 opportunities to use the great hit, and 3 opportunities to heal.     #
#######################################################################################################################
	
		
	.data
# start the game, a dialog box will pop out that prompts the player to input a number that represents the character of the game, or click 'cancel' to end the game
input:		.asciiz		"Welcome to the galaxy! \nPlease select the number of the character you want to play: 1. Yoda, 2. Darth Vader\n You can always quit the game by clicking 'Cancel'"

# if the user inputs the valid number, another dialog box will direct the user for further operations
outputY:	.asciiz		"You have selected Yoda."
outputV:	.asciiz		"You have selected Darth Vader."
output2:	.asciiz		" Let's begin!"


# characters: 1 for Yoda and 2 for Vader
Yoda:		.byte		1
Vader:		.byte		2


# to continue the game, the dialog box will ask the user to input the number that represents operations, or click cancel to end the game.
outputYm:	.asciiz		"Master Yoda, it's your turn! \nWhat do you want to do: 1. Attack, 2. Use the force, 3. Recover\n You can always quit the game by clicking 'Cancel'"
outputVm:	.asciiz		"Lord Vader, it's your turn! \nWhat do you want to do: 1. Attack, 2. Use the dark force, 3. Recover\n You can always quit the game by clicking 'Cancel'"


# in case of wrong character input, different feedback will be present
noValue:	.asciiz		"You didn't pick a character, "		# if the user doesn't input any value, 
return:		.asciiz		"please select one."			# the dialog box will ask the user to input one

wrong:		.asciiz		"Invalid input, "			# if the input is not acceptable
goback:		.asciiz		"please select a character."		# another input will be asked 


# in case of wrong operation input, different feedback will be present
noMove:		.asciiz		"You didn't pick a move, "		# if the user doesn't input any value, 
goback2:	.asciiz		"please select a move."			# the dialog box will ask the user to input one

used:		.asciiz		"You can no longer use the force anymore, "	# if the user used up the special skills(great hit or heal)
usedAgain:	.asciiz		"You can no longer use the heal anymore, "
goback3:	.asciiz		"please select another move"			# another input will be asked


# dialogs used to end the game 
endOutput:	.asciiz		"I hope you enjoy the game, "			
endOutput2:	.asciiz		"may the force be with you!"

# operations: 1 for hit, 2 for great hit, and 3 for heal
keyHit:		.byte		1
keySuper:	.byte		2
keyRecover:	.byte		3

# the opertaion record for Yoda
YodaHit:	.asciiz		"\nMaster Yoda striked Darth Vader, causing damage: "
YodaSuper:	.asciiz		"\nMaster Yoda striked Darth Vader with the force, causing damage: "
YodaHeal:	.asciiz		"\nMaster Yoda healed himseilf, HP increases by: "

# the opertaion record for Vader
VaderHit:	.asciiz		"\nLord Vader striked Yoda, causing damage: "
VaderSuper:	.asciiz		"\nLord Vader striked Yoda with the dark force, causing damage: "
VaderHeal:	.asciiz		"\nLord Vader healed himseilf, HP increases by: "

# the status record for Yoda
YodaHp:		.asciiz		"\nMaster Yoda has HP remaining: "
YodaNoF:	.asciiz		", force slot remaing: "
YodaNoH:	.asciiz		", healing slot remaing: "

# the status record for Vader
VaderHp:	.asciiz		"\nLord Vader has HP remaining: "
VaderNoF:	.asciiz		", force slot remaing: "
VaderNoH:	.asciiz		", healing slot remaing: "

# lines for separating the operations
Divider1:	.asciiz		"\n##################################################################"
Divider2:	.asciiz		"\n------------------------------------------------------------------"


# ASCII art for Yoda, used in record feedback
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


# ASCII art for Vader, used in record feedback
Vader1:		.asciiz		"\n                       .-."
Vader2:		.asciiz		"\n                      |_:_|"
Vader3:		.asciiz		"\n                     /(_Y_)\\"
Vader4:		.asciiz		"\n.                   (  \/M\/  )"
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


YodaWin1:	.asciiz 	"\nCongratulations Master Yoda,"
YodaWin2:	.asciiz		" you brought balance to the force and the galaxy."
YodaLose1:	.asciiz		"\nI'm sorry Master Yoda,"
YodaLose2:	.asciiz		" perhaps you're too old to use your light saber?"
VaderWin1:	.asciiz		"Congratulations Lord Vader,"
VaderWin2:	.asciiz		" you just beat the galaxy's most honored Jedi!"
VaderLose1:	.asciiz		"It's over Anakin,"
VaderLose2:	.asciiz		" the Jedi has the high ground again!"


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
		j	print
		
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
		add	$a0,	$zero,	$t2
		li	$a1,	3
		syscall
		addi	$t2,	$t2,	1		
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
		la	$a0,	noMove
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
		beq	$s7,	1,	print
		j	determine
		
hitV:
		li	$s1,	1
		sub	$s4,	$s4,	$s3
		li	$v0,	4
		la	$a0,	VaderHit
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		beq	$s7,	1,	print
		j	determine

whichOne:	
		bne	$s7,	0,	goE
		bne	$s0,	1,	seeV
		bgt	$t3,	0,	Super	
		j	usedUp

seeV:
		bgt	$t4,	0,	Super
		j	usedUp

goE:
		bne	$s0,	1,	backV
		bgt	$t4,	0,	Super			
		j 	enemyMove
		
backV:	
		bgt	$t3,	0,	Super
		j	enemyMove

Super:		
		jal	generateRandom
		addi	$s3,	$a0,	1
		addi	$s3,	$s3,	10
determine3:
		bne	$s1,	1,	superV
		sub	$s5,	$s5,	$s3
		subi	$t3,	$t3,	1
		li	$v0,	4
		la	$a0,	YodaSuper
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		li	$s1,	2
		beq	$s7,	1,	print
		j	determine
superV:
		sub	$s4,	$s4,	$s3
		subi	$t4,	$t4,	1
		li	$v0,	4
		la	$a0,	VaderSuper
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		li	$s1,	1
		beq	$s7,	1,	print
		j	determine

healWhich:	
		bne	$s7,	0,	determineE
		bne	$s0,	1,	noV
		beq	$t0,	0,	usedUpAgain	
		j	Recover
noV:
		beq	$t1,	0,	usedUpAgain
		j	Recover

determineE:
		bne	$s0,	2,	gbackY
		bgt	$t0,	0,	Recover			
		j 	enemyMove
gbackY:	
		bgt	$t1,	0,	Recover
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
		beq	$s7,	1,	print
		j	determine

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
		beq	$s7,	1,	print
		j	determine

healthdeterminerV:
		bgt	$s5,	100,	resetV
		jr	$ra

resetV:
		addi	$s5,	$zero,	100
		jr	$ra

		
generateRandom:
		li	$v0,	42
		add	$a0,	$zero,	$t2
		li	$a1,	10
		syscall
		addi	$t2,	$t2,	1
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
		jal	finalPrint
		jal	ImperialMarch
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
		jal	finalPrint
		jal	newHope
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
		
ImperialMarch:
		li	$v0,	33
		li	$a0, 	55
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall			

		li	$v0,	33
		li	$a0, 	55
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall			
					
		li	$v0,	33
		li	$a0, 	55
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall								
											
		li	$v0,	33
		li	$a0, 	51
		li	$a1,	950
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	58
		li	$a1,	450
		li	$a2, 	48
		li	$a3,	127
		syscall	

		li	$v0,	33
		li	$a0, 	55
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	51
		li	$a1,	950
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	58
		li	$a1,	450
		li	$a2, 	48
		li	$a3,	127
		syscall	

		li	$v0,	33
		li	$a0, 	55
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall
		jr	$ra	

newHope:
		li	$v0,	33
		li	$a0, 	62
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall			

		li	$v0,	33
		li	$a0, 	67
		li	$a1,	1100
		li	$a2, 	48
		li	$a3,	127
		syscall			
					
		li	$v0,	33
		li	$a0, 	69
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall								
											
		li	$v0,	33
		li	$a0, 	70
		li	$a1,	450
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	72
		li	$a1,	600
		li	$a2, 	48
		li	$a3,	127
		syscall	

		li	$v0,	33
		li	$a0, 	70
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	62
		li	$a1,	1200
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	62
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall	

		li	$v0,	33
		li	$a0, 	67
		li	$a1,	1200
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	69
		li	$a1,	700
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	70
		li	$a1,	400
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	67
		li	$a1,	500
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	70
		li	$a1,	400
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	67
		li	$a1,	500
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	74
		li	$a1,	700
		li	$a2, 	48
		li	$a3,	127
		syscall
		
		li	$v0,	33
		li	$a0, 	72
		li	$a1,	1000
		li	$a2, 	48
		li	$a3,	127
		syscall
		jr	$ra
		
finalPrint:	
		beq	$s7,	1,	noPrint
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
		jr	$ra																																																																																																																																																																																																																		

noPrint:
		jr	$ra																				
																																																												
endProgram:	li	$v0,	59
		la	$a0,	endOutput
		la	$a1,	endOutput2
		syscall
	
		li	$v0,	10
		syscall
