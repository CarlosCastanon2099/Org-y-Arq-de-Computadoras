# 4) Escribe un programa que calcule el cociente y el residuo de una división.
.data

divisor: .asciiz   "Ingrese el divisor: "   # mensaje para pedir el divisor
dividendo: .asciiz   "Ingrese el dividendo: "  # mensaje para pedir el dividendo
cociente:   .asciiz   "El cociente es: "     # mensaje del resultado del cociente
residuo: .asciiz "\nEl residuo es: "  # mensaje del resultado del residuo

    .text
    .globl main

main:
    # Pide el divisor
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, divisor     # carga la dirección del mensaje divisor en $a0
    syscall             # imprime el mensaje

    # Lee el divisor
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el divisor
    move $t0, $v0       # guarda el divisor en $t0

    # Pide el dividendo
    li $v0, 4           # carga la llamada del sistema para imprimir una cadena
    la $a0, dividendo     # carga la dirección del mensaje dividendo en $a0
    syscall             # imprime el mensaje

    # Lee el dividendo
    li $v0, 5           # carga la llamada del sistema para leer un entero
    syscall             # lee el dividendo
    move $t1, $v0       # guarda el dividendo en $t1

    # for para obtener el cociente y residuo
    loop:
    	sub $t1, $t1, $t0 	# resta al dividendo el divisor y lo guarda en t1
    	bltz $t1, imp_resultado # Salto de linea si el numero es menor
       	addi $t3, $t3, 1  	# aumentamos el contador de $3 y lo guardamos en $t3
    	j loop
    	
imp_resultado:
	add $t1, $t1, $t0	# Volvemos a tener el residuo 0 o positivo
	li $v0, 4		# Carga la llamada para imprimir una cadena
	la $a0, cociente	# Carga la direccion del mensaje de cociente
	syscall			# imprime el mensaje
	li $v0, 1		# Carga la llamada para imprimir un entero
	move $a0, $t3		# Carga el cociente para imprimir
	syscall			# Imprime entero
	li $v0, 4		# Carga la llamada para imprimir una cadena
	la $a0, residuo 	# Carga la direccion del mensaje de residuo
	syscall			# Imprime mensaje
	li $v0, 1		# Carga la llamada para imprimir un entero
	move $a0, $t1		# Carga el residuo para imprimir.
	syscall			# Imprime entero
	j end			# Termina el programa
	
end:
    li $v0, 10          # carga la llamada del sistema para salir del programa
    syscall             # sale del programa
