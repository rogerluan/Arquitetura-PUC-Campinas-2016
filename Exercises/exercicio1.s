.text 	# indica que as linhas seguintes contém instruções
.globl main 	# define o símbolo main como sendo global
main: 	# indica o início do programa

li $s1,7 	# registrador $s1 contém o valor imediato 15
li $s2,9 	# registrador $s2 contém o valor imediato 36
addi $s3, $zero, 6 	# registrador $s3 contém o valor imediato 12
addi $s4, $zero, 9 	# registrador $s4 contém o valor imediato 19

add $t0,$s1,$s2 	# registrador $t0 contém g + h
add $t1,$s3,$s4 	# registrador $t1 contém i + j
sub $s0,$t0,$t1 	# registrador $s0 contém (g + h) - (i + j)