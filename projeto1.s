.data
armazenador: .space 400 
msg1: .asciiz "\n Armazenar"
msgdata: .asciiz "\n Dia: "
msgbarra: .asciiz "/"
msgnome: .asciiz "\n Nome: "
msgkm: .asciiz "\n Quilometragem: "
msgqnt: .asciiz "\n Quantidade: "
msgpreco: .asciiz "\n Preco: "
msg8: .asciiz "\n Escolha qual operacao realizar: \n \t 1-Armazenar \n \t 2-Excluir \n \t 3-Exibir \n \t 4-Exibir Consumo \n \t 5-Exibir Preco Medio \n \t 6-Exibir Ranking\n"
msg9: .asciiz "\n Valor invalido"
msg10: .asciiz "\n Excluir"
msg11: .asciiz "\n Exibir"
msg12: .asciiz "\n Consumo"
msg13: .asciiz "\n Preco"
msg14: .asciiz "\n Ranking"

.text
.globl main
main: 
    add $s7, $zero, $zero	# Limpa o conteúdo do nosso contador
    


cabecalho:
    
    
    la $a0, msg8
    jal ExibirMensagem
    
    jal LerInt
    
    beq $v0,1,armazenar
    #beq $v0,2,excluir
    #beq $v0,3,exibir
    #beq $v0,4,consumo
    #beq $v0,5,preco
    #beq $v0,6,ranking
    
   
    la $a0, msg9
     jal ExibirMensagem
    j cabecalho
    
armazenar:
    
    la $a0, msg1
    jal ExibirMensagem
    
    la $a0, msgdata
    jal ExibirMensagem
    
    jal LerInt
    la  $t0, armazenador
    sw  $v0, 0($t0)
    
    la $a0, msgbarra
    jal ExibirMensagem
    
    jal LerInt
    la  $t0, armazenador
    sw  $v0, 4($t0)
    
    la $a0, msgbarra
    jal ExibirMensagem
    
    jal LerInt
    la  $t0, armazenador
    sw  $v0, 8($t0)
    
    la $a0, msgnome
    jal ExibirMensagem
    
    la $a0, msgkm
    jal ExibirMensagem
    
    la $a0, msgqnt
    jal ExibirMensagem
    
    la $a0, msgpreco
    jal ExibirMensagem
    
    jr cabecalho
    

#excluir:
 #   li $v0,4
  #  la $a0,msg10
   # j cabecalho
# shift left 40 bits para excluir
    
#exibir:
 #   li $v0,4
  #  la $a0,msg11
   # j cabecalho

#consumo:
 #   li $v0,4
  #  la $a0,msg12
   # j cabecalho
    
#preco:
 #   li $v0,4
  #  la $a0,msg13
   # j cabecalho
    
#ranking:
 #   li $v0,4
  #  la $a0,msg14
   # j cabecalho
    
#################HELPER####################

ExibirMensagem:
    li $v0,4
    syscall
    jr $ra
    
LerInt:
    li $v0,5
    syscall
    jr $ra
    
LerFloat:
    li $v0,6
    syscall
    jr $ra
    
LerDouble:
    li $v0,7
    syscall
    jr $ra
    
LerEstabelecimento:
    li $v0,8
    la $a0,buffer
    li $a1, 16
    add $v1,$a0, $zero
    jr $ra
    
LoadEndereco:
    la  $t0, armazenador
    lb $t1, $s7
    addi $t2, 40, $zero 
    mult $t1, $t2
    
    mflo $v0
    jr $ra
    
IncremetarEstabelecimento:
    lb $t0, $s7
    addi $t0, $t0, 1
    sb $s7, $t0

DecremetarEstabelecimento:
    lb $t0, $s7
    addi $t0, $t0, -1
    sb $s7, $t0