#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Pracica 4
// Programa que simula una Unidad Aritmetica y Logica de 32 bits que realiza las operaciones de:
// AND, OR, ADICION, SUSTRACCION, IGUALDAD, MENOR QUE

// Compuerta Logica AND , suma dos bits



// Sumador de 1 bit
// Nuestro sumador de 1 bit sera un sumador completo o full adder, este contara con las entradas A, B y Ci para los operandos y el acarreo de entrada
// respectivamente y las salidas O y Ci+1 para el resultado de la operacion y el acarreo de salida.
int sumador(int a, int b, int c){
    int s = a ^ b ^ c;
    int c_out = (a & b) | (b & c) | (a & c);
    return s;
}


// Suma de 8 bits
// Sumador de 8 bits, lo obtenemos conectando ocho sumadores de 1 bit de la siguiente forma:
// la salida Ci+1 del sumador n se conecta a la entrada Ci del sumador n + 1. 
// Asi cada An, Bn y On corresponderan al n-esimo bit del operando A, el operando B y la salida Resultado, comenzando con el bit menos
// significativo. Queda sin conexion la entrada Ci del primer sumador, la del bit
// menos significativo, y la salida Ci+1 del ultimo
int suma_8bits(int a, int b){
    int s0 = sumador(a & 1, b & 1, 0);
    int s1 = sumador((a >> 1) & 1, (b >> 1) & 1, s0);
    int s2 = sumador((a >> 2) & 1, (b >> 2) & 1, s1);
    int s3 = sumador((a >> 3) & 1, (b >> 3) & 1, s2);
    int s4 = sumador((a >> 4) & 1, (b >> 4) & 1, s3);
    int s5 = sumador((a >> 5) & 1, (b >> 5) & 1, s4);
    int s6 = sumador((a >> 6) & 1, (b >> 6) & 1, s5);
    int s7 = sumador((a >> 7) & 1, (b >> 7) & 1, s6);
    return s0 | (s1 << 1) | (s2 << 2) | (s3 << 3) | (s4 << 4) | (s5 << 5) | (s6 << 6) | (s7 << 7);
}


// Sustractor 
// Nota: para representar los inversos aditivos en nuestro sumador, usaremos la representacion de complemento a dos.
// Entonces en el diseño del circuito que realizara la sustraccion, podemos aprovechar los circuitos que ya tenemos
// esto es, para obtener A − B sumaremos al minuendo A el inverso aditivo del sustraendo B.
// para obtener las sustraccion, la ALU debe de llevar a cabo la operacion A + (B^) + 1, en donde B^ es la entrada
// B con todos sus bits negados.
int sustraccion(int a, int b){
    int b_inverso = ~b;
    int b_inverso_mas_uno = b_inverso + 1;
    return suma_8bits(a, b_inverso_mas_uno);
}


// Multiplicador de 8 bits
// El multiplicador de 8 bits se obtiene conectando 8 sumadores de 8 bits de la siguiente forma:
// la salida Ci+1 del sumador n se conecta a la entrada Ci del sumador n + 1.
// Asi cada An, Bn y On corresponderan al n-esimo bit del operando A, el operando B y la salida Resultado, comenzando con el bit menos
// significativo. Queda sin conexion la entrada Ci del primer sumador, la del bit
// menos significativo, y la salida Ci+1 del ultimo
int multiplicacion_8bits(int a, int b){
    int s0 = suma_8bits(a & 1, b & 1);
    int s1 = suma_8bits((a >> 1) & 1, (b >> 1) & 1);
    int s2 = suma_8bits((a >> 2) & 1, (b >> 2) & 1);
    int s3 = suma_8bits((a >> 3) & 1, (b >> 3) & 1);
    int s4 = suma_8bits((a >> 4) & 1, (b >> 4) & 1);
    int s5 = suma_8bits((a >> 5) & 1, (b >> 5) & 1);
    int s6 = suma_8bits((a >> 6) & 1, (b >> 6) & 1);
    int s7 = suma_8bits((a >> 7) & 1, (b >> 7) & 1);
    return s0 | (s1 << 1) | (s2 << 2) | (s3 << 3) | (s4 << 4) | (s5 << 5) | (s6 << 6) | (s7 << 7);
}



/* 

*/


int main(int argc, char *argv[ ]){

    // OpA OpB op

    // op 000 AND
    // op 001 OR
    // op 010 ADICION
    // op 011 SUSTRACCION
    // op 100 IGUALDAD
    // op 101 MENOR QUE


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

    