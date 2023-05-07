.data
buffer: .space 80 # Espacio reservado de 80 bytes para entrar la cadena de entrada
# Comandos del programa:

help:	.asciiz "help"
joke:	.asciiz "joke"
song:	.asciiz "song"
rev:	.asciiz "rev"
cat:	.asciiz "cat"
exit:	.asciiz "exit"

# Mensajes del programa:

prompt: .asciiz "Inserte el comando aquí o veras!: "
exit_msg: .asciiz "Adios popo"
error_msg: .asciiz "Has matado a potter"
accept_msg: .asciiz "Placeholder para aceptar la cadena"
help_msg: .asciiz "Quién necesita ayudar? jsjsjsj"

.text 	 	
.globl main

main:
	li $v0, 4 		 	# Cargamos instrucción para imprimir cadena
	la $a0, prompt		# Cargamos la cadena a imprimir
	syscall				# Imprimimos prompt
	
	li $v0, 8			# Cargamos instrucción para leer cadena
	la $a0, buffer		# Cargamos el buffer donde se almacenará la cadena a leer
	li $a1, 81			# Establecemos el maximo de longitud de la cadena a leer
	syscall
	
	la  $t0, buffer 	# Cargamos a t0 la dirección del buffer
	jal help_command 		# Saltamos a cmp y guardamos el registro siguiente por si la palabra no coincide
	
	la $t1, exit
	jal exit_command
	
	j cmpeq				# La cadena pasada, no corresponde a ningún caso, por lo tanto llamamos a error

# Loop que compara cada char de una cadena
# Funciona comparando cada byte en un registro, de forma similar
# a comparar cada elemento guardado en un arreglo
cmploop:
    lb  $t0, ($s0)	 	# Siguiente char de la primera cadena 
    lb  $t1, ($s1)	 	# Siguiente char de la siguiente cadena 
    bne $t0, $t1, reset	# Si son diferentes saltamos reiniciar la cadena

    beqz $t1, cmpeq 	# Si llegamos al final del string, SALTA
    
    addi $s0,$s0,1	 	# Apuntamos al siguiente char
    addi $s1,$s1,1	 	# Apuntamos al siguiente char de la otra
    j cmploop			# Volvemos al mismo loop pero ahora verificamos el siguiente char

# Las cadenas no son iguales. Mandamos el mensaje        
 
cmpne:
    la $a0, error_msg	# Cargamos el string del error
    li $v0, 4		 	# Cargamos la instrucción de imprimir cadena
    syscall				# Imprimimos la cadena
    j	 main 		 	# Volvemos al main
    
# Reiniciamos los registros a 0 en caso de que sobren cadenas por analizar
reset:
	la $t0, buffer		# Volvemos a cargar lo que recibió el buffer en t0
	move $t8 $ra		# Volvemos al main a evaluar el siguiente comando
	jr $ra				# Volvemos al main donde lo dejamos

# Las cadenas son iguales. Mandamos el mensaje         
cmpeq:
    la	 $a0, accept_msg	# Cargamos el mensaje de aceptación
    li	 $v0, 4				# Cargamos la instrucción de imprimir cadena
    syscall					# Imprimimos la cadena
    jr	$ra					# Saltamos al comando necesario 
    
exit_command:
	move $t8 $ra 		# Guardamos el $ra en t8 por si la cadena falla
	la	$t1, exit		# Cargamos a t1 la dirección de la cadena exit
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
	la $a0, exit_msg 	# Cargamos mensaje de salida
	li $v0, 4			# Cargamos la instrucción para imprimir cadena
	syscall				# Imprimimos la cadena
	li $v0, 10			# Cargamos la instrucción para salir del programa
	syscall

help_command:
	move $t8 $ra 		# Guardamos el $ra en t8 por si la cadena falla
	la	$t1, help		# Cargamos a t1 la dirección de la cadena help
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
	la $v0, help_msg	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	j main				# Volvemos a main
	