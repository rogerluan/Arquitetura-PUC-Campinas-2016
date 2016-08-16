.data 	# indica ao SPIM que as próximas linhas são dados
const1: .byte 1 	# const1 declarado como byte com valor 1
const2: .word 4 	# const2 declarado como word com valor 4
array1: .byte 9, 21, 16, 18, 38 	# array1 declarado com 5 elementos (bytes)
tam1 : .byte 5 	# tam1 (tamanho do array1 em bytes)
array2: .word 206, 1543, 348, 709, 7000, 994 	# array2 declarado com 6 elementos (words)
tam2 : .byte 24 	# tam2 (tamanho do array2 em bytes)

.text 	
.globl main 	
main: 	
lb $s0,const1 	# $s0 recebe o valor de const1 (1)
lw $s1,const2 	# $s1 recebe o valor de const2 (4)

add $s2,$zero,$zero 	# Zera o registrador $s2
add $t0,$zero,$zero 	# Zera o registrador $t0
lb $t1,tam1 	# $t1 recebe o tamanho do array1 (5bytes)
soma1: 	
lb $t2,array1($t0) 	# $t2 recebe o valor da posicao apontada por array1 + $t0
add $s2,$s2,$t2 	# $s2 é somado com o valor carregado do array1
add $t0,$t0,$s0 	# $t0 irá apontar para a próxima posição (atual +1)
bne $t0,$t1,soma1 	# Repete até chegar ao final do array1

add $s3,$zero,$zero 	# Zera o registrador $s3
add $t0,$zero,$zero 	# Zera o registrador $t0
lb $t1,tam2 	# $t1 recebe o tamanho do array2 (24bytes)
soma2: 	
lw $t2,array2($t0) 	# $t2 recebe o valor da posicao apontada por array2 + $t0
add $s3,$s3,$t2 	# $s3 é somado com o valor carregado do array2
add $t0,$t0,$s1 	# $t0 irá apontar para a próxima posição do array (atual +4)
bne $t0,$t1,soma2 	# Repete até chegar ao final do array2

