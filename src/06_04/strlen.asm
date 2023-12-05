# Getting Started with RISC-V
# Exercise 06_04
# strlen, by Eduardo Corpeño 

#  int count = 0;
#  char *str = “RISC-V is the bomb!!!”;
#
#  int main(){
#    while(*str){
#      count++;
#      str++;
#    }
#  }

.data
count: .word   0
str:   .string "RISC-V is the bomb!!!"


.text

main:
    la   t0, count   # t0 points to count
    lw   t1, 0(t0)   # t1 implements count
    la   t2, str     # t2 points to *str

while:
    lb   t3, 0(t2)   # Load *str into t3
    beqz t3 finish   # If *str==0, go to finish
    addi t1, t1, 1   # count++;
    addi t2, t2, 1   # str++;
    j    while

finish:
    sw   t1, 0(t0)   # Store t1 into count
mv a1, t1
addi a0, x0, 1 # If we have input we echo it in the console
ecall   # If we have input we echo it in the console
li a1, '\n'
addi a0, x0, 11 # If we have input we echo it in the console
ecall   # If we have input we echo it in the console

forever:
#    j    forever     # Hang forever

