# 2) Escribe un programa que calcule el maximo comun divisor de dos numeros.

.data
	prompt1: .asciiz  "Ingrese el primer número: "  # mensaje para pedir el primer número
	prompt2: .asciiz  "Ingrese el segundo número: " # mensaje para pedir el segundo número
	result:  .asciiz  "El MCD es: " 		# mensaje para mostrar el resultado

.text
.globl main

# Función principal del programa
main:
    # Pide el primer número
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt1	# carga la dirección del mensaje prompt1 en $a0
    syscall		# imprime el mensaje

    # Lee el primer número
    li $v0, 5		# carga la llamada del sistema para leer un entero
    syscall		# lee el primer número
    move $t0, $v0	# guarda el primer número en $a0


    # Pide el segundo número
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt2     # carga la dirección del mensaje prompt2 en $t0
    syscall             # imprime el mensaje
    
    # Lee el segundo número
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el segundo número
    move $t1, $v0       # guarda el segundo número en $t1
    
# Calcular MCD utilizando el algoritmo de Euclides
loop:
beq $t1, $zero, end     # Si el segundo número es cero, terminar y mostrar el resultado
div $t0, $t1 		# Dividir el primer número por el segundo número
move $t0, $t1 		# El segundo número pasa a ser el nuevo primer número
mfhi $t1 		# El resto de la división pasa a ser el nuevo segundo número
j loop 			# Saltar al inicio del loop

# Imprimir mensaje del resultado
end:
li $v0, 4
la $a0, result
syscall

# Imprimir el resultado
li $v0, 1
move $a0, $t0
syscall

#  Terminar el programa
li $v0, 10
syscall
