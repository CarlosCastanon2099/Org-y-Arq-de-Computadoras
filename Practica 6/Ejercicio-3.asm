# 3) Escribe un programa que compare 2 numeros enteros e imprima un mensaje que nos diga si son iguales o no.
.data
prompt1: .asciiz   "Ingrese el primer n�mero: "   # mensaje para pedir el primer n�mero
prompt2: .asciiz   "Ingrese el segundo n�mero: "  # mensaje para pedir el segundo n�mero
equal:   .asciiz   "Los n�meros son iguales."     # mensaje si los n�meros son iguales
not_equal: .asciiz "Los n�meros son diferentes."  # mensaje si los n�meros son diferentes

    .text
    .globl main

main:
    # Pide el primer n�mero
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt1     # carga la direcci�n del mensaje prompt1 en $a0
    syscall             # imprime el mensaje

    # Lee el primer n�mero
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el primer n�mero
    move $t0, $v0       # guarda el primer n�mero en $t0

    # Pide el segundo n�mero
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt2     # carga la direcci�n del mensaje prompt2 en $a0
    syscall             # imprime el mensaje

    # Lee el segundo n�mero
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el segundo n�mero
    move $t1, $v0       # guarda el segundo n�mero en $t1

    # Compara los n�meros
    beq $t0, $t1, banderaT     # salta a la etiqueta bandera si $t0 es igual a $t1
    bne $t0, $t1, banderaF     # salta a la etiqueta bandera si $t0 es diferente a $t1


banderaT:
    li $v0, 1           # si los n�meros son iguales, establece el resultado en 1
    j print_equal       # imprime el mensaje de que los numeros son iguales
    
banderaF:
    li $v0, 0           # si los n�meros son diferentes, establece el resultado en 0
    j print_not_equal   # imprime el mensaje de que los numeros no son iguales


print_equal:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, equal       # carga la direcci�n del mensaje equal en $a0
    syscall             # imprime el mensaje
    j end               # salta a la etiqueta end para salir del programa


print_not_equal:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, not_equal   # carga la direcci�n del mensaje not_equal en $a0
    syscall             # imprime el mensaje
    j end               # salta a la etiqueta end para salir del programa
    

print:
    syscall             # imprime el mensaje
end:
    li $v0, 10          # carga la llamada del sistema para salir del programa
    syscall             # sale del programa