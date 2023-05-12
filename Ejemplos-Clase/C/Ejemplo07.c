#include <stdio.h>

/*

  Si se requieren recibir datos por medio de la consola se declaran
  dos argumuentos en la función main

  - Argument counter
 
    int argc - Es el número de argumentos pasados por la línea
               de comandos al invocarse el programa.

  - Argument vector

    char *argv[] - Es un arreglo de apuntadores a cadenas que contiene
                   los argumentos, uno por cadena.

*/
int main(int argc, char *argv[])
{
  /* argv[0] es un apuntador a la cadena con el nombre con el que se
     invocó al programa. */
  int i;
  for (i = 1; i < argc; i++) {
    printf("%s\n", argv[i]);// Imprime cada uno de los argumentos recibidos.
  }
}
