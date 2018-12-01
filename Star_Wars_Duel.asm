#######################################################################################################################
# # This is a small game with star wars background                                                                    #
# # you can choose to play Darth Vader or Master Yoda, and the computer will choose the other one                     #     
# # your goal is to use your character to defeat the computer's character.                                            #
# #                                                                                                                   #
# # before running the program, please enlarge the Run I/O to fullest scale, and clear the previous logs, 	      #
# # for the game includes some ASCII arts                                                                             #	
# #      													      #
# # each character has unlimited strike times, 3 opportunities to use the great hit, and 3 opportunities to heal.     #
# # 														      #
# # the hit point range for strike is 1 - 10, the hit point range for great hit is 11 - 20, and the recover range for #
# #  heal is 1 - 10                                                                                                   #
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
Divider1:	.asciiz		"\n#########################################################################################"
Divider2:	.asciiz		"\n-----------------------------------------------------------------------------------------"


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

# outcomes:
# 1. Yoda wins
YodaWin1:	.asciiz 	"\nCongratulations Master Yoda,"
YodaWin2:	.asciiz		" you brought balance to the force and the galaxy."
# 2. Yoda loses
YodaLose1:	.asciiz		"\nI'm sorry Master Yoda,"
YodaLose2:	.asciiz		" perhaps you're too old to use your light saber?"
# 3. Vader wins
VaderWin1:	.asciiz		"Congratulations Lord Vader,"
VaderWin2:	.asciiz		" you just beat the galaxy's most honored Jedi!"
# 4. Vader loses
VaderLose1:	.asciiz		"It's over Anakin,"
VaderLose2:	.asciiz		" the Jedi has the high ground again!"


	.text
	# to initialize the game, set both characters's HP to 100, and the special skill slots for great hit and heal to 3
initial:				
		li	$s4,	100			# Yoda's HP
		li	$s5,	100			# Vader's HP
		li	$t3,	3			# Yoda's force slot
		li	$t4,	3			# Vader's force slot
		li	$t0,	3			# Yoda's heal slot
		li	$t1,	3			# Vader's heal slot
	
	# a dialog to ask the user to input the character that he/she wants to play	
prompt:		li	$v0,	51			# input the character
		la	$a0,	input
		syscall
	
	# determine if the input is valid, and according to the status value, the program will have different reply		
pick:	
		li	$t7,	-2			# if the user clicks 'Cancel'
		beq	$a1,	$t7,	endProgram	# the program will end
		
		li	$t7,	-3			# if the user doesn't input any value
		beq	$a1,	$t7,	repick		# the program will ask the user to input one
		
		li	$t7,	-1			# if the input is not legal
		beq	$a1,	$t7,	invalid		# the program will ask the user to input another one
		j	log				# else, the program will record the character the user picks

# to ask the user to input a value	
repick:		li	$v0,	59
		la	$a0,	noValue
		la	$a1,	return
		syscall
		j	prompt

# to ask the user to input another value
invalid:	li	$v0,	59
		la	$a0,	wrong
		la	$a1,	goback
		syscall
		j	prompt

# to record the character the user picks		
log:		
		add	$s0,	$a0,	$zero
		add	$s1,	$a0,	$zero	

# according to which character the user inputs, the program will have different dialog background
prep:				
		lb	$t5,	Yoda
		beq	$s0,	$t5,	pickY	
		lb	$t5,	Vader
		beq	$s0,	$t5,	pickV
		# if the user inputs a number that's not 1 or 2, the program will go back to ask the user to input another value
		j	invalid				

# if the user picks Yoda, all following dialogs will put Yoda as the character
pickY:	
		li	$v0,	59
		la	$a0,	outputY
		la	$a1,	output2
		syscall
		j	start
# if the user picks Vader, all following dialogs will put Vader as the character		
pickV:	
		li	$v0,	59
		la	$a0,	outputV
		la	$a1,	output2
		syscall
		j	start

# start the duel, first set the first move, then print the character's status
start:
		addi	$s7,	$zero,	1	# use register $s7 to determine which move it is, the first move will always be the user
		add	$t2,	$zero,	$zero	# the seed used to generate a random number for strike, great hit, and heal
		j	print

# the first determiner		
determine:
		# if the hitpoint of either character becomes less than or equal to 0, a winner and a loser will be determined
		ble	$s4,	0,	VaderWin		
		ble	$s5,	0,	YodaWin		
		# according to the character the user input, different demostration will be printed.
		bne	$s0,	1,	pickVm
		la	$a0,	outputYm
		j	determiner
		
pickVm:		la	$a0,	outputVm

# the second determiner
determiner:	
		# first will determine whose move it is, and feed the operation accordingly
		bne	$s7,	$zero,	yourMove		# 1 for your move, 0 for enemy's move

# for the enemy's move
enemyMove:	
		# first set the move register to 1, so the next move will be the user's
		addi	$s7,	$zero,	1
		# generate a random number from 1, 2, or 3 to determine which move the enemy will take
		jal	enemyRan
		addi	$a0,	$a0,	1
		j	whatYouDo

# pick a random number for operation for enemy 		
enemyRan:
		li	$v0,	42
		add	$a0,	$zero,	$t2
		li	$a1,	3
		syscall
		addi	$t2,	$t2,	1		
		jr 	$ra						

# for the user's move												
yourMove:	
		# first set the move to 0, so the next move will be the enemy
		add	$s7,	$zero,	$zero

# the user can pick the operation by him/herself
movePrompt:			
		li	$v0,	51
		syscall

# check if the operation number is valid or not
validOrNot:
		li	$t7,	-2			# if the user clicks "Cancel", 
		beq	$a1,	$t7,	endProgram	# the program will end
		
		li	$t7,	-3			# if the user doesn't input a value, 
		beq	$a1,	$t7,	reEnter		# the program will ask the user to input one
		
		li	$t7,	-1			# if the value is not legal
		beq	$a1,	$t7,	noSuch		# the program will ask the user to input another one
		# if the value is legal, the program will do the determining accordingly
		j	whatYouDo

# tells the user that he/she didn't input a value and ask the user to input one
reEnter:
		li	$v0,	59
		la	$a0,	noMove
		la	$a1,	return
		syscall
		addi	$s7,	$zero,	1
		j	determine

# tells the user that his/her input is illegal and prompts the user to input another one
noSuch:
		li	$v0,	59
		la	$a0,	wrong
		la	$a1,	goback2
		syscall
		addi	$s7,	$zero,	1
		j	determine	

# if the user's character used up the special skill slots, and he/she input the special skill, 
# then the program will ask the user to re enter another move
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

# the determiner used to determine the character's operation based on your input
whatYouDo:	
		lb	$t5,	keyHit		 # if 1 is the input, 
		beq	$a0,	$t5,	Hit	 # the program will go to the determiner for strike
		
		lb	$t5,	keySuper	 # if 2 is the input, 
		beq	$a0,	$t5,	whichOne # the program will go to the determiner for great hit
		
		lb	$t5,	keyRecover	  # if 3 is the input, 
		beq	$a0,	$t5,	healWhich # the program will go to the determiner for heal
		# otherwise, the program will ask the user for another value
		j	noSuch		

# if the character input 1, the program will generate a random number as the strike value, 
# and deduct the value from the opposite character's HP		
Hit:
		jal	generateRandom
		addi	$s3,	$a0,	1
		
determine2:
		bne	$s1,	1,	hitV		# based on which character the user picks, the program will select who's strike it would be
		li	$s1,	2
		sub	$s5,	$s5,	$s3		# deduct the value from the opposite character's HP
		li	$v0,	4
		la	$a0,	YodaHit			# then print the operation to the I/O console
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		beq	$s7,	1,	print
		j	determine			# after the operation is finished, jump back to the first determiner

# hit operation for Vader		
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

# if 2 is the input, the program first will determine if the character has great hit slot remaining
whichOne:	
		bne	$s7,	0,	goE		# based on whose move, the program will determine who will carray out the great hit 
		bne	$s0,	1,	seeV		# based on which character the user chooses, the program will determine who will carray out the great hit 
		bgt	$t3,	0,	Super		# if the character still has slot, the program will allow the character to use the great hit
		# otherwise, the program will ask for another operation input
		j	usedUp

# great hit determiner for the enemy
goE:
		bne	$s0,	1,	backV
		bgt	$t4,	0,	Super			
		j 	enemyMove
# great hit determiner for vader		
seeV:
		bgt	$t4,	0,	Super
		j	usedUp
		
# if the enemy doesn't have slot left, the program will reenter anothe random value for him				
backV:	
		bgt	$t3,	0,	Super
		j	enemyMove

# the super operation will generate a random number from 1 to 10, then add 10 to it
Super:		
		jal	generateRandom
		addi	$s3,	$a0,	1
		addi	$s3,	$s3,	10

# after determining whose move it is, the program will deduct the number from the opposite one's HP
determine3:
		bne	$s1,	1,	superV
		sub	$s5,	$s5,	$s3
		subi	$t3,	$t3,	1
		li	$v0,	4
		la	$a0,	YodaSuper			# and print the operation record
		syscall
		li	$v0,	1
		add	$a0,	$zero,	$s3
		syscall
		li	$s1,	2
		beq	$s7,	1,	print
		j	determine

# operation part for Vader
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

# Similarly, if 3 is the input, the program first will determine whether the character still has heal slot remaining
healWhich:	
		bne	$s7,	0,	determineE
		bne	$s0,	1,	noV
		beq	$t0,	0,	usedUpAgain	
		j	Recover
noV:
		beq	$t1,	0,	usedUpAgain
		j	Recover

# heal determiner for the enemy
determineE:
		bne	$s0,	2,	gbackY
		bgt	$t0,	0,	Recover			
		j 	enemyMove
gbackY:	
		bgt	$t1,	0,	Recover
		j	enemyMove

# if the character still has slot, the program will allow him to heal himself
Recover:
		# the range for one recover is from 1 to 10
		jal	generateRandom
		addi	$s3,	$a0,	1

# to determine whose HP will be recovered
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

# the HP cannot pass 100, so if the character heals himself to over 100, the value will be reset to 100
healthdeterminerY:
		bgt	$s4,	100,	resetY
		jr	$ra
# if Yoda's HP surpass 100, reset it to 100
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
# if Vader's HP surpass 100, reset it to 100
resetV:
		addi	$s5,	$zero,	100
		jr	$ra

# used to generate a random number from 0 to 9		
generateRandom:
		li	$v0,	42
		add	$a0,	$zero,	$t2
		li	$a1,	10
		syscall
		addi	$t2,	$t2,	1
		jr	$ra

# this part is used to print each operation log and the ASCII art for Vader and Yoda
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
		
# the outcome for Vader's victory
VaderWin:
		jal	finalPrint
		jal	ImperialMarch
		bne	$s0,	1,	win1
		j	lose1
# if the user picks Vader, then the user wins		
win1:		li	$v0,	59
		la	$a0,	VaderWin1
		la	$a1,	VaderWin2
		syscall
		j	endProgram	
# if the user picks Yoda, then the user loses	
lose1:		
		li	$v0,	59
		la	$a0,	YodaLose1
		la	$a1,	YodaLose2
		syscall
		j	endProgram
						
# the outcome for Yoda's victory												
YodaWin:
		jal	finalPrint
		jal	newHope
		bne	$s0,	2,	win2
		j	lose2
# if the user picks Yoda, the user wins
win2:
		li	$v0,	59
		la	$a0,	YodaWin1
		la	$a1,	YodaWin2
		syscall
		j	endProgram	
# if the user picks Vader, the user loses
lose2:		
		li	$v0,	59
		la	$a0,	VaderLose1
		la	$a1,	VaderLose2
		syscall
		j	endProgram

# the music for Vader's victory		
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

# the music for Yoda's victory
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

# the finally print of the character's status, after a winner has been determined				
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

# to exit the program properly.																																																																																																																								
endProgram:	li	$v0,	59
		la	$a0,	endOutput
		la	$a1,	endOutput2
		syscall
	
		li	$v0,	10
		syscall
