# 1) Programa Misterioso
# La funcion mist_0 de este programa se encarga de multiplicar dos numeros y mist_1 de multiplicarlos b veces 
# Teniendo de esta forma que el programa realiza exponenciacion de a^b entonces si tenemos 4^5 = 1024


.data
# a: .word 5
# b: .word 4
prompt1: .asciiz "Ingrese el valor de a: "
prompt2: .asciiz "Ingrese el valor de b: "
result: .asciiz "El resultado de a^b es: "

.text
.globl main

main:
# Pidiendo el valor de a
li $v0, 4 # Imprimir cadena
la $a0, prompt1 # Dirección de la cadena a imprimir
syscall

li $v0, 5 # Leer un entero
syscall
move $s0, $v0 # Guardar el valor de a en $s0

# Pidiendo el valor de b
li $v0, 4 # Imprimir cadena
la $a0, prompt2 # Dirección de la cadena a imprimir
syscall

li $v0, 5 # Leer un entero
syscall
move $s1, $v0 # Guardar el valor de b en $s1


# mist_1
# Inicializando el resultado en 1
li $s2, 1
# Realizando la operación a^b
loop:
beq $s1, $zero, print # Si b es igual a 0, imprimir el resultado y salir del programa

# mist_0 
mult $s2, $s0 # Multiplicar el resultado actual por a
mflo $s2 # Se retorna el resultado en $s2
addi $s1, $s1, -1 # Decrementar b
j loop # Volver al inicio del ciclo

print:
# Imprimiendo el resultado
li $v0, 4 # Imprimir cadena
la $a0, result # Dirección de la cadena a imprimir
syscall

li $v0, 1 # Imprimir entero
move $a0, $s2 # Cargar el valor de resultado en $a0
syscall

li $v0, 10 # Salir del programa
syscall
