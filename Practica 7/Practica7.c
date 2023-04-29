#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Programa que calcula recursivamente el binomial de un numero 
// Mediante la identidad de Pascal
int identidadPascal(int n, int k) {
    if (k == 0 || k == n) { // Caso base
        return 1;  
    } else {
        return identidadPascal(n-1, k-1) + identidadPascal(n-1, k); // Caso recursivo  
    }
}



int main() {
    // Pedimos un valor de n al usuario
    int n;
    printf("Introduce un valor de n: ");
    scanf("%d", &n);

    // Pedimos un valor de k al usuario
    int k;
    printf("Introduce un valor de k: ");
    scanf("%d", &k);

    // Calculamos la identidad de Pascal
    int idPascal = identidadPascal(n, k);
    printf("La identidad de Pascal de %d sobre %d es %d\n", n, k, idPascal);



    return 0;
}


