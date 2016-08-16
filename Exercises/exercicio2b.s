.text 	
.globl main 	
main:

move $s0,$gp 	 
addi $s0,$s0,5000 	# Definimos novamente o ponteiro para os dados do array fonte ($gp + 5000)
move $s1,$gp 	 
addi $s1,$s1,6000 	# Ponteiro para os dados do array destino ($gp + 6000)
transfere: 	 
lw $t0,0($s0) 	# Armazena em t0 o conteúdo da posição apontada por $s0 (array fonte)
sw $t0,0($s1) 	# Armazena no array destino (apontado por $s1) o valor carregado
addi $s0,$s0,4 	# Incrementa s0 em 4 (para chegar-se ao próximo elemento no array fonte)
addi $s1,$s1,4 	# Incrementa s1 em 4 (para chegar-se ao próximo elemento no array destino)
bne $s0,$s2,transfere 	# Enquanto s0 não chegar em 400 (100 elementos), repete o laço