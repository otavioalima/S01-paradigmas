#include <iostream>


using namespace std;

// Função recursiva para calcular o Fibonacci de n
int fibonacci(int n) {
    
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    
    // Passo recursivo
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    int numero;

    cout << "Digite um numero inteiro para calcular o Fibonacci: ";
    cin >> numero;

    // A sequencia e definida para números nao-negativos
    if (numero < 0) {
        cout << "Por favor, digite um numero nao-negativo." << endl;
    } else {
        int resultado = fibonacci(numero);
        cout << "O resultado de fibonacci(" << numero << ") eh: " << resultado << endl;
    }

    return 0;
}