# Code Quality Standards http://www.cs.uwm.edu/classes/cs315/Bacon/Lecture/HTML/ch07.html
# Please read:

# Default development language: English
# Commas are followed by a whitespace.
# Macros cannot be used in QtSpim.

#########################################################################
#   System call constants
#########################################################################

SYS_PRINT_INT       =   1
SYS_PRINT_FLOAT     =   2
SYS_PRINT_DOUBLE    =   3
SYS_PRINT_STRING    =   4
SYS_READ_INT        =   5
SYS_READ_FLOAT      =   6
SYS_READ_DOUBLE     =   7
SYS_READ_STRING     =   8
SYS_SBRK            =   9
SYS_EXIT            =   10
SYS_PRINT_CHAR      =   11
SYS_READ_CHAR       =   12

#########################################################################
#   Program defined constants
#########################################################################

STRUCT_TOTAL_SIZE   = 40
STRUCT_NAME_SIZE    = 16
MENU_STORE          = 1
MENU_DELETE         = 2
MENU_DISPLAY        = 3
MENU_CONSUMPTION    = 4
MENU_PRICE          = 5
MENU_RANKING        = 6

#########################################################################
#   Macro definitions and includes. See http://www.cs.uwm.edu/classes/cs315/Bacon/Lecture/HTML/ch09s03.html
#########################################################################

	# Print the string at address $var
	#.macro  print_string_var($var)
	#la      $a0, $var
	#li      $v0, SYS_PRINT_STRING
	#syscall
	#.end_macro

#########################################################################
#   Main program
#########################################################################

.data
### database ###
database:           .space 400
buffer:             .space STRUCT_NAME_SIZE

### messages ###
message_menu:       .asciiz "\n Escolha qual operacao realizar: \n 1- Cadastrar abastecimento \n 2- Excluir abastecimento \n 3- Exibir abastecimentos \n 4- Exibir consumo médio \n 5- Exibir preço médio \n 6- Exibir ranking de postos\n"
message_day:        .asciiz "\n Dia: "
message_month:      .asciiz " Mes: "
message_year:       .asciiz " Ano: "
message_name:       .asciiz "\n Nome: "
message_kilometer:  .asciiz "\n Quilometragem: "
message_liters:     .asciiz "\n Quantidade: "
message_price:      .asciiz "\n Preco: "
message_invalid:    .asciiz "\n Valor invalido"

message_option:     .asciiz "\n Opcao: "

actionMessage_store:        .asciiz "\n Armazenar"
actionMessage_delete:       .asciiz "\n Digite a data a ser excluida:"
actionMessage_display:      .asciiz "\n Exibir"
actionMessage_consumption:  .asciiz "\n Consumo"
actionMessage_price:        .asciiz "\n Preco"
actionMessage_ranking:      .asciiz "\n Ranking"

.text
.globl main

main:
    addi $s7, $zero, 0	# Limpa o conteúdo do contador
    add $t0, $zero, $zero	# Limpa o conteúdo do t0
    add $t1, $zero, $zero	# Limpa o conteúdo do t1

menu:
    la      $a0, message_menu
    jal     displayMessage
    la      $a0, message_option
    jal     displayMessage
    jal     readInt
    
    beq     $v0, MENU_STORE, store
    beq     $v0, MENU_DELETE, delete
    beq     $v0, MENU_DISPLAY, listPlaces
    beq     $v0, MENU_CONSUMPTION, consumption
    beq     $v0, MENU_PRICE, price
    beq     $v0, MENU_RANKING, ranking

    la      $a0, message_invalid
    jal     displayMessage
    j       menu


#########################################################################
#   Actions
#########################################################################

store:
    la      $a0, actionMessage_store
    jal     displayMessage

    #reads day
    la      $a0, message_day
    jal     displayMessage

    jal     loadDatabase
    jal     readInt
    sw      $v0, 0($s1)

    #reads month
    la      $a0, message_month
    jal     displayMessage
    
    jal     readInt
    sw      $v0, 4($s1)

    #reads year
    la      $a0, message_year
    jal     displayMessage
    
    jal     readInt
    sw      $v0, 8($s1)

    #reads name
    la      $a0, message_name
    jal     displayMessage

    jal     readName
    #sw      $v1, 12($s1)
    
    
    #reads kilometer
    la      $a0, message_kilometer
    jal     displayMessage
    
    jal     readFloat
    s.s      $f0, 28($s1)#f
    
    #reads consumption
    la      $a0, message_liters
    jal     displayMessage
    
    jal     readFloat
    s.s      $f0, 32($s1)

    #reads price
    la      $a0, message_price
    jal     displayMessage
    
    jal     readFloat
    s.s      $f0, 36($s1)
    
    jal     incrementRegister
    
    jr      menu


delete:
    #Delete information
    li      $v0, 4
    la      $a0, actionMessage_delete
    syscall
    
    li      $v0, 4
    la      $a0, message_day
    syscall
    
    #get day 
    jal     readInt
    add      $t1, $v0, $zero
    
    li      $v0, 4
    la      $a0, message_month
    syscall
    
    #get month
    jal     readInt
    add      $t2, $v0, $zero
    
    li      $v0, 4
    la      $a0, message_year
    syscall
    
    #get year
    jal     readInt
    add      $t3, $v0, $zero
    
    la      $t0, database       #load database
    add     $t4, $s7, $zero     #get register
DeleteLoop:
    slti    $t5, $t4, 1
    bne     $t5, $zero, DeleteEnd
    
    lw      $t5, 8($t0)
    beq     $t3, $t5, YearOk
    addi     $t0, $t0, 40
    addi     $t4, $t4, -1
    j       DeleteLoop
    
YearOk:
    lw      $t5, 4($t0)
    beq     $t2, $t5, MonthOk
    addi    $t0, $t0, 40
    addi    $t4, $t4, -1
    j       DeleteLoop
    
MonthOk:
    lw      $t5, 0($t0)
    beq     $t1, $t5, DayOk
    addi    $t0, $t0, 40
    addi    $t4, $t4, -1
    j       DeleteLoop
    
DayOk:
    #the date was found
    
    jal     DeleteFunction
    addi    $t4, $t4, -1
    addi    $t0, $t0, 40
    bne     $t4, $zero, DayOk
    addi    $t5, $zero, 0
    
    
DeleteEnd:

    bne     $t5, 0, NotDone
    addi    $s7, $s7, -1
    
NotDone:
    
    j       menu
    #shift left 40 bits para excluir


listPlaces:

    la      $t0, database
    add     $t1, $s7, $zero #move the register to a safe location
    add     $t2, $t2, $zero #reset $t2
startLoop:
    #stop condition
    slti    $t3, $t1, 1
    bne     $t3, $zero, endLoop #if counter < 1, exit

    jal     ListFunction


    addi    $t1, $t1, -1
    addi    $t0, $t0, 40          #goes to the 40th position

    j       startLoop

endLoop:
    jr      menu

consumption:
   
    j       menu


price:
    li      $v0, 4
    la      $a0, actionMessage_price
    j       menu


ranking:
    li      $v0, 4
    la      $a0, actionMessage_ranking
    j       menu


#########################################################################
#   Helpers
#########################################################################

displayMessage:
    li      $v0, SYS_PRINT_STRING
    syscall
    jr      $ra


readInt:
    li      $v0, SYS_READ_INT
    syscall
    jr      $ra


readFloat:
    li      $v0, SYS_READ_FLOAT
    syscall
    jr      $ra


readDouble:
    li      $v0, SYS_READ_DOUBLE
    syscall
    jr      $ra


readName:
    li      $v0, SYS_READ_STRING
    la      $a0, 12($s1)
    li      $a1, STRUCT_NAME_SIZE
    syscall
    jr      $ra

    
loadDatabase:
    ### not working: ###
    #la     $t0, database
    #lw     $t1, 0($s7)
    #addi   $t2, $zero, STRUCT_TOTAL_SIZE  #loads $t2 with STRUCT_TOTAL_SIZE
    #mult   $t1, $t2                       #multiplies counter*STRUCT_TOTAL_SIZE
    #mflo   $t3
    #add    $v0, $t0, $t3

    ### this works: ###
    la      $s1, database
    addi    $t1, $zero, STRUCT_TOTAL_SIZE  #loads $t1 with STRUCT_TOTAL_SIZE
    mult    $t1, $s7                       #multiplies counter*STRUCT_TOTAL_SIZE
    mflo    $t2
    add     $s1, $s1, $t2

    jr $ra

incrementRegister:
    addi    $s7, $s7, 1
    jr      $ra

decrementRegister:
    addi    $s7, $s7, -1
    jr      $ra
    
DeleteFunction:
    #move day
    lw      $t5, 40($t0)
    sw      $t5, 0($t0)
    
    #move month
    lw      $t5, 44($t0)
    sw      $t5, 4($t0)
    
    #move year
    lw      $t5, 48($t0)
    sw      $t5, 8($t0)
    
    #move name
    lw      $t5, 52($t0)
    sw      $t5, 12($t0)
    lw      $t5, 56($t0)
    sw      $t5, 16($t0)
    lw      $t5, 60($t0)
    sw      $t5, 20($t0)
    lw      $t5, 64($t0)
    sw      $t5, 24($t0)
    
    #move kilometer
    l.s     $f5, 68($t0)
    s.s     $f5, 28($t0)
    
    #move Quantidade
    l.s     $f5, 72($t0)
    s.s     $f5, 32($t0)
    
    #move price
    l.s     $f5, 76($t0)
    s.s     $f5, 36($t0)
    jr      $ra
    
ListFunction:
    #list place
    addi    $t2, $t2, 1         #adds 1 to the printed counter
    
    
    lw      $t4, 0($t0)
    add     $a0, $zero, $t4     #prepares print function to print day
    
    
    li      $v0, SYS_PRINT_INT  #prints day
    syscall
    
    #put "/"
    add     $a0, $zero, '/'
    li      $v0, SYS_PRINT_CHAR
    syscall
    
# # #     #show the month
    lw      $t4, 4($t0)         #prepares print function to print month
    add     $a0, $zero, $t4
    li      $v0, SYS_PRINT_INT  #prints month
    syscall
    
    #put a "/"
    add     $a0, $zero, '/'
    li      $v0, SYS_PRINT_CHAR
    syscall
    
    #show the year
    lw      $t4, 8($t0)             #prepares print function to print year
    add     $a0, $zero, $t4
    li      $v0, SYS_PRINT_INT      #print year
    syscall
    
    add     $a0, $zero, 10          #prepare the system to a new line
    li      $v0, 11             
    syscall
    
    #show name
    la      $a0, 12($t0)            #prepare print function to print name
    li      $v0, SYS_PRINT_STRING   #print name
    syscall
    
    #show kilometer
    l.s      $f12, 28($t0)          #prepare to print a float(kilometer)
    add     $a0, $zero, $t4
    li      $v0, SYS_PRINT_FLOAT    #print kilometer
    syscall
    
     add     $a0, $zero, 10         #prepare the system to a new line
    li      $v0, 11             
    syscall
    
    #show Quantidade
    l.s      $f12, 32($t0)          #prepare to print a float(Quantidade)
    add     $a0, $zero, $t4
    li      $v0, SYS_PRINT_FLOAT    #print Quantidade
    syscall
    
     add     $a0, $zero, 10         #prepare the system to a new line
    li      $v0, 11             
    syscall
    
    #show Preco
    l.s      $f12, 36($t0)          #prepare to print a float(preço)
    add     $a0, $zero, $t4
    li      $v0, SYS_PRINT_FLOAT    #print preço
    syscall
    
    add     $a0, $zero, 10          #prepare the system to a new line
    li      $v0, 11             
    syscall
    jr      $ra