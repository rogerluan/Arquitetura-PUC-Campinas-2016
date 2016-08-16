.data
msg1:	.asciiz "\nEntre o numero de avaliações da disciplina: "
msg2:	.asciiz "\nEntre um valor para a nota "
msg3:   .asciiz ": "
msg4:	.asciiz "\nA média das notas é: "

.text
.globl main

main:
	add $t0, $zero, $zero	# Limpa o conteúdo de $t0
	add $t1, $zero, $zero	# Limpa o conteúdo de $t1

numnotas:
	li $v0, 4		# Codigo SysCall p/ escrever strings
	la $a0, msg1		# Parametro (string a ser escrita)
	syscall			#

	li $v0, 5		# Codigo SysCall p/ ler inteiros 
	syscall			# Inteiro lido vai ficar em $v0

	add $s0, $v0, $zero	# Armazena em $s0 o número de notas

loopnotas:
	addi $t0, $t0, 1	# Incrementa $t0 - contador de notas

	li $v0, 4		# Codigo SysCall p/ escrever strings
	la $a0, msg2		# Parametro (string a ser escrita)
	syscall			#

	li $v0, 1		# Codigo SysCall p/ escrever inteiros
	add $a0, $zero, $t0	# Parametro (inteiro a ser escrito)
	syscall

	li $v0, 4		# Codigo SysCall p/ escrever strings
	la $a0, msg3		# Parametro (string a ser escrita)
	syscall			#

	li $v0, 5		# Codigo SysCall p/ ler inteiros 
	syscall			# Inteiro lido vai ficar em v0

	add $t1, $t1, $v0	# Soma a nota ao total

	bne $t0, $s0, loopnotas # Enquanto não preencher todas as notas, loop

Calcula:
	div $t1, $s0		# Divide o total pelo numero de notas
	mflo $t2		# Move o resultado para $t2

	li $v0, 4		# Codigo SysCall p/ escrever strings
	la $a0, msg4		# Parametro (string a ser escrita)
	syscall			#

	li $v0, 1		# Codigo SysCall p/ escrever inteiros
	add $a0, $zero, $t2	# Parametro (inteiro a ser escrito)
	syscall

	li $v0, 5		# Apenas para esperar um [ENTER]
	syscall			# 
