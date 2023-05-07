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

prompt: .asciiz "Inserte el comando aqu� o veras!: "
exit_msg: .asciiz "Adios popo"
error_msg: .asciiz "Has matado a potter\n"
accept_msg: .asciiz "Comando aceptado!!!\n"
help_msg: .asciiz "Qui�n necesita ayudar? jsjsjsj\n"

.text 	 	
.globl main

main:
	li $v0, 4 		 	# Cargamos instrucci�n para imprimir cadena
	la $a0, prompt		# Cargamos la cadena a imprimir
	syscall				# Imprimimos prompt
	
	li $v0, 8			# Cargamos instrucci�n para leer cadena
	la $s0, buffer		# Cargamos el buffer donde se almacenar� la cadena a leer
	move $t0, $s0		# guardamos el contenido del buffer en s0
	move $a0, $t0		# Colocamos al buffer en el argumento 0
	li $a1, 81			# Establecemos el maximo de longitud de la cadena a leer
	syscall

	
	jal help_command 	# Saltamos a cmp y guardamos el registro siguiente por si la palabra no coincide
	
	la $t0, exit
	jal exit_command
	
	j cmpne				# La cadena pasada, no corresponde a ning�n caso, por lo tanto llamamos a error

# Loop que compara cada char de una cadena
# Funciona comparando cada byte en un registro, de forma similar
# a comparar cada elemento guardado en un arreglo
cmploop:
    lb  $t0, ($s0)	 	# Siguiente char de la primera cadena 
    lb  $t1, ($s1)	 	# Siguiente char de la siguiente cadena 

    beq $t1,$zero, cmpeq# Si llegamos al final del string, SALTA
    
    bne $t0, $t1, reset	# Si son diferentes saltamos reiniciar la cadena
    
    addi $s0,$s0,1	 	# Apuntamos al siguiente char
    addi $s1,$s1,1	 	# Apuntamos al siguiente char de la otra
    j cmploop			# Volvemos al mismo loop pero ahora verificamos el siguiente char

# Las cadenas no son iguales. Mandamos el mensaje        
 
cmpne:
    la $a0, error_msg	# Cargamos el string del error
    li $v0, 4		 	# Cargamos la instrucci�n de imprimir cadena
    syscall				# Imprimimos la cadena
    j	 main 		 	# Volvemos al main
    
# Reiniciamos los registros a 0 en caso de que sobren cadenas por analizar
reset:
	la $s0, buffer		# Cargamos la direcci�n del buffer
	move $t0, $s0		# Cargamos el contenido del buffer
	move $ra, $t8		# Volvemos al main a evaluar el siguiente comando
	jr $ra				# Volvemos al main donde lo dejamos

# Las cadenas son iguales. Mandamos el mensaje         
cmpeq:
    la	 $a0, accept_msg	# Cargamos el mensaje de aceptaci�n
    li	 $v0, 4				# Cargamos la instrucci�n de imprimir cadena
    syscall					# Imprimimos la cadena
    jr	$ra					# Saltamos al comando necesario 
    
exit_command:
	move $t8 $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la	$t1, exit		# Cargamos a t1 la direcci�n de la cadena exit
	move $s1, $t1		# Cargamos el string en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
	la $a0, exit_msg 	# Cargamos mensaje de salida
	li $v0, 4			# Cargamos la instrucci�n para imprimir cadena
	syscall				# Imprimimos la cadena
	li $v0, 10			# Cargamos la instrucci�n para salir del programa
	syscall

help_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, help 		# Cargamos a $t0 la direcci�n del string "help" 
	move $s1, $t1		# Cargamos el stringo en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
	la $a0, help_msg	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	j main				# Volvemos a main
	