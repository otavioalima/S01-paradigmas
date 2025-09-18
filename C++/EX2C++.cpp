#include <iostream>
#include <cmath> 

float somarArray(float arr[], int tamanho) {
    float soma = 0.0f;
    for (int i = 0; i < tamanho; ++i) {
        soma += arr[i];
    }
    return soma;
}

int main() {
    using namespace std; 

    int tamanho;

    cout << "Digite o tamanho do array: ";
    cin >> tamanho;

    // Alocacao dinamica de memoria para o array
    float* numeros = new float[tamanho];

    cout << "Digite os " << tamanho << " elementos do array:" << endl;
    for (int i = 0; i < tamanho; ++i) {
        cout << "Elemento " << i + 1 << ": ";
        cin >> numeros[i];
    }

    float resultado = somarArray(numeros, tamanho);

    cout << "O somatorio do array e: " << resultado << endl;

    
    // A funcao sqrt() exige um numero nao-negativo
    if (resultado >= 0) {
        float raiz = sqrt(resultado);
        cout << "A raiz quadrada do somatorio e: " << raiz << endl;
    } else {
        cout << "Nao e possivel calcular a raiz quadrada de um somatorio negativo." << endl;
    }

    
    delete[] numeros;

    return 0;
}