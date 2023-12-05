# Getting Started with RISC-V
# Exercise 06_05
# Matrix Displays, by Eduardo Corpeño 
li a0, 0x100
la s0, logo
li s2, 0
li s3, 10
outer:
li s1, 0
inner:
lw a2, 0(s0)
slli a1, s2, 16
or a1, a1, s1
ecall
addi s0, s0, 4
addi s1, s1, 1
bne s1, s3, inner
addi s2, s2, 1
bne s2, s3, outer
li a0, 10
li a1, 0
ecall


.equ black 0x00000000
.equ white 0x00FFFFFF
.equ blue  0x000174B3

.data
logo:
#column 0
.word black
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word black
#column 1
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
#column 2
.word blue
.word blue
.word white
.word blue
.word white
.word white
.word white
.word white
.word blue
.word blue
#column 3
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
#column 4
.word blue
.word blue
.word blue
.word blue
.word white
.word white
.word white
.word white
.word blue
.word blue
#column 5
.word blue
.word blue
.word blue
.word blue
.word white
.word blue
.word blue
.word blue
.word blue
.word blue
#column 6
.word blue
.word blue
.word blue
.word blue
.word white
.word blue
.word blue
.word blue
.word blue
.word blue
#column 7
.word blue
.word blue
.word blue
.word blue
.word blue
.word white
.word white
.word white
.word blue
.word blue
#column 8
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
#column 9
.word black
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word blue
.word black
