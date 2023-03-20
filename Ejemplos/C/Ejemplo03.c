/*

  Declaración y definición.

  - Para poder usar una variable en un programa, el compilador debe
    conocer sus propiedades, tipo e identificador. Por lo que es necesario
    indícarlo por medio de una definción o por una declaración.

  Definción de variables
  
  - En una definción de variable se definen las propiedades, el tipo y el
    identificador de la variable.
  
  - El compilador reserva un espacio de memoria apropiado.

  - Solo existe una definción.
  
*/

int variable;

/*

  Declaración de variables

  - En una declaración de variable se declaran la propiedades, el tipo y
    el identificador de una variable.

  - No se reserva el espacio en memoria.

  - La variable se define en otro archivo de código fuente.

  - Se indica con la palabra reservada extern

*/

extern int variable_externa;

/*
  
  Definición de funciones

  - Se define el tipo de retorno, el identificador, la lista de argumentos
    y el cuerpo de una función.

  - La función puede ser usada desde el momento que se declara y hasta el
    final del archivo.

*/

int funcion(int a, int b)
{
  return a + b;
}


/*

  Supongamos que definimos dos funciones de la siguiente forma:

  void funcionA(...)
  {
    ...
    funcionB(...);
    ...
  }
  
  void funcionB(...)
  {
    ...
    funcionA(...);
    ...
  }

  - No se puede invocar funcionB en el cuerpo de funcionA, ya que el 
    compilador no conoce la definición de la función.

  - Definir las funciones en distinto orden no soluciona el problema.

  
  Declaración de funciones
  
  - Se declara el tipo de retorno, identificador y la lista de los 
    tipos de los argumentos de la función, la declaración termina con ';'.

  - No se declara el identificador de los argumentos

  - No se define el cuerpo de la función.

  - Se les conoce como prototipo de función.

  - Si las funiones se usarán en otros archivos de código fuente,
    los prototipos de funcion se declaran en una cabecera.

*/

void funcionA(int);

void funcionB(int, int);

// Ahora se pueden invocar sin ningun problema.
void funcionA(int a)
{
  if (a > 0)
    funcionB(a - 1, a);
}

void funcionB(int a, int b)
{
  if (a > 0)
    funcionA(a - 1);
}
