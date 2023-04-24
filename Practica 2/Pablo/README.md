# **Practica 2** ⏰📐

- Alumno: Pablo César Navarro Santana

---

Usé la biblioteca math.h para obtener exponentes y raices.
Agregué un caso donde la opcion ingresada sea diferente a 'A','a','H','h,'G','g'.
Al compilar, es necesario agregar al final -lm en la terminal debido a que como hago 
uso de la biblioteca math.h, el comando "-lm" que significa "library math" indica que
se debe de juntar la libreria math al script para poder usar esta libreria.

## **Uso**

- Compilar mediante:

```
gcc -o medias medias.c -lm
```

- Una vez compilado ejecutar el programa mediante la estructura:

```
./medias [Bandera] [Numeros]
```
- Teniendo que las banderas son las opciones de las medias a calcular: 

- **A** para la media aritmetica, **H** para la media armonica y **G** para la media geometrica.

- Teniendo por consiguiente los siguientes ejemplos de uso:

```
./medias A 12 7 29 9
```

```
./medias H 23 15 4 77
```

```
./medias G 25 67 14 8
```


