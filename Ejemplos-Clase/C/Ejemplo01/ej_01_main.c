/*
  Esto es un comentario. Todo el texto entre /* y * /  sera ignoardo.
*/

// Esto tambien es un comentario. Todo la línea a partir de // será ignorada.

/*
  - Un archivo de código fuente se nombra con extensión .c

  - Proceso de compilación:

    1. Preprocesador                 -> Código fuente 
    2. Traducción a ensamblador      -> Código ensamblador
    3. Traducción a lenguaje máquina -> Archivo objeto
    4. Enlazado                      -> Archivo ejecutable

  - Compilar un archivo ejecutable (debe tener función main):

     gcc foo.c
  
     Produce un ejecutable a.out y se ejecuta con el comando:
  
     ./a.out
  
  - Compilar un archivo ejecutable cambiando el nombre del ejecutable:
  
     gcc foo.c -o bar
  
     Produce el archivo ejecutable bar y se ejecuta con el comando:

     ./bar
     
  - Si se usa el código de otro archivo de código fuente se compila como:
  
     gcc foo.c bar.c
  
     Siempre se recompilarán los archivos aunque no se hayan hecho cambios
     por lo que es recomendable compilar como codigo objeto los archivos que no se
     han modificado (ver ej_01.c), y compilar los archivos de la forma:
  
     gcc foo.o bar.c

*/

/*
  - La directiva #include copia el contenido del archivo indicado a este archivo. (Ver ej_01.h)
*/

// Si la cabecera se encuentra en el mismo directorio que este archivo de código fuente:
#include "ej_01.h"

// Si la cebecera se encuentra en el directorio de cabeceras del sistema:
#include <stdlib.h>

/*

  La función main será donde se comience a ejecutar el programa, se declara como:

 */
int main(void)
{

}
