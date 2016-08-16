.text 	
.globl main 	
main: 	
move $s0,$gp 	
addi $s0,$s0,5000 	# Ponteiro para os dados do array fonte ($gp) + 5000
move $s2,$s0 	
addi $s2,$s2,400


li $t0,9 	# Carrega no reg. temporário $t0 um valor para ser armazenado no array
dados: 	
sw $t0,0($s0) 	# Armazena o valor na posição do array apontada por $s0
addi $s0,$s0,4 	# Aponta para a próxima posição no array (incrementa em 4 o ponteiro)
addi $t0,$t0,9 	# Altera o valor a ser armazenado no array (incrementa em 9)
bne $s0,$s2,dados 	# Enquanto não chegar ao fim do array, repete o laço