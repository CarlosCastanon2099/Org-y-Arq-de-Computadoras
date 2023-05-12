/*

  Tipos de variables

  Variables externas

     - Definidas fuera de bloques.
     - Accesibles para este y otros archivos de código fuente.
     - Alcance: Desde donde se declaro hasta el final del archivo.
     - Si no se inicalizan su valor inicial es cero.

  Variables Automáticas

  - Definidas en argumentos y dentro de bloques.
  - Alcance y tiempo de vida: Desde donde se declaro hasta el final 
    del bloque.
  - Si no se inicializa su valor inicial posiblemente será basura.

*/

int variable_externa;

void funcion(int automatica_arg)
{
  int automatica_funcion;
  if (1){
    int automatica_bloque;
  }
}

/*
   
  Edpecificadores de tipo
  
  - unsigned - Los tipos char, short, int y long pueden ser almacenados 
               sólo como positivos, permitiendo un mayor rango de 
	       enteros positivos.

  - signed - Dependiendo de la implementación del compilador, el tipo char 
             puede ser guardado como unsigned por default, por lo que el 
	     calificador signed permite que se consideren valores negativos.
	     Para los otros tipos este calificador es inutil.

  - Calificadores de tipo:

      const    - Anuncia que la variable no va a cambiar. Se 
                 puede inicalizar, pero no se puede cambiar su 
		 valor posteriormente.

      volatile - Indica al compilador que la variabale puede
                 cambiar en cualquier momento, no necesariamente
		 por el código próximo.

  - Especificadores de categoría de almacenamiento:

      register - Almacenar la variable en los registros rápidos de
                 la máquina (si es posible).

      static   - Dentro de un bloque la variable static mantiene su 
                 valor entre reentradas y salidas del bloques. 
		 Una variable fuera de un bloque la vuelve local para el 
		 archivo de código fuente.

      auto     - Define la variable como local. Solo puede ser usado
                 dentro de un bloque, una variable dentro de un bloque 
		 es local por lo que este especificador es inutil. 
      
*/

// Constante positiva
const unsigned int cons_pos;

// Variable visible sólo para este archivo
static int privada;

// Función visible sólo para este archivo.
static void fun_priv(void)
{

}

/*

  Ejemplos de constantes.

 */
int main(void)
{
  /*

    Constantes enteras
    octal         0_____
    hexadecimal   0x____
    sin signo     _____u
    long          _____l

  */
  long l = 0172 + 0x1A3 +234u + 343l;


  /*  

      Constantes tipo double
      ____.____
      ____.____e___

  */

  double d = 0.4 + 1.0e124;

  /*

    Constantes de tipo float
    ____.____f
    ____.____e___f
    
  */

  float f = 0.4f + 1.0e124;

  /*

    Constantes de presición extendida
    ____.____L
    ____.____e___L

  */

  long double ld = 0.4L + 1.0e124L;

  /*

    Constantes de tipo carcater
    Caracter    '_'
    Octal       \0__ 
    Hexadecimal \x__


  */

  char c = 'c';
  c = 99;
  c = '\143';
  c = '\x63';

  /*
    
    Constantes de tipo caracter especiales:
    
    \n  Salto de linea
    \t  Tabulación
    \v  Tabulación vertical
    \\  Diagonal invertida
    \?  Signo de interrogación
    \'  Comilla 
    \"  Comillas
    
    
    String
    
    "_____"
    
    "___" "___" concatenacion
    
  */
  
  char *str = "Hola" " " "mundo";
}
