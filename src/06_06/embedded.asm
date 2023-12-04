# Getting Started with RISC-V
# Exercise 06_06
# Embedded Application, by Eduardo Corpeño 

.data
count: .word   0
str:   .string "RISC-V is the bomb!!!"

.align 2
.text
.globl main


main:
    la t0, count        # t0 points to count
    lw t1, 0(t0)        # t1 implements count
    la t2, str          # t2 points to *str

while:
    lb   t3, 0(t2)      # Load *str into t3
    beqz t3 finish      # if *str==0, go to finish
    addi t1, t1, 1      # count++;
    addi t2, t2, 1      # str++;
    j    while

finish:
    sw   t1, 0(t0)      # Store t1 into count
hang:
    j    hang  # jump to hang

