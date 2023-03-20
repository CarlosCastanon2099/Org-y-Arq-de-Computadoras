/*
  
  Un arreglo es un esapcio contiguo de memoria usado para almacenar
  objetos del mismo tipo.
  
 */

void main(void)
{
  
  /*
    
    Para definir un arreglo, se indica el tipo de los objetos que serán 
    almacenados, un identificador y, entre corchetes, el número de elementos.

   */

  int arreglo[20];

  /*

    - Se ha definido un bloque de 20 objetos con nombres: arreglo[0], 
      arreglo[1], arreglo[2], ..., arreglo[19]
    
    - Se puede asignar y obtener el valor del i-ésimo objero como:

   */

  arreglo[0] = 10;
  
  arreglo[1] = arreglo[0] + 10;

  
  /*
    
    Se puede usar un apuntador para recorrer un arreglo.
    
   */

  int *pt_arreglo = &arreglo[0];

  /*

    - Equivalente a:

       int *pt_arreglo = arreglo;

    - Para obtener el valor del i-ésimo elemento:

  */

  *(pt_arreglo + 3) = *(pt_arreglo + 10);

  /*
    
    Equivalente a:
    
   */

  arreglo[3] = *(arreglo + 10);

  
}
