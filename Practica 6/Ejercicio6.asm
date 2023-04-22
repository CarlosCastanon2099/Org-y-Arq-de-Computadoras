# Serie de Leibniz en MIPS con punto flotante de precisión sencilla

.data
    resultado: .float 0.0
    uno: .float 1.0
    menosuno: .float -1.0
    dos: .float 2.0
    cuatro: .float 4.0
    mensaje_m: .asciiz "Introduce un valor de m: "
    
.text
.globl main

    main:
    	# Pedir un valor de m al usuario
        la $a0, mensaje_m  # dirección del mensaje
        li $v0, 4           # syscall para imprimir cadena
        syscall
        
        li $v0, 5           # syscall para leer un entero
        syscall
        move $t0, $v0       # almacenar m en $t0
        
        # Inicializar valores para calcular serie de Leibniz
        l.s $f0, resultado
        l.s $f2, uno
        l.s $f4, menosuno
        l.s $f6, dos
        l.s $f8, cuatro
        
        # Calcular serie de Leibniz
        li $t1, 0   # n = 0
        Loop:
            # (-1)^n
            mtc1 $t1, $f10
            cvt.s.w $f10, $f10
            mul.s $f12, $f10, $f4

            # 1 / (2*n+1)
            addi $t2, $t1, 1
            sll $t2, $t2, 1
            addi $t2, $t2, 1
            mtc1 $t2, $f10
            cvt.s.w $f10, $f10
            div.s $f14, $f2, $f10

            # Agregar término a resultado
            mul.s $f16, $f12, $f14
            add.s $f0, $f0, $f16

            # Incrementar n
            addi $t1, $t1, 1
            blt $t1, $t0, Loop

        # Multiplicar resultado por 4
        mul.s $f2, $f0, $f8
        
        # Imprimir resultado
        li $v0, 2   # syscall para imprimir flotante
        mov.s $f12, $f0
        syscall
        
        # Salir del programa
        li $v0, 10  # syscall para salir
        syscall