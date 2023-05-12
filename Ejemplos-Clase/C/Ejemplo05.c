#include <stdio.h>

int main(void)
{
  /*
    
    Un apuntador es una variable que tiene la dirección de una variable.

    - Para definir un apuntador se usa el operador '*':

  */

  int *pt_entero;
  
  /*

    - En esta definición pt_entero no apunta a un área de memoria válida, 
      sólo se ha reservado memoria para guardar la dirección de memoria 
      pero no un espacio para guardar el valor apuntado.
    
    - No se puede definir e inicilaizar con un valor al mismo tiempo:

             int *pt_entero = 1; // Error, se espera una dirección.

    - Debe existir un espacio de memoria definido para guardar el valor 
      apuntado.

    - Para obtener la dirección de un objeto se usa el operador '&'.
    

   */

  int entero;
  pt_entero = &entero;

  /*
    
    - entero es una variable que contiene un int.
    
    - Ahora pt_entero es una variable con la dirección de memoria de una
      variable que contiene un int. 

    - Para asignar un valor a la variable apuntada por pt_entero se usa
      el operador '*'.

  */

  *pt_entero = 10;

  /*
    
    Para obtener el valor almacenado en la dirección apuntada, se 
    usa el operador *
    
  */
  
  int otro_entero = *pt_entero;

  /*
    
    - entero y otro entero tinen el mismo valor, pero no es el mismo 
      espacio de memoria.

    - Se puede iniciarlizar el apuntador con otro apuntador.
    
  */
  
  int *pt_otro_entero = pt_entero;

  /*

    - Equivalente a:
    
       int *pt_otro_entero = &entero;
    
    - Ahora pt_entero y pt_otro_entero apuntan al mismo espacio de memoria.
    
    
    - Se puede operar con los valores apuntados:
    
  */
  
  entero = *pt_entero + 10;

  (*pt_entero)++;

  /*

    El apuntador a void es un apuntador genérico y a diferencia
    de los otros tipos de apuntadores puede convertirse a cualquier
    oto tipo sin perder información:
    
  */

  void *pt_generico;
  
  pt_generico = pt_entero;

  
  
}
