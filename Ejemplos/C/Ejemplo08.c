#include <stdio.h>
#include <string.h>

static const char *err_uso_1 = "Error: Se debe especificar un archivo como operando.\n";
static const char *err_uso_2 = "Error: Se debe especificar un archivo destino.\n";
static const char *err_arc_1 = "Error: No se puede abrir el archivo";

int main(int argc, char *argv[])
{
  if (argc == 1) {           // Verificar que se especifique archivo fuente
    printf("%s", err_uso_1);
  } else if (argc == 2) {    // Verificar que se especifique archivo destino
    printf("%s", err_uso_2);
  } else {
    FILE *leer = fopen(argv[1], "r"); // Abrir archivo a leer "r" sólo lectura
    if (leer == NULL) {               // Verificar si se abrió el archivo
      printf("%s %s\n", err_arc_1, argv[1]);
    } else {
      FILE *escribir = fopen(argv[2], "w"); // Abrir archivo a escribir "w" sobreescribir
      if (escribir == NULL) {               // Verificar si se abrió el archivo
	printf("%s %s\n", err_arc_1, argv[2]);
      } else {
	int c = fgetc(leer);      // Leer un carcater
	while (c != EOF) {        // Verificar si se terminó de leer el archivo.
	  fputc(c, escribir);     // Escribir caracter
	  c = (char) fgetc(leer); // Obtener nuevo caracter
	}
	fclose(leer);     // Cerrar archivos
	fclose(escribir); 
      }
    }
  }
}
