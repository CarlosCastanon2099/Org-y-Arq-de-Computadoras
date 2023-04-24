#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Programa que calcula la suma de leibnz con valores arbitrarios de m 
double leibniz(int m) {
    double resultado = 0;  // Inicializamos el resultado a 0
    for (int n = 0; n < m; n++) {   // Iteramos hasta m
        int arriba = (n % 2 == 0) ? 1 : -1; // (-1)^n
        double division = arriba / (2.0*n+1.0); // 1/(2n+1)
        resultado += division;  // Sumamos el resultado
    }
    return resultado * 4;  // Multiplicamos por 4 el resultado
}

int main() {
    // Pedimos un valor de m al usuario
    int m;
    printf("Introduce un valor de m: ");
    scanf("%d", &m);

    double pi = leibniz(m);
    printf("Pi: %.15f\n", pi);
    return 0;
}


