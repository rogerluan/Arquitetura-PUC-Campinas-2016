# Code Quality Standards http://www.cs.uwm.edu/classes/cs315/Bacon/Lecture/HTML/ch07.html
# Please read:

# Default development language: English
# Commas are followed by a whitespace.
# Macros cannot be used in QtSpim.


#########################################################################
#   System call constants
#########################################################################

SYS_PRINT_INT       = 1
SYS_PRINT_FLOAT     = 2
SYS_PRINT_DOUBLE    = 3
SYS_PRINT_STRING    = 4
SYS_READ_INT        = 5
SYS_READ_FLOAT      = 6
SYS_READ_DOUBLE     = 7
SYS_READ_STRING     = 8
SYS_SBRK            = 9
SYS_EXIT            = 10
SYS_PRINT_CHAR      = 11
SYS_READ_CHAR       = 12


#########################################################################
#   Program defined constants
#########################################################################

STRUCT_TOTAL_SIZE   = 40
STRUCT_NAME_SIZE    = 16

INT_SIZE            = 4
FLOAT_SIZE          = 8

DAY_POSITION        = 0
MONTH_POSITION      = 4
YEAR_POSITION       = 8
NAME_POSITION       = 12
KILOMETER_POSITION  = 28
LITERS_POSITION     = 36
PRICE_POSITION      = 44

MENU_STORE          = 1
MENU_DELETE         = 2
MENU_DISPLAY        = 3
MENU_CONSUMPTION    = 4
MENU_PRICE          = 5
MENU_RANKING        = 6


#########################################################################
#   Program Variables
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


#########################################################################
#   Main Program
#########################################################################

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

#########################################################################
#   Function 1) Store Data
#########################################################################

store:
    la      $a0, actionMessage_store
    jal     displayMessage

    #reads day
    la      $a0, message_day
    jal     displayMessage

    jal     loadDatabase
    jal     readInt
    sw      $v0, DAY_POSITION($s1)

    #reads month
    la      $a0, message_month
    jal     displayMessage
    
    jal     readInt
    sw      $v0, MONTH_POSITION($s1)

    #reads year
    la      $a0, message_year
    jal     displayMessage
    
    jal     readInt
    sw      $v0, YEAR_POSITION($s1)

    #reads name
    la      $a0, message_name
    jal     displayMessage

    jal     readName
    
    #reads kilometer
    la      $a0, message_kilometer
    jal     displayMessage
    
    jal     readFloat
    s.s     $f0, KILOMETER_POSITION($s1)
    
    #reads consumption
    la      $a0, message_liters
    jal     displayMessage
    
    jal     readFloat
    s.s     $f0, 32($s1)

    #reads price
    la      $a0, message_price
    jal     displayMessage
    
    jal     readFloat
    s.s     $f0, 36($s1)
    
    jal     incrementRegister
    
    j       menu


#########################################################################
#   Function 2) Delete Data
#########################################################################

delete:
    #Delete information
    la      $a0, actionMessage_delete
    jal     displayMessage

    la      $a0, message_day
    jal     displayMessage
    
    #get day 
    jal     readInt
    add     $t1, $v0, $zero

    la      $a0, message_month
    jal     displayMessage
    
    #get month
    jal     readInt
    add     $t2, $v0, $zero

    la      $a0, message_year
    jal     displayMessage
    
    #get year
    jal     readInt
    add     $t3, $v0, $zero
    
    la      $t0, database       # load database
    add     $t4, $s7, $zero     # get counter

DeleteLoop:
    slti    $t5, $t4, 1             # $t5 = 1 when counter < 1 (like 0)
    bne     $t5, $zero, DeleteEnd   # if ($t5 == 1) jump to DeleteEnd //when counter = 0, end loop
    
    lw      $t5, YEAR_POSITION($t0)
    beq     $t3, $t5, YearOk
    addi    $t0, $t0, STRUCT_TOTAL_SIZE
    addi    $t4, $t4, -1
    j       DeleteLoop
    
YearOk:
    lw      $t5, MONTH_POSITION($t0)
    beq     $t2, $t5, MonthOk
    addi    $t0, $t0, STRUCT_TOTAL_SIZE
    addi    $t4, $t4, -1
    j       DeleteLoop
    
MonthOk:
    lw      $t5, DAY_POSITION($t0)
    beq     $t1, $t5, DayOk
    addi    $t0, $t0, STRUCT_TOTAL_SIZE
    addi    $t4, $t4, -1
    j       DeleteLoop
    
DayOk:
    jal     DeleteFunction
    addi    $t4, $t4, -1
    addi    $t0, $t0, STRUCT_TOTAL_SIZE
    bne     $t4, $zero, DayOk
    addi    $t5, $zero, 0
    
    
DeleteEnd:
    bne     $t5, 0, NotDone
    addi    $s7, $s7, -1
    
NotDone:
    j       menu


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
    
    #move fuel quantity
    l.s     $f5, 72($t0)
    s.s     $f5, 32($t0)
    
    #move price
    l.s     $f5, 76($t0)
    s.s     $f5, 36($t0)
    jr      $ra


#########################################################################
#   Function 3) Display/list Data
#########################################################################

listPlaces:

    la      $t0, database
    add     $t1, $s7, $zero             #move the register to a safe location
    add     $t2, $t2, $zero             #reset $t2
startLoop:
    #stop condition
    slti    $t3, $t1, 1
    bne     $t3, $zero, endLoop         #if counter < 1, exit

    jal     displayNewLine
    jal     ListFunction

    addi    $t1, $t1, -1
    addi    $t0, $t0, STRUCT_TOTAL_SIZE #goes to the 40th position

    j       startLoop

endLoop:
    j      menu


ListFunction:
    #push
    addi    $sp, $sp, -4        #adjust stack for 1 item
    sw      $ra, 0($sp)         #save return address

    #list place
    addi    $t2, $t2, 1         #adds 1 to the printed counter

    #prints day
    lw      $t4, 0($t0)
    add     $a0, $zero, $t4     #prepares print function to print day
    jal     displayInt
    jal     displaySlash

    #prints month
    lw      $t4, 4($t0)         #prepares print function to print month
    add     $a0, $zero, $t4
    jal     displayInt
    jal     displaySlash
    
    #prints year
    lw      $t4, 8($t0)         #prepares print function to print year
    add     $a0, $zero, $t4
    jal     displayInt
    jal     displayNewLine
    
    #prints name
    la      $a0, 12($t0)        #prepare print function to print name
    jal     displayMessage      #print name
    
    #prints kilometer
    l.s     $f12, 28($t0)       #prepare to print a float(kilometer)
    jal     displayFloat        #print kilometer
    jal     displayNewLine
    
    #prints fuel quantity
    l.s     $f12, 32($t0)       #prepare to print a float(fuel quantity)
    jal     displayFloat        #print fuel quantity
    jal     displayNewLine
    
    #prints price
    l.s     $f12, 36($t0)       #prepare to print a float(price)
    jal     displayFloat        #print price
    jal     displayNewLine

    #pop
    lw      $ra, 0($sp)         #restore return address
    addi    $sp, $sp, 4
    jr      $ra


#########################################################################
#   Function 4) Display Average Consumption
#########################################################################

consumption:
    la      $t0, database               #get the database
    add     $t1, $s7, $zero             #save the counter in a safe place
    
ConsumoLoop:
    slti    $t3, $t1, 1                 #check if counter < 1
    bne     $t3, $zero, ConsumoEnd      #if so, end loop
    
    l.s     $f2, 28($t0)                #store the kilometer of this position
    l.s     $f4, 32($t0)                #store the fuel quantity of this position
    
    div.s   $f12, $f2, $f4
    jal     displayFloat
    jal     displayNewLine
    
    add     $t0, $t0, STRUCT_TOTAL_SIZE #move to the next one
    add     $t1, $t1, -1                #decrement counter
    j       ConsumoLoop
ConsumoEnd:
    j       menu


#########################################################################
#   Function 5) Display Average Price
#########################################################################

price:
    la      $a0, actionMessage_price
    jal     displayMessage
    
    la      $t0, database               #get database
    add     $t1, $zero, $s7             #save counter in a safe place
    mtc1    $zero, $f1                  #zero one float register for use
    mtc1    $zero, $f2                  #zero one float register for use
    mtc1    $zero, $f3                  #zero one float register for use
    mtc1    $zero, $f4                  #zero one float register for use
    mtc1    $zero, $f12
    
    
PriceLoop:
    slti    $t3, $t1, 1
    bne     $t3, $zero, PriceEnd
    
    l.s     $f1, 36($t0)                #get the price in the register
    
    add.s   $f12, $f12, $f1             #add price with the others
    
    
    add     $t0, $t0, STRUCT_TOTAL_SIZE #move to the next one
    add     $t1, $t1, -1                #decrement counter
    
    
    j PriceLoop
    
PriceEnd:
    add     $t1, $zero, $s7             #get counter again
    
    mtc1    $s7, $f3
    cvt.s.w $f3, $f3                    #convert count int to float
    
    div.s   $f12, $f12, $f3             #do the math  all_prices\counter
    jal     displayFloat                #print the result
    j       menu


#########################################################################
#   Function 6) Display Gas Stations Ranking
#########################################################################

ranking:
    la      $a0, actionMessage_ranking
    jal     displayMessage
    j       menu


#########################################################################
#   Helpers
#########################################################################

displayMessage:
    li      $v0, SYS_PRINT_STRING
    syscall
    jr      $ra

displaySlash:
    #put a "/"
    add     $a0, $zero, '/'
    li      $v0, SYS_PRINT_CHAR
    syscall
    jr      $ra

displayNewLine:
    add     $a0, $zero, 10      #line feed char in decimal (ASCII)
    li      $v0, SYS_PRINT_CHAR
    syscall
    jr      $ra

displayInt:
    li      $v0, SYS_PRINT_INT
    syscall
    jr      $ra

displayFloat:
    li      $v0, SYS_PRINT_FLOAT
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

readName:
    li      $v0, SYS_READ_STRING
    la      $a0, NAME_POSITION($s1)
    li      $a1, STRUCT_NAME_SIZE
    syscall
    jr      $ra

    
loadDatabase:
    ### not working: ###    revise!
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

#self notes:
#add more verbose responses
#add successful operation after deletion
#format responses better
#average consumption is completely wrong
#refactor delete method