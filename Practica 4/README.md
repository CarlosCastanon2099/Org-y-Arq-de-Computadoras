# **Practica 4** 🏹


<div align="center">

<b>Carlos Emilio Castañon Maldonado ~ Pablo César Navarro Santana

</div>

---

## **Uso**

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


