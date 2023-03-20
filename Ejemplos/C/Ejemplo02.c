/*

  Un programa en C consta de variables y funciones.

  Expresiones, sentencias y bloques

  - Una expresión es una variable, una constante, una llamada 
    a una función o una construcción de expresiones y operadores.

  - Una sentencia es una expresión que termina en ';'.
  
  - Un bloque es una agrupación de sentencias contenido entre
    llaves '{'  '}'.

  Identificadores  

  - Nombres dados a variables, funciones, estructuras, etc.

  - Reglas para escribirlos:
     * Secuencia de letras, números y guiones bajos.
     * Deben inciar con una letra.
     * Deben ser únicos

  Tipos básicos
  
      char
      short
      int
      long
      float
      double
      long double
   
   Definición de variables

   - Se define el tipo y el identificadir de la variale.

        T id1, id2, ...;
*/

char caracter;
int entero1, entero2;
long double precision_extendida;

/*
   Definición de funciones
   
   - Se define un tipo de retorno, un identificador y una lista 
   de argumentos, separada por comas.

   - La lista de argumentos se pone entre paréntesis.

   - El cuerpo de la función es un bloque.

   - Si la función retorna un valor, este se devuelve por medio
     de la palabra reservada return.

*/
int functionA(int a, int b)
{
  return b;
}

// Si la función no devuelve ningun valor, el tipo de retorno es void
void functionB(int a)
{

}

// Si la función no recibe argumentos, la lista es void
void functionC(void)
{

}

/*
  Una función especial es la función main, ya que es donde comienza 
  la ejecución del programa.
 */
int main(void)
{
 
}
