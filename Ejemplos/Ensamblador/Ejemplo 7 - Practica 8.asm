	.data
num:	.asciiz		"-1024"
	.text
	la	$a0, num
	jal	str_to_int
	move	$t0, $v0
	li	$v0, 10
	syscall
##
# Rutina que convierte una cadena a un entero. La cadena debe terminar en espacio, salto de linea 
# o caracter nulo.
# $a0 Apuntador al inicio de la cadena.
# Retorno
# $v0 Entero resultado de la conversion
# $v1 Apuntador a final de la cadena
##
str_to_int:
	move	$v0, $zero		# Poner el resultado en cero
	move	$v1, $a0		# Apuntador al final de la cadena
	li	$t0, 10			# Cargar inmediato 10 (usado para convertir el numero)
					
					## Verificar si es positivo o negativo
	lb	$t1, ($v1)		# Cargar primer carcater
	bne	$t1, '-', loop		# Si el primer caracter es '-' 
	li	$t2, 1			# Cargar 1 en $t2 (El numero es negativo)
	addi	$v1, $v1, 1		# Siguiente caracter
	
loop:	lb	$t1, ($v1)		## Cargar siguiente carcater

	beq	$t1, ' ', end		## Si el carcater es espacio, salto de linea o nulo, fin de la rutina
	beq	$t1, '\n', end		
	beq	$t1, '\0', end		
					## Verificar errores
	tlti	$t1, '0'		# El caracter no es un numero
	tgei	$t1, ':'		# El carcater no es un numero	

	mult	$v0, $t0		# Multiplicar el resultado por 10
	mflo	$v0			# Recuperar el resultado del producto

	subi	$t1, $t1, '0'		## Convertir el caracter en entero
	add	$v0, $v0, $t1		# Agregar la unidad al resultado
	
	addi	$v1, $v1, 1		# Apuntar a siguiente carcater
	j	loop			# Repetir proceso
			
end:	bne	$t2, 1, return		## Si el número era negativo
	neg	$v0, $v0		## Cambiar el signo del resultado
	
return:	jr	$ra			# Fin de la rutina
	
