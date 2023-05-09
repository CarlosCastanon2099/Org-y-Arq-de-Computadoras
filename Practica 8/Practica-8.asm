.data
buffer: .space 80 # Espacio reservado de 80 bytes para entrar la cadena de entrada

# Comandos del programa:

help:	.asciiz "help"
joke:	.asciiz "joke"
song:	.asciiz "song"
rev:	.asciiz "rev"
cat:	.asciiz "cat"
exit:	.asciiz "exit"
maxwell:.asciiz "maxwell"
# Extras
music:	.asciiz "music"
random: .asciiz "random"

# Mensajes del programa:
next_line : .asciiz "\n"
prompt: .asciiz "Inserte el comando aquí o veras!: "
exit_msg: .asciiz "Adios popo"
error_msg: .asciiz "Has matado a potter\n"
accept_msg: .asciiz "Comando aceptado!!!\n"
random_msg: .asciiz "El comando random es: "
help_msg_0: .asciiz "Quién necesita ayuda? jsjsjsj\nNo es cierto, aquí tienes una lista de comandos:\njoke : Imprime un chiste aleatorio muy bueno\n"
help_msg_1: .asciiz "song : Reproduce una canción muy cotorra :D\nrev : Pide una cadena a continuación y la regresa al revez\n"
help_msg_2: .asciiz "rev [archivo] : lee un archivo e imprime la reversa del contenido del archivo\n"
help_msg_3: .asciiz "random : Elige un comando al azar y lo ejecuta\nmusic : Devuelve un link a una canción de youtube :D\n"
help_msg_4: .asciiz "cat [archivo] [archivo] : Concatena dos archivos y los imrpime en la pantalla\nexit : Termina al interprete y la diversión termina :c\n"
help_msg_5: .asciiz "??????? : Ingresa el nombre de nuestro gato favorito y admira la magia :)\n"

chistes:
chiste_0: .asciiz "Había una vez truz                                              \n"
chiste_1: .asciiz "El panda es el animal mas viejo... Porque esta en blanco y negro\n"
chiste_2: .asciiz "Un día eres joven, y al otro día también porque solo paso un día\n"
chiste_3: .asciiz "A veces es mejor caminar de pie, porque acostado no se puede ): \n"
# Uno es un rickroll, pero, cual?
chiste_4: .asciiz "https://www.youtube.com/watch?v=dQw4w9WgXcQ                     \n"
chiste_5: .asciiz "https://www.youtube.com/watch?v=YRvOePz2OqQ                     \n"

canciones: 
cancion_0: .asciiz "https://www.youtube.com/watch?v=8SbUC-UaAxE \n"
cancion_1: .asciiz "https://www.youtube.com/watch?v=2jKa_0xnTfU \n"
cancion_2: .asciiz "https://www.youtube.com/watch?v=Ijk4j-r7qPA \n"
cancion_3: .asciiz "https://www.youtube.com/watch?v=9J8nMBVJz58 \n"
cancion_4: .asciiz "https://www.youtube.com/watch?v=dQw4w9WgXcQ \n"
cancion_5: .asciiz "https://www.youtube.com/watch?v=fJ9rUzIMcZQ \n"
cancion_6: .asciiz "https://www.youtube.com/watch?v=1V_xRb0x9aw \n"
cancion_7: .asciiz "https://www.youtube.com/watch?v=gBt1jOtKz6Y \n"

# Shhhhhhhhhhh...
M_0: .asciiz "                                                                           ..    \n"
M_1: .asciiz "                                                                   ..::::^JB~    \n"
M_2: .asciiz "                               .:^^~!777!^:..   .?55J7!~^^:::^!J5PGB####&&@#.    \n"
M_3: .asciiz "                           .~?P#&&&&@@@@@@&#BGPY7~7B@@@@&&&&&&@@@@@@@&&&&&@P:    \n"
M_4: .asciiz "                        :!5#&@@@&&&&&&@@@@@@@@@@@@&&@&&&@@@@@@@@@@@@&&&&&&&&&J.  \n"
M_5: .asciiz "                      ^P&@@@&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@@&&@@&&&&&&&&@B: \n"
M_6: .asciiz "                     ?#@&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&@&&&&#B#@5 \n"
M_7: .asciiz "                   ~G@&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@&&&&&&&&#&##&&&&&&##&&#.\n"
M_8: .asciiz "                  !&@&&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@&&&&&&&@@@@@&&&&&&&&&&G \n"
M_9: .asciiz "                 .B@&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@&&&######&&&&&&&&&&#Y^ \n"
M_10: .asciiz "                 J@&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@&&&&&#BBGGPPPB&&&&##&B?.  \n"
M_11: .asciiz "                 G&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@&&&&#######BPYYPGPP55J:    \n"
M_12: .asciiz "                 P&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&BP555555555Y!     \n"
M_13: .asciiz "                 J&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@&&&&&&&#5JJYYYYJJJY7     \n"
M_14: .asciiz "                 !&&&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@&&@@@&&GY??JJJ??J5~     \n"
M_15: .asciiz "                  5@&&&&&&&&&&&&&&&&&&@@@@@@@@@@@&@@@@@@@&@@&&&&&#PJ?????J5.     \n"
M_16: .asciiz "                  .G@&&&&&&&&&&&&&&&&&@@@@@@@&&@@@@@@@@@&&@&&&&&&&&BY?JYP#7      \n"
M_17: .asciiz "                   ^G@&&&&&&&&&&&&&&&&&@@@@@&&@@@@@@@@@&&&&&&&&&&&&&BYY#@B.      \n"
M_18: .asciiz "                    .J#@@@@&&&&&&&&&&@@@@@@@&&@@@@@@@@@@@@@@@@&&&&&&P??#G:       \n"
M_19: .asciiz "                      :7JPB#&@@@@@@@@@@@@&&&&@@@@@@@@@@@@@@@@@@&&&&@BJYB^        \n"
M_20: .asciiz "                           :~7?J5PGB#&&@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&J!:         \n"
M_21: .asciiz "                                    .:^~!?J5B#&@@@@@@@@@@@@@@@@@@@@@G            \n"
M_22: .asciiz "                                             :~7J5PPGB##&&&&&&&###B5!            \n"
M_23: .asciiz "                                                     ...:^^^::::...              \n"

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
	syscall				# Pedimos la cadena a leer
	li $v0, 4			# Cargamos la instrucción para imprimir cadena
	
	jal next_line_print # Imprimimos un next_line para que se vea bien la consola
	
	jal help_command 	# Vemos si el caso coincide con help

	jal exit_command 	# Vemos si el caso coincide con exit

	jal joke_command 	# Vemos si el caso coincide con joke
	
	jal random_command	# Vemos si el caso coincide con random
	
	jal music_command	# Vemos si el caso coincide con music
	
	jal song_command	# Vemos si el caso coincide con song
	
	jal maxwell_command	# Me preguntó para que sirve este caso...
	
# Ningún caso coincide con la cadena escrita        
 
cmpne:
    la $a0, error_msg	# Cargamos el string del error
    li $v0, 4		 	# Cargamos la instrucción de imprimir cadena
    syscall				# Imprimimos la cadena
	jal next_line_print # Imprimimos un next_line para que se vea bien la consola
    j	 main 		 	# Volvemos al main

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
	la $a0, help_msg_5	# Cargamos el mensaje de help
	syscall				# Imprimimos la salida
	jal next_line_print # Imprimimos un next_line para que se vea bien la consola
	j main				# Volvemos a main

joke_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, joke 		# Cargamos a $t0 la dirección del string "joke" 
	move $s1, $t1		# Cargamos el stringo en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
joke_run:
	la $t5, chistes		# Guardamos la dirección del separador de chistes
	li $v0, 42			# Ponemos la instrucción del numero random
	li $a1, 6			# Ponemos el limite del numero random
	syscall				# Obtenemos el numero random
	mul $a0, $a0 66		# Multiplicamos el numero random por 66 para saber cual cadena poner
	add $t5, $t5 $a0	# La agregamos al registro de chistes para obtener nuestro chiste
	la $a0 ($t5)		# Cargamos la cadena para imprimirla
	li $v0, 4			# Ponemos la instrucción para imprimir strings
	syscall				# Imprimimos el chiste
	jal next_line_print # Imprimimos un next_line para que se vea bien la consola
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
	li $a1, 6			# Ponemos el limite del numero random
	syscall				# Obtenemos el numero random
	move $t5, $a0		# Guardamos el random en $t5
	li $v0, 4			# Cargar instrucción para imprimir cadena.
	
	beqz $t5 random_help		# Saltamos al caso de help
	beq  $t5 1 random_joke		# Saltamos al caso de joke
	beq  $t5 2 random_random	# Saltamos al caso de random
	beq  $t5 3 random_music		# Saltamos al caso de music
	beq	 $t5 4 random_song		# Saltamos al caso de song
	
random_exit:
	la $a0, exit		# Cargamos el mensaje de exit
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j exit_run			# Saltamos a la ejecución de exit
	
random_help:
	la $a0, help		# Cargamos el mensaje de help
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j help_run			# Saltamos a la ejecución de exit

random_joke:
	la $a0, joke		# Cargamos el mensaje de joke
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j joke_run			# Saltamos a la ejecución de joke
	
random_random:
	la $a0, random		# Cargamos el mensaje de random
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j random_run		# Saltamos a la ejecución de random
	
random_music:
	la $a0, music		# Cargamos el mensaje de music
	syscall				# Imprimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j music_run			# Saltamos a la ejecución de music

random_song:
	la $a0, song		# Cargamos el mensaje de song
	syscall				# Imrpimimos el mensaje del comando elegido
	jal next_line_print # Saltamos a imprimir el next_line
	j song_run			# Saltamos a la ejecución de song

next_line_print:
	la $a0, next_line	# Cargamos un next_line para que no se junten las cadenas
	syscall				# Imprimimos el next_line
	jr $ra				# Seguimos con la ejecución del random
	
music_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, music 		# Cargamos a $t0 la dirección del string "music" 
	move $s1, $t1		# Cargamos el string en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
music_run:
	la $t5, canciones	# Guardamos la dirección del separador de canciones
	li $v0, 42			# Ponemos la instrucción del numero random
	li $a1, 8 			# Ponemos el limite del numero random
	syscall				# Obtenemos el numero random
	mul $a0, $a0 46		# Multiplicamos el numero random por 46 para saber cual cadena poner
	add $t5, $t5 $a0	# La agregamos al registro de musica para obtener nuestra cancipon
	la $a0 ($t5)		# Cargamos la cadena para imprimirla
	li $v0, 4			# Ponemos la instrucción para imprimir strings
	syscall				# Imprimimos la canción
	jal next_line_print # Imprimimos un next_line para que se vea bien la consola
	j main				# Volvemos a main
	
song_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, song 		# Cargamos a $t0 la dirección del string "song" 
	move $s1, $t1		# Cargamos el string en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	
# Por obvias razones, no vamos a comentar todo esto, simplemente las primeras lineas 
song_run:
	li $v0, 31			# Cargamos la instrucción para reproducir sonidos
	li $a0, 74			# Establecemos la nota que reproducirímos
	li $a1, 400			# Establecemos el tiempo que durará la nota
	li $a2, 72			# Establecemos el instrumento que reproducirá la nota
	li $a3, 64			# Establecemos el volumen al que se escuchará la nota
	syscall
	li $v0, 32
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 74
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 74
	syscall
	li $v0, 32
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 76
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 77
	li $a1, 800
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 77
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 83
	li $a1, 400
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 83
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 83
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 79
	li $a1, 800
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 79
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 72
	li $a1, 1600
	syscall
	li $v0, 32 
	li $a0, 1600
	syscall
	li $v0, 31
	li $a0, 69
	syscall
	li $v0, 32 
	li $a0, 1600
	syscall
	li $v0, 31
	li $a0, 76
	syscall
	li $v0, 32 
	li $a0, 1600
	syscall
	li $v0, 31
	li $a0, 72
	syscall
	li $v0, 32 
	li $a0, 1600
	syscall
	li $v0, 31
	li $a0, 74
	li $a1, 400
	syscall
	li $v0, 32
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 74
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 74
	syscall
	li $v0, 32
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 76
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 77
	li $a1, 800
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 77
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 83
	li $a1, 400
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 83
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 83
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 79
	li $a1, 800
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 79
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 81
	li $a1, 400
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 83
	syscall
	li $v0, 32 
	li $a0, 400
	syscall
	li $v0, 31
	li $a0, 81
	li $a1,	800
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 79
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 77
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	li $v0, 31
	li $a0, 76
	syscall
	li $v0, 32 
	li $a0, 800
	syscall
	j main				# Volvemos al main
	
#Shhhhhhhhhhhh, no preguntes...
maxwell_command:
	move $t8, $ra 		# Guardamos el $ra en t8 por si la cadena falla
	
	la  $t1, maxwell 	# Cargamos a $t0 la dirección del string "maxwell" 
	move $s1, $t1		# Cargamos el string en $s0
	
	jal	 cmploop		# Vamos a verificar si la cadena es correcta
	li $v0, 4
	la $a0, M_0
	syscall
	la $a0, M_1
	syscall
	la $a0, M_2
	syscall
	la $a0, M_3
	syscall
	la $a0, M_4
	syscall
	la $a0, M_5
	syscall
	la $a0, M_6
	syscall
	la $a0, M_7
	syscall
	la $a0, M_8
	syscall
	la $a0, M_9
	syscall
	la $a0, M_10
	syscall
	la $a0, M_11
	syscall
	la $a0, M_12
	syscall
	la $a0, M_13
	syscall
	la $a0, M_14
	syscall
	la $a0, M_15
	syscall
	la $a0, M_16
	syscall
	la $a0, M_17
	syscall
	la $a0, M_18
	syscall
	la $a0, M_19
	syscall
	la $a0, M_20
	syscall
	la $a0, M_21
	syscall
	la $a0, M_22
	syscall
	la $a0, M_23
	syscall
	j main			# Volvemos a la normalidad....
