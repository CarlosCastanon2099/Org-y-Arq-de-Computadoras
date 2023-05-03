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
print_command: .asciiz "Placeholder para aceptar la cadena"

.text 	 	
# Loop que compara cada char de una cadena
# Funciona comparando cada byte en un registro, de forma similar
# a comparar cada elemento guardado en un arreglo 
.globl main

main:

	li $v0, 4 		 	# Cargamos instrucción para imprimir cadena
	la $a0, prompt		# Cargamos la cadena a imprimir
	syscall				# Imprimimos prompt
	
	li $v0 8			# Cargamos instrucción para leer cadena
	la $a0, buffer		# Cargamos el buffer donde se almacenará la cadena a leer
	li $a0, 81			# Establecemos el maximo de longitud de la cadena a leer
	syscall
	
	la  $t0, buffer 	# Cargamos a t0 la dirección del buffer
	la	$t1, help		# Cargamos a t1 la dirección de la cadena help
	j	cmploop
	
cmploop:
    lb  $t0,($s0)	 	# Siguiente char de la primera cadena 
    lb  $t1,($s1)	 	# Siguiente char de la siguiente cadena 
    bne $t2,$t3,cmpne   # Si son diferentes saltamos a cmpne
    
    beq $t2,$zero,cmpeq # Si llegamos al final del string, SALTA
    
    addi $s2,$s2,1	 # Apuntamos al siguiente char
    addi $s3,$s3,1	 # Apuntamos al siguiente char de la otra
    j cmploop

# Las cadenas no son iguales. Mandamos el mensaje         
cmpne:
    la $a0, error_msg	# Cargamos el string del error
    li $v0, 4		 	# Cargamos la instrucción de imprimir cadena
    syscall				# Imprimimos la cadena
    j	 main 		 	# Volvemos al main
    
# Las cadenas son iguales. Mandamos el mensaje         
cmpeq:
    la	 $a0, print_command	# Cargamos el mensaje de 
    li	 $v0, 4				 
    syscall
    j	 main 
    
