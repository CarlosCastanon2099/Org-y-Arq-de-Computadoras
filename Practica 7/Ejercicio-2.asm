# 2) Programa que calcula recursivamente el coeficiente binomial de n en k utilizando la identidad de Pascal
.data
mensaje_n: .asciiz   "Introduce un valor de n: "   # mensaje para pedir el primer número
mensaje_k: .asciiz   "Introduce un valor de k: "  # mensaje para pedir el segundo número
mensaje_resultado:   .asciiz   "La identidad de Pascal es: "     # mensaje del resultado


.text
.globl main

# Función principal
main:
        li $v0, 4		#Codigo 4, imprime String
	la $a0, mensaje_n
	syscall 		#Imprime pregunta
	
	li $v0, 5 		#Syscall se transforma a Recibe INT del usuario.
	syscall			#Guarda el input en $v0
	move $a1, $v0 		#Movemos el input del usuario a $a1
	
	li $v0, 4		#Codigo 4 es imprime String
	la $a0, mensaje_k
	syscall 		#Imprime pregunta
	
	li $v0, 5 		#Syscall se transforma a Recibe INT del usuario.
	syscall			#Guarda el input en $v0
	move $a2, $v0 		#Movemos el input del usuario a $a2
	
    	jal coefBinomial        # Llama a la función coefBinomial
    
    	li $v0, 4               # Codigo 4 es para imprimir un String
    	la $a0, mensaje_resultado
    	syscall                 # Imprime mensaje de resultado
    
    	li $v0, 1               # Codigo 1 es para imprimir un entero
    	move $a0, $v1           # Mueve el resultado a $a0
    	syscall                 # Imprime el resultado
    
    	li $v0, 10              # Codigo 10 es para terminar el programa
    	syscall                 # Termina el programa

# Funcion que calcula el binomial de un numero    	
coefBinomial:
    add $s3, $zero, $ra		
    add $a0, $zero, $a1		#a0=a1=n
    jal fact			#Llamada recursiva a fact.
    add $t0, $zero, $v0		# t0 = n!
    add $a0, $zero, $a2		# k = a0 
    
    jal fact 			#Llamada recursiva a fact.
    add $t1, $zero, $v0		# t1 = k!
    sub $a1, $a1, $a2		# a1 = n - k
    add $a0, $zero, $a1 
    
    jal fact 			#Llamada recursiva a fact.
    add $t3, $zero, $v0 	# t3 = (n-k)!
    mul $t2, $t1, $t3 		# t2 = k!(n-k)!
    div $v1, $t0, $t2		# v1 = n! / k!(n-k)!
    add $ra, $zero, $s3
    jr $ra 
    

# función fact que calcula el factorial de un número entero
fact:
    addi $sp, $sp, -8      # reserva espacio en la pila
    sw $ra, 0($sp)         # guarda la dirección de retorno en la pila
    sw $a0, 4($sp)         # guarda el argumento en la pila
    
    ble $a0, 1, base       # si el argumento es menor o igual a 1, ir a la etiqueta base
    j caso_recursivo       # en caso contrario, ir a la etiqueta caso_recursivo
    
base:
    lw $ra, 0($sp)         # carga la dirección de retorno de la pila
    lw $a0, 4($sp)         # carga el argumento de la pila
    
    addi $sp, $sp, 8       # libera espacio en la pila
    addi $v0, $zero, 1     # coloca el valor 1 en el registro $v0
    
    jr $ra                 # salta a la dirección de retorno
    
caso_recursivo:
    addi $a0, $a0, -1      # decrementa el argumento en 1
    jal fact               # llama a la función fact recursivamente
    
    lw $ra, 0($sp)         # carga la dirección de retorno de la pila
    lw $a0, 4($sp)         # carga el argumento de la pila
    
    addi $sp, $sp, 8       # libera espacio en la pila
    mul $v0, $a0, $v0      # multiplica el argumento por el valor en $v0 (el resultado de la llamada recursiva)
    
    jr $ra                 # salta a la dirección de retorno
    


