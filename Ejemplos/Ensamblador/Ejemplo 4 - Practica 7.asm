#
# Programa que compara dos cadenas
#
	.data
str: 	.asciiz	"Cadena de prueba"
str2:	.asciiz	"Cadena de pruena"
str3:	.asciiz	"Cadena de prueba"

strl:	.asciiz	"La longitud de la cadena 1 es:\n"
strc:	.asciiz	"La cadena 1 y 2 son iguales?\n"
strc2:	.asciiz	"La cadena 1 y 3 son iguales?\n"

	.text
main:	la	$a0, str		# Cargar direccion de la cadena 1
	jal	str_len			# Invocacion para calcular el tamano de la cadena 1
	move	$t0, $v0		# Conservar la longitud en $t0
	la	$a0, strl		# Imprimir mensaje de longitud
	li	$v0, 4			# Codigo llamada al sistema para imprimir cadena
	syscall				# Llamada al sistema
	move	$a0, $t0		# Imprimir entero representando longitud de la cadena 1
	li	$v0, 1			# Codigo llamada al sistema para imprimir entero
	syscall				# Llamada al sistema
	li	$a0, '\n'		# Imprimir salto de linea
	li	$v0, 11			# Codigo llamada al sistema para imprimir carcater
	syscall				# Llamada al sistema
		
	la	$a0, str		# Cargar direccion cadena 1 como argumento
	la	$a1, str2		# Cargar direccion cadena 2 como argumento
	jal	str_cmp			# Invocacion para comparar cadenas
	move	$t0, $v0		# Guardar resultado de la comparacion tn $t0
	la	$a0, strc		# Imprimir mensaje de comparacion
	li	$v0, 4			# Codigo llamada al sistema para imprimir cadena
	syscall				# Llamada al sistema
	move	$a0, $t0		# Imprimir resultado de comparacion como entero
	li	$v0, 1			# Codigo llamada al sistema para imprimir entero
	syscall				# Llamada al sistema
	li	$a0, '\n'		# Imprimir salto de linea
	li	$v0, 11			# Codigo de llamada al sistema para imprimir caracter
	syscall				# Llamada al sistema

	la	$a0, str		# Cargar direccion cadena 1 como argumento
	la	$a1, str3		# Cargar direccion cadena 3 como argumento
	jal	str_cmp			# Invocacion para comparar cadenas
	move	$t0, $v0		# Guardar resultado de la comparacion tn $t0
	la	$a0, strc2		# Imprimir mensaje de comparacion
	li	$v0, 4			# Codigo llamada al sistema para imprimir cadena
	syscall				# Llamada al sistema
	move	$a0, $t0		# Imprimir resultado de comparacion como entero
	li	$v0, 1			# Codigo llamada al sistema para imprimir entero
	syscall				# Llamada al sistema
	li	$a0, '\n'		# Imprimir salto de linea
	li	$v0, 11			# Codigo de llamada al sistema para imprimir caracter
	syscall				# Llamada al sistema

										## Fin del programa
	li	$v0, 10			# Cargar codigo de llamada para terminar programa
	syscall

# Subrutina que calcula el tamano de una cadena.
# $a0 apuntado a la cadena de la cual se calculara su tamano
# Retorna en $v0 el tamano de la cadena.
					## Preambulo. No es necesario un marco en la pila
str_len:move	$v0, $zero		# Inicializar el contador en cero
loopsl:	lb	$t0, ($a0)		# Cargar caracter
	beq	$t0, '\0', endsl	# Si es el caracter nulo, fin
	addi	$v0, $v0, 1		# Aumentar contador 1
	addi	$a0, $a0, 1		# Aumentar apuntador 1
	j	loopsl			# Revisar siguiente carcater
					## Conclusion.
endsl:	jr	$ra			# 4. Retonar control

# Subrutina que verifica que dos cadenas sean iguales.
# $a0 apuntador de la primer cadena a comparar
# $a1 apuntador de la segunda cadena a comparar
# Retorna 1 en $v0 si las cadenas son iguales, 0 en otro caso.
					## Preambulo. Agregar marco a la pila
str_cmp:subi	$sp, $sp, 32		# 1. Tamano de la pila: 32
	sw	$ra, 16($sp)		# 3. Almacenar $ra
	sw	$fp, 20($sp)		# 4. Almacenar $fp
	addi	$fp, $sp, 28		# 4. Actualizar $fp

					## Como se van a usar los argumentos, nos aseguramos de poder recuperarlos:
	sw	$a0, 4($fp)		# Almacenar argumento $a0 en la pila del invocador (pila de rutina main)
	sw	$a1, 8($fp)		# Almacenar argumento $a1 en la pila del invocador (pila de rutina main)
					
					## Calculo del tamano de la primer cadena con str_len
					## Invocacion. No hay que hacer nada para la primer invocación de str_len
	jal	str_len			# 3. Invocación str_len

					## Calculo del tamano de la segunda cadena con str_len	
					## Invocacion.
	lw	$a0, 8($fp)		# 1. Pasar apuntador de segunda cadena como argumento 
	sw	$v0, 28($sp)		# 2. Guardar el tamano de la primer cadena
	jal	str_len			# 3. Invocacion str_len
				
					## Retorno.
	lw	$a0, 4($fp)		# 1. Cargar de la pila el Argumento 0
	lw	$a1, 8($fp)		# 1. Cargar de la pila el Argumento 1
	lw	$t0, 28($sp)		# 1. Cargar tamano de la cadena 1
	
					## Comparar tamano de las cadenas
	bne	$t0, $v0, notEq		# Si los tamanos son distintos las cadenas no son iguales
	
					## Comparar caracter a caracter
	li	$v0, 0			# Las cadenas son distintas hasta que se demuestre lo contratrio
loopsc:	lb	$t0, ($a0)		# Cargar siguiente caracter a comparar de la primer cadena
	beq	$t0, $zero, eqstr	# Fin de la cadena encontrado, las cadenas son iguales
	lb	$t1, ($a1)		# Cargar siguiente carcater de la segunda cadena
	bne	$t0, $t1, notEq		# Si los caracteres no son iguales, las cadenas no lo son
	addi	$a0, $a0, 1		# Aumentar apuntador de la cadena 1 en 1
	addi	$a1, $a1, 1		# Aumentar apuntador de la cadena 2 en 1
	j	loopsc			# Verificar siguiente caracter

eqstr:	li	$v0, 1			## Las cadenas son iguales, cargar 1 en $v0					

					## Conclusion.
notEq:	lw	$ra, 16($sp)		# 2. Restaurar $sp
	lw	$fp, 20($sp)		# 2. Restaurar $fp
	addi	$sp, $sp, 32		# 3. Restaurar $sp
	jr	$ra			# 4. Fin subrutina
