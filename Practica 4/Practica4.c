#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>

// Pracica 4
// Programa que simula una Unidad Aritmetica y Logica de 32 bits que realiza las operaciones de:
// AND, OR, ADICION, SUSTRACCION, IGUALDAD, MENOR QUE
// Cabe resaltar que operaremos sobre strings para que estos simulen los bits (0, 1) 
// Por lo que procedemos a programarlo en C

// Compuerta Logica AND , suma de n bits
char and(char a[], char b[]){
    char resultado[] = "";
    for(int i = 0; i<31; i++){
        if (a[i] == '1' && b[i] == '1'){
            strcat(resultado, "1");
        } else{
            strcat(resultado, "0");
        }
    }
    return *resultado;
}

// Compuerta Logica OR , suma de n bits
char or(char a[], char b[]){
    char resultado [] = "";
    for(int i = 0; i<31; i++){
        if (a[i] == '1' || b[i] == '1'){
            strcat(resultado, "1");
        } else{
            strcat(resultado, "0");
        }
    }
    return *resultado;
}

// adicion de n bits
char adicion(char a[], char b[]){
    char resultado [] = "";
    bool acarreo = false;
    for(int i = 31; i>-1; i--){
        if (a[i] == '0'){
            if (b[i] == '0' && !acarreo){
                strcat(resultado, "0");
                continue;
            }
            if (b[i] == '1' && acarreo){
                strcat(resultado, "0");
                continue;
            }
            strcat(resultado, "1");
            acarreo = false;
        } else{
            if (b[i] == '0' && !acarreo){
                strcat(resultado, "1");
                continue;
            }
            if (b[i] == '1' && acarreo){
                strcat(resultado, "1");
                continue;
            }
            strcat(resultado, "0");
            acarreo = true;
        }
        
    }
    return *resultado;
}


// Sustractor 
// Nota: para representar los inversos aditivos en nuestro sumador, usaremos la representacion de complemento a dos.
// Entonces en el diseño del circuito que realizara la sustraccion, podemos aprovechar los circuitos que ya tenemos
// esto es, para obtener A − B sumaremos al minuendo A el inverso aditivo del sustraendo B.
// para obtener las sustraccion, la ALU debe de llevar a cabo la operacion A + (B^) + 1, en donde B^ es la entrada
// B con todos sus bits negados.
char sustraccion(char a[], char b[]){
    char resultado [] = "";
    bool acarreo = true;
    for(int i = 31; i>-1; i--){
        if (a[i] == '0'){
            if (b[i] == '0' && !acarreo){
                strcat(resultado, "0");
                continue;
            }
            if (b[i] == '1' && acarreo){
                strcat(resultado, "0");
                continue;
            }
            strcat(resultado, "1");
            acarreo = false;
        } else{
            if (b[i] == '0' && !acarreo){
                strcat(resultado, "1");
                continue;
            }
            if (b[i] == '1' && acarreo){
                strcat(resultado, "1");
                continue;
            }
            strcat(resultado, "0");
            acarreo = true;
        }
        
    }
    return *resultado;
}



// Arreglo de 32 ceros para decir que algo es false
char falso[32] = "00000000000000000000000000000000";

// Arreglo de 32 unos para decir que algo es true
char verdadero[32] = "10000000000000000000000000000000";

// Funcion Menor Que 
// Verifica que un numero n de bits sea menor que otro numero m de bits
// Notemos que con bits nos referimos a solo 0 y 1 
char menor_que(char a[], char b[]){
    for(int i = 0; i<31; i++){
        if(a[i] == b[i]) continue;
        if(a[i] == 0) return *verdadero;
        return *falso;
    }
    return *falso;
}

// Funcion de Igualdad de Bits
// Verifica que un numero n de bits sea igual a otro numero m de bits
// Notemos que con bits nos referimos a solo 0 y 1
char igualdad(char a[], char b[]){
    for(int i = 0; i<31; i++){
        if (a[i] == b[i]) continue;
        return *falso;
    }
    return *verdadero;
}




int main(int argc, char *argv[ ]){
    // Funcion Main que cumple el rol de la ALU
    // La ALU recibe 3 argumentos, el primero y el segundo son los operandos y el tercero es la operacion a realizar
    // Los codigos de las operaciones a realizar son las siguientes:
    // op 000 AND
    // op 001 OR
    // op 010 ADICION
    // op 011 SUSTRACCION
    // op 100 IGUALDAD
    // op 101 MENOR QUE
    // ./Practica4 00111111100000000000000000000000  00111111100000000000000000000000 001

    // Uso del programa: 
    // Compilar con: gcc -o Practica4 Practica4.c -lm
    // Una vez compilado ejecutar con por ejemplo:
    // ./Practica4 00111111100000000000000000000000  00111111100000000000000000000000 001
    // ./Practica4 00000001 00000001 000

    // Verificacion de que se han introducido los argumentos necesarios
    if(argc < 4){
        printf("Error: no se han introducido los argumentos necesarios");
        printf("\n");
        return 1;
    }

    char *a = argv[1];
    char *b = argv[2];
    char *operacion = argv[3];

    if(strlen(a)!=32 || strlen(b)!=32){
        printf("Error: los argumentos no tienen el tamaño correcto");
        printf("\n");
        return 1;
    }

    char resultado[32];

    // Verificacion de que se ha introducido una operacion valida
    if(operacion[0] == '0' && operacion[1] == '0' && operacion[2] == '0'){
        // AND
        *resultado = and(a, b);
        printf(resultado);
        printf("\n");
    }else if(operacion[0] == '0' && operacion[1] == '0' && operacion[2] == '1'){
        // OR
        *resultado = or(a, b);
        printf(resultado);
        printf("\n");
    }else if(operacion[0] == '0' && operacion[1] == '1' && operacion[2] == '0'){
        // ADICION
        *resultado = adicion(a, b);
        printf(resultado);
        printf("\n");
    }else if(operacion[0] == '0' && operacion[1] == '1' && operacion[2] == '1'){
        // SUSTRACCION
        *resultado = sustraccion(a, b);
        printf(resultado);
        printf("\n");
    }else if(operacion[0] == '1' && operacion[1] == '0' && operacion[2] == '0'){
        // IGUALDAD
        *resultado = igualdad(a, b);
        printf(resultado);
        printf("\n");
    }else if(operacion[0] == '1' && operacion[1] == '0' && operacion[2] == '1'){
        // MENOR QUE
        *resultado = menor_que(a, b);
        printf(resultado);
        printf("\n");
    }else{
        printf("Error: no se ha introducido una operacion valida");
        printf("\n");
        return 1;
    }

   




   return 0;
}


/*  
switch(argv[3]){
        case "000":
            and(argv[1],argv[2]);
        case "001":
            or(argv[1],argv[2]);
        case "010":
            adicion(argv[1],argv[2]);
        case "011":
            sustraccion(argv[1],argv[2]);
        case "100":
            igualdad(argv[1],argv[2]);
        case "101":
            menor_que(argv[1],argv[2]);
    return 0;

    }


if(argc < 4){
        printf("Error: no se han introducido los argumentos necesarios");
        printf("\n");
        return 1;
    }else if(argv[3][0] == '0' && argv[3][1] == '0' && argv[3][2] == '0'){
        // AND
        printf(and(a, b));
        printf("\n");
    }else if(argv[3][0] == '0' && argv[3][1] == '0' && argv[3][2] == '1'){
        // OR
        printf(or(a, b));
        printf("\n");
    }else if(argv[3][0] == '0' && argv[3][1] == '1' && argv[3][2] == '0'){
        // ADICION
        printf(adicion(a, b));
        printf("\n");
    }else if(argv[3][0] == '0' && argv[3][1] == '1' && argv[3][2] == '1'){
        // SUSTRACCION
        //int a = atoi(argv[1]);
        //int b = atoi(argv[2]);
        printf(sustraccion(a, b));
        printf("\n");
    }else if(argv[3][0] == '1' && argv[3][1] == '0' && argv[3][2] == '0'){
        // IGUALDAD
        printf(igualdad_bits(a, b));
        printf("\n");
    }else if(argv[3][0] == '1' && argv[3][1] == '0' && argv[3][2] == '1'){
        // MENOR QUE
        printf(menor_que(a, b));
        printf("\n");
    }else{
        printf("Error: no se ha introducido una operacion valida");
        printf("\n");
        return 1;
    }


    11111111111111111111111111111111 complemento a2x  - 000. . . 1 = 
    11111111111111111111111111111110

    10000000000000000000000000000000 - 00000000000000000000000000000001 =
    00000000000000000000000000000001 ?? postivo o negativo?
    00000000000000000000000000000000 - 00000000000000000000000000000001 =
    111111111111111111111111111111111 33 bits ????
    00000000000000000000000000000001 = 00000000000000000000000000000001
La salida sera una cadena de tama ̃no 32 formada por 0 y 1 (QUE ESTEN REPRESENTADOS CON COMPLEMENTO A 2), la cual representara
el resultado de la operaci ́on solicitada, en particular, para las salidas que repre-
sentan TRUE y FALSE (las comparaciones), la salida debe ser 31 ceros y un

1, (00000000000000000000000000000001) para TRUE y 32 ceros para FALSE.
(00000000000000000000000000000000)

*/

