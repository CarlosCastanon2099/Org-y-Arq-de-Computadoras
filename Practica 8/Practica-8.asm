

# Loop que compara cada char de una cadena
# Funciona comparando cada byte en un registro, de forma similar
# a comparar cada elemento guardado en un arreglo 
cmploop:
    lb	 $t2,($s2)	 # Siguiente char de la primera cadena 
    lb   $t3,($s3)	 # Siguiente char de la siguiente cadena 
    bne  $t2,$t3,cmpne   # Si son diferentes saltamos a cmpne
    
    beq  $t2,$zero,cmpeq # Si llegamos al final del string, SALTA
    
    addi $s2,$s2,1	 # Apuntamos al siguiente char
    addi $s3,$s3,1	 # Apuntamos al siguiente char de la otra
    j cmploop

# Las cadenas no son iguales. Mandamos el mensaje         
cmpne:
    la	 $a0,errormsg	 #
    li	 $v0,4		 #
    syscall
    j	 main 		 # 
    
# Las cadenas son iguales. Mandamos el mensaje         
cmpeq:
    la	 $a0,print_command
    li	 $v0,4 
    syscall
    j	 main 
    