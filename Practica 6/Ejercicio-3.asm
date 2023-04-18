.data
prompt1: .asciiz "Ingrese el primer n�mero: " # mensaje para pedir el primer n�mero
prompt2: .asciiz "Ingrese el segundo n�mero: " # mensaje para pedir el segundo n�mero
equal:   .asciiz "Los n�meros son iguales."   # mensaje si los n�meros son iguales
not_equal: .asciiz "Los n�meros son diferentes." # mensaje si los n�meros son diferentes

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
    beq $t0, $t1, equal     # salta a la etiqueta equal si $t0 es igual a $t1
    li $v0, 0               # si los n�meros son diferentes, establece el resultado en 0
    j print_not_equal       # salta a la etiqueta print_not_equal para imprimir el mensaje
    li $v0, 1           # si los n�meros son iguales, establece el resultado en 1

    # Imprime el mensaje correspondiente
    j print_result

print_not_equal:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, not_equal   # carga la direcci�n del mensaje not_equal en $a0
    syscall             # imprime el mensaje
    j end               # salta a la etiqueta end para salir del programa

print_result:
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    beq $v0, 1, print_equal     # salta a la etiqueta print_equal si $v0 es igual a 1
    la $a0, not_equal   # carga la direcci�n del mensaje not_equal en $a0
    j print
print_equal:
    la $a0, equal       # carga la direcci�n del mensaje equal en $a0
    j print

print:
    syscall             # imprime el mensaje
end:
    li $v0, 10          # carga la llamada del sistema para salir del programa
    syscall             # sale del programa