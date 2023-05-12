# 2) Escribe un programa que calcule el maximo comun divisor de dos numeros.

.data
	prompt1: .asciiz  "Ingrese el primer n�mero: "  # mensaje para pedir el primer n�mero
	prompt2: .asciiz  "Ingrese el segundo n�mero: " # mensaje para pedir el segundo n�mero
	result:  .asciiz  "El MCD es: " 		# mensaje para mostrar el resultado

.text
.globl main

# Funci�n principal del programa
main:
    # Pide el primer n�mero
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt1	# carga la direcci�n del mensaje prompt1 en $a0
    syscall		# imprime el mensaje

    # Lee el primer n�mero
    li $v0, 5		# carga la llamada del sistema para leer un entero
    syscall		# lee el primer n�mero
    move $t0, $v0	# guarda el primer n�mero en $a0


    # Pide el segundo n�mero
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, prompt2     # carga la direcci�n del mensaje prompt2 en $t0
    syscall             # imprime el mensaje
    
    # Lee el segundo n�mero
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el segundo n�mero
    move $t1, $v0       # guarda el segundo n�mero en $t1
    
# Calcular MCD utilizando el algoritmo de Euclides
loop:
beq $t1, $zero, end     # Si el segundo n�mero es cero, terminar y mostrar el resultado
div $t0, $t1 		# Dividir el primer n�mero por el segundo n�mero
move $t0, $t1 		# El segundo n�mero pasa a ser el nuevo primer n�mero
mfhi $t1 		# El resto de la divisi�n pasa a ser el nuevo segundo n�mero
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
