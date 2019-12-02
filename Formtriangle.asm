# Author: Alphonso Mckenzie and Priyanka  Khanom
# Email: ajm6684@psu.edu
# Course: CMPSC 312
# Assignment: MIPS Programming Project
# Due Date: 4/11/2018
# File: 312Project2.asm
# Purpose: This program prompts a user to enter 3 positive integers and reports whether or not they form a triangle.
# Simulator: MARS 4.5
# Operating System: MAC and Windows
# References: Class demo program



.data		

# Data declaration section
ask_user: .asciiz "\nPlease enter 3 positive intergers by pressing <enter> after each : "
do_formtriangle1: .asciiz "\n The integers DO form a triangle  "
not_formtriangle1: .asciiz "\n The intergers do NOT form a triangle "
askuser_moreints: .asciiz "\n Do you want to test more integers? (Type 0 to quit, 1 to run again.): "
input_error: .asciiz "\n Invalid entry!  "


.text 		
	
# main method 	
main: 	
	
	li $v0, 4	
	la $a0, ask_user # printing intial ask user string 
	syscall #execute		
			
					
	
	#blez,$v0, input_error
				
	li $v0, 5               #Read first value
	syscall
	blez $v0, wronginput
	
	move $t0,$v0            #move first value to $t0
	
	li $v0, 5               #Read second value
	syscall    
	blez $v0, wronginput             
	
	move $t1,$v0            #move second value to $t1
	
	li $v0, 5               #Read third value
	syscall 
	blez $v0, wronginput
	
	move $t2,$v0            #move third value to $t2
	
		
			
	add $t3,$t0,$t1	# add t0 and t1 and move sum to t3
	blt  $t3, $t2, not_formtriangle #branch to method if t3 is less than t2 
	beq  $t3, $t2, not_formtriangle #branch to method if t3 is equal to t2
	
	add $t4,$t1,$t2 # add t1 and t2								
	blt $t4, $t0, not_formtriangle # branch if less than 
	beq $t4, $t0, not_formtriangle # branch if equal
	
	add $t5,$t0,$t2 # add t0 and t2
	blt $t5,$t1, not_formtriangle # branch if less than
	beq $t5,$t1, not_formtriangle # branch if equal
	
	b do_formtriangle #if all of the previous condtions are false, branch.
	   
	
	
	#li $v0, 10 
	#syscall

# Method for if user enters integer less than or equal to 0						
wronginput :  	
		li $v0, 4
		la $a0, input_error
		syscall
		#li $v0, 10
		#syscall		
		
		j main 

# method if intergers form a triangle
do_formtriangle :
		
		li $v0, 4
		la $a0, do_formtriangle1
		syscall
		
		j choiceContinue 
		
	
# method if integers do not form a triangle 			
not_formtriangle : 
		
		li $v0, 4
		la $a0, not_formtriangle1
		syscall		
		
		j choiceContinue 
								

# method to ask the user if they would like to test more integers
choiceContinue :
		li $v0, 4
		la $a0, askuser_moreints
		syscall
		
		li $v0, 5               
		syscall
		beq $v0, 0, EXIT
		bgtz $v0, main
		
		j main												

# Exiting method if user enters 1 in choiceContinue method																		
EXIT : 
	li $v0, 10
	syscall	
	
																											
