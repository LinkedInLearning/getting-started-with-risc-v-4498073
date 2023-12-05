# Getting Started with RISC-V
# Exercise 06_03
# Console Interaction, by Eduardo Corpeño 

# Data Section
.data
prompt:   .string   "Hi, what's your name?\n" 
response: .string   "\nIt's nice to meet you, " 
name:     .string   "                       "

# Code Section
.text

###################################################################
# Main entry point.
# The program starts here, at address 0x00000000
###################################################################

main:
    # Initializations
    # t0 is a pointer to the name string
    la t0, name

    # print_string(prompt) - Environment call 4
    la a1, prompt
    li a0, 4
    ecall

    # Call read_str subroutine
    jal read_str

    # print_string(response) - Environment call 4
    la a1, response
    li a0, 4
    ecall
    
    # print_string(name) - Environment call 4
    la a1, name
    li a0, 4
    ecall
    
    # print_char() - Environment call 11
    li a0, 11
    li a1, '!'
    ecall
    
    li a1, '\n'
    ecall
    ecall

    # Exit - Environment call 17
    addi a0, x0, 17
    ecall
    

###################################################################
# read_str subroutine
# Read input string from the console.
# This input is a line of text terminated with the enter keystroke.
###################################################################

read_str:
    # Initializations
    li  a5, 1     # a5 holds comparison value for branching

    # Enable console input - Environment call 0x130
    li a0, 0x130 
    ecall

read_char:
    # Read a character from console input - Environment call 0x131
    li  a0, 0x131 
    ecall

    # Read the result of the environment call in a0
    beq a0, a5, read_char # If still waiting for input, keep polling
    beq a0, x0, finish    # If buffer is empty, go to finish
    
    # Handle incoming character
    sb   a1, 0(t0)        # Append input character to name string 
    addi t0, t0, 1        # Increment the name string pointer

    j read_char           # Iterate to get the next character

finish:
    # Suboutine epoligue
    sb zero, 0(t0)  # Append null-terminator to name string
    jr ra           # Return to caller
