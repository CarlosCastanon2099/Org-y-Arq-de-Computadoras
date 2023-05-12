.data
pregunta: .asciiz "Introduce un entero no negativo"
resultado: .asciiz "El factorial del numero introducido es: "

.text
.globl main
main:
	li $v0, 4#Codigo 4 es imprime String
	la $a0, pregunta
	syscall #Imprime pregunta
	
	li $v0, 5 #Syscall se transforma a Recibe INT del usuario.
	syscall#Guarda el input en $v0
	move $a0, $v0 #Movemos el input del usuario a $a0
	
	
	#En registro tenemos $a0=input y $v0=input
	jal fact#Todas las ejecuciones de factorial.
	
	
	#Para este entonces, el resutlado del fact esta en $v1
	li $v0, 4
	la $a0, resultado#Imprime el mensaje de resultado.
	syscall
	
	
	li $v0,1 #Codigo 1 es para imprimir un INT.
	move $a0, $v1# Para imprimer el resultado lo movemos a $a0
	syscall#Imprime el resultado
	
	li $v0, 10#Salir de programa
	syscall
	
fact:
	#Preambulo
	#Equivalente a sp[] -> sp[1]=ra
	addi $sp, $sp, -12 #$sp vamos a reservar 3 palabras.
	sw $ra, 0($sp)#Guardar el contenido de $ra en la primera palabra del stack
	sw $a0, 4($sp)#Guardar el contenido de $a0 en la segunda palabra
	sw $s0, 8($sp)#Guardar el direccion de reg, en la tercera palabra.
	
	#Caso base, n=1 o n=0.
	li $v1,1 #Inicializar el factorial.
	beq $a0, $zero, fact_regreso
	beq $a0, 1, fact_regreso
	
	#Ejecucion del Factorial
	addi $sp, $sp, -4#Reservamos una nueva palabra.
	sub $a0, $a0, 1 #Restamos 1 a el argumento. n= n-1
	jal fact#Llamada recursiva a fact.
	#Lo que sigue abajo se deja pendiente en recursion.
	addi $sp, $sp, 4#Borramos la palabra que creamos
	lw $s0, 0($sp)#Vamos a guardar $ra en $s0
	lw $a0, 4($sp)#Guardamos el argumento de memoria a registro.
	mul $v1, $v1, $a0# Multiplicacion del factorial
	
fact_regreso:
	#Conclusion:
	lw $s0, 8($sp)#Guardamos en registro la direccion de regis.
	lw $a0, 4($sp)#Guardamos en registro el argumento
	lw $ra, 0($sp)#Guardamos en registro la direccion de retorno.
	addi $sp, $sp, 12 #Borrar la pila que creamos.
	jr $ra
