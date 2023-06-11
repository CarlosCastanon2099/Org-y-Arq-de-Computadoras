
<div align="center">
  
# **Practica 4** 🏹

Carlos Emilio Castañon Maldonado ~ Pablo César Navarro Santana

[![](https://media.giphy.com/media/QpVUMRUJGokfqXyfa1/giphy.gif)](https://www.youtube.com/watch?v=5NV6Rdv1a3I)

</div>

---

## **Uso**

## **Para el Programa en C**

- Compilar mediante:

```
gcc -o Practica4 Practica4.c -lm
```

- Una vez compilado ejecutar el programa mediante la estructura:

```
./Practica4 [arg1] [arg2] [bandera]
```
- Teniendo que las banderas estan dadas por un conjunto de tres ceros/unos, estas son las opciones de las operaciones a calcular: 

- 000 -----> AND
- 001 -----> OR
- 010 -----> ADICION
- 011 -----> SUSTRACCION
- 100 -----> IGUALDAD
- 101 -----> MENOR QUE

- Ademas de que **arg1** y **arg2** seran las cadenas de tamaño 32 formadas por 0 y 1, las cuales
representaran los operandos en binario.

- Teniendo por consiguiente los siguientes ejemplos de uso:

```
./Practica4 00111111100000000000000000000000  00111111100000000000000000000000 000
```

```
./Practica4 00111111100000000000000000000000  00111111100000001000000000000000 001
```

```
./Practica4 00111111100000000000000010000000  00111111100001000000000000000000 010
```

## **Para el Archivo en Logisim**
- Abrir el archivo .circ con Logisim
** **

</div>
<div align="center">
  
# **Los circuitos presentes son:** 
  
Half Adder
  
![](https://github.com/CarlosCastanon2099/Org-y-Arq-de-Computadoras/blob/main/GIFS/p4/01-HalfAdder.gif)
  
Full Adder
  
![](https://github.com/CarlosCastanon2099/Org-y-Arq-de-Computadoras/blob/main/GIFS/p4/02-FullAdder.gif)
  
Sumador de 8 Bits
  
![](https://github.com/CarlosCastanon2099/Org-y-Arq-de-Computadoras/blob/main/GIFS/p4/03-Sumador8Bits.gif)
  
Restador de 8 Bits
  
![](https://github.com/CarlosCastanon2099/Org-y-Arq-de-Computadoras/blob/main/GIFS/p4/04-Restador8Bits.gif)
  
Multiplexor de el Sumador y la Resta de 8 Bits
  
![](https://github.com/CarlosCastanon2099/Org-y-Arq-de-Computadoras/blob/main/GIFS/p4/05-MultiplexorDeSumyRes.gif)

  
  
</div>
