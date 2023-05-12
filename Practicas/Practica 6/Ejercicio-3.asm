# 3) Escribe un programa que compare 2 numeros enteros e imprima un mensaje que nos diga si son iguales o no.
.data
prompt1: .asciiz   "Ingrese el primer número: "   # mensaje para pedir el primer número
prompt2: .asciiz   "Ingrese el segundo número: "  # mensaje para pedir el segundo número
equal:   .asciiz   "Los números son iguales."     # mensaje si los números son iguales
not_equal: .asciiz "Los números son diferentes."  # mensaje si los números son diferentes

    .text
    .globl main

main:
    # Pide el primer número
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt1     # carga la dirección del mensaje prompt1 en $a0
    syscall             # imprime el mensaje

    # Lee el primer número
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el primer número
    move $t0, $v0       # guarda el primer número en $t0

    # Pide el segundo número
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt2     # carga la dirección del mensaje prompt2 en $a0
    syscall             # imprime el mensaje

    # Lee el segundo número
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el segundo número
    move $t1, $v0       # guarda el segundo número en $t1

    # Compara los números
    beq $t0, $t1, banderaT     # salta a la etiqueta bandera si $t0 es igual a $t1
    bne $t0, $t1, banderaF     # salta a la etiqueta bandera si $t0 es diferente a $t1


banderaT:
    li $v0, 1           # si los números son iguales, establece el resultado en 1
    j print_equal       # imprime el mensaje de que los numeros son iguales
    
banderaF:
    li $v0, 0           # si los números son diferentes, establece el resultado en 0
    j print_not_equal   # imprime el mensaje de que los numeros no son iguales


print_equal:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, equal       # carga la dirección del mensaje equal en $a0
    syscall             # imprime el mensaje
    j end               # salta a la etiqueta end para salir del programa


print_not_equal:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, not_equal   # carga la dirección del mensaje not_equal en $a0
    syscall             # imprime el mensaje
    j end               # salta a la etiqueta end para salir del programa
    

print:
    syscall             # imprime el mensaje
end:
    li $v0, 10          # carga la llamada del sistema para salir del programa
    syscall             # sale del programa