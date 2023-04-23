# 1) Escribe un programa que, sin usar la memoria ni la instruccion move, copie el contenido de un registro a otro.
.text
.globl main

main:
  # 1) 
  # Como no encontramos otra manera de mover registros por consola, nuestra solucion fue la de que en 
  # los registros en los que no se deba usar move para moverlos, basta con usar las operaciones add y sub 
  # para obtener un comportamiento bastante parecido a move.
  
  # Ejemplo: 
  add $v0, $t1, $zero   # copia el contenido de $t1 en $v0
  sub $t1, $t1, $zero   # limpia el registro $t1 para que los datos solo existan en $v0
  
  
  # termina el programa
  li $v0, 10
  syscall
