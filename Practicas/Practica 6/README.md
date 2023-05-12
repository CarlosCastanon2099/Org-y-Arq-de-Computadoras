</div>

<div align="center">
  
# **Equipo Org y Arq de Computadoras - Practica 6** 💾





<b>Carlos Emilio Castañon Maldonado    ~   Pablo  César Navarro Santana



[![](https://media.tenor.com/dcpZz7CEJWEAAAAC/spinning-cat-maxwell.gif)](https://www.youtube.com/watch?v=KC6cPq-NmuU)

</div>
  
---

## **Uso**

- Compilar cada archivo desde su respectivo .asm:
  
- Para el Ejercicio 1 el programa se encarga de todo (Hay nula comunicacion con usuario)

- Para los demas programas basta con compilarlos y correrlos para que cada uno pida al usuario los valores con los que va a funcionar el programa

---
- Para el programa en C que calcula la Suma de Leibnz

$$4 \times \left( \sum_{n=0}^m \frac{(-1)^n}{2n + 1} \right) $$

- Compilar mediante:

```
gcc -o Ejercicio-5 Ejercicio-5.c -lm
```

- Una vez compilado, ejecutar el programa mediante:

```
./Ejercicio-5 
```
- Una vez compilado se nos desplegara una linea en terminal que nos pedira un valor de m.

- Tendremos que m sera el numero de iteraciones de nuestro programa para calcular $\pi$

- A lo que por consiguiente los siguientes ejemplos de uso:

```
> ./Ejercicio-5 
Introduce un valor de m: 10
Pi: 3.041839618929403
```

```
> ./Ejercicio-5 
Introduce un valor de m: 100000
Pi: 3.141582653589720
```

```
> ./Ejercicio-5 
Introduce un valor de m: 10000000000
Pi: 3.141592652878837
```


