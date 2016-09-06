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

DAY_POSITION        = 0
MONTH_POSITION      = 4
YEAR_POSITION       = 8
NAME_POSITION       = 12
KILOMETER_POSITION  = 28
LITERS_POSITION     = 32
PRICE_POSITION      = 36

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
message_menu:       .asciiz "\n ======================================== \n\n Escolha qual operacao realizar: \n 1- Cadastrar abastecimento \n 2- Excluir abastecimento \n 3- Exibir abastecimentos \n 4- Exibir consumo médio \n 5- Exibir preço médio \n 6- Exibir ranking de postos\n"
message_day:        .asciiz "\n Dia: "
message_month:      .asciiz " Mes: "
message_year:       .asciiz " Ano: "
message_date:       .asciiz "\n Data do abastecimento (dd/mm/aa): "
message_name:       .asciiz " Nome do posto: "
message_kilometer:  .asciiz " Quilometragem total do carro: "
message_liters:     .asciiz " Quantidade de litros abastecidos: "
message_price:      .asciiz " Preco por litro do combustivel: "
message_invalid:    .asciiz "\n Valor invalido"

message_option:     .asciiz "\n Opcao: "

actionMessage_store:        .asciiz "\n -------------------- \n\n Cadastro de novo abastecimento!"
actionMessage_delete:       .asciiz "\n -------------------- \n\n Digite a data do abastecimento a ser excluido:"
actionMessage_display:      .asciiz "\n -------------------- \n\n Abastecimentos Cadastrados: \n"
actionMessage_consumption:  .asciiz "\n -------------------- \n\n Consumo medio do veiculo: "
actionMessage_price:        .asciiz "\n -------------------- \n\n Preco medio dos postos: "
actionMessage_ranking:      .asciiz "\n -------------------- \n\n Ranking dos postos: \n"

message_list:               .asciiz "\n Abastecimento "
message_deleted:            .asciiz "\n Abastecimento excluido com sucesso! "
message_invalid_consumption:.asciiz "\n O consumo medio soh pode ser realizado a partir de 2 (dois) ou mais abastecimentos. "
message_consumption_unit:   .asciiz "km/l\n"


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
    s.s     $f0, LITERS_POSITION($s1)

    #reads price
    la      $a0, message_price
    jal     displayMessage
    
    jal     readFloat
    s.s     $f0, PRICE_POSITION($s1)
    
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
    la      $a0, message_deleted
    jal     displayMessage
    
NotDone:
    j       menu


DeleteFunction:
    #move day
    lw      $t5, 40($t0)        # DAY_POSITION + STRUCT_TOTAL_SIZE
    sw      $t5, DAY_POSITION($t0)
    
    #move month
    lw      $t5, 44($t0)        # MONTH_POSITION + STRUCT_TOTAL_SIZE
    sw      $t5, MONTH_POSITION($t0)
    
    #move year
    lw      $t5, 48($t0)        # YEAR_POSITION + STRUCT_TOTAL_SIZE
    sw      $t5, YEAR_POSITION($t0)
    
    #move name
    lw      $t5, 52($t0)        # NAME_POSITION + STRUCT_TOTAL_SIZE
    sw      $t5, NAME_POSITION($t0)
    lw      $t5, 56($t0)        # NAME_POSITION + STRUCT_TOTAL_SIZE + 4 (1 word)
    sw      $t5, 16($t0)        # NAME_POSITION + 4 (1 word)
    lw      $t5, 60($t0)        # NAME_POSITION + STRUCT_TOTAL_SIZE + 8 (2 words)
    sw      $t5, 20($t0)        # NAME_POSITION + 8 (2 words)
    lw      $t5, 64($t0)        # NAME_POSITION + STRUCT_TOTAL_SIZE + 12 (3 words)
    sw      $t5, 24($t0)        # NAME_POSITION + 12 (3 words)
    
    #move kilometer
    l.s     $f5, 68($t0)        # KILOMETER_POSITION + STRUCT_TOTAL_SIZE
    s.s     $f5, KILOMETER_POSITION($t0)
    
    #move fuel quantity
    l.s     $f5, 72($t0)        # LITERS_POSITION + STRUCT_TOTAL_SIZE
    s.s     $f5, LITERS_POSITION($t0)
    
    #move price
    l.s     $f5, 76($t0)        # PRICE_POSITION + STRUCT_TOTAL_SIZE
    s.s     $f5, PRICE_POSITION($t0)
    jr      $ra


#########################################################################
#   Function 3) Display/list Data
#########################################################################

listPlaces:
    la      $a0, actionMessage_display
    jal     displayMessage

    la      $t0, database
    add     $t1, $s7, $zero             #move the register to a safe location
    add     $t2, $zero, $zero             #reset $t2
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
    addi    $sp, $sp, -4                #adjust stack for 1 item
    sw      $ra, 0($sp)                 #save return address

    #list place
    addi    $t2, $t2, 1                 #adds 1 to the printed counter

    la      $a0, message_list
    jal     displayMessage
    add     $a0, $t2, $zero
    jal     displayInt
    la      $a0, message_date
    jal     displayMessage

    #prints day
    lw      $t4, DAY_POSITION($t0)      #prepares print function to print day
    add     $a0, $zero, $t4
    jal     displayInt
    jal     displaySlash

    #prints month
    lw      $t4, MONTH_POSITION($t0)    #prepares print function to print month
    add     $a0, $zero, $t4
    jal     displayInt
    jal     displaySlash
    
    #prints year
    lw      $t4, YEAR_POSITION($t0)     #prepares print function to print year
    add     $a0, $zero, $t4
    jal     displayInt
    jal     displayNewLine
    
    #prints name
    la      $a0, message_name
    jal     displayMessage
    la      $a0, NAME_POSITION($t0)     #prepare print function to print name
    jal     displayMessage              #print name
    
    #prints kilometer
    la      $a0, message_kilometer
    jal     displayMessage
    l.s     $f12, KILOMETER_POSITION($t0)#prepare to print a float(kilometer)
    jal     displayFloat                #print kilometer
    jal     displayNewLine
    
    #prints fuel quantity
    la      $a0, message_liters
    jal     displayMessage
    l.s     $f12, LITERS_POSITION($t0)  #prepare to print a float(fuel quantity)
    jal     displayFloat                #print fuel quantity
    jal     displayNewLine
    
    #prints price
    la      $a0, message_price
    jal     displayMessage
    l.s     $f12, PRICE_POSITION($t0)   #prepare to print a float(price)
    jal     displayFloat                #print price
    jal     displayNewLine

    #pop
    lw      $ra, 0($sp)                 #restore return address
    addi    $sp, $sp, 4
    jr      $ra


#########################################################################
#   Function 4) Display Average Consumption
#########################################################################

consumption:
    #check validity condition
    add     $t1, $s7, $zero                 # save the counter in a safe place
    slti    $t2, $t1, 2                     # check if counter < 2
    bne     $t2, $zero, ConsumptionInvalid  # consumption may only be calculated with 2 or more registries

    mtc1    $zero, $f4                  # reset $f4 register

    la      $a0, actionMessage_consumption
    jal     displayMessage

    la      $t0, database
    addi    $t5, $zero, STRUCT_TOTAL_SIZE   # loads $t1 with STRUCT_TOTAL_SIZE
    addi    $t4, $s7, -1                    # gets count-1 to jump to the init of struct's last registry
    mult    $t5, $t4                        # multiplies counter*STRUCT_TOTAL_SIZE
    mflo    $t2                             # result goes to $t2
    add     $t0, $t0, $t2
    lwc1    $f1, KILOMETER_POSITION($t0)    # gets kilometer of last database entry

    la      $t0, database                   # loads first registry in $t0
    lwc1    $f2, KILOMETER_POSITION($t0)    # gets kilometer of first database entry

    sub.s   $f1, $f1, $f2                   # substracts higher (last) mileage from lowest (first)

ConsumoLoop:
    slti    $t3, $t1, 2                 # check if counter < 2 (cuz it shouldn't count the last fuel quantity)
    bne     $t3, $zero, ConsumoEnd      # if so, end loop

    lwc1    $f3, LITERS_POSITION($t0)   # store the fuel quantity of this position
    add.s   $f4, $f4, $f3
    
    add     $t0, $t0, STRUCT_TOTAL_SIZE # move to the next registry
    add     $t1, $t1, -1                # decrement counter
    j       ConsumoLoop
ConsumoEnd:
    div.s   $f12, $f1, $f4
    jal     displayFloat
    la      $a0, message_consumption_unit
    jal     displayMessage
    j       menu

ConsumptionInvalid:
    la      $a0, message_invalid_consumption
    jal     displayMessage
    j menu


#########################################################################
#   Function 5) Display Average Price
#########################################################################

price:
    la      $a0, actionMessage_price
    jal     displayMessage
    
    la      $t0, database               #get database
    add     $t1, $zero, $s7             #save counter in a safe place
    mtc1    $zero, $f1                  #zero one float register for use
    mtc1    $zero, $f3                  #zero one float register for use
    mtc1    $zero, $f4                  #zero one float register for use
    mtc1    $zero, $f12
    
    
PriceLoop:
    slti    $t3, $t1, 1
    bne     $t3, $zero, PriceEnd
    
    l.s     $f1, PRICE_POSITION($t0)    #get the price in the register
    
    add.s   $f12, $f12, $f1             #add price with the others
    
    
    add     $t0, $t0, STRUCT_TOTAL_SIZE #move to the next one
    add     $t1, $t1, -1                #decrement counter
    
    
    j PriceLoop
    
PriceEnd:
    add     $t1, $zero, $s7             #get counter again
    
    mtc1    $s7, $f3
    cvt.s.w $f3, $f3                    #convert count int to float
    
    div.s   $f12, $f12, $f3             #do the math  all_prices/counter
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