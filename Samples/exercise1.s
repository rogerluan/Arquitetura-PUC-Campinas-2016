.text 
.globl main
main:

li $s1, 15
li $s2, 36
addi $s3, $zero, 12
addi $s4, $zero, 19

add $t0, $s1, $s2
add $t1, $s3, $s4
sub $s0, $t0, $t1