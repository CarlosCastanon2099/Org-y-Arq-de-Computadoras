.data
buffer: .space 80 # Espacio reservado de 80 bytes para entrar la cadena de entrada

# Comandos del programa:

help:	.asciiz "help"
joke:	.asciiz "joke"
song:	.asciiz "song"
rev:	.asciiz "rev"
cat:	.asciiz "cat"
random: .asciiz "random"
exit:	.asciiz "exit"

# Mensajes del programa:
next_line : .asciiz "\n"
prompt: .asciiz "Inserte el comando aquí o veras!: "
exit_msg: .asciiz "Adios popo"
error_msg: .asciiz "Has matado a potter\n"
accept_msg: .asciiz "Comando aceptado!!!\n"
random_msg: .asciiz "El comando aleatorio es: "
help_msg_0: .asciiz "Quién necesita ayuda? jsjsjsj\nNo es cierto, aquí tienes una lista de comandos:\njoke : Imprime un chiste aleatorio muy bueno\n"
help_msg_1: .asciiz "song : Reproduce una canción muy cotorra :D\nrev : Pide una cadena a continuación y la regresa al revez\n"
help_msg_2: .asciiz "rev [archivo] : lee un archivo e imprime la reversa del contenido del archivo\n"
help_msg_3: .asciiz "random : Elige un comando al azar y lo ejecuta\n"
help_msg_4: .asciiz "cat [archivo] [archivo] : Concatena dos archivos y los imrpime en la pantalla\nexit : Termina al interprete y la diversión termina :c\n"
chistes:
chiste_0: .asciiz "Había una vez truz                                              \n"
chiste_1: .asciiz "El panda es el animal mas viejo... Porque esta en blanco y negro\n"
chiste_2: .asciiz "Un día eres joven, y al otro día también porque solo paso un día\n"
chiste_3: .asciiz "A veces es mejor caminar de pie, porque acostado no se puede ): \n"

.text 	 	
.globl main

main:
	li $v0, 4 		 	# Cargamos instrucción para imprimir cadena
	la $a0, prompt		# Cargamos la cadena a imprimir
	syscall				# Imprimimos prompt
	
	li $v0, 8			# Cargamos instrucción para leer cadena
	la $s0, buffer		# Cargamos el buffer donde se almacenará la cadena a leer
	move $t0, $s0		# guardamos el contenido del buffer en s0
	move $a0, $t0		# Colocamos al buffer en el argumento 0
	li $a1, 81			# Establecemos el maximo de longitud de la cadena a leer
	syscall

	
	jal help_command 	# Vemos si el caso coincide con help

	jal exit_command 	# Vemos si el caso coincide con help

	jal joke_command 	# Vemos si el caso coincide con help
	
	jal random_command	# Vemos si el caso coincide con random
	
	j cmpne				# La cadena pasada, no corresponde a ningún caso, por lo tanto llamamos a error

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
    li $v0, 4		 	# Cargamos la instrucción de imprimir cadena
    syscall				# Imprimimos la cadena
    j	 main 		 	# Volvemos al main
    
# Reiniciamos los registros a 0 en caso de que sobren cadenas por analizar
reset:
	la $s0, buffer		# Cargamos la dirección del buffer
	move $t0, $s0		# Cargamos el contenido del buffer
	move $ra, $t8		# Volvemos al main a evaluar el siguiente comando
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
	move $s1, $t1		# Cargamos el string en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
exit_run:
	la $a0, exit_msg 	# Cargamos mensaje de salida
	li $v0, 4			# Cargamos la instrucción para imprimir cadena
	syscall				# Imprimimos la cadena
	li $v0, 10			# Cargamos la instrucción para salir del programa
	syscall

help_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, help 		# Cargamos a $t0 la dirección del string "help" 
	move $s1, $t1		# Cargamos el stringo en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
help_run:
	la $a0, help_msg_0	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	la $a0, help_msg_1	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	la $a0, help_msg_2	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	la $a0, help_msg_3	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	la $a0, help_msg_4	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	j main				# Volvemos a main

joke_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, joke 		# Cargamos a $t0 la dirección del string "joke" 
	move $s1, $t1		# Cargamos el stringo en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
joke_run:
	la $t5, chistes		# Guardamos la dirección del separador de chistes
	li $v0, 42			# Ponemos la instrucción del numero random
	li $a1, 4			# Ponemos el limite del numero random
	syscall				# Obtenemos el numero random
	mul $a0, $a0 66		# Multiplicamos el numero random por 66 para saber cual cadena poner
	add $t5, $t5 $a0	# La agregamos al registro de chistes para obtener nuestro chiste
	la $a0 ($t5)		# Cargamos la cadena para imprimirla
	li $v0, 4			# Ponemos la instrucción para imprimir strings
	syscall				# Imprimimos el chiste
	j main				# Volvemos a main	
random_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, random 	# Cargamos a $t0 la dirección del string "random" 
	move $s1, $t1		# Cargamos el stringo en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta

random_run:

	la $a0, random_msg	# Cargamos el mensaje de random
	syscall				# Imprimimos la salida
	li $v0, 42			# Ponemos la instrucción del numero random
	li $a1, 4			# Ponemos el limite del numero random
	syscall				# Obtenemos el numero random
	move $t5, $a0		# Guardamos el random en $t5
	li $v0, 4			# Cargar instrucción para imprimir cadena.
	
	beqz $t5 random_help		# Saltamos al caso de help
	beq  $t5 1 random_joke		# Saltamos al caso de joke
	beq  $t5 2 random_random	# Saltamos al caso de random
	
random_exit:
	la $a0, exit		# Cargamos el mensaje de exit
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j exit_run			# Saltamos a la ejecurción de exit
	
random_help:
	la $a0, help		# Cargamos el mensaje de help
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j help_run			# Saltamos a la ejecurción de exit

random_joke:
	la $a0, joke		# Cargamos el mensaje de joke
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j joke_run			# Saltamos a la ejecurción de joke
	
random_random:
	la $a0, random		# Cargamos el mensaje de random
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j random_run		# Saltamos a la ejecurción de random
	
next_line_print:
	la $a0, next_line	# Cargamos un next_line para que no se junten las cadenas
	syscall				# Imprimimos el next_line
	jr $ra				# Seguimos con la ejecución del random
	