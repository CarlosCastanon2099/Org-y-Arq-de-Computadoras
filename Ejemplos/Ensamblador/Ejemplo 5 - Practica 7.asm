#
# Programa que imprime un archivo de texto en consola,
#
	
	.data
str:	.asciiz "Introduzca el nombre del archivo:\n"
str_err:.asciiz "El archivo no existe.\n"
buffer:	.data	16
	.text
					### Imprimir cadena con llamada al sistema
	la	$a0, str		# Cargar direccion de cadena
	li	$v0, 4			# Cargar codigo de llamada para imprimir cadena
	syscall				# Llamada al sistema
	
					### Leer nombre del archivo
	la	$a0, buffer		# Cargar direccion del buffer
	li	$a1, 16			# Tamano del buffer
	li	$v0, 8			# Cargar codigo de llamada para leer cadena
	syscall				# Llamada al sistema
	
					### Eliminar salto de linea del nombre del archivo
	la	$t0, buffer		# $t0 apuntador al inicio del nombre del archivo.
loop:	lb	$t1, ($t0)		# Cargar caracter
	beq	$t1, '\n', eraseCh	# Si el caracter es salto de linea, branch
	beq	$t1, $zero, eraseCh	# Fin de la cadena, no hay salto de linea
	addi	$t0, $t0, 1		# Aumentat apuntador en 1
	j	loop			# Repetir
eraseCh:sb	$zero, ($t0)		# Remplazar carcater por \0

					### Abrir archivo
	la	$a0, buffer		# Cargar direccion de cadena con nombre del archivo
	li	$a1, 0			# Cargar bandera 0, solo lectura
	li	$v0, 13			# Cargar codigo de llamada para leer archivo
	syscall				# Llamada al sistema
	beq	$v0, -1, printErr	# El descriptor es 0, no existe el archivo

					### Leer del archivo
	sb	$zero, buffer + 15	# Agregar caracter nulo al final del buffer
	move	$t0, $v0		# Copiar descriptor del archivo a $t0
read:	move 	$a0, $t0		# Cargar descriptor del archivo
	la	$a1, buffer		# Cargar direccion del buffer de lectura
	li	$a2, 15			# Cargar tamaño del buffer
	li	$v0, 14			# Cargar codigo llamada para leer archivo
	syscall				# Llamada al sistema
	blt	$v0, 15, lastR		# Si se leyeron menos de 15 bytes, salto (ultima lectura)
	
					### Imprimir fragmento leido
	la	$a0, buffer		# Cargar direccion de cadena
	li	$v0, 4			# Cargar codigo de llamada para imprimir cadena
	syscall				# Llamada al sistema
	j read				# Leer siguiente fragmento
lastR:	sb	$zero buffer($v0)  	# Agregar caracter nulo despues del ultimo byte leido
	la	$a0, buffer		# Cargar direccion de cadena
	li	$v0, 4			# Cargar codigo de llamada para imprimir cadena
	syscall				# Llamada al sistema	
					
					### Cerrar el archivo
	move 	$a0, $t0		# Cargar descritor
	li	$v0, 16			# Cargar codigo de llamada para cerrar archivo
	syscall				# Llamada al sistema
	
	j	end			### Salto al fin del programa	

					### Imprimir error al abrir el archivo
printErr:la	$a0, str_err		# Cargar direccion de cadena
	li	$v0, 4			# Cargar codigo de llamada para imprimir cadena
	syscall			
					### Fin del programa con llamada al sistema
end:	li	$v0, 10			# Cargar código fin del programa
	syscall
	
	