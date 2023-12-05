# Getting Started with RISC-V
# Exercise 06_04
# Hello World, by Eduardo Corpeño 

addi a0, x0, 0x130 # 0x130 equals parseInt
ecall
jal pollInt
addi a0, x0, 10 # exit
ecall

pollInt:
addi a0, x0, 0x131 # 0x131 equals parseInt
li   a5,  1  # we use a5 as our comparison for branching
addi a1, x0, 0 # we also need to set a1
ecall
beq a0, a5, pollInt # if no input was detected both are 0 and we need to keep polling

beq a0, x0, finish # 0x130 equals parseInt
addi a0, x0, 11 # If we have input we echo it in the console
ecall   # If we have input we echo it in the console
j pollInt

finish:
jr ra   # return