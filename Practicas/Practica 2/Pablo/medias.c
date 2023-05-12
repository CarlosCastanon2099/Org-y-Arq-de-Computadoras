#include <stdio.h>
#include <stdlib.h>

// Usaremos math.h para poder obtener raices y exponentes negativos
#include <math.h>

// Nada de especial, la tipica media aritmetica de sumar todos los valores y dividirlo entre el numero de valores
float media_aritmetica(float datos[], int n){
    float resultado = 0;
    for(int i = 0; i < n; i++){
        resultado += datos[i];
    }
    return resultado/n;
}

// Aquí sumamos los inversos de cada valor y luego dividimos el total de valores entre la suma de estos
float media_armonica(float datos[], int n){
    float resultado = 0;
    for(int i = 0; i < n; i++){
        resultado += pow(datos[i],-1.0);
    }
    //No estoy muy seguro si es necesario transformar el n en double pero lo hice para evitar problemas
    return ((double) n/ resultado);
}

// Aquí reemplazamos resultado por 1 ya que si lo dejamos por 1, al estar multiplicando, multiplicamos 0 por el valor
// en cuestión lo cual siempre da 0, por eso se reemplaza por 1.
// Entonces multiplicamos todos los valores y al final obtenemos la raiz al numero del total de valores
float media_geometrica(float datos[], int n){
    float resultado = 1;
    for(int i = 0; i < n; i++){
        resultado *= datos[i];
    }
    return pow(resultado,1.0/(double)n);
}


int main(int argc, char *argv[]){

    //Como vamos a tener n valores y el primero es el nombre del programa y el segundo es el simbolo de la 
    //media que obtendremos, entonces el arreglo de valores va a ser de n-2
    float datos[argc-2];

    //Ya que piden que las funciones usen directamente un arreglo de floats, entonces del arreglo de cadenas
    //obtenemos un arrelgo de floats mediante un ciclo por transformando cada uno de las cadenas de los valores
    //a floats mediante la funcion "atof" que convierte un string en un float
    for(int i=2; i < argc; i++){
        datos[i-2] = atof(argv[i]);
    }

    //Hacemos un switch para identificar en que caso nos encontramos
    switch(argv[1][0]){
    //Este argv[1][0] verifica cual es la primera letra del segundo argumento de la terminal.
        case 'A':
        case 'a':
        //Estos casos pertenece a la media aritmetica (Agregue un caso de la letra en minusculas para hacer el programa
        //un poco mas robusto)
        printf("La media aritmetica del arreglo es: %f\n",media_aritmetica(datos,argc-2));
        break;
        case 'H':
        case 'h':
        //Estos casos pertenecen a la media armonica.
        printf("La media armonica del arreglo es: %f\n",media_armonica(datos,argc-2));
        break;
        case 'G':
        case 'g':
        //Estos casos pertenecen a la media geometrica.
        printf("La media geometrica del arreglo es: %f\n",media_geometrica(datos,argc-2));
        break;
        default:
        //En caso de introducir una opcion diferente, entonces regresamos un texto indicando este fallo.
        printf("La opcion '%s' es incorrecta\n", argv[1]);
    }
    return 0;
}