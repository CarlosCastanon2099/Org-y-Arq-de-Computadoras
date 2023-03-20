#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Uso del programa: 
// Compilar con: gcc -o Practica2 Practica2.c -lm
// Una vez compilado ejecutar con por ejemplo: ./Practica2 A 7 8 9 0 
// Notese que A es la bandera de la media aritmetica, H de la armonica y G de la geometrica


    float media_aritmetica(float datos[], int n){
        float suma = 0;
        for (int i = 0; i < n; i++){
            suma += datos[i];
        }
        return suma/n;
    }

    float media_armonica(float datos[], int n){
        float suma = 0;
        for (int i = 0; i < n; i++){
            suma += 1/datos[i];
        }
        return n/suma;
    }


//    float potencia(float base, float exponente){
//        if(exponente <= 0){
//            return 1;
//        }else{
//            return base * potencia(base, exponente-(1.0/1.0));
//        }
//
//    }

    float media_geometrica(float datos[], int n){
        float producto = 1;
        float resultado;
        for (int i = 0; i < n; i++){
            producto *= datos[i];
        }
        return pow(producto, 1.0/n);
    }

    



int main(int argc, char *argv[ ]){

    // Media aritmetica : A 5 4 3 2
    // Media armonica : H 5 4 3 2
    // Media geometrica : G 5 4 3 2

    if(argc < 3){
        printf("Error: no se han introducido los argumentos necesarios");
        printf("\n");
        return 1;
    }else if(argv[1][0] == 'A'){
        float datos[argc-2];
        for(int i = 2; i < argc; i++){
            datos[i-2] = atof(argv[i]);
        }
        printf("La media aritmetica es: %f", media_aritmetica(datos, argc-2));
        printf("\n");
    }else if(argv[1][0] == 'H'){
        float datos[argc-2];
        for(int i = 2; i < argc; i++){
            datos[i-2] = atof(argv[i]);
        }
        printf("La media armonica es: %f", media_armonica(datos, argc-2));
        printf("\n");
    }else if(argv[1][0] == 'G'){
        float datos[argc-2];
        for(int i = 2; i < argc; i++){
            datos[i-2] = atof(argv[i]);
        }
        printf("La media geometrica es: %f", media_geometrica(datos, argc-2));
        printf("\n");
    }else{
        printf("Opcion no valida");
        printf("\n");
    }


    

    return 0;
}

    