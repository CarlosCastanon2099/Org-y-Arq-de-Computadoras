.data
prompt1: .asciiz "Ingrese el primer número: " # mensaje para pedir el primer número
prompt2: .asciiz "Ingrese el segundo número: " # mensaje para pedir el segundo número
equal:   .asciiz "Los números son iguales."   # mensaje si los números son iguales
not_equal: .asciiz "Los números son diferentes." # mensaje si los números son diferentes

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
    beq $t0, $t1, equal     # salta a la etiqueta equal si $t0 es igual a $t1
    li $v0, 0               # si los números son diferentes, establece el resultado en 0
    j print_not_equal       # salta a la etiqueta print_not_equal para imprimir el mensaje
    li $v0, 1           # si los números son iguales, establece el resultado en 1

    # Imprime el mensaje correspondiente
    j print_result

print_not_equal:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, not_equal   # carga la dirección del mensaje not_equal en $a0
    syscall             # imprime el mensaje
    j end               # salta a la etiqueta end para salir del programa

print_result:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    beq $v0, 1, print_equal     # salta a la etiqueta print_equal si $v0 es igual a 1
    la $a0, not_equal   # carga la dirección del mensaje not_equal en $a0
    j print
print_equal:
    la $a0, equal       # carga la dirección del mensaje equal en $a0
    j print

print:
    syscall             # imprime el mensaje
end:
    li $v0, 10          # carga la llamada del sistema para salir del programa
    syscall             # sale del programa