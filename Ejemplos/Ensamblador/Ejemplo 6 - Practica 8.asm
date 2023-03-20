##
# Ejemplos de excepciones en MARS
#
	.text
	 
	## DivZ Division por cero
	div	$t0, $t0, $t0
	
	## Ov	Overflow Aaritmetico
	li	$t0, 0x7fffffff
	addi	$t0, $t0, 1
	
	## Tr	Trap
	teq $zero, $zero
	
	## AsEs	Acceso a memoria no válida
	lw	$t0, 0
	
end:	li	$v0, 10			# Fin del programa
	syscall
	
	.kdata 

err:	.asciiz	"Ocurrio el siguiente error:\n" 
divz:	.asciiz	"Division entre cero.\n"
ov:	.asciiz	"Desbordamiento aritmetico.\n"
tr:	.asciiz	"It's a trap!\n"
ases:	.asciiz	"Direccion de memoria inaccesible.\n"

	.ktext 0x80000180
	
	la	$a0, err		# Imprimir mensaje de error
	li	$v0, 4			# Codigo llamada al sistema para imprimir cadena
	syscall				
	
	mfc0	$k0, $13		# Obtener la causa de la excepción del registro del coproc 0
	andi	$k0, $k0, 0x7C		# Obtener solo la causa (sin excepciones pendientes) con la mascara 0x7C
	
	beq 	$k0, 0x24, vec_d	# Codigo Br Breakpoint ?
	beq 	$k0, 0x30, vec_o	# Codigo Ov Desbordamiento aritmetico ?
	beq 	$k0, 0x34, vec_t	# Codigo Tr Trap ?
	beq 	$k0, 0x10, vec_a	# Codigo AdEL Load direccion no valida ?
	
	la	$a0, 10			# Error no manejado por este manejador de excepciones, fin de la ejecucion
	syscall
	
vec_d:	la 	$a0, divz		# Imprimir mensaje de error
	j 	vec_end

vec_o:	la 	$a0, ov			# Imprimir mensaje de error
	j 	vec_end	

vec_t:	la 	$a0, tr			# Imprimir mensaje de error
	j 	vec_end	

vec_a:	la 	$a0, ases		# Imprimir mensaje de error

vec_end:li	$v0, 4			
	syscall
	mfc0	$k0, $14		# Obtener la dirección del error
	addi	$k0, $k0, 4		# Actualizar a la siguiente instruccion
	mtc0	$k0, $14		# Guardar direccion en EPC
	eret				# Fin del manejador de excepciones
