//
//  Aula aug:17.s
//  
//
//  Created by Roger Luan on 8/17/16.
//
//


# código em C

//int leaf_example (int g, h, i, j) {
//    int f;
//    f = ( g + h) - (i + j);
//    return f;
//}

# argumentos g, ..., j em $a0, ..., $a3
# f em $s0 (portanto há necessidade de salvar $s0 na pilha)
# resultado em $v0

main:
    addi $a0, $s1, 123
    addi $a1, $s2, 234
    addi $a2, $s3, 345
    addi $a3, $s4, 456

    jal leaf_example

leaf_example:
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    add $t0, $a0, $a1
    add $t1, $a2, $a3
    sub $s0, $t0, $t1
    add$v0, $s0, $zero
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    jr $ra