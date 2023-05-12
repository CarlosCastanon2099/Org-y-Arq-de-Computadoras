#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "queue.h"

#define imprimeInt(a) printf(#a " = %d\n", a)
#define imprimeStr(a) printf(#a " = %s\n", a)

char *strclone(char *str);

char *strclone(char *str)
{
  int str_size = strlen(str);
  char *ptnew_str;
  ptnew_str = malloc(str_size + 1);
  strcpy(ptnew_str, str);
  return ptnew_str;
}

int main()
{
  queue *ptq;
  ptq = new_queue();          // Inicializa la cola con estado válido.
  /*
   * Se prueba encolar dos cadenas y desencolarlas verificando
   * el tamaño de la cola después de cada operaci+om.
   */
  imprimeInt(size(ptq));          
  enqueue("Hola", ptq); 
  imprimeInt(size(ptq));
  enqueue("mundo", ptq);
  imprimeInt(size(ptq));
  while (size(ptq) > 0) {
    imprimeStr(dequeue(ptq));
    imprimeInt(size(ptq));
  }
  /* 
   * La cola solo maneja apuntadores, por lo que si usamos un 
   * buffer para leer un archivo, necesitamos guardar una
   * copia de la cadena.
   */
  // ¡¡¡¡¡ Esta es la forma incorrecta de usar la cola !!!!!
  printf("Forma erronea de usar la cola:\n");
  char *buff;
  strcpy(buff,"Hola"); // Alguna función escribe en el buffer.
  enqueue(buff, ptq);
  strcpy(buff,"mundo"); // Alguna función escribe otra vez en el buffer.
  enqueue(buff, ptq);
  while (size(ptq) > 0) {
    imprimeStr(dequeue(ptq)); // Observa la salida dle programa.
  }
  // Esta es la forma correcta
  printf("Forma correcta de usar la cola:\n");
  strcpy(buff,"Hola"); // Alguna función escribe en el buffer.
  enqueue(strclone(buff), ptq); // Observa el código de strclone
  strcpy(buff,"mundo"); // Alguna función escribe otra vez en el buffer.
  enqueue(strclone(buff), ptq);
  while (size(ptq) > 0) {
    char *str;
    str = dequeue(ptq); 
    imprimeStr(str); // Observa la salida dle programa.
    /* 
     * Siempre liberen la memoria que hayan solicitado con 
     * malloc cuando ya no se vaya a utlizar.
     */
    free(str);
  }
  free_queue(ptq); // Ya no se usa la cola, libarar memoria,
}
