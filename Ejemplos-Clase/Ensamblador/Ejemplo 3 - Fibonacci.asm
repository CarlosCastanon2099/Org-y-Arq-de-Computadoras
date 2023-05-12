#
# 	Rutina que calcula fibonacci(n) de forma recursiva con convención
# de llamadas a subrutinas.
#	
	.data
n:	.word	5		# Valor de n
	.text
main:	# Preambulo
	subi	$sp, $sp, 24	# 1 Reservar memoria para el marco
	sw	$ra, 16($sp)	# 3 Guardar $ra
	sw	$fp, 20($sp)	# 4 Guardar $fp
	addi	$fp, $sp, 20	# 4 Establecer $fp
	# Tarea
	li	$s0, 1		# Cargar como variable global la constate 1
	# Invocacion
	lw	$a0, n		# 1 Pasar argumentos
	jal	fibo		# 3 Brincar a subrutina
	# Conlcusion
	lw	$ra, 16($sp)	# 3 Restaurar $ra
	lw	$fp, 20($sp)	# 4 Restaurar $fp
	j	finmain		# Final del programa
fibo:	# Preambulo
	subi	$sp, $sp, 32	# 1 Reservar memoria para el marco
	sw	$ra, 16($sp)	# 3 Guardar $ra
	sw	$fp, 20($sp)	# 4 Guardar $fp
	addi	$fp, $sp, 28	# 4 Establecer $fp
	# Tarea
	ble	$a0, $s0, else	# Si n <= 1, pasa a los casos base
	sw	$a0, 32($sp)	# Guardar $a0 en el marco anterior
	# Invocacion n-1	# fibo(n-1)
	subi	$a0, $a0, 1	# 1 Pasar argumentos
	jal	fibo		# 3 Brincar a subrutina
	# Retorno
	move	$t0, $v0	# Copiar el valor de fibo(n-1)
	lw	$t1, 32($sp)	# Restaurar $t1 con el valor de n
	# Invocacion		# fibo(n-2)
	subi	$a0, $t1, 2	# 1 Pasar argumentos
	sw	$t0, 24($sp)	# 2 Guardar $t0
	jal	fibo		# 3 Brinca subrutina
	# Retorno
	lw	$t0, 24($sp)	# 1 Restaurar $t0
	add	$t0, $t0, $v0   # fibi(n-1) + fibo(n-1)
	j	end		# Fin then
else:	li	$t0, 1		# Caso base
end:	# Conclusion
	move	$v0, $t0	# 1 Valores de retorno
	lw	$ra, 16($sp)	# 2 Restaurar $ra
	lw	$fp, 20($sp)	# 2 Restaurar $fp
	addi	$sp, $sp, 32	# 3 Eliminar el marco 
	jr	$ra		# 4 Regresar control a rutina invocadora

finmain:nop			# Terminamos el programa.