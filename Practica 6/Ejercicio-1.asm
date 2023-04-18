.text
.globl main

main:
  # 1) 
  # xor $v0, $t0, $zero
  add $v0, $t1, $zero   # copia el contenido de $t1 en $v0
  sub $v0, $v0, $zero   # limpia el registro $v0
  
  
  

  
  # termina el programa
  li $v0, 10
  syscall
