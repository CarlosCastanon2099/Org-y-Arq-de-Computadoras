<div align="center">

# Prácticas 📜🗝️

##   Curso de Organización y Arquitectura de Computadoras 2023-2
 
###  <em> Prácticas realizadas durante el curso: </em>
</div>

> -  Práctica 01: <em> Medidas de desempeño. </em>
> -  Práctica 02: <em> Introducción a C. </em>
> -  Práctica 03: <em> Circuitos combinacionales. </em>
> -  Práctica 04: <em> Unidad Aritmético-Lógica. </em>
> -  Práctica 05: <em> Lógica secuencial. </em>
> -  Práctica 06: <em> Lenguaje ensamblador. </em>
> -  Práctica 07: <em> Convenciones de llamada a subrutinas. </em>
> -  Práctica 08: <em> Llamadas al sistema. </em>



Las prácticas se realizaron bajo dos enfoques, programacion de codigo y el diseño de circuitos digitales, para los circuitos hemos empleado el software [Logisim](http://www.cburch.com/logisim/), para la programacion de codigo en lenguaje ensamblador se empleo el software [MARS](http://courses.missouristate.edu/KenVollmar/mars/), ambos software son de uso libre y se pueden descargar desde sus respectivas paginas oficiales, para poder ejecutarlos basta con tener la paqueteria de [JAVA](https://www.oracle.com/java/technologies/downloads/) instalada y ejecutarlos respectivamente mediante.

LOGISIM:
```
java -jar logisim-generic-2.7.1.jar
```

En logisim se puede ejecutar mediante el comando anterior (o dando doble click sobre un archivo logisim) o simplemente dando doble click en el archivo .jar.


MARS:
```
java -jar Mars4_4.jar
```
En MARS es necesario ejecutarlo mediante el comando anterior para que entonces, posteriormente dentro de MARS se pueda abrir el archivo .asm que se desee ejecutar.


A continuacion un ejemplo sobre como se compila y ejecuta un archivo .asm en MARS:


[![](./GIFS/EjemploCompilacionEnMars.gif)]


En las practicas tambien llegamos a usar el lenguaje de programacion C, para ello se empleo el compilador [GCC](https://gcc.gnu.org/), para compilar un archivo .c basta con ejecutar el siguiente comando:

C :
```
gcc -o nombre_ejecutable nombre_archivo.c
```

Para ejecutar el archivo compilado basta con ejecutar el siguiente comando:

```
./nombre_ejecutable
```

