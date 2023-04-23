# 6) Empleando el coprocesador y las instrucciones de punto flotante de precision sencilla, escribe un programa (en MIPS) que calcule la suma de Leibnz del ejercicio 5

.data
	cero: .float 0.0
	uno: .float 1.0
	menosuno: .float -1.0
	dos: .float 2.0
	cuatro: .float 4.0
	mensaje_m: .asciiz  "Introduce un valor de m: "
	mensaje_pi: .asciiz "Pi: "   

.text
.globl main

main:
        # Pedir un valor de m al usuario   
    	la $a0, mensaje_m    # Dirección del mensaje
    	li $v0, 4            # syscall para imprimir cadena
    	syscall

    	li $v0, 5            # syscall para leer un entero
    	syscall                

    	# Inicializado de valores para calcular serie de Leibniz
    	# Las que inciamos en 0 las usaremos para que cambien constantemente
    	# Intuitivamente las que no son 0 las usaremos como constantes para realizar la suma de leibnz
    	move $t2,$v0       # Almacenar m en $t2
    	li   $t1,1         # Contador generico para saber en que iteracion estamos
    	l.s  $f2,cero      
    	l.s  $f4,cero      
    	l.s  $f6,cero      
    	l.s  $f8,cero      
    	l.s  $f10,uno      
    	l.s  $f14,dos      
    	l.s  $f22, cuatro

# Nuestro bucle for de C adaptado en MIPS
loop:   # Nuestro equivalente en C de n < m, si ya terminamos nos salimos del bucle y saltamos a ya_terminamos   
	beq   $t1,$t2,ya_terminamos      
	mul.s $f4,$f14,$f8      # (2*n)
	add.s $f4,$f4,$f10      # (2*n+1)
	div.s $f4,$f10,$f4      # 1 / (2*n+1)
	addi  $t1,$t1,1         # Aumentamos en 1 nuestro contador generico :D
	add.s $f8,$f8,$f10      # Aumentamos en 1 a n para que la siguiente iteracion sea n+1 (siempre y cuando exista otra iteracion :p)
	andi  $t3,$t1,1
	beq   $t3,$zero,no_hemos_terminado_pipipipi
	sub.s $f2,$f2,$f4
	j loop

ya_terminamos:   
	mul.s $f2,$f2,$f22   # Multiplicamos por 4 todo el resultado para tener nuestra aproximacion de Pi
	mov.s $f12,$f2       # Movemos el resultado para poder imprimirlo
	# la $a2, mensaje_pi   # Dirección del mensaje
	# li $v1, 4            # syscall para imprimir cadena
	li $v0,2             # Imprimimos Pi
	syscall
	li $v0,10            # syscall para salir
	syscall


no_hemos_terminado_pipipipi:
	add.s $f2,$f4,$f2
	j loop


